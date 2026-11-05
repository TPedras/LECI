#include <detpic32.h>

void putc(char byte) {
    while (U2STAbits.UTXBF == 1); // Wait while TX buffer is full
    U2TXREG = byte;
}

void putstr(char *str) {
    while (*str != '\0') {
        putc(*str);
        str++;
    }
}

void _int_(32) isr_uart2(void) {
    if (IFS1bits.U2RXIF == 1) {
        char c = U2RXREG;
        if (c == '?') {
            putstr("AC2-Guiao 11\n");
        } else if (c == 'T') {
            LATCbits.LATC14 = 1;
        } else if (c == 't') {
            LATCbits.LATC14 = 0;
        } else {
            putc(c);
        }
        IFS1bits.U2RXIF = 0; // Clear UART2 RX interrupt flag
    }
}

int main(void) {
    // Configure LED on RC14
    TRISCbits.TRISC14 = 0; // RC14 as output
    LATCbits.LATC14 = 0;   // LED off

    // Configure UART2: 115200, N, 8, 1
    U2BRG = ((20000000 + 8 * 115200) / (16 * 115200)) - 1;
    U2MODEbits.BRGH = 0;   // Standard speed (16x baud clock)
    U2MODEbits.PDSEL = 0;  // 8-bit data, no parity
    U2MODEbits.STSEL = 0;  // 1 stop bit
    U2STAbits.UTXEN = 1;   // Enable TX
    U2STAbits.URXEN = 1;   // Enable RX
    U2MODEbits.ON = 1;     // Enable UART2

    // Configure UART2 interrupts
    U2STAbits.URXISEL = 0; // Interrupt when RX FIFO is not empty
    IPC8bits.U2IP = 2;     // Priority level
    IEC1bits.U2RXIE = 1;   // Enable RX interrupt
    IEC1bits.U2TXIE = 0;   // Disable TX interrupt
    IFS1bits.U2RXIF = 0;   // Clear RX flag

    EnableInterrupts();

    while (1) {
        IdleMode();
    }

    return 0;
}
