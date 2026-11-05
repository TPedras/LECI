


volatile int temperatura = 0;


void display(unsigned int value) {
    static const char disp[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
    
    int unidade = value % 10;
    int dezena = value / 10;
    
    static int flag = 0;
    
    if (flag) {
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x80FF) | (disp[unidades] << 8);
        LATE = (LATE)
    } else {
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80FF) | (disp[dezena] << 8);
    }
    flag = !flag;
}

void _int_(12) isr_T3(void) {
    display(temperatura);
    IFS0bits.T3IF = 0;
}

int main(void) {
    TRSIB = TRISB & 0x80FF;
    TRSDbits.TRISD5 = 0;
    TRISDbtis.TRISD6 = 0;

    
    
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
            //  This must the last command of the A/D 
            //  configuration sequence 
    // prescaler
    // 140 hz
    // 20 000 000 / 140) / 65536 = 2,17
    // 20 000 000 / 4 ) / 140 = 35 714,2 - 1 = 35 713
    
    T3CONbits.TCKPS = 2; // 2^2
    TR3 = 35713;
    TMR3 = 0;
    T3CONbits.TON = 1;
    
    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;
    
    EnableInterrupts();
    
    while(1) {
        resetCoreTimer();
        int soma = 0;
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.ADIF == 0);
        
        int *p = (int *)(&ADC1BUF0);
        for(i = 0; i < conversoes; i++) {
            media += p[i*4];
        }
        media /= conversoes;
        // gama = 75-10 = 65
        gama = 65;
        // 
        temperatura = ((media * gama) + 511) / 1023 + 10;
        
        IFS1bits.ADIF = 0;
        while(readCoreTimer() < 20000 / 5);
    }        

}