#include <detpic32.h>


int main(void) {

    TRISB = TRISB | 0x0009; 
    //pres
    // 20 000 000 / 150 ) / 65536 = 2,03
    // 20 000 000 / (4 * 150) = 33 333 - 1 = 33 332

    T2CONbits.TCKPS = 2;
    PR2 = 33332;
    TMR2 = 0;
    T2CONbits.TON = 1;

    OC2CONbits.OCM = 6;
    OC2CONbits.OCTSEL = 0;

    OC2RS = ((PR2 - 1) * 25) / 100;
    OC2CONbits.ON = 1;
    while(1) {
        resetCoreTimer();
        int rb3 = PORTBbits.RB3;
        int rb0 = PORTBbits.RB0;

        if (rb3 && !rb0) {
            OC2RS = ((PR2 - 1) * 70) / 100;

        } else if(!rb3 && rb0){
            OC2RS = ((PR2 - 1) * 25) / 100;
        }
        
        while(readCoreTimer() < 20 * 250);

    }
    return 0;
}
