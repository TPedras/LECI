#include <detpic32.h>

void setPWM(unsigned int dutyCycle) {
    if (dutyCycle > 100) dutyCycle = 100;
    // OC1RS = (PR3 + 1) * dutyCycle / 100
    OC1RS = ((PR3 + 1) * dutyCycle) / 100;
}

void configureAll(void) {
    // 1. Timer T3 (100 Hz)
    T3CONbits.TCKPS = 5;    // 1:32 prescaler
    PR3 = 6249;             // (20MHz / (32 * 100Hz)) - 1
    TMR3 = 0;
    T3CONbits.TON = 1;

    // 2. OC1 Module
    OC1CONbits.OCM = 6;     // PWM mode, no fault pin
    OC1CONbits.OCTSEL = 1;  // Use Timer 3
    setPWM(25);             // Initial duty cycle 25%
    OC1CONbits.ON = 1;

    // 3. RC14 for LED D11
    TRISCbits.TRISC14 = 0;  // RC14 as output
}

int main(void) {
    configureAll();
    
    while (1) {
        // Task 5: Mirror RD0 (OC1) to RC14 (D11)
        LATCbits.LATC14 = PORTDbits.RD0;
    }
    return 0;
}
