#include <detpic32.h>

volatile int temperatura = 0;

void display(int value){
    static const char disp[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};
    static int flag = 0;
    int unidade = value % 10;
    int dezena = value / 10;

    if(flag) {
        LATDbits.LATD5 = 1;
        LATDbits.LATD6 = 0;
        LATB = (LATB & 0x80FF) | (disp[unidade] << 8);
    } else {
        LATDbits.LATD5 = 0;
        LATDbits.LATD6 = 1;
        LATB = (LATB & 0x80FF) | (disp[dezena] << 8);
    }
    flag  = !flag;

}


void _int_(12) isr_t3(void){
    display(temperatura);
    IFS0bits.T3IF = 0;
}

int main(void){
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;
    int conversoes = 2;

    TRISBbits.TRISB4 = 1;      // Configurar RB4 como entrada
    AD1PCFGbits.PCFG4 = 0;     // Configurar AN4 como analógico
    AD1CON1bits.SSRC = 7;      // Conversão automática após amostragem
    AD1CON1bits.CLRASAM = 1;   // Parar conversões quando a flag for ativada
    AD1CON3bits.SAMC = 16;     // Tempo de amostragem definido para 16 TAD
    AD1CON2bits.SMPI = conversoes - 1;      // 2 conversões por amostra (valor 1 significa 2 conversões: N-1)
    AD1CHSbits.CH0SA = 4;      // Selecionar canal AN4
    AD1CON1bits.ON = 1;        // Ativar o módulo ADC

    //conf t
    // 250hz
    // 20 000 000/ (250* 65536) = 1,3 
    T3CONbits.TCKPS = 1;
    // 40000 - 1
    PR3 = 39999;
    TMR3 = 0;
    T3CONbits.TON = 1;

    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;

    EnableInterrupts();

    while(1){
        resetCoreTimer();
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0);

        int *p = (int *)(&ADC1BUF0);
        int media = 0;
        int i = 0;
        for(;i< conversoes; i++){
            media += p[i*4];
        }
        media /= conversoes;

        int gama = 73 -7;
        temperatura = ((media * gama) + 511) / 1023 + 7;

        IFS1bits.AD1IF = 0;
        while(readCoreTimer() < 20000000 / 5); // 20 000 000 / 5hz

    }
    return 0;

}
