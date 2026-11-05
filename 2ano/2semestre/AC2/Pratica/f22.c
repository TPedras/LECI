#include <detpic32.h>

volatile int temperature = 0; // Variável global para ser lida pela rotina de interrupção

void send2displays(unsigned char value) {
    static const char display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
    static char displayFlag = 0;
    
    unsigned char digit_low = value % 10;
    unsigned char digit_high = value / 10;
    
    if(displayFlag == 0) {
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x80FF) | (display7Scodes[digit_low] << 8);
    } else {
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80FF) | (display7Scodes[digit_high] << 8);
    }
    displayFlag = !displayFlag;
}

// Rotina de interrupção do Timer 3
void _int_(12) isr_T3(void) {
    send2displays(temperature);
    IFS0bits.T3IF = 0; // Limpar a flag de interrupção do Timer 3
}

int main(void) {
    // 1. Configuração dos displays de 7 segmentos (RB8-RB14 e RD5-RD6)
    TRISB = TRISB & 0x80FF;
    TRISDbits.TRISD5 = 0;
    TRISDbits.TRISD6 = 0;

    // 2. Configuração do ADC (AN4/RB4)
    TRISBbits.TRISB4 = 1;      // Configurar RB4 como entrada
    AD1PCFGbits.PCFG4 = 0;     // Configurar AN4 como analógico
    AD1CON1bits.SSRC = 7;      // Conversão automática após amostragem
    AD1CON1bits.CLRASAM = 1;   // Parar conversões quando a flag for ativada
    AD1CON3bits.SAMC = 16;     // Tempo de amostragem definido para 16 TAD
    AD1CON2bits.SMPI = 1;      // 2 conversões por amostra (valor 1 significa 2 conversões: N-1)
    AD1CHSbits.CH0SA = 4;      // Selecionar canal AN4
    AD1CON1bits.ON = 1;        // Ativar o módulo ADC

    // 3. Configuração do Timer 3 (250Hz para refrescamento dos displays)
    // Prescaler = (20MHz / 250) / 65536 = 1.22 -> Devemos escolher o prescaler imediatamente acima: 2
    T3CONbits.TCKPS = 1;       // Prescaler = 2 (T3CONbits.TCKPS = 1 significa 1:2)
    PR3 = 39999;               // (20.000.000 / (2 * 250)) - 1 = 40000 - 1 = 39999
    TMR3 = 0;                  // Reset do contador
    T3CONbits.TON = 1;         // Ligar o Timer 3

    // 4. Configuração das interrupções para o Timer 3
    IPC3bits.T3IP = 2;         // Prioridade da interrupção (pode ser entre 1 e 6)
    IEC0bits.T3IE = 1;         // Ativar interrupções para o Timer 3
    IFS0bits.T3IF = 0;         // Limpar a flag antes de começar
    
    EnableInterrupts();        // Ativar interrupções globais

    while(1) {
        // 5. Temporização de 5Hz usando o Core Timer
        // O Core Timer funciona a metade do clock periférico (20MHz / 2 = 10MHz).
        // 1 segundo = 10.000.000 ticks. 5Hz (0.2s) = 2.000.000 ticks.
        resetCoreTimer();
        while(readCoreTimer() < 2000000); 

        // 6. Iniciar processo de amostragem do ADC
        AD1CON1bits.ASAM = 1; 

        // 7. Polling: Esperar pelo fim da conversão
        while(IFS1bits.AD1IF == 0);

        // 8. Calcular a média das 2 amostras e converter para temperatura
        // V_medio = (ADC1BUF0 + ADC1BUF1) / 2
        // A amplitude térmica é 75 - 10? Não, pelo enunciado de 2024 é de 7ºC a 73ºC (Delta = 66)
        // Temperatura = (V_medio * 66) / 1023 + 7
        // Temperatura = (((ADC1BUF0 + ADC1BUF1) / 2) * 66) / 1023 + 7
        // Otimização matemática: Temperatura = ((ADC1BUF0 + ADC1BUF1) * 33) / 1023 + 7
        // Adiciona-se 511 antes da divisão por 1023 para fazer um arredondamento correto (+0.5)
        
        int soma = ADC1BUF0 + ADC1BUF1;
        temperature = ((soma * 33) + 511) / 1023 + 7;

        // Limpar a flag do ADC para permitir futuras conversões
        IFS1bits.AD1IF = 0;
    }

    return 0;
}
