#include <detpic32.h>

void delay ( int ms) {
    resetCoreTimer();
    while (readCoreTimer() < 20000 * ms); // 1 ms * ms
}

int main(void){
    int conversoes = 2; // número de conversões por amostra
    TRISBbits.TRISB4 = 1; // rb4 como entrada
    AD1PCFGbits.PCFG4 = 0; // rb4 como analógico

    AD1CON1bits.SSRC = 7; // conversão automática
    AD1CON1bits.CLRASAM = 1; // parar conversão quando o buffer estiver cheio

    AD1CON1bits.ASAM = 0; // iniciar amostragem manualmente

    AD1CON3bits.SAMC = 16; // 6 Hz de (1 TAD = 100 ns) tempo de amostragem
    AD1CON2bits.SMPI = conversoes - 1; // 2 conversoes por amostra
    AD1CHSbits.CH0SA = 4; // entrada do canal é a AN4
    AD1CON1bits.ON = 1; // ligar o conversor

    
    TRISB = TRISB & 0x80FF;    // RB14-RB8 como saídas (segmentos)
    TRISDbits.TRISD5 = 0;      // RD5 como saída (Seleção Low)
    TRISDbits.TRISD6 = 0;      // RD6 como saída (Seleção High)
    
    LATDbits.LATD5 = 1;        // Ativar display menos significativo
    LATDbits.LATD6 = 0;        // Desativar display mais significativo


    static const char codes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

    while(1){
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0); // esperar pela conversão
        // int media = (ADC1BUF0 + ADC1BUF1) / 2; // calcular a média das 2 conversões
        int *buffs = ( int *)(&ADC1BUF0); // ponteiro para o início do buffer
        for (int i = 0; i < conversoes; i++) {
            media + = buffs[i]; // somar as conversões
        }
        media /= conversoes; // calcular a média
        
        IFS1bits.AD1IF = 0;


        printInt(media, 16 | 3 << 16); // imprimir o valor da conversão em hexadecimal
        putChar('\r');

        int val = (media * 9) / 1023; // calcular o valor a mostrar no display
        LATB = (LATB & 0x80FF) | (codes[val] << 8);
        delay(20000 / 6)
    }
    return 0;
    
}