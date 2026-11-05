#include <detpic32.h>

void delay(unsigned int ms) {
    for(; ms > 0; ms--) {
        resetCoreTimer();
        while(readCoreTimer() < 20000);
    }
}


int main(void) {
    // 1. CONFIGURATION
    
    // ADC
    // Configure AN0 as analog input
    TRISBbits.TRISB0 = 1;
    AD1PCFGbits.PCFG0 = 0;
    
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 3; // 4 conversions
    AD1CHSbits.CH0SA = 0; // AN0
    AD1CON1bits.ON = 1;

    // Switch DS4 (RB3) as input
    TRISBbits.TRISB3 = 1;

    // 7-Segment Display Segments (RB8-RB14) and Selection (RD5-RD6)
    TRISB = TRISB & 0x80FF; // RB8-RB14 as outputs
    TRISD = TRISD & 0xFF9F; // RD5, RD6 as outputs

    // LEDs (RE6 and RE1)
    TRISEbits.TRISE6 = 0;
    TRISEbits.TRISE1 = 0;
    
    // Initial state: RE6=1, RE1=0
    LATEbits.LATE6 = 1;
    LATEbits.LATE1 = 0;

    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};

    while(1) {
        // Start ADC conversion
        AD1CON1bits.ASAM = 1;
        while(AD1CON1bits.DONE == 0); // Polling

        // Calculate average of 4 samples
        int average = (ADC1BUF0 + ADC1BUF1 + ADC1BUF2 + ADC1BUF3) / 4;

        // i) Show 1's complement in binary (12 bits) on same line
        int complement = ~average;
        putChar('\r');
        printBin12(complement & 0xFFF); // Mask to 12 bits

        // ii) Scale value to 4-E hex and show on display
        // Range 0-1023 -> 4-14 (0x4 - 0xE)
        int scaled = (average * 10) / 1023 + 4;
        
        // DS4 (RB3) check
        if(PORTBbits.RB3 == 1) { // DS4 ON -> LSB (Right)
            LATD = (LATD & 0xFF9F) | 0x0020; // RD5=1, RD6=0
        } else { // DS4 OFF -> MSB (Left)
            LATD = (LATD & 0xFF9F) | 0x0040; // RD6=1, RD5=0
        }
        // Send to segments
        LATB = (LATB & 0x80FF) | (disp7Scodes[scaled] << 8);

        // iii) Toggle LED pattern (01, 10, ...)
        LATEbits.LATE6 = !LATEbits.LATE6;
        LATEbits.LATE1 = !LATEbits.LATE1;

        // 4Hz Frequency -> 250ms period
        delay(250);
    }

    return 0;
}
