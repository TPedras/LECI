#include <detpic32.h>

void delay(unsigned int ms);

int main(void) {

    // Definir os portos RB8-RB14 e RD5 e RD6 como saída;
    TRISB = TRISB & 0x80FF;
    TRISD = TRISD & 0xFF9F;

    // Selecionar o display mais significativo: 
    LATD = (LATD & 0xFF9F) | 0x0040;

    while(1) {
        char key = getChar();

        /*
        if ((key >= 'a') && key <= 'g') {
            if (key == 'a') LATB = (LATB & 0x80FF) | 0x0100;
            else if (key == 'b') LATB = (LATB & 0x80FF) | 0x0200;
            else if (key == 'c') LATB = (LATB & 0x80FF) | 0x0400;
            else if (key == 'd') LATB = (LATB & 0x80FF) | 0x0800;
            else if (key == 'e') LATB = (LATB & 0x80FF) | 0x1000;
            else if (key == 'f') LATB = (LATB & 0x80FF) | 0x2000;
            else if (key == 'g') LATB = (LATB & 0x80FF) | 0x4000;
        }*/

        key = key & 0x07;
    	int value = 1 << (key - 1);
		LATB = (LATB & 0x80FF) | (value << 8);

    }

    return 0;
}

void delay(unsigned int ms) {
    resetCoreTimer();
    while(readCoreTimer() < 20000 * ms);
}