#include <detpic32.h>

#define SAMPLES 4

volatile int voltage = 0; // Global variable

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

void configureAll(void) {
    // 1. Digital I/O
    TRISB &= 0x80FF;                 // Configure RB8-RB14 as outputs (7-seg)
    TRISD &= 0xFF9F;                 // Configure RD5-RD6 as outputs (displays)

    // 2. ADC
    TRISBbits.TRISB4 = 1;            // RB4 digital output disconnected
    AD1PCFGbits.PCFG4 = 0;           // RB4 configured as analog input (AN4)
    AD1CON1bits.SSRC = 7;            // Conversion trigger selection bits
    AD1CON1bits.CLRASAM = 1;         // Stop conversions when 1st ADC interrupt
    AD1CON3bits.SAMC = 16;           // Sample time 16 TAD
    AD1CON2bits.SMPI = SAMPLES - 1;  // Interrupt after 4 samples
    AD1CHSbits.CH0SA = 4;            // Select AN4
    AD1CON1bits.ON = 1;              // Enable ADC

    // 3. ADC Interrupts
    IPC6bits.AD1IP = 2;              // Priority
    IEC1bits.AD1IE = 1;              // Enable ADC interrupts
    IFS1bits.AD1IF = 0;              // Reset flag

    // 4. Timer T1 (5 Hz -> 200 ms)
    // Fout = 20MHz / (prescaler * (PR1 + 1)) = 5
    // 20,000,000 / (256 * 5) = 15625 -> PR1 = 15624
    T1CONbits.TCKPS = 3;             // Prescaler 1:256
    PR1 = 15624;
    TMR1 = 0;
    T1CONbits.TON = 1;

    // T1 Interrupts
    IPC1bits.T1IP = 2;  //prioridade
    IEC0bits.T1IE = 1;  //reset flag
    IFS0bits.T1IF = 0;  // enable interrupt

    // 5. Timer T3 (100 Hz -> 10 ms)
    // 20,000,000 / (32 * 100) = 6250 -> PR3 = 6249
    T3CONbits.TCKPS = 5;             // Prescaler 1:32
    PR3 = 6249;
    TMR3 = 0;
    T3CONbits.TON = 1;

    // T3 Interrupts
    IPC3bits.T3IP = 2;
    IEC0bits.T3IE = 1;
    IFS0bits.T3IF = 0;
}

void _int_(VECTOR_TIMER1) isr_T1(void) {
    AD1CON1bits.ASAM = 1;            // Start ADC conversion
    IFS0bits.T1IF = 0;               // Reset T1IF flag
}

void _int_(VECTOR_TIMER3) isr_T3(void) {
    send2displays(voltage);          // Refresh display
    IFS0bits.T3IF = 0;               // Reset T3IF flag
}

void _int_(VECTOR_ADC) isr_adc(void) {
    int total = 0;
    int *p = (int *)(&ADC1BUF0);
    for (; p <= (int *)(&ADC1BUFF); p += 4) {
        total += *p;
    }
    int val_ad = total / SAMPLES;
    voltage = (val_ad * 33 + 511) / 1023; // Convert to [0, 33] (0.0V to 3.3V)
    IFS1bits.AD1IF = 0;              // Reset AD1IF flag
}

int main(void) {
    configureAll();
    EnableInterrupts();
    while (1) {
        IdleMode();
    }
    return 0;
}
