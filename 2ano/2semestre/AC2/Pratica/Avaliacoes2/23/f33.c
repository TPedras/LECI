#include <detpic32.h>

  void putc(char c) {
      while (U2STAbits.UTXBF == 1);
      U2TXREG = c;
  }

  void putString(char *s) {
      while (*s != '\0') {
          putc(*s);
          s++;
      }
  }

  volatile int cont = 0;

  void _int_(32) isr_uart2(void) {
      if (IFS1bits.U2RXIF) {
          char c = U2RXREG;
          putc(c);                       // eco
          if (c == 'F') {
              cont = (cont + 1) % 10;
              LATE = (LATE & 0xFFF0) | cont;
          } else if (c == 'C') {
              cont = 0;
              LATE = (LATE & 0xFFF0) | cont;
              putString("\r\nVALOR MINIMO\r\n");
          }
          IFS1bits.U2RXIF = 0;
      }
  }

  int main(void) {
      TRISE &= 0xFFF0;
      LATE  &= 0xFFF0;

      U2BRG = 520;                       // 2400 bps @ PBCLK=20MHz
      U2MODEbits.PDSEL = 1;              // 8 data bits, even parity
      U2MODEbits.STSEL = 1;              // 2 stop bits
      U2MODEbits.BRGH  = 0;
      U2STAbits.URXEN  = 1;
      U2STAbits.UTXEN  = 1;
      U2MODEbits.ON    = 1;
      U2STAbits.URXISEL = 0;
      IPC8bits.U2IP    = 2;
      IEC1bits.U2RXIE  = 1;
      IFS1bits.U2RXIF  = 0;

      EnableInterrupts();
      while (1);
      return 0;
  }

