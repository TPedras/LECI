#include <detpic32.h>

// Função de atraso em milissegundos
void delay(unsigned int ms)
{
    for(; ms > 0; ms--)
    {
        resetCoreTimer();
        while(readCoreTimer() < 20000); // 1ms = 20,000,000 / 1000 = 20,000 (PBCLK=20MHz)
    }
}

// Função para enviar um valor de 8 bits (2 algarismos hexadecimais) para os displays
void send2displays(unsigned char value)
{
    static const char disp7Scodes[] = {
        0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
    };
    
    // Variável estática para alternar entre o display High e Low em cada chamada
    static char displayFlag = 0; 
    
    int digit_low = value & 0x0F;          // 4 bits menos significativos (unidades hex)
    int digit_high = (value & 0xF0) >> 4;  // 4 bits mais significativos (dezenas hex)

    if (displayFlag == 0)
    {
        // 1. Selecionar o display LOW (RD5=1, RD6=0)
        LATD = (LATD & 0xFF9F) | 0x0020;
        
        // 2. Enviar o dígito menos significativo para os segmentos (RB14-RB8)
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
        
        displayFlag = 1; // Alterna para o próximo display
    }
    else
    {
        // 1. Selecionar o display HIGH (RD6=1, RD5=0)
        LATD = (LATD & 0xFF9F) | 0x0040;
        
        // 2. Enviar o dígito mais significativo para os segmentos (RB14-RB8)
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
        
        displayFlag = 0; // Alterna de volta
    }
}

int main(void)
{
    // 1. Configurar portos de saída
    // RB14-RB8: Saídas (segmentos) -> Máscara 1000 0000 1111 1111 (0x80FF)
    TRISB = TRISB & 0x80FF;
    // RD6-RD5: Saídas (seleção) -> Máscara 1111 1111 1001 1111 (0xFF9F)
    TRISD = TRISD & 0xFF9F;

    unsigned int counter = 0;
    unsigned int i;

    while(1)
    {
        i = 0;
        // Ciclo de refrescamento: 50 Hz -> período de 20ms
        // Para o contador de 5 Hz (período 200ms), fazemos 10 iterações de 20ms
        do
        {
            send2displays(counter);
            delay(20); // 20ms de ativação
        } while(++i < 10);

        // Incrementar o contador módulo 256 (00 a FF)
        counter = (counter + 1) % 256;
    }

    return 0;
}
