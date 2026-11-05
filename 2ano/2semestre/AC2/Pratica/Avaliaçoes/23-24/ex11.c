#include <detpic32.h>

int main(void){
    TRISE = TRISE & 0xFFC3;
    
    TRISB = TRISB | 0x0004;
    
    int counter = 0;
    
    while(1){
    printInt(counter, 10 | (2 << 16));
    putChar('\r');
    int ticks;

    LATE = (LATE & 0xFFC3)  | (counter << 2);
    if (PORTBbits.RB2 == 0){ // ds3 off
    ticks = 20000000 / 2.3;
    } else {
    ticks = 20000000 / 5.5;
    }
    resetCoretimer();
    while(readCoretimer() <  ticks);
    
    counter = (counter -1 + 12) % 12;
    }
    return 0;
}