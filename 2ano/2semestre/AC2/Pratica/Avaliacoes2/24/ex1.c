#include <detpic32.h>

void setDutyCycle(unsigned int dc){
    OC4RS = ((PR3 + 1)* dc) / 100;
}

int main(void) {
    TRISB = TRISB & 0x0002;
    // prescaler = (20 000 000 / 130) / 65536 = 2.34
    //prescaler = 4 -- 2²
    T2CONbits.TCKPS = 2;
    
    //PR3 = (20 000 000 / 4) / 130 - 1 = 38460.53
    PR3 = 38461;
    TMR3 = 0;
    T3CONbits.TON = 1;
    
    OC4CONbits.OCM = 6;
    OC4CONbits.OCTSEL = 0;
    
    setDutyCycle(50);
    OC4CONbits.ON = 1;
    
    int flag = 0;
    
    while(1) {
        resetCoreTimer();
        if(PORTBbits.RB2 == 1){
            if(PORTBbits.RB1 == 1){}
            else {
                if(flag){
                    setDutyCycle(25);
                }else{
                    setDutyCycle(75);
            }
            flag = !flag;
            while(readCoreTimer() < 2000000 * 13);
        }

        }
    }
    
    return 0;
    
    
}