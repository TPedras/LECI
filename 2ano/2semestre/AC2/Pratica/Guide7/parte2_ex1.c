#include <detpic32.h>

void _int_(27) isr_adc(void)
{
    volatile int adc_value;
    
    // Passa a porta RD11 para nível baixo para demarcar início
    LATDbits.LATD11 = 0; 

    // Lê ADC1BUF0
    adc_value = ADC1BUF0; 

    // Passa a porta RD11 para nível alto
    LATDbits.LATD11 = 1; 

    // Inicia a próxima conversão
    AD1CON1bits.ASAM = 1; 

    // Limpa a flag da interrupção do A/D
    IFS1bits.AD1IF = 0; 
}

int main(void)
{
    // Configura o RD11 como saída (para usar o ponto de teste INT4)
    TRISDbits.TRISD11 = 0;

    // Configurações do ADC (SMPI = 0)
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 0;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    // Configuração de Interrupções
    IPC6bits.AD1IP = 2;
    IFS1bits.AD1IF = 0;
    IEC1bits.AD1IE = 1;

    EnableInterrupts();

    // Inicia a conversão
    AD1CON1bits.ASAM = 1;

    while(1)
    {
        // ...
    }
    return 0;
}
