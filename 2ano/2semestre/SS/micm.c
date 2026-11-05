/* ********************************************************************************************************************************* 
 * Microphone test - ADC in continuous mode and time-domain BP filtering 
 * Paulo Pedreiras, Pedro Fonseca, Luis Moutinho 2026/Apr.
 * 
 * Tested:
 *  ESP32-C6 DevKitC-1
 * 
 * - Basic use of the ADC to get and process sound samples.
 * - Uses continuous mode ADC operation, to allow higher frequencies
 * - Signal is processed by a Band-Pass filter, in the time-domain, to identify defined frequencies 
 *  
 * Microphone is a MEMS Adafruit Silicon MEMS Microphone Breakout - SPW2430.
 *     Supplied with 3.3-5V, output at DC pin has a 0.7 V and a 100 mVpp "when talking near". 
 *      In my case I had around 1 V. So the attenuation cannot be 0 dB. 
 *      I have used 2.5 dB (vref/0.7), to get 1.3 to 1.5 volts for Vref+ and avoid saturation
 *      Check other mics to see if this is normal.  
 * 
 *  
 * Bibliography: 
 *      https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/adc/index.html
 *      https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/adc/adc_continuous.html 
 *      https://docs.espressif.com/projects/esp-dsp/en/latest/esp32/esp-dsp-library.html      
 * 
 * Based on the sample code  provided by EspressIF:
 *      https://github.com/espressif/esp-idf/tree/47faecc3/examples/peripherals/adc/continuous_read 
 * 
 * NOTE: must run idf.py add-dependency "espressif/esp-dsp" when creating a new project using dsp functionality
 ***********************************************************************************************************************************/ 

/* ********************************* 
 * Includes
 ***********************************/
#include <string.h>
#include <stdio.h>
#include <math.h>

#include "sdkconfig.h"
#include "esp_log.h"
#include "freertos/FreeRTOS.h"      // FreeRTOS includes
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "freertos/queue.h"
#include "esp_adc/adc_continuous.h" // For ESP ADC
#include "esp_dsp.h"                // For ESP DSP functions, conv in the case
#include "esp_private/esp_clk.h"    // For ESP clock functions
#include "driver/gpio.h"            // para controlar o LED

/* ********************************
 * Global defines 
 **********************************/
#define MICEX_ADC_UNIT                    ADC_UNIT_1
#define MICEX_ADC_CONV_MODE               ADC_CONV_SINGLE_UNIT_1
#define MICEX_ADC_ATTEN                   ADC_ATTEN_DB_2_5            // Use Vref/0.75, 1.3 ... 1.5 V
#define MICEX_ADC_BIT_WIDTH               SOC_ADC_DIGI_MAX_BITWIDTH   // 12 bits resolution (maximum)

#define MICEX_ADC_FRAME_SIZE             512                           /* ADC frame size, in bytes */
#define MICEX_ADC_BUF_SIZE               (4 * MICEX_ADC_FRAME_SIZE)    /* Internal buffer, should an integer multiple of the frame size to avoid incomplete frames */
#define MICEX_ADC_SAMPLE_FREQ            (20 * 1000)                   /* Sample frequency, in Hz. Notice that there are lower and higher bounds*/

#define MICEX_SOUND_SAMPLES_BUF_SIZE     2048 /* IMPORTANT: If FFT is to be used, must be must be a power of two */
                                              /* For time-domain conv. filters there is no such restriction */
                                              
#define MAX_FILT_IR_LEN                 200     /* Maximum IR filter length */

/* Global variable declarations */
static adc_channel_t channel[1] = {ADC_CHANNEL_3};  // Mic on ADC channel 3
static TaskHandle_t s_task_handle;

static const char *TAG = "MIC_EXAMPLE";

/* ADC - Variables to hold data acquisition and parsing */
__attribute__((aligned(16))) uint8_t result[MICEX_ADC_FRAME_SIZE] = {0}; // Buffer where the results of a continuous read are placed   
__attribute__((aligned(16))) adc_continuous_data_t parsed_data[MICEX_ADC_FRAME_SIZE / SOC_ADC_DIGI_RESULT_BYTES]; // Buffer where frame parsed data is placed 

/* FreeRTOS tasks and IPC */
#define PROCESSOR_TASK_STACK_SIZE       8192            // Accomodate calls to dsp functions, log, user vars, ...
#define PROCESSOR_TASK_PRIORITY	( tskIDLE_PRIORITY + 4 )
QueueHandle_t XQ;    /* Queue handle */

/* Impulse reponse filter and related variables */
__attribute__((aligned(16))) float hbpf2k[]={0.000000139618742, 0.000000255721385, 0.000000140050607, -0.000000328918009, -0.000001079871671, -0.000001790994587, -0.000001943975411, -0.000001031882007, 0.000001111877099, 0.000004001347557, 0.000006413035946, 0.000006707873993, 0.000003574260112, -0.000003048702149, -0.000011330185703, -0.000017688431396, -0.000017969871244, -0.000009435702605, 0.000007215862062, 0.000026871405806, 0.000040972415077, 0.000040614490911, 0.000020897907315, -0.000015285006327, -0.000056126887733, -0.000083842525959, -0.000081437626075, -0.000041101266796, 0.000029421836936, 0.000106148839227, 0.000155757573851, 0.000148773462501, 0.000074351529935, -0.000050052623102, -0.000180121406766, -0.000259437345082, -0.000243952642519, -0.000126937980784, 0.000047492844400, 0.000191919289194, 0.000580032052973, 0.000667352843244, 0.000306111499321, -0.000446298721323, -0.001342483904490, -0.001978250973038, -0.001912439692934,-0.000868574004532, 0.001047898364964, 0.003236203885917, 0.004708723047573, 0.004458080398213, 0.001979374693417, -0.002286980559547, -0.006863696045905, -0.009659616406773, -0.008836721670391, -0.003790852332498, 0.004230959606325, 0.012280364027838, 0.016725773018749, 0.014820278024314, 0.006161630397857, -0.006683261470121, -0.018835296877081, -0.024940029322091, -0.021501888240714, -0.008700432996997, 0.009216737308611, 0.025316468417048, 0.032708573103906, 0.027529205755171, 0.010869128872094, -0.011297781514959, -0.030304625508737, -0.038281206662112, -0.031498011959705, -0.012107397246638, 0.012536609979868, 0.032771101414432, 0.040552804004055, 0.032771101414432, 0.012536609979868, -0.012107397246638, -0.031498011959704, -0.038281206662113, -0.030304625508737, -0.011297781514959, 0.010869128872094, 0.027529205755171, 0.032708573103906, 0.025316468417048, 0.009216737308611, -0.008700432996997, -0.021501888240714, -0.024940029322091, -0.018835296877081, -0.006683261470121, 0.006161630397857, 0.014820278024314, 0.016725773018749, 0.012280364027838,0.004230959606325, -0.003790852332499, -0.008836721670391, -0.009659616406773, -0.006863696045905, -0.002286980559547, 0.001979374693417, 0.004458080398213, 0.004708723047573, 0.003236203885917, 0.001047898364964, -0.000868574004532, -0.001912439692934, -0.001978250973038, -0.001342483904490, -0.000446298721323, 0.000306111499321, 0.000667352843244, 0.000580032052973, 0.000191919289194, 0.000047492844400, -0.000126937980784, -0.000243952642519, -0.000259437345082, -0.000180121406766, -0.000050052623102, 0.000074351529935, 0.000148773462501, 0.000155757573851, 0.000106148839227, 0.000029421836936, -0.000041101266796, -0.000081437626075, -0.000083842525959, -0.000056126887733, -0.000015285006327, 0.000020897907315, 0.000040614490911, 0.000040972415077, 0.000026871405806, 0.000007215862062, -0.000009435702605, -0.000017969871244, -0.000017688431396, -0.000011330185703, -0.000003048702149, 0.000003574260112,0.000006707873993, 0.000006413035946, 0.000004001347557, 0.000001111877099, -0.000001031882007, -0.000001943975411, -0.000001790994587, -0.000001079871671, -0.000000328918009, 0.000000140050607, 0.000000255721385, 0.000000139618742};


/* turma 5: f0 = 5*500 = 2500 Hz */
/* NMEC 126033 -> 1+2+6+0+3+3 = 15 */
/* NMEC 127419 -> 1+2+7+4+1+9 = 24 */
/* soma = 39, modulo 10 = 9 */
/* f1 = 2500 + 700 + 9*20 = 3380 Hz */
/* f2 = 3380 + 700 + 9*20 = 4260 Hz */
#define F0_FREQ     2500
#define F1_FREQ     3380
#define F2_FREQ     4260

/* comprimento dos filtros FIR */
#define FIR_LEN     151


#define LED_GPIO      11


#define ENERGY_THRESHOLD    50.0f

/* numero de amostragens por simbolo antes de avaliar */
#define AMOSTRAS_POR_SIMBOLO  4

/* sequencias: ABRIR = 0,1,2,1  |  FECHAR = 2,1,2,0 */
#define SEQ_LEN     4
static const int seq_abrir[SEQ_LEN]  = {0, 1, 2, 1};
static const int seq_fechar[SEQ_LEN] = {2, 1, 2, 0};

/* filtro para f0 = 2500 Hz */
__attribute__((aligned(16))) float h_f0[FIR_LEN] = {
    0.000489250818985f, -0.000000000000000f, -0.000508748006266f, -0.000740067949897f,
    -0.000540885476946f, -0.000000000000000f, 0.000583770702785f, 0.000859959191110f,
    0.000633423354619f, -0.000000000000000f, -0.000683741394851f, -0.000999389838767f,
    -0.000726559475502f, 0.000000000000000f, 0.000751801482296f, 0.001066626239270f,
    0.000747725426680f, 0.000000000000000f, -0.000701255224097f, -0.000930228180972f,
    -0.000598390348452f, -0.000000000000000f, 0.000424681057838f, 0.000433809964615f,
    0.000165753976048f, 0.000000000000000f, 0.000192129593441f, 0.000582881031772f,
    0.000661502048404f, 0.000000000000000f, -0.001253125111498f, -0.002259243815549f,
    -0.001975453626141f, 0.000000000000000f, 0.002834148069076f, 0.004688870937051f,
    0.003831655172661f, 0.000000000000000f, -0.004966874161397f, -0.007898031941624f,
    -0.006234923538847f, 0.000000000000000f, 0.007627020196452f, 0.011830988260135f,
    0.009130478961543f, 0.000000000000000f, -0.010728836684575f, -0.016344749968216f,
    -0.012402100726562f, -0.000000000000000f, 0.014127117398182f, 0.021214687028556f,
    0.015878051677517f, 0.000000000000000f, -0.017626965547870f, -0.026150958896776f,
    -0.019344478697375f, -0.000000000000000f, 0.021000492242007f, 0.030824230001387f,
    0.022564953689218f, 0.000000000000000f, -0.024008639644527f, -0.034897809461488f,
    -0.025303931845717f, 0.000000000000000f, 0.026425562028063f, 0.038062386202519f,
    0.027351301888283f, 0.000000000000000f, -0.028062576002893f, -0.040069070819318f,
    -0.028544977916755f, -0.000000000000000f, 0.028788672669886f, 0.040756577177756f,
    0.028788672669886f, -0.000000000000000f, -0.028544977916755f, -0.040069070819318f,
    -0.028062576002893f, 0.000000000000000f, 0.027351301888283f, 0.038062386202519f,
    0.026425562028063f, 0.000000000000000f, -0.025303931845717f, -0.034897809461488f,
    -0.024008639644527f, 0.000000000000000f, 0.022564953689218f, 0.030824230001387f,
    0.021000492242007f, -0.000000000000000f, -0.019344478697375f, -0.026150958896776f,
    -0.017626965547870f, 0.000000000000000f, 0.015878051677517f, 0.021214687028556f,
    0.014127117398182f, -0.000000000000000f, -0.012402100726562f, -0.016344749968216f,
    -0.010728836684575f, 0.000000000000000f, 0.009130478961543f, 0.011830988260135f,
    0.007627020196452f, 0.000000000000000f, -0.006234923538847f, -0.007898031941624f,
    -0.004966874161397f, 0.000000000000000f, 0.003831655172661f, 0.004688870937051f,
    0.002834148069076f, 0.000000000000000f, -0.001975453626141f, -0.002259243815549f,
    -0.001253125111498f, 0.000000000000000f, 0.000661502048404f, 0.000582881031772f,
    0.000192129593441f, 0.000000000000000f, 0.000165753976048f, 0.000433809964615f,
    0.000424681057838f, -0.000000000000000f, -0.000598390348452f, -0.000930228180972f,
    -0.000701255224097f, 0.000000000000000f, 0.000747725426680f, 0.001066626239270f,
    0.000751801482296f, 0.000000000000000f, -0.000726559475502f, -0.000999389838767f,
    -0.000683741394851f, -0.000000000000000f, 0.000633423354619f, 0.000859959191110f,
    0.000583770702785f, -0.000000000000000f, -0.000540885476946f, -0.000740067949897f,
    -0.000508748006266f, -0.000000000000000f, 0.000489250818985f
};

/* filtro para f1 = 3380 Hz */
__attribute__((aligned(16))) float h_f1[FIR_LEN] = {
    0.000314212332551f, 0.000703111898430f, 0.000374109197549f, -0.000364760801542f,
    -0.000765141306910f, -0.000382450225995f, 0.000438108561617f, 0.000859129963005f,
    0.000396739659391f, -0.000528803859817f, -0.000962952954961f, -0.000402781056466f,
    0.000619701625117f, 0.001039754326263f, 0.000385289242048f, -0.000680096547638f,
    -0.001040248784361f, -0.000331727883597f, 0.000665334397470f, 0.000906803555463f,
    0.000236167340635f, -0.000518167097288f, -0.000578975678768f, -0.000102626313704f,
    0.000171934921060f, -0.000000000000000f, -0.000052605499217f, 0.000444546226721f,
    0.000876409364883f, 0.000200070564347f, -0.001400720977817f, -0.002079650065343f,
    -0.000297930101834f, 0.002757166868333f, 0.003616916377301f, 0.000294504718872f,
    -0.004558255825342f, -0.005469599343087f, -0.000132435209367f, 0.006825335978847f,
    0.007591874863458f, -0.000245869457659f, -0.009551169751996f, -0.009911748689102f,
    0.000892000702408f, 0.012696291341598f, 0.012334588810651f, -0.001845161220441f,
    -0.016187800537164f, -0.014748926961950f, 0.003126301767204f, 0.019920902683634f,
    0.017034077795409f, -0.004733452291149f, -0.023763255767240f, -0.019068931506423f,
    0.006638826986848f, 0.027561919427419f, 0.020741144106118f, -0.008788127542697f,
    -0.031152444028651f, -0.021955893784496f, 0.011102261978202f, 0.034369417317505f,
    0.022643398630893f, -0.013481458838518f, -0.037057625043152f, -0.022764498494440f,
    0.015811512783128f, 0.039082897934062f, 0.022313781570368f, -0.017971673579436f,
    -0.040341720631682f, -0.021319966539514f, 0.019843510355329f, 0.040768769783289f,
    0.019843510355329f, -0.021319966539514f, -0.040341720631682f, -0.017971673579436f,
    0.022313781570368f, 0.039082897934062f, 0.015811512783128f, -0.022764498494440f,
    -0.037057625043152f, -0.013481458838518f, 0.022643398630893f, 0.034369417317505f,
    0.011102261978202f, -0.021955893784496f, -0.031152444028651f, -0.008788127542697f,
    0.020741144106118f, 0.027561919427419f, 0.006638826986848f, -0.019068931506423f,
    -0.023763255767240f, -0.004733452291149f, 0.017034077795409f, 0.019920902683634f,
    0.003126301767204f, -0.014748926961950f, -0.016187800537164f, -0.001845161220441f,
    0.012334588810651f, 0.012696291341598f, 0.000892000702408f, -0.009911748689102f,
    -0.009551169751996f, -0.000245869457659f, 0.007591874863458f, 0.006825335978847f,
    -0.000132435209367f, -0.005469599343087f, -0.004558255825342f, 0.000294504718872f,
    0.003616916377301f, 0.002757166868333f, -0.000297930101834f, -0.002079650065343f,
    -0.001400720977817f, 0.000200070564347f, 0.000876409364883f, 0.000444546226721f,
    -0.000052605499217f, -0.000000000000000f, 0.000171934921060f, -0.000102626313704f,
    -0.000578975678768f, -0.000518167097288f, 0.000236167340635f, 0.000906803555463f,
    0.000665334397470f, -0.000331727883597f, -0.001040248784361f, -0.000680096547638f,
    0.000385289242048f, 0.001039754326263f, 0.000619701625117f, -0.000402781056466f,
    -0.000962952954961f, -0.000528803859817f, 0.000396739659391f, 0.000859129963005f,
    0.000438108561617f, -0.000382450225995f, -0.000765141306910f, -0.000364760801542f,
    0.000374109197549f, 0.000703111898430f, 0.000314212332551f
};

/* filtro para f2 = 4260 Hz */
__attribute__((aligned(16))) float h_f2[FIR_LEN] = {
    -0.000683828569936f, -0.000053019244850f, 0.000686091374577f, 0.000380966412093f,
    -0.000547993702376f, -0.000670520240854f, 0.000270045575472f, 0.000856170575223f,
    0.000117931026678f, -0.000871277018720f, -0.000543861566144f, 0.000675357198361f,
    0.000897866385133f, -0.000286635647506f, -0.001062866542546f, -0.000199995074458f,
    0.000965743846849f, 0.000628576130972f, -0.000627741101597f, -0.000837193150355f,
    0.000184723477236f, 0.000737644929917f, 0.000145796823824f, -0.000385531592680f,
    -0.000152896144662f, -0.000000000000000f, -0.000250863632441f, 0.000094859421913f,
    0.000933875176110f, 0.000395737660893f, -0.001526381854401f, -0.001568145361151f,
    0.001512715242287f, 0.003186035123101f, -0.000427583496705f, -0.004654906039812f,
    -0.001900696244029f, 0.005150912698576f, 0.005153878169076f, -0.003894092854265f,
    -0.008472878098688f, 0.000491754400454f, 0.010614531167188f, 0.004769863853380f,
    -0.010308140234277f, -0.010815391947076f, 0.006722255747096f, 0.015938698517078f,
    0.000110272702481f, -0.018231864362909f, -0.009076033121100f, 0.016185439149513f,
    0.018094847024546f, -0.009279416937328f, -0.024586326998999f, -0.001643094151115f,
    0.026189911352256f, 0.014383580438013f, -0.021535521848176f, -0.025832851516664f,
    0.010816680860485f, 0.032766988775725f, 0.004046361798820f, -0.032780940105721f,
    -0.019753503504562f, 0.025078196262519f, 0.032424590295558f, -0.010855528669664f,
    -0.038643726761034f, -0.006869344353337f, 0.036445999904184f, 0.023972989744459f,
    -0.025943667602735f, -0.036298954030673f, 0.009385986793173f, 0.040782933302330f,
    0.009385986793173f, -0.036298954030673f, -0.025943667602735f, 0.023972989744459f,
    0.036445999904184f, -0.006869344353337f, -0.038643726761034f, -0.010855528669664f,
    0.032424590295558f, 0.025078196262519f, -0.019753503504562f, -0.032780940105721f,
    0.004046361798820f, 0.032766988775725f, 0.010816680860485f, -0.025832851516664f,
    -0.021535521848176f, 0.014383580438013f, 0.026189911352256f, -0.001643094151115f,
    -0.024586326998999f, -0.009279416937328f, 0.018094847024546f, 0.016185439149513f,
    -0.009076033121100f, -0.018231864362909f, 0.000110272702481f, 0.015938698517078f,
    0.006722255747096f, -0.010815391947076f, -0.010308140234277f, 0.004769863853380f,
    0.010614531167188f, 0.000491754400454f, -0.008472878098688f, -0.003894092854265f,
    0.005153878169076f, 0.005150912698576f, -0.001900696244029f, -0.004654906039812f,
    -0.000427583496705f, 0.003186035123101f, 0.001512715242287f, -0.001568145361151f,
    -0.001526381854401f, 0.000395737660893f, 0.000933875176110f, 0.000094859421913f,
    -0.000250863632441f, -0.000000000000000f, -0.000152896144662f, -0.000385531592680f,
    0.000145796823824f, 0.000737644929917f, 0.000184723477236f, -0.000837193150355f,
    -0.000627741101597f, 0.000628576130972f, 0.000965743846849f, -0.000199995074458f,
    -0.001062866542546f, -0.000286635647506f, 0.000897866385133f, 0.000675357198361f,
    -0.000543861566144f, -0.000871277018720f, 0.000117931026678f, 0.000856170575223f,
    0.000270045575472f, -0.000670520240854f, -0.000547993702376f, 0.000380966412093f,
    0.000686091374577f, -0.000053019244850f, -0.000683828569936f
};

/* *************************************************************** 
 * Function prototypes 
 *****************************************************************/
/* Inits the ADC for continuous mode (channels, attenuation, frequency, handles, ...)*/
 static void continuous_adc_init(adc_channel_t *channel, uint8_t channel_num, adc_continuous_handle_t *out_handle);
 /* Callback of ADC driver. Executed whenever a new frame is available */
static bool s_conv_done_cb(adc_continuous_handle_t handle, const adc_continuous_evt_data_t *edata, void *user_data);
/* Task called to process one full buffer of data. A queue + blocking read is used for synchronization and data passing */
static void pv_processor_task(void *pvParam);

/******************************************************************* 
 * The main task 
 *******************************************************************/
void app_main(void)
{
    /* Variable declarations */
    esp_err_t ret;          // Generic return code variable
    esp_err_t parse_ret;    // return code of ADC frame parse function 
    uint32_t ret_num = 0;   // Length of bytes return by a read operation
    uint32_t sb_count = 0;   // For counting the number of acquired samples    
    uint32_t num_parsed_samples = 0;    // To count the number of parsed samples
    
    adc_continuous_evt_cbs_t cbs;   // Variable for setting callback type (internal poll full, or frame conversion completed)    
    adc_continuous_handle_t handle = NULL;  //Handle for ADC          

    float * sound_samp_buf_ADC;   // Buffer to hold sound samples. Sound buffers are float because conv() function requires float parameters - avoid conversions 
    
    /* Variable inits */
    memset(result, 0x00, MICEX_ADC_FRAME_SIZE); // Init frame buffer     
    sound_samp_buf_ADC = heap_caps_malloc(sizeof(float) * MICEX_SOUND_SAMPLES_BUF_SIZE, MALLOC_CAP_DMA);     

    s_task_handle = xTaskGetCurrentTaskHandle();    // Get handle of the current task

    cbs.on_conv_done = s_conv_done_cb;  // Callback called when one conversion frame is done     
    cbs.on_pool_ovf = NULL;          // Don't set callback for internbal buffer overflow         

    /* Set log level */
    /* Debug allow to see variable values */
    /* Info only shows the decision */
    /* Verbose shows a trace of calls an some additional vars*/
    esp_log_level_set(TAG,ESP_LOG_DEBUG);

    /* Processor task and Queue inits */
    XQ=xQueueCreate(1, sizeof(float)*MICEX_SOUND_SAMPLES_BUF_SIZE); // Create queue to store one full sample period of sound
    xTaskCreate(pv_processor_task, "Processor", PROCESSOR_TASK_STACK_SIZE, NULL, PROCESSOR_TASK_PRIORITY, NULL );

    /* Init ADC */
    continuous_adc_init(channel, sizeof(channel) / sizeof(adc_channel_t), &handle); // Call init function
    ESP_ERROR_CHECK(adc_continuous_register_event_callbacks(handle, &cbs, NULL));   // Regiter callbacks
    ESP_ERROR_CHECK(adc_continuous_start(handle));                                  // Start the ADC

    /* Infinite loop - wait for data and process it */
    /* Synchronization with ADC is obtained via the ulTaskNotifyTake(pdTRUE, portMAX_DELAY); call */
    /*     that assures that processing does not proceed until a notification that a frame was acquired*/
    while (1) {        
        ulTaskNotifyTake(pdTRUE, portMAX_DELAY); // Wait for a new frame

        while (1) {
            ret = adc_continuous_read(handle, result, MICEX_ADC_FRAME_SIZE, &ret_num, 0);
            if (ret == ESP_OK) {
                ESP_LOGV(TAG, "ret is %x, ret_num is %"PRIu32" bytes", ret, ret_num);                
                /* One frame received. Extract samples from frame and put them on sound sample buffer*/
                parse_ret = adc_continuous_parse_data(handle, result, ret_num, parsed_data, &num_parsed_samples);
                if (parse_ret == ESP_OK) {
                    
                    for (int i = 0; i < num_parsed_samples; i++) {
                        sound_samp_buf_ADC[sb_count] = (float) parsed_data[i].raw_data;                           
                        sb_count+=1;
                        if(sb_count == MICEX_SOUND_SAMPLES_BUF_SIZE) { // The sound buffer is full. Process it ... */
                            ESP_LOGD(TAG, "sound buffer acquired. Time to process ...\n");                
                            xQueueSend(XQ,(void *)sound_samp_buf_ADC,0);     // Places the sound buffer in the queue. If the queue is full skip it (ticksTo Wait set to 0)
                                                                        // The consumer/processing task is automatically waked if blocked in the Queue
                            sb_count = 0;
                        }
                    }

                } else {
                    ESP_LOGE(TAG, "Data parsing failed: %s", esp_err_to_name(parse_ret));
                }
                /*                  
                 * To avoid a task watchdog timeout, add a delay here. 
                 */
                vTaskDelay(1);
            } else if (ret == ESP_ERR_TIMEOUT) {
                //We try to read `EXAMPLE_READ_LEN` until API returns timeout, which means there's no available data
                break;
            }
        }
    }

    ESP_ERROR_CHECK(adc_continuous_stop(handle));
    ESP_ERROR_CHECK(adc_continuous_deinit(handle));
}


/* **********************************************************************************************
 * Task activated when there is a full buffer of sound samples data available
 * The task reads a queue in blocking mode. This wait it awakes whenever the ADC processing code
 *      (the app_main taks in the case) delivers a new full buffer of data. 
 * Note that the use of a Queue and two separate buffers (ADC and processing) decouples the 
 *      acquisition from processing. I.e., processing can take as much time as needed without race conditions
 *      or any other sort of interference. The cost is overhead ...
 ************************************************************************************************/
void pv_processor_task(void *pvParam)
{
    /* Local vars, for auxiliary computations */    
    int n;        
    float * sound_samp_buf_proc;       // Buffer to hold sound samples. Buffers are float because conv() function requires float parameters - avoid conversions     
    
    /* Variable inits */
    sound_samp_buf_proc = heap_caps_malloc(sizeof(float) * MICEX_SOUND_SAMPLES_BUF_SIZE, MALLOC_CAP_DMA);         
    

    /* variaveis para os filtros e energias */
    float *conv_out;
    float energy0, energy1, energy2, energia_max;
    float media_dc;
    int i;

    /* variaveis de amostragem */
    int votos[3];
    int conta_amostras = 0;

    /* variaveis da sequencia */
    int sequencia[SEQ_LEN];
    int pos_sequencia  = 0;
    int porta_aberta   = 0;

    /* flag que indica que estamos a aguardar silencio antes de aceitar o proximo simbolo */
    /* e ativada apos confirmar um simbolo correto ou apos um erro */
    int aguarda_silencio     = 0;
    int ciclos_silencio      = 0;
    /* 1 segundo de silencio */
    #define SILENCIO_BUFFERS  ((MICEX_ADC_SAMPLE_FREQ) / (MICEX_SOUND_SAMPLES_BUF_SIZE))

    /* alocamento da memoria para a saida da convolucao */
    conv_out = heap_caps_malloc(sizeof(float) * (MICEX_SOUND_SAMPLES_BUF_SIZE + FIR_LEN - 1), MALLOC_CAP_DMA);

    /* configuração do LED como output */
    gpio_config_t led_conf = {};
    led_conf.intr_type    = GPIO_INTR_DISABLE;
    led_conf.mode         = GPIO_MODE_OUTPUT;
    led_conf.pin_bit_mask = (1ULL << LED_GPIO);
    led_conf.pull_down_en = 0;
    led_conf.pull_up_en   = 0;
    gpio_config(&led_conf);
    gpio_set_level(LED_GPIO, 0);

    votos[0] = 0; votos[1] = 0; votos[2] = 0;

    /* Infinite processing loop */
    for(;;) {
        /* Waits for new data */
        xQueueReceive(XQ,(void *)sound_samp_buf_proc,portMAX_DELAY); // Reads a sound sample. Blocks if queue is empty.
        ESP_LOGV(TAG, "Process Task got a buffer!");

        /* removo a componente DC do buffer antes de filtrar */
        media_dc = 0.0f;
        for(i = 0; i < MICEX_SOUND_SAMPLES_BUF_SIZE; i++) media_dc += sound_samp_buf_proc[i];
        media_dc /= MICEX_SOUND_SAMPLES_BUF_SIZE;
        for(i = 0; i < MICEX_SOUND_SAMPLES_BUF_SIZE; i++) sound_samp_buf_proc[i] -= media_dc;

        /* aplico os 3 filtros e calculo a energia de cada um */
        dsps_conv_f32(sound_samp_buf_proc, MICEX_SOUND_SAMPLES_BUF_SIZE, h_f0, FIR_LEN, conv_out);
        energy0 = 0.0f;
        for(i = 0; i < MICEX_SOUND_SAMPLES_BUF_SIZE; i++) energy0 += conv_out[i] * conv_out[i];
        energy0 /= MICEX_SOUND_SAMPLES_BUF_SIZE;

        dsps_conv_f32(sound_samp_buf_proc, MICEX_SOUND_SAMPLES_BUF_SIZE, h_f1, FIR_LEN, conv_out);
        energy1 = 0.0f;
        for(i = 0; i < MICEX_SOUND_SAMPLES_BUF_SIZE; i++) energy1 += conv_out[i] * conv_out[i];
        energy1 /= MICEX_SOUND_SAMPLES_BUF_SIZE;

        dsps_conv_f32(sound_samp_buf_proc, MICEX_SOUND_SAMPLES_BUF_SIZE, h_f2, FIR_LEN, conv_out);
        energy2 = 0.0f;
        for(i = 0; i < MICEX_SOUND_SAMPLES_BUF_SIZE; i++) energy2 += conv_out[i] * conv_out[i];
        energy2 /= MICEX_SOUND_SAMPLES_BUF_SIZE;

        /* o simbolo é sempre o filtro com maior energia*/
        /* só é considerado silêncio se o filtro com mais enegergia não passar do limiar */
        if(energy0 >= energy1 && energy0 >= energy2)      energia_max = energy0;
        else if(energy1 >= energy0 && energy1 >= energy2) energia_max = energy1;
        else                                               energia_max = energy2;

        int simbolo_buffer = -1;
        if(energia_max >= ENERGY_THRESHOLD) {
            if     (energy0 == energia_max) simbolo_buffer = 0;
            else if(energy1 == energia_max) simbolo_buffer = 1;
            else                            simbolo_buffer = 2;
        }

        printf("Energias: f0=%.2f f1=%.2f f2=%.2f -> %s\n",
               energy0, energy1, energy2,
               simbolo_buffer < 0 ? "silencio" : (simbolo_buffer == 0 ? "simbolo 0" :
                                                   simbolo_buffer == 1 ? "simbolo 1" : "simbolo 2"));

        /* aguardar silencio apos confirmar um simbolo ou erro */
        if(aguarda_silencio) {
            if(simbolo_buffer < 0) {
                ciclos_silencio++;
                if(ciclos_silencio >= SILENCIO_BUFFERS) {
                    /*se a condição for satisfeita aceita-se o próximo simbolo*/
                    aguarda_silencio = 0;
                    ciclos_silencio  = 0;
                    votos[0] = 0; votos[1] = 0; votos[2] = 0;
                    conta_amostras = 0;
                    printf("  Silencio detetado - pronto para o proximo simbolo\n");
                }
            } else {
                /* se ainda ouvir som reseta a contagem de silencio */
                ciclos_silencio = 0;
            }
            continue;
        }

        /* se há silencio antes de comecar a ouvir um simbolo, ignora-se */
        if(simbolo_buffer < 0) {
            votos[0] = 0; votos[1] = 0; votos[2] = 0;
            conta_amostras = 0;
            continue;
        }

        /* registo o voto desta amostra */
        votos[simbolo_buffer]++;
        conta_amostras++;
        printf("  Amostra %d/%d -> voto no simbolo %d\n", conta_amostras, AMOSTRAS_POR_SIMBOLO, simbolo_buffer);

        /* so se avalia depois de recolher 4 amostras */
        if(conta_amostras < AMOSTRAS_POR_SIMBOLO) {
            continue;
        }

        /* amostras suficientes, usa-se o símbolo que tiver mais votos */
        int simbolo_decidido;
        if(votos[0] >= votos[1] && votos[0] >= votos[2])      simbolo_decidido = 0;
        else if(votos[1] >= votos[0] && votos[1] >= votos[2]) simbolo_decidido = 1;
        else                                                    simbolo_decidido = 2;

        printf("  Simbolo decidido: %d (votos: f0=%d f1=%d f2=%d)\n",
               simbolo_decidido, votos[0], votos[1], votos[2]);

        /* apos decidir o simbolo, aguarda-se silencio antes do proximo */
        aguarda_silencio = 1;
        ciclos_silencio  = 0;

        /* a sequencia a verificar depende do estado atual da porta */
        const int *seq_alvo = porta_aberta ? seq_fechar : seq_abrir;

        /* verifica-se se o simbolo está correto na posição atual da sequencia */
        if(simbolo_decidido != seq_alvo[pos_sequencia]) {
            printf("  ERRO na posicao %d: recebi %d, esperava %d (%s)\n",
                   pos_sequencia, simbolo_decidido, seq_alvo[pos_sequencia],
                   porta_aberta ? "fechar" : "abrir");
            printf(">>> SEQUENCIA INVALIDA - a piscar LED 5s <<<\n");
            for(i = 0; i < 10; i++) {
                gpio_set_level(LED_GPIO, 1);
                vTaskDelay(pdMS_TO_TICKS(250));
                gpio_set_level(LED_GPIO, 0);
                vTaskDelay(pdMS_TO_TICKS(250));
            }
            gpio_set_level(LED_GPIO, porta_aberta);
            pos_sequencia = 0;
            continue;
        }

        /* simbolo correto, avança na sequência */
        sequencia[pos_sequencia] = simbolo_decidido;
        pos_sequencia++;
        printf("  Posicao %d/%d correta!\n", pos_sequencia, SEQ_LEN);

        /* se chega ao fim da sequência, abre ou fecha a porta */
        if(pos_sequencia == SEQ_LEN) {
            if(porta_aberta) {
                porta_aberta = 0;
                gpio_set_level(LED_GPIO, 0);
                printf(">>> PORTA FECHADA <<<\n");
            } else {
                porta_aberta = 1;
                gpio_set_level(LED_GPIO, 1);
                printf(">>> PORTA ABERTA <<<\n");
            }
            pos_sequencia = 0;
        }
    }
}

/* ADC Callback - called when one frame was acquired */
static bool IRAM_ATTR s_conv_done_cb(adc_continuous_handle_t handle, const adc_continuous_evt_data_t *edata, void *user_data)
{
    BaseType_t mustYield = pdFALSE;
    //Notify that ADC continuous driver has done enough number of conversions
    vTaskNotifyGiveFromISR(s_task_handle, &mustYield);

    return (mustYield == pdTRUE);
}

/* ADC init function */
static void continuous_adc_init(adc_channel_t *channel, uint8_t channel_num, adc_continuous_handle_t *out_handle)
{
    adc_continuous_handle_t handle = NULL;

    adc_continuous_handle_cfg_t adc_config = {
        .max_store_buf_size = MICEX_ADC_BUF_SIZE,
        .conv_frame_size = MICEX_ADC_FRAME_SIZE,
    };
    ESP_ERROR_CHECK(adc_continuous_new_handle(&adc_config, &handle));

    adc_continuous_config_t dig_cfg = {
        .sample_freq_hz = MICEX_ADC_SAMPLE_FREQ,
        .conv_mode = MICEX_ADC_CONV_MODE,
    };

    adc_digi_pattern_config_t adc_pattern[SOC_ADC_PATT_LEN_MAX] = {0};
    dig_cfg.pattern_num = channel_num;
    for (int i = 0; i < channel_num; i++) {
        adc_pattern[i].atten = MICEX_ADC_ATTEN;
        adc_pattern[i].channel = channel[i] & 0x7;
        adc_pattern[i].unit = MICEX_ADC_UNIT;
        adc_pattern[i].bit_width = MICEX_ADC_BIT_WIDTH;

        ESP_LOGI(TAG, "adc_pattern[%d].atten is :%"PRIx8, i, adc_pattern[i].atten);
        ESP_LOGI(TAG, "adc_pattern[%d].channel is :%"PRIx8, i, adc_pattern[i].channel);
        ESP_LOGI(TAG, "adc_pattern[%d].unit is :%"PRIx8, i, adc_pattern[i].unit);
    }
    dig_cfg.adc_pattern = adc_pattern;
    ESP_ERROR_CHECK(adc_continuous_config(handle, &dig_cfg));

    *out_handle = handle;
}