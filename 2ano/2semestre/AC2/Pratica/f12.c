#include <detpic32.h>

int main(void)
{
    // 1. Configuração do módulo A/D
    TRISBbits.TRISB4 = 1;      // RB4 como entrada
    AD1PCFGbits.PCFG4 = 0;     // AN4 como analógico
    AD1CON1bits.SSRC = 7;      // Seleção de gatilho interno (auto-convert)
    AD1CON1bits.CLRASAM = 1;    // Para a conversão quando o buffer está cheio
    AD1CON1bits.ASAM = 0;      // Início manual da amostragem
    AD1CON2bits.SMPI = 1;      // 2 conversões (N-1 = 1) antes de gerar interrupção/flag
    AD1CHSbits.CH0SA = 4;      // Selecionar AN4
    AD1CON3bits.SAMC = 16;     // Tempo de amostragem (máximo para estabilidade)
    AD1CON1bits.ON = 1;        // Ativar o módulo A/D

    // 2. Configuração do LED1 (RE1)
    TRISEbits.TRISE1 = 0;      // RE1 como saída
    LATEbits.LATE1 = 0;        // Valor inicial 0

    // 3. Configuração dos Displays
    TRISB = TRISB & 0x80FF;    // RB14-RB8 como saídas (segmentos)
    TRISDbits.TRISD5 = 0;      // RD5 como saída (Seleção Low)
    TRISDbits.TRISD6 = 0;      // RD6 como saída (Seleção High)
    
    LATDbits.LATD5 = 1;        // Ativar display menos significativo
    LATDbits.LATD6 = 0;        // Desativar display mais significativo

    static const char codes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    while(1)
    {
        // 4. Iniciar amostragem e aguardar fim da conversão (Polling)
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0); // Espera que a flag de interrupção suba (fim das 2 conversões)

        // 5. Cálculo da média
        // ADC1BUF0 e ADC1BUF1 contêm os dois resultados
        int avg = (ADC1BUF0 + ADC1BUF1) / 2;

        // Resetar a flag para a próxima vez
        IFS1bits.AD1IF = 0;

        // i) Mostrar no ecrã do PC em Hexadecimal (3 dígitos)
        printInt(avg, 16 | (3 << 16));
        putChar('\r');

        // ii) Apresentar escala 0 a 9 no display
        // Fórmula: (Valor * (Max_Escala)) / Max_ADC
        int v_scale = (avg * 9) / 1023;
        LATB = (LATB & 0x80FF) | (codes[v_scale] << 8);

        // iii) Mudar estado do LED1
        LATEbits.LATE1 = !LATEbits.LATE1;

        // 6. Frequência de 6Hz (20,000,000 / 6 = 3,333,333 ticks)
        resetCoreTimer();
        while(readCoreTimer() < 3333333);
    }

    return 0;
}
