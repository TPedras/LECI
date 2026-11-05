#include <detpic32.h>

volatile unsigned char voltage = 0; // Variável global (volátil porque é acedida pela RSI e main)

// Função auxiliar para converter decimal para BCD
unsigned char toBcd(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

// Função para refrescar os displays
void send2displays(unsigned char value) {
    static const char display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    static char displayFlag = 0;

    unsigned char digit_low = value & 0x0F;
    unsigned char digit_high = value >> 4;

    if (displayFlag == 0) {
        LATDbits.LATD5 = 1; // Seleciona display menos significativo
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x80FF) | (display7Scodes[digit_low] << 8);
    } else {
        LATDbits.LATD5 = 0; // Seleciona display mais significativo
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80FF) | (display7Scodes[digit_high] << 8);
    }
    displayFlag = !displayFlag; // Alterna a flag para a próxima chamada
}

void _int_(27) isr_adc(void)
{
    int *p = (int *)(&ADC1BUF0);
    int sum = 0, i;

    // Lê 8 amostras (ADC1BUF0, ..., ADC1BUF7) e calcula a média
    for(i = 0; i < 8; i++) {
        sum += p[i*4];
    }
    int average = sum / 8;

    // Calcula a amplitude da tensão (0 a 33 para representar 0.0V a 3.3V)
    int v = (average * 33 + 511) / 1023;

    // Converte a amplitude para decimal (BCD) e armazena em "voltage"
    voltage = toBcd(v);

    // Faz reset à flag de interrupção
    IFS1bits.AD1IF = 0;
}

int main(void)
{
    unsigned int cnt = 0;

    // --- Configuração dos Displays ---
    TRISB = TRISB & 0x80FF; // RB14 a RB8 configurados como saídas (segmentos)
    TRISDbits.TRISD5 = 0;   // RD5 como saída (display low)
    TRISDbits.TRISD6 = 0;   // RD6 como saída (display high)

    // --- Configuração do ADC ---
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4= 0;     // AN4 analógico
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 7;     // Interrupção é gerada após 8 amostras
    AD1CHSbits.CH0SA = 4;     // Seleciona o canal AN4
    AD1CON1bits.ON = 1;

    // --- Configuração do Sistema de Interrupções ---
    IPC6bits.AD1IP = 2;       // Prioridade das interrupções do ADC (1-6)
    IFS1bits.AD1IF = 0;       // Limpa flag de interrupção
    IEC1bits.AD1IE = 1;       // Ativa as interrupções do ADC

    EnableInterrupts();       // Global Interrupt Enable

    while(1)
    {
        // Se contador atingiu 0 (a cada 200 ms, ou seja, a 5 Hz)
        if(cnt == 0)
        {
            // Inicia uma nova conversão A/D de 8 amostras
            AD1CON1bits.ASAM = 1;
        }

        // Envia o valor "voltage" para os displays
        send2displays(voltage);

        // Atualiza cnt (gestão da espera). Um ciclo é 10ms.
        // Frequência de 5 Hz corresponde a um período de 200ms.
        // 200ms / 10ms (atraso do ciclo) = 20 vezes que precisamos passar por aqui para atingir os 5Hz.
        cnt = (cnt + 1) % 20;

        // Espera 10 ms (frequência de refrescamento do display de 100 Hz)
        resetCoreTimer();
        while(readCoreTimer() < 200000); // (20 MHz (clocks/s) / 100 Hz = 200000)
    }
    
    return 0;
}
