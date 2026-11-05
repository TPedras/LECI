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

void putint(int n){
    if(n < 10){
        putc(n + '0');
    } else{
        putc((n / 10) + '0');
        putc((n % 10) + '0');
    }

}
void _int_(32) isr_uart2(void){
    if(IFS1bits.U2RXIF == 1) {
        char c = U2RXREG;
        putc(c);
        LATDbits.LATD7 = !LATDbits.LATD7;
        if(c == 'D') {
            putString("\r\nDSD=");
            int val = PORTB & 0x000F;
            putint(val);
            putString("\r\n");
        }

        IFS1bits.U2RXIF = 0;

    }
}
 


int main(void) {


    TRISEbits.TRISE7 = 0;
    LATEbits.LATE7 = 0;

    TRISB = TRISB | 0x000F;
    //conf uart
    // 20 000 000 / (16 * 9600) = 130

    U2BRG = 130;
    U2MODEbits.PDSEL = 2;
    U2MODEbits.STSEL = 1;

    U2MODEbits.BRGH = 0;

    U2STAbits.URXEN= 1;
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