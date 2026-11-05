#include <detpic32.h>
void putc(char c){
  while(U2STAbits.UTXBF==1);
  U2TXREG= c;
}

void putst(char *str){
  while(*str != '\0'){
    putc(*str);
    str++;
  }
}
void putint(int val){
  if(val >= 10){
    putc((val/10)+ '0');
  }
  putc((val%10)+'0');
}
volatile int count=15;

void _int_(32) isr_uart2(void){
  if(IFS1bits.U2RXIF==1){
    char c= U2RXREG;
    putc(c);
   
    if(c=='U'){
      count++;
      if(count>=16){
        count=0;
      }
      LATE= (LATE & 0xFFE1) | (count << 1);
    }
   
    if(c=='R'){
      count=0;
      LATE= (LATE & 0xFFE1) | (count << 1);
      putst("\n\rRESET\r\n");
    }
    IFS1bits.U2RXIF=0;
  }
}
int main(void){
  TRISE= TRISE & 0xFFE1;
  LATE = (LATE & 0xFFE1) | (count << 1);

 
  U2MODEbits.BRGH= 0;
  U2BRG= 129;
  U2MODEbits.PDSEL= 2;
  U2MODEbits.STSEL= 1;
  U2STAbits.URXISEL= 0;
  U2STAbits.UTXEN= 1;
  U2STAbits.URXEN= 1;
 
  U2MODEbits.ON= 1;
 
  IPC8bits.U2IP= 2;
  IEC1bits.U2RXIE= 1;
  IFS1bits.U2RXIF= 0;
 
 
  EnableInterrupts();
  while(1){
  }
  return 0;
}