#include <detpic32.h>

void _int_(27) isr_adc(void) // O vetor do A/D é o 27
{
    // Lê o resultado da conversão (ADC1BUF0) e imprime
    printInt(ADC1BUF0, 16 | 3 << 16);
    putChar('\n');

    // Inicia nova conversão A/D
    AD1CON1bits.ASAM = 1;

    // Faz reset à flag de interrupção do A/D
    IFS1bits.AD1IF = 0;
}

int main(void)
{
    // Configurações do ADC (exemplo comum com leitura do AN4 no RB4)
    TRISBbits.TRISB4 = 1;     // Desliga saída digital do RB4
    AD1PCFGbits.PCFG4= 0;     // RB4 configurado como entrada analógica (AN4)
    AD1CON1bits.SSRC = 7;     // Counter interno termina a amostragem e inicia a conversão
    AD1CON1bits.CLRASAM = 1;  // Para conversões quando a interrupção é gerada
    AD1CON3bits.SAMC = 16;    // Tempo de amostragem é 16 TAD
    AD1CON2bits.SMPI = 0;     // Interrupção gerada após 1 conversão
    AD1CHSbits.CH0SA = 4;     // Seleciona o canal 4
    AD1CON1bits.ON = 1;       // Ativa o módulo A/D

    // Configuração do Sistema de Interrupções
    IPC6bits.AD1IP = 2;       // Configura prioridade das interrupções A/D para 2
    IFS1bits.AD1IF = 0;       // Limpa flag de interrupção do A/D (pendentes)
    IEC1bits.AD1IE = 1;       // Autoriza as interrupções do módulo A/D

    EnableInterrupts();       // Ativa interrupções globalmente (Macro)

    // Inicia a primeira conversão A/D
    AD1CON1bits.ASAM = 1;

    while(1)
    {
        // A atividade é toda processada pela ISR (RSI)
    }
    
    return 0;
}
