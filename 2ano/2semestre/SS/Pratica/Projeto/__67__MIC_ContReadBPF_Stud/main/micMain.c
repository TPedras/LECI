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
#include "driver/gpio.h"            // Necessário para controlar os pinos (LED)

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

/* Frequencias dos simbolos (Turma 5, NMECs: 116113 e 125804)
   F0 = 5*500 = 2500Hz
   F1 = 2500+700+3*20 = 3260
   F2 = 3380+700+60 = 4020Hz */
#define FREQ0                            2500
#define FREQ1                            3260
#define FREQ2                            4020

#define LED_GPIO                         11 
#define SOUND_THRESHOLD                  50.0f  /* limiar de som para deteção */

const int SEQ_ABRIR[4] = {0, 1, 2, 0};
const int SEQ_FECHAR[4] = {2, 1, 0, 2};

int seq_detetada[4] = {-1, -1, -1, -1};
int seq_id = 0;
int simbolo_anterior = -1;
int silencio_count = 0;

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

// Impulse reponse filter 
__attribute__((aligned(16))) float h_f0[151] = {-0.000361579334616f, 0.000162099328389f, 0.000645423677402f, 0.000793871457360f, 0.000470161017624f, -0.000201633932768f, -0.000864425436137f, -0.001100199099421f, -0.000675592129842f, 0.000272584348526f, 0.001243426434454f, 0.001613059947951f, 0.001011784516284f, -0.000377675376689f, -0.001817347919223f, -0.002377772822822f, -0.001509245604744f, 0.000515351024004f, 0.002610238016727f, 0.003427626915224f, 0.002192361485287f, -0.000679800867545f, -0.003632810127457f, -0.004780456437120f, -0.003076888141899f, 0.000861376454912f, 0.004880835853860f, 0.006436102555524f, 0.004167852450724f, -0.001047364076032f, -0.006334527101267f, -0.008374979320066f, -0.005458045087384f, 0.001223048968218f, 0.007958972221583f, 0.010557887811078f, 0.006927253018665f, -0.001372980262334f, -0.009705615868248f, -0.012927137805922f, -0.008542331859163f, 0.001482328000301f, 0.011514697218807f, 0.015408944946997f, 0.010258161224637f, -0.001538214939053f, -0.013318492018792f, -0.017916980353270f, -0.012019463369777f, 0.001530907379635f, 0.015045145693933f, 0.020356865597050f, 0.013763401505872f, -0.001454760819106f, -0.016622841917277f, -0.022631335292748f, -0.015422814133481f, 0.001308836841077f, 0.017984026682614f, 0.024645737622828f, 0.016929890227598f, -0.001097135572103f, -0.019069403891216f, -0.026313514027078f, -0.018220051378239f, 0.000828420832439f, 0.019831434926239f, 0.027561295409471f, 0.019235784341110f, -0.000515649968234f, -0.020237110336266f, -0.028333274114141f, -0.019930163051824f, 0.000175054252476f, 0.020269813804152f, 0.028594557211571f, 0.020269813804152f, 0.000175054252476f, -0.019930163051824f, -0.028333274114141f, -0.020237110336266f, -0.000515649968234f, 0.019235784341110f, 0.027561295409471f, 0.019831434926239f, 0.000828420832439f, -0.018220051378239f, -0.026313514027078f, -0.019069403891216f, -0.001097135572103f, 0.016929890227598f, 0.024645737622828f, 0.017984026682614f, 0.001308836841077f, -0.015422814133481f, -0.022631335292748f, -0.016622841917277f, -0.001454760819106f, 0.013763401505872f, 0.020356865597050f, 0.015045145693933f, 0.001530907379635f, -0.012019463369777f, -0.017916980353270f, -0.013318492018792f, -0.001538214939053f, 0.010258161224637f, 0.015408944946997f, 0.011514697218807f, 0.001482328000301f, -0.008542331859163f, -0.012927137805922f, -0.009705615868248f, -0.001372980262334f, 0.006927253018665f, 0.010557887811078f, 0.007958972221583f, 0.001223048968218f, -0.005458045087384f, -0.008374979320066f, -0.006334527101267f, -0.001047364076032f, 0.004167852450724f, 0.006436102555524f, 0.004880835853860f, 0.000861376454912f, -0.003076888141899f, -0.004780456437120f, -0.003632810127457f, -0.000679800867545f, 0.002192361485287f, 0.003427626915224f, 0.002610238016727f, 0.000515351024004f, -0.001509245604744f, -0.002377772822822f, -0.001817347919223f, -0.000377675376689f, 0.001011784516284f, 0.001613059947951f, 0.001243426434454f, 0.000272584348526f, -0.000675592129842f, -0.001100199099421f, -0.000864425436137f, -0.000201633932768f, 0.000470161017624f, 0.000793871457360f, 0.000645423677402f, 0.000162099328389f, -0.000361579334616f};

__attribute__((aligned(16))) float h_f1[151] = {0.000254153645574f, 0.000710004056811f, 0.000502106966408f, -0.000242803422885f, -0.000848381878856f, -0.000675891997754f, 0.000230706250648f, 0.001066553180585f, 0.000944737307554f, -0.000201019944271f, -0.001374533750981f, -0.001338002071652f, 0.000129368449841f, 0.001773929077260f, 0.001882930505380f, 0.000014933273542f, -0.002256640502590f, -0.002601891956522f, -0.000266979682866f, 0.002804265083075f, 0.003509742827598f, 0.000663810030666f, -0.003388278528504f, -0.004611525207401f, -0.001241537813104f, 0.003971033964041f, 0.005900701320999f, 0.002032272359628f, -0.004507548077800f, -0.007358091271236f, -0.003061055746755f, 0.004947985111383f, 0.008951636023243f, 0.004343047157258f, -0.005240692798953f, -0.010637051276957f, -0.005881178445277f, 0.005335597196481f, 0.012359374783137f, 0.007664479186216f, -0.005187729187509f, -0.014055344394680f, -0.009667228384528f, 0.004760637208439f, 0.015656481577940f, 0.011849036004769f, -0.004029440150955f, -0.017092699998231f, -0.014155894339522f, 0.002983291905981f, 0.018296215421556f, 0.016522171452871f, -0.001627063682497f, -0.019205505007558f, -0.018873451488093f, -0.000017900178011f, 0.019769053482071f, 0.021130064505364f, 0.001914036066889f, -0.019948631758745f, -0.023211096394406f, -0.004008839524639f, 0.019721880029816f, 0.025038631275613f, 0.006237112485472f, -0.019084010489448f, -0.026541957650617f, -0.008524055882216f, 0.018048501748007f, 0.027661467144351f, 0.010789024225601f, -0.016646723648908f, -0.028351991372730f, -0.012949711120587f, 0.014926502859676f, 0.028585357234022f, 0.014926502859676f, -0.012949711120587f, -0.028351991372730f, -0.016646723648908f, 0.010789024225601f, 0.027661467144351f,0.018048501748007f, -0.008524055882216f, -0.026541957650617f, -0.019084010489448f, 0.006237112485472f, 0.025038631275613f, 0.019721880029816f, -0.004008839524639f, -0.023211096394406f, -0.019948631758745f, 0.001914036066889f, 0.021130064505364f, 0.019769053482071f, -0.000017900178011f, -0.018873451488093f, -0.019205505007558f, -0.001627063682497f, 0.016522171452871f, 0.018296215421556f, 0.002983291905981f, -0.014155894339522f, -0.017092699998231f, -0.004029440150955f, 0.011849036004769f, 0.015656481577940f, 0.004760637208439f, -0.009667228384528f, -0.014055344394680f, -0.005187729187509f, 0.007664479186216f, 0.012359374783137f, 0.005335597196481f, -0.005881178445277f, -0.010637051276957f, -0.005240692798953f, 0.004343047157258f, 0.008951636023243f, 0.004947985111383f, -0.003061055746755f, -0.007358091271236f, -0.004507548077800f, 0.002032272359628f, 0.005900701320999f, 0.003971033964041f, -0.001241537813104f, -0.004611525207401f, -0.003388278528504f, 0.000663810030666f, 0.003509742827598f, 0.002804265083075f, -0.000266979682866f, -0.002601891956522f, -0.002256640502590f, 0.000014933273542f, 0.001882930505380f, 0.001773929077260f, 0.000129368449841f, -0.001338002071652f, -0.001374533750981f, -0.000201019944271f, 0.000944737307554f, 0.001066553180585f, 0.000230706250648f, -0.000675891997754f, -0.000848381878856f, -0.000242803422885f, 0.000502106966408f, 0.000710004056811f, 0.000254153645574f};
__attribute__((aligned(16))) float h_f2[151] = {0.000661753505249f, 0.000381500404496f, -0.000489270037788f, -0.000749995721972f, 0.000068947488939f, 0.000917928290383f, 0.000528898167550f, -0.000738173986222f, -0.001128415059399f, 0.000131824461463f, 0.001454731741981f, 0.000819945498452f, -0.001214931743006f, -0.001814475622976f, 0.000252811251235f, 0.002367314541227f, 0.001284153025634f, -0.001989374697569f, -0.002871671210334f, 0.000459654279962f, 0.003724008371961f, 0.001931825292559f, -0.003112159556516f, -0.004330144141956f, 0.000778902420860f, 0.005555603915070f, 0.002751838328094f, -0.004606333425648f, -0.006180438270896f, 0.001231670698807f, 0.007847999854726f, 0.003711846469264f, -0.006461197639626f, -0.008371252245672f, 0.001829537436609f, 0.010539210778950f, 0.004760909019752f, -0.008629331690958f, -0.010811565895939f, 0.002571149381820f, 0.013521269974546f, 0.005834242903264f, -0.011027323075944f, -0.013377032350132f, 0.003440056529108f, 0.016647036461503f, 0.006859559935568f, -0.013540354641892f, -0.015920054147771f, 0.004404172751541f, 0.019741373393252f, 0.007764266409748f, -0.016030371882635f, -0.018282547924855f, 0.005417073400604f, 0.022615669361982f, 0.008482709594863f, -0.018347138061552f, -0.020310097123859f, 0.006421118547355f, 0.025084283026094f, 0.008962660671430f, -0.020341134326566f, -0.021866030954863f, 0.007352158082289f, 0.026981251368948f, 0.009170324564118f, -0.021877018222475f, -0.022843969116184f, 0.008145362310899f, 0.028175542420704f, 0.009093350299004f, -0.022846248748333f, -0.023177535261526f, 0.008741557232747f, 0.028583263431733f, 0.008741557232747f, -0.023177535261526f, -0.022846248748333f, 0.009093350299004f, 0.028175542420704f, 0.008145362310899f, -0.022843969116184f, -0.021877018222475f, 0.009170324564118f, 0.026981251368948f, 0.007352158082289f, -0.021866030954863f, -0.020341134326566f, 0.008962660671430f, 0.025084283026094f, 0.006421118547355f, -0.020310097123859f, -0.018347138061552f, 0.008482709594863f, 0.022615669361982f, 0.005417073400604f, -0.018282547924855f, -0.016030371882635f, 0.007764266409748f,0.019741373393252f, 0.004404172751541f, -0.015920054147771f, -0.013540354641892f, 0.006859559935568f, 0.016647036461503f, 0.003440056529108f, -0.013377032350132f, -0.011027323075944f, 0.005834242903264f, 0.013521269974546f, 0.002571149381820f, -0.010811565895939f, -0.008629331690958f, 0.004760909019752f, 0.010539210778950f, 0.001829537436609f, -0.008371252245672f, -0.006461197639626f, 0.003711846469264f, 0.007847999854726f, 0.001231670698807f, -0.006180438270896f, -0.004606333425648f, 0.002751838328094f, 0.005555603915070f, 0.000778902420860f, -0.004330144141956f, -0.003112159556516f, 0.001931825292559f, 0.003724008371961f, 0.000459654279962f, -0.002871671210334f, -0.001989374697569f, 0.001284153025634f, 0.002367314541227f, 0.000252811251235f, -0.001814475622976f, -0.001214931743006f, 0.000819945498452f, 0.001454731741981f, 0.000131824461463f, -0.001128415059399f, -0.000738173986222f, 0.000528898167550f, 0.000917928290383f, 0.000068947488939f, -0.000749995721972f, -0.000489270037788f, 0.000381500404496f, 0.000661753505249f};

/* *************************************************************** 
 * Function prototypes 
 *****************************************************************/
 static void continuous_adc_init(adc_channel_t *channel, uint8_t channel_num, adc_continuous_handle_t *out_handle);
 static bool s_conv_done_cb(adc_continuous_handle_t handle, const adc_continuous_evt_data_t *edata, void *user_data);
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

    // Configuração robusta do LED usando gpio_config_t (inspirada no micm.c)
    gpio_config_t led_conf = {
        .intr_type = GPIO_INTR_DISABLE,
        .mode = GPIO_MODE_OUTPUT, 
        .pin_bit_mask = (1ULL << LED_GPIO),
        .pull_down_en = GPIO_PULLDOWN_DISABLE,
        .pull_up_en = GPIO_PULLUP_DISABLE,
    };
    gpio_config(&led_conf);
    gpio_set_level(LED_GPIO, 0); // Começa desligado

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
    float * filtered_samp_buf;     
    int estado_porta = 0;
    
    /* Variable inits */
    sound_samp_buf_proc = heap_caps_malloc(sizeof(float) * MICEX_SOUND_SAMPLES_BUF_SIZE, MALLOC_CAP_DMA);         
    filtered_samp_buf = heap_caps_malloc(sizeof(float) * (MICEX_SOUND_SAMPLES_BUF_SIZE + MAX_FILT_IR_LEN), MALLOC_CAP_DMA);

    /* Infinite processing loop */
    for(;;) {
        /* Waits for new data */
        xQueueReceive(XQ,(void *)sound_samp_buf_proc,portMAX_DELAY); // Reads a sound sample. Blocks if queue is empty.
        ESP_LOGV(TAG, "Process Task got a buffer!");

        // Remove o offset DC do sinal
        float mean_dc = 0;
        for (n = 0; n < MICEX_SOUND_SAMPLES_BUF_SIZE; n++) {
            mean_dc += sound_samp_buf_proc[n];
        }
        mean_dc /= MICEX_SOUND_SAMPLES_BUF_SIZE;

        for (n = 0; n < MICEX_SOUND_SAMPLES_BUF_SIZE; n++) {
            sound_samp_buf_proc[n] -= mean_dc;
        }

        // Aplicar a convolucao para cada uma das frequencias alvo
        int fir_len = sizeof(h_f0) / sizeof(float);
        int conv_out_len = MICEX_SOUND_SAMPLES_BUF_SIZE + fir_len - 1;
        float energy0 = 0, energy1 = 0, energy2 = 0;

        // Filtro F0
        dsps_conv_f32(sound_samp_buf_proc, MICEX_SOUND_SAMPLES_BUF_SIZE, h_f0, fir_len, filtered_samp_buf);
        for (n = 0; n < conv_out_len; n++) {
            energy0 += filtered_samp_buf[n] * filtered_samp_buf[n];
        }
        energy0 /= conv_out_len;

        // Filtro F1
        dsps_conv_f32(sound_samp_buf_proc, MICEX_SOUND_SAMPLES_BUF_SIZE, h_f1, fir_len, filtered_samp_buf);
        for (n = 0; n < conv_out_len; n++) {
            energy1 += filtered_samp_buf[n] * filtered_samp_buf[n];
        }
        energy1 /= conv_out_len;

        // Filtro F2
        dsps_conv_f32(sound_samp_buf_proc, MICEX_SOUND_SAMPLES_BUF_SIZE, h_f2, fir_len, filtered_samp_buf);
        for (n = 0; n < conv_out_len; n++) {
            energy2 += filtered_samp_buf[n] * filtered_samp_buf[n];
        }
        energy2 /= conv_out_len;

        int current_detected = -1;
        
        if (energy0 > SOUND_THRESHOLD && energy0 > energy1 && energy0 > energy2) {
            current_detected = 0;
        } else if (energy1 > SOUND_THRESHOLD && energy1 > energy0 && energy1 > energy2) {
            current_detected = 1;
        } else if (energy2 > SOUND_THRESHOLD && energy2 > energy0 && energy2 > energy1) {
            current_detected = 2;
        }

        ESP_LOGI(TAG, "Energias -> F0: %.2f | F1: %.2f | F2: %.2f | Simbolo atual: %d", energy0, energy1, energy2, current_detected);

        if (current_detected != -1) {
            if (current_detected != simbolo_anterior) {
                ESP_LOGI(TAG, "Simbolo novo detetado: %d", current_detected);
                seq_detetada[seq_id++] = current_detected;
                simbolo_anterior = current_detected;
                current_detected = -1;
                silencio_count = 0;

                ESP_LOGI(TAG, "Posicao na sequencia: %d de 4 (detetados ate agora: [%d, %d, %d, %d])", seq_id, seq_detetada[0], seq_detetada[1], seq_detetada[2], seq_detetada[3]);
                // Verificação de Prefixo (vê se o que temos até agora condiz com o INÍCIO de ABRIR ou FECHAR)
                int abrir_ok = 1;
                int fechar_ok = 1;

                for (int i = 0; i < seq_id; i++) {
                    if (seq_detetada[i] != SEQ_ABRIR[i]) abrir_ok = 0;
                    if (seq_detetada[i] != SEQ_FECHAR[i]) fechar_ok = 0;
                }

                
                    if ((!abrir_ok && !estado_porta) || (!fechar_ok && estado_porta)) {
                    ESP_LOGE(TAG, "Sequencia incorreta");
                    seq_id = 0;
                    for (int i = 0; i < 4; i++) seq_detetada[i] = -1;
                    simbolo_anterior = -1;
                    for (int i = 0; i < 25; i++) {
                        gpio_set_level(LED_GPIO, !estado_porta);
                        vTaskDelay(pdMS_TO_TICKS(100));
                        gpio_set_level(LED_GPIO, estado_porta);
                        vTaskDelay(pdMS_TO_TICKS(100));
                    }
                } 
                // Se chegou ao fim (4 símbolos) e passou no teste de prefixo acima
                else if (seq_id == 4) {
                    if (abrir_ok) {
                        ESP_LOGI(TAG, "Porta ABERTA");
                        estado_porta = 1;
                        gpio_set_level(LED_GPIO, estado_porta);
                    } else { 
                        ESP_LOGI(TAG, "Porta FECHADA");
                        estado_porta = 0;
                        gpio_set_level(LED_GPIO, estado_porta);
                    }
                    
                    // Reset para a próxima tentativa
                    seq_id = 0;
                    for (int i = 0; i < 4; i++) seq_detetada[i] = -1;
                }
            }
        } else {

            silencio_count++;
            if (silencio_count > 3) simbolo_anterior = -1; 
            
            if (silencio_count > 20) {
                seq_id = 0;
                for (int i = 0; i < 4; i++) seq_detetada[i] = -1;
                ESP_LOGI(TAG, "Sequencia limpa");1
                silencio_count = 0;
            }
        }
    }
}

/* Funções Auxiliares do ADC (Originais) */
static bool IRAM_ATTR s_conv_done_cb(adc_continuous_handle_t handle, const adc_continuous_evt_data_t *edata, void *user_data)
{
    BaseType_t mustYield = pdFALSE;
    vTaskNotifyGiveFromISR(s_task_handle, &mustYield);
    return (mustYield == pdTRUE);
}

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
