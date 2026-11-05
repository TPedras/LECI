#include <detpic32.h>

void delay(int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms); // 1 ms * ms
}


int main(void) {
TRISBbits.TRISB4 = 1; // RBx digital output disconnected
AD1PCFGbits.PCFG4= 0; // RBx configured as analog input
AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this
// mode an internal counter ends sampling and
// starts conversion
AD1CON1bits.CLRASAM = 1; // Stop conversions when the 1st A/D converter
// interrupt is generated. At the same time,
// hardware clears the ASAM bit
AD1CON3bits.SAMC = 16; // Sample time is 16 TAD (TAD = 100 ns)
AD1CON2bits.SMPI = 3; // Interrupt is generated after N samples
// (replace N by the desired number of
// consecutive samples)
AD1CHSbits.CH0SA = 4; // replace x by the desired input
// analog channel (0 to 15)
AD1CON1bits.ON = 1; // Enable A/D converter
// This must the last command of the A/D
// configuration sequence
//display 7 segmentos RB8-RB14
TRISB = TRISB & 0x80FF; // RB8-RB
TRISDbits.TRISD5 = 0; // RD5 como saída (Seleção Low)
TRISDbits.TRISD6 = 0; // RD6 como saída (Sele

LATEbits.LATE5 = 1; // Ativar display menos significativo
LATEbits.LATE6 = 0; // Desativar display mais significativo

static const char codes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
while(1) {
    AD1CON1bits.ASAM = 1; // manual start of sampling pooling mode
    while(IFS1bits.AD1IF == 0); // wait while conversion not done
    int media = (ADC1BUF0 + ADC1BUF1 + ADC1BUF2 + ADC1BUF3) / 4;
    IFS1bits.AD1IF = 0;
    putChar('\r');
    printInt(~media &0x0FFF, 2 | 12 << 16); // 1 complemento em binario formatado em 12 bits
    

    // ii)
    int valor = media * 10 / 1023 + 4; // escala de 0-1023 para 4-14
    
    if(PORTBbits.RB3 == 1) {
        LATDbits.LATD5 = 1; // Ativar display menos significativo
        LATDbits.LATD6 = 0; // Desativar display mais significativo
    } else {
        LATD = (LATD & 0xFF9F) | 0x0040;
    }
    LATB = (LATB & 0x80FF) | (codes[valor] << 8);

    // iii 
    LATEbits.LATE6 = !LATEbits.LATE6; // Toggle RE6
    LATEbits.LATE1 = !LATEbits.LATE1; // Toggle RE1


}
return 0;
}