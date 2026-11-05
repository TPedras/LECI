#include <detpic32.h>

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}

int main(void) {
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
    
    TRISBbits.TRISB3 = 1;

    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;
    TRISE = TRISE & 0xFFBD;
    
    LATD = LATD | 0x0060;
    
    int freq = 1000 / 4;
    static const char codes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    
    while (1) {
        int media = 0;
        int i = 0;
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0);
        int *buffer = (int * )(&ADC1BUF0);

        for (; i < conversoes; i++) {
            media += buffer[i * 4];
        }
        media /= conversoes;
        if(PORTBbits.RB3){
            LATDbits.LATD5 = 1; // Ativar display menos significativo
            LATDbits.LATD6 = 0; // Desativar display mais significativo
        } else {
            LATD = (LATD & 0xFF9F) | 0x0040;

        }
        
        
        
        int val = (media * 11 + 511) / 1023;
        val += 4;
        IFS1bits.AD1IF = 0;
        printInt(~media & 0xFFF, 2 | 12 << 16);
        
        LATB = (LATB & 0x80FF) | (codes[val] << 8);
        
        LATEbits.LATE6 = !LATEbits.LATE6; // Toggle RE6
        LATEbits.LATE1 = !LATEbits.LATE1; // Toggle RE1
        
        delay(freq);
    }
    return 0;
}