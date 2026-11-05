#include <detpic32.h>

volatile int temperatura = 0;

void display(int value) {
    static const char disp[] = 
    static int flag = 0;

    if(flag)
}


void _int_(12) isr_t3(void) {
    display(temperatura);
    IFS0bits.T3IF = 0;

}

int main(void) {

    TR

    int conversoes = 2;
    TRISBbits.TRISB4 = 1;      // Configurar RB4 como entrada
    AD1PCFGbits.PCFG4 = 0;     // Configurar AN4 como analógico
    AD1CON1bits.SSRC = 7;      // Conversão automática após amostragem
    AD1CON1bits.CLRASAM = 1;   // Parar conversões quando a flag for ativada
    AD1CON3bits.SAMC = 16;     // Tempo de amostragem definido para 16 TAD
    AD1CON2bits.SMPI = 1;      // 2 conversões por amostra (valor 1 significa 2 conversões: N-1)
    AD1CHSbits.CH0SA = 4;      // Selecionar canal AN4
    AD1CON1bits.ON = 1;        // Ativar o módulo ADC

    //conf t
    // 20 000 000 / (250 * 65536) = 1.22 -- 2
    // 20 000 000 / (2 * 250) =  40 000 - 1 =  39 999
    T3CONbits.TCKPS = 1;
    PR3 = 39999;
    TMR3 = 0;
    T3CONbits.TON = 1;

    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;

    EnableInterrupts();

    while(1) {
        resetCoreTimer();
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0);
        int *p = (int *)(&ADC1BUF0);
        int i = 0;
        int media = 0;
        for(; i < conversoes; i++) {
            media += p[i*4];
        }
        media /= conversoes;
        int gama = 73 - 7;
        temperatura = ((media * gama) + 511) / 1023 + 7;



        IFS1bits.AD1IF = 0;
        while(readCoreTimer() < 20000000 / 5); // loop de amostragem cm 5Hz 

    }
    


}