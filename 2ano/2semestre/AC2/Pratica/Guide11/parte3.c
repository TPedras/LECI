#include <detpic32.h>

volatile int voltage = 0;
volatile int voltMin = 33;
volatile int voltMax = 0;
volatile int adc_active = 1;

void putc(char byte) {
    while (U2STAbits.UTXBF == 1);
    U2TXREG = byte;
}

void putstr(char *str) {
    while (*str != '\0') {
        putc(*str);
        str++;
    }
}

unsigned char toBcd(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

void sendVoltage(char *prefix, int val) {
    putstr(prefix);
    unsigned char bcd = toBcd(val);
    putc((bcd >> 4) + '0');
    putc('.');
    putc((bcd & 0x0F) + '0');
    putstr("V\n");
}

void _int_(32) isr_uart2(void) {
    if (IFS1bits.U2RXIF == 1) {
        char c = U2RXREG;
        if (c == 'M') {
            sendVoltage("VMax=", voltMax);
        } else if (c == 'm') {
            sendVoltage("VMin=", voltMin);
        } else if (c == 'P') {
            IEC0bits.T1IE = 0; // Pause ADC
            adc_active = 0;
        } else if (c == 'R') {
            IEC0bits.T1IE = 1; // Resume ADC
            adc_active = 1;
        } else if (c == 'S') {
            if (adc_active) putstr("ADC ativa\n");
            else putstr("ADC inativa\n");
        }
        IFS1bits.U2RXIF = 0;
    }
}

void _int_(VECTOR_ADC) isr_adc(void) {
    int total = 0;
    int *p = (int *)(&ADC1BUF0);
    int i;
    for (i = 0; i < 8; i++) {
        total += p[i*4];
    }
    int val_ad = total / 8;
    voltage = (val_ad * 33 + 511) / 1023;

    if (voltage < voltMin) voltMin = voltage;
    if (voltage > voltMax) voltMax = voltage;

    IFS1bits.AD1IF = 0;
}

void _int_(VECTOR_TIMER1) isr_T1(void) {
    AD1CON1bits.ASAM = 1;
    IFS0bits.T1IF = 0;
}

void configureAll(void) {
    // UART2: 115200, N, 8, 1
    U2BRG = ((20000000 + 8 * 115200) / (16 * 115200)) - 1;
    U2MODEbits.BRGH = 0;
    U2MODEbits.PDSEL = 0;
    U2MODEbits.STSEL = 0;
    U2STAbits.UTXEN = 1;
    U2STAbits.URXEN = 1;
    U2MODEbits.ON = 1;

    // UART2 Interrupts
    U2STAbits.URXISEL = 0;
    IPC8bits.U2IP = 2;
    IEC1bits.U2RXIE = 1;
    IFS1bits.U2RXIF = 0;

    // ADC
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = 7; // 8 samples
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    // ADC Interrupts
    IPC6bits.AD1IP = 2;
    IEC1bits.AD1IE = 1;
    IFS1bits.AD1IF = 0;

    // Timer T1 (5 Hz -> 200 ms)
    T1CONbits.TCKPS = 3; // 1:256
    PR1 = 15624;
    TMR1 = 0;
    T1CONbits.TON = 1;

    // T1 Interrupts
    IPC1bits.T1IP = 2;
    IEC0bits.T1IE = 1;
    IFS0bits.T1IF = 0;
}

int main(void) {
    configureAll();
    EnableInterrupts();
    while (1) {
        IdleMode();
    }
    return 0;
}
