// ex1 2022
#include <detpic32.h>


int main(void) {
    // 1001
    TRSIB = TRISB | 0x0009;
    
    //prescaler
    // (20 000 000 / 150 ) / 65536 = 2,03
    // 20 000 000 / 4) / 150 = 33 333 - 1 = 33.332
    T2CONbits.TCKPS = 2;
    PR2 = 33332;
    TMR2 = 0;
    T2CONbits.TON = 1;
    
    
    T2CONbits.OCM = 6;
    T2CONbits.OCTSEL = 0;
    
    
    int OCR2S = ((PR2 + 1) * 25) / 100;
    OC2CONbits.ON = 1;
    
    while(1) {
        resetCoreTimer();
        int ds4 = PORTBbits.RB3;
        int ds1 = PORTBbits.RB0;
        
        if(!ds4 && ds1){
            OCR2S = ((PR2 + 1) * 25) / 100;
        } else if(ds4 && !ds1) {
            OCR2S = ((PR2 + 1) * 70) / 100;
        }
        
        while(readCoreTimer() < 20 * 250);
    }
    
    return 0;
}

