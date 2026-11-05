#include <detpic32.h>

volatile unsigned int counter = 0;

void __attribute__((interrupt(IPL2SOFT), vector(12))) isr_T3(void) 
// Replace VECTOR by the timer T3 vector number (12)
{
    counter++;
    if(counter % 2 == 0)
    {
        putChar('.');
    }
    // Reset T3 interrupt flag
    IFS0bits.T3IF = 0;
}

int main(void)
{
    // Configure Timer T3 (2 Hz with interrupts disabled)
    T3CONbits.TCKPS = 7; // 1:256 prescaler
    PR3 = 39061;
    TMR3 = 0;
    T3CONbits.TON = 1;

    // Configure T3 interrupts
    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;

    EnableInterrupts();

    while(1)
    {
    }
    return 0;
}t