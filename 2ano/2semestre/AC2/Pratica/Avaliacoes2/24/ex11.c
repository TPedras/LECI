#include <detpic.h>


int main(void) {

    TRISB = TRISB | 0x0006;
    //prescaler
    // 20 000 000 ( 130 * 65536) = 2.3
    // 20 000 000( 4 * 130) - 1= 38460
    T3CONbits.TCKPS = 2;
    PR3 = 38460;
    TMR3 = 0;
    T3CONbits.TON = 1;

    OC4CONbits.OCM = 6;
    OC4CONbits.OCTSEL = 0;

    OC4RS = (( PR3 - 1) * 50) / 100;
    T3CONbits.ON = 1;

    while(1) {
        resetCoreTimer();
        int rb1 = PORTBbits.RB1;
        int rb2 = PORTBbits.RB2;

        if(!rb1){
            
        }

    }

    return 0;
}