#include <detpic32.h>

typedef struct {
    char mem[100];
    int nchar;
    int posrd;
} t_buf;

volatile t_buf txbuf;

void putstrInt(char *s) {
    while (txbuf.nchar > 0); // Wait while buffer is not empty
    
    int i = 0;
    while (*s != '\0' && i < 100) {
        txbuf.mem[i] = *s;
        s++;
        i++;
    }
    txbuf.nchar = i;
    txbuf.posrd = 0;
    
    IEC1bits.U2TXIE = 1; // Enable UART2 TX interrupts
}

void _int_(32) isr_uart2(void) {
    // TX interrupt
    if (IFS1bits.U2TXIF == 1) {
        if (txbuf.nchar > 0) {
            U2TXREG = txbuf.mem[txbuf.posrd];
            txbuf.posrd++;
            txbuf.nchar--;
        } else {
            IEC1bits.U2TXIE = 0; // Disable UART2 TX interrupts
        }
        IFS1bits.U2TXIF = 0; // Clear UART2 TX interrupt flag
    }

    // RX interrupt (keep it simple for now, as Parte II focuses on TX)
    if (IFS1bits.U2RXIF == 1) {
        IFS1bits.U2RXIF = 0;
    }
}

int main(void) {
    // Configure UART2: 115200, N, 8, 1
    U2BRG = ((20000000 + 8 * 115200) / (16 * 115200)) - 1;
    U2MODEbits.BRGH = 0;
    U2MODEbits.PDSEL = 0;
    U2MODEbits.STSEL = 0;
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    U2MODEbits.ON = 1;

    // Configure UART2 interrupts
    U2STAbits.UTXISEL = 0; // Interrupt when TX FIFO has at least one free position
    IPC8bits.U2IP = 2;
    IEC1bits.U2RXIE = 0;
    IEC1bits.U2TXIE = 0;
    IFS1bits.U2TXIF = 0;
    IFS1bits.U2RXIF = 0;

    txbuf.nchar = 0;

    EnableInterrupts();

    while (1) {
        putstrInt("Test string which can be as long as you like, up to a maximum of 100 characters\n");
    }

    return 0;
}
