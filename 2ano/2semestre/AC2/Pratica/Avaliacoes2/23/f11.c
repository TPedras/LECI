#include <detpic32.h>

void setDutyCycle(unsigned int duty) {
    // OC2RS = ((PR3 + 1) * duty) / 100
    OC2RS = (41667 * duty) / 100;
}

int main(void) {
    // 1. Configurar portos: RB0 e RB2 como entradas (Switches DS1 e DS3)
    TRISB = TRISB | 0x0005; 

    // 2. Configurar Timer T3 (Referência para PWM)
    // Freq = 120Hz
    // Prescaler = (20MHz / 120) / 65536 = 2.54 -> Escolhe-se 4 (máxima resolução)
    T3CONbits.TCKPS = 2; // Prescaler 4
    PR3 = 41666;         // (20MHz / (4 * 120Hz)) - 1 = 41665.67
    TMR3 = 0;
    T3CONbits.TON = 1;

    // 3. Configurar Output Compare 2 (PWM)
    OC2CONbits.OCM = 6;    // PWM mode
    OC2CONbits.OCTSEL = 1; // Timer 3 como base de tempo
    setDutyCycle(75);      // Valor inicial 75%
    OC2CONbits.ON = 1;

    while(1) {
        // 4. Ler switches (RB2 e RB0)
        int rb2 = PORTBbits.RB2;
        int rb0 = PORTBbits.RB0;

        // Lógica de alteração do duty-cycle
        if(rb2 == 0 && rb0 == 0) {
            setDutyCycle(30);
        } 
        else if(rb2 == 1 && rb0 == 1) {
            setDutyCycle(55);
        }
        // Restantes combinações mantém o valor anterior (não fazemos nada)

        // 5. Temporização de 360 µs usando Core Timer
        // 20MHz clock -> Core Timer a 20MHz (10 * 2 ticks por µs)
        // 360 µs * 10 ticks/µs = 3600 ticks
        resetCoreTimer();
        while(readCoreTimer() < 3600* 2);
    }

    return 0;
}
