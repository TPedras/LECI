#include <detpic32.h>
void delay( int ms) {
    resetCoretime();
    while(readCoretime() < 20000 * ms);
}

int main(void) {

    TRISE = TRISE & 0xFF03;
    TRISB = TRISB | 0x0005
    
    int padrao = 0b110000;
    int freq 1000/10.5;
    
    while(1) {
    LATE = (LATE & 0xFF03) | (padrao << 2);
    
    padrao = padrao >> 1;
    if (padrao <= 1){
    padrao = 0b110000;
    }
    int ds3 = PORTBbits.RB2;
    int ds1 = PORTBbits.RB0;
    
    if (ds3 && ds1) {
    freq = 1000/ 10.5;
    }
    else if (!ds3 && !ds1) {
    freq = 1000 / 3.5;
    }
    
    delay(freq);
    printInt(padrao,2 | 6 << 16);
    putChar('\r');
    
    }
    

return 0;    
}