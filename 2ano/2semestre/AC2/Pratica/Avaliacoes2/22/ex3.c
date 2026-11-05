#include <detpic32.h>


void putc(char c){
    while(U2STAbits.UTXBF == 1);
    U2TXREG = c;
}

void putString(char *s){
    while(*s != '\0'){
        putc(*s);
        s++;
    }
}


volatile int contador = 15;

void _int_(32) isr_uart2(void) {

    if(IFS1bits.U2RXIF == 1) {
        char c = U2RXREG;
        putc(c);

        if (c == 'U') {
            contador = ++contador % 16;
            LATE = (LATE & 0xFFF0) | contador; 
        } else if(c == 'R'){
            contador = 0;
            LATE = (LATE & 0xFFF0) | contador; 
            putString("\r\nRESET\r\n");
        }

        IFS1bits.U2RXIF = 0;
    }

}


int main(void) {

    TRISE = TRISE & 0xFFF0;
    LATE = (LATE & 0xFFF0) | contador;


    // calculo brg
    // 20 000 000 + (8 * 9600)) / (16 * 9600) - 1 
    U2BRG = 130;
    U2MODEbits.PDSEL = 2;
    U2MODEbits.STSEL = 1;
    U2MODEbits.BRGH = 0;
    
    U2STAbits.URXEN = 1;
    U2STAbits.UTXEN = 1;
    U2MODEbits.ON = 1;

    U2STAbits.URXISEL = 0;
    IPC8bits.U2IP = 2;
    IEC1bits.U2RXIE = 1;
    IFS1bits.U2RXIF = 0;
    EnableInterrupts();

    while(1);

    return 0;

}
