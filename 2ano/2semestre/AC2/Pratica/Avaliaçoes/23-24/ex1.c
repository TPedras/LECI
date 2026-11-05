#include <detpic32.h>


int main(void) {
    // define 5 a 2 como saidas (LEDs)
    TRISE = TRISE  & 0xFFC3;

    // definir RB2 como entrada "switch DS3"
    TRISB = TRISB | 0x0004;


    int counter = 0;

    while(1) {
        LATE = (LATE & 0xFFC3) | (counter << 2);

        unsigned int ticks;
        if(PORTBbits.RB2 == 0) { // DS3 off
            ticks = 20000000 / 2.3;
        }
        else { // ds3 on
            ticks = 20000000 / 5.5;
        }

        resetCoreTimer();
        while(readCoreTimer() < ticks);

        counter = (counter - 1 + 12) % 12;
    }

    return 0;
}