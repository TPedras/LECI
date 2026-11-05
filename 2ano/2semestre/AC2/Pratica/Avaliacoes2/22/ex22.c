#include <detpic32.h>


volatile int temp = 0;

void displ(unsigned int value){
    static const char disp[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
    static int flag = 0;

    int unidade = value % 10;
    int dezena = value / 10;

    if(flag) {
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x80FF) | (disp[unidade] << 8);
    } else if(!flag) {
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80FF) | (disp[dezena] << 8);
    }
    flag = !flag;
}



void _int_(8) isr_t2(void) {
    displ(temp);
    IFS0bits.T2IF = 0;

}
int main(void) {
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;

    int conversoes = 2;
    TRISBbits.TRISB4 = 1; // RBx digital output disconnected 
    AD1PCFGbits.PCFG4= 0; // RBx configured as analog input 
    AD1CON1bits.SSRC = 7; // Conversion trigger selection bits: in this 
            //  mode an internal counter ends sampling and 
            //  starts conversion 
    AD1CON1bits.CLRASAM = 1;  // Stop conversions when the 1st A/D converter 
            //  interrupt is generated. At the same time, 
            //  hardware clears the ASAM bit 
    AD1CON3bits.SAMC = 16;    // Sample time is 16 TAD (TAD = 100 ns) 
    AD1CON2bits.SMPI = conversoes-1;   // Interrupt is generated after N samples 
            //  (replace N by the desired number of 
            //  consecutive samples) 
    AD1CHSbits.CH0SA = 4;   // replace x by the desired input  
            //  analog channel (0 to 15) 
    AD1CON1bits.ON = 1;     // Enable A/D converter 

    // presc disp
    // 20 000 000 / 120 ) / 65536 = 2,5
    // 20 000 000 /  4) / 10 = 62500 - 1 = 41 666,7 - 1= 41 666
    T2CONbits.TCKPS = 2;
    PR2 = 41666;
    TMR2 = 0;
    T2CONbits.TON = 1;

    IPC2bits.T2IP = 2;
    IEC0bits.T2IE = 1;
    IFS0bits.T2IF = 0;
    EnableInterrupts();

    while(1){
        resetCoreTimer();
        int media = 0;
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0);

        int *p = (int *)(&ADC1BUF0);
        int i;
        for(i = 0; i < conversoes; i++) {
            media += p[i*4];
        }
        media /= conversoes;

        int gama = 65 - 15;

        temp = ((media * gama) + 511) / 1023 + 15;

        
        IFS1bits.AD1IF = 0;
        
        while(readCoreTimer()< 2000000);
    
    }   
    return 0;

}
