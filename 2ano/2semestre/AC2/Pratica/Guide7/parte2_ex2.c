#include <detpic32.h>

void _int_(27) isr_adc(void)
{
    volatile int adc_value;

    adc_value = ADC1BUF0;

    AD1CON1bits.ASAM = 1;

    // Limpa a flag de interrupção
    IFS1bits.AD1IF = 0;

    // Passa a porta RD11 a nível alto no final da execução da RSI (para medir overhead global)
    LATDbits.LATD11 = 1; 
}

int main(void)
{
    // Configura o RD11 como saída
    TRISDbits.TRISD11 = 0;

    // Configuração do ADC
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 0;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    // Configuração de interrupções
    IPC6bits.AD1IP = 2;
    IFS1bits.AD1IF = 0;
    IEC1bits.AD1IE = 1;

    EnableInterrupts();

    AD1CON1bits.ASAM = 1;

    while(1)
    {
        // Volta a colocar RD11 a nível 0 no ciclo principal, logo que volta da interrupção
        LATDbits.LATD11 = 0;
    }
    
    return 0;
}
