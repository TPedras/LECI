#include <detpic32.h>

#define SAMPLES 4

volatile int voltage = 0;

const unsigned int dis7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D,
                                   0xFD, 0x07, 0x7F, 0x6F, 0x77, 0xFC,
                                   0x39, 0x5E, 0xF9, 0xF1};

typedef enum { HIGH, LOW } flag;

unsigned char toBdc(unsigned char value) {
    return ((value / 10) << 4) + (value % 10);
}

void send2displays(unsigned char value) {
    static flag f = LOW;
    value = toBdc(value);
    unsigned char high = dis7Scodes[value >> 4];
    unsigned char low = dis7Scodes[value & 0x0F];

    if (f == HIGH) {
        LATD = (LATD & 0xFF9F) | 0x0040;
        LATB = (LATB & 0x80FF) | high << 8;
        f = LOW;
    } else {
        LATD = (LATD & 0xFF9F) | 0x0020;
        LATB = (LATB & 0x80FF) | low << 8;
        f = HIGH;
    }
}

void setPWM(unsigned int dutyCycle) {
    if (dutyCycle > 100) dutyCycle = 100;
    OC1RS = ((PR3 + 1) * dutyCycle) / 100;
}

void configureAll(void) {
    // 1. Digital I/O
    TRISB &= 0x80FF;                 // RB8-RB14 outputs (7-seg)
    TRISD &= 0xFF9F;                 // RD5-RD6 outputs (displays)
    TRISBbits.TRISB0 = 1;            // RB0 input
    TRISBbits.TRISB1 = 1;            // RB1 input
    TRISCbits.TRISC14 = 0;           // RC14 output (LED D11)

    // 2. ADC
    TRISBbits.TRISB4 = 1;
    AD1PCFGbits.PCFG4 = 0;
    AD1CON1bits.SSRC = 7;
    AD1CON1bits.CLRASAM = 1;
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.SMPI = SAMPLES - 1;
    AD1CHSbits.CH0SA = 4;
    AD1CON1bits.ON = 1;

    // 3. ADC Interrupts
    IPC6bits.AD1IP = 2;
    IEC1bits.AD1IE = 1;
    IFS1bits.AD1IF = 0;

    // 4. Timer T1 (5 Hz)
    T1CONbits.TCKPS = 3;             // 1:256
    PR1 = 15624;
    TMR1 = 0;
    T1CONbits.TON = 1;
    IPC1bits.T1IP = 2;
    IEC0bits.T1IE = 1;
    IFS0bits.T1IF = 0;

    // 5. Timer T3 (100 Hz)
    T3CONbits.TCKPS = 5;             // 1:32
    PR3 = 6249;
    TMR3 = 0;
    T3CONbits.TON = 1;
    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;

    // 6. OC1 (using T3)
    OC1CONbits.OCM = 6;
    OC1CONbits.OCTSEL = 1;           // Use T3
    OC1CONbits.ON = 1;
}

void _int_(VECTOR_TIMER1) isr_T1(void) {
    AD1CON1bits.ASAM = 1;
    IFS0bits.T1IF = 0;
}

void _int_(VECTOR_TIMER3) isr_T3(void) {
    send2displays(voltage);
    IFS0bits.T3IF = 0;
}

void _int_(VECTOR_ADC) isr_adc(void) {
    int total = 0;
    int *p = (int *)(&ADC1BUF0);
    for (; p <= (int *)(&ADC1BUFF); p += 4) {
        total += *p;
    }
    voltage = ((total / SAMPLES) * 33 + 511) / 1023;
    IFS1bits.AD1IF = 0;
}

int main(void) {
    configureAll();
    EnableInterrupts();

    while (1) {
        int portVal = PORTB & 0x0003; // Mask RB1, RB0
        int dutyCycle;

        switch (portVal) {
            case 0: // 00: Voltmeter
                IEC0bits.T1IE = 1;    // Enable T1 interrupts
                setPWM(0);
                break;
            case 1: // 01: Freeze
                IEC0bits.T1IE = 0;    // Disable T1 interrupts
                setPWM(100);
                break;
            default: // 1X: PWM controlled by voltage
                IEC0bits.T1IE = 1;    // Enable T1 interrupts
                dutyCycle = voltage * 3;
                setPWM(dutyCycle);
                break;
        }
        
        // Mirror OC1 to LED D11
        LATCbits.LATC14 = PORTDbits.RD0;
    }
    return 0;
}
