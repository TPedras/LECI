#include <detpic32.h>

// Função para converter binário para BCD (ex: 25 -> 0x25)
unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

// Função de atraso em milissegundos
void delay(unsigned int ms)
{
    for(; ms > 0; ms--)
    {
        resetCoreTimer();
        while(readCoreTimer() < 20000); // 1ms = 20,000,000 / 1000 = 20,000 (PBCLK=20MHz)
    }
}

// Função para enviar valor para os displays (multiplexada)
void send2displays(unsigned char value)
{
    static const char disp7Scodes[] = {
        0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07,
        0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71
    };
    static char displayFlag = 0;
    
    int digit_low = value & 0x0F;
    int digit_high = (value & 0xF0) >> 4;

    if (displayFlag == 0)
    {
        // Selecionar o display LOW (RD5=1, RD6=0)
        LATD = (LATD & 0xFF9F) | 0x0020;
        // Enviar o dígito LOW para os segmentos (RB14-RB8)
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
    }
    else
    {
        // Selecionar o display HIGH (RD6=1, RD5=0)
        LATD = (LATD & 0xFF9F) | 0x0040;
        // Enviar o dígito HIGH para os segmentos (RB14-RB8)
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
    }
    displayFlag = !displayFlag;
}

int main(void)
{
    // 1. Configurações de I/O
    // RB14-RB8: Saídas (segmentos); RB0: Entrada (DS1)
    TRISB = (TRISB & 0x80FF) | 0x0001;
    // RD6-RD5: Saídas (seleção dos displays)
    TRISD = TRISD & 0xFF9F;
    // RE7-RE0: Saídas (8 LEDs para BCD)
    TRISE = TRISE & 0xFF00;
    // RC14: Saída (LED de alarme D11)
    TRISCbits.TRISC14 = 0;

    int counter = 0;
    int i = 0;
    int led_timer = 0; // Contador para os 5 segundos do LED (500 * 10ms)

    while(1)
    {
        // 2. Determinar direção e frequência (Ex 2 e 3)
        // DS1 ON (1) -> Up (5Hz = 200ms); DS1 OFF (0) -> Down (2Hz = 500ms)
        int ds1 = PORTBbits.RB0;
        int freq_limit = (ds1 == 1) ? 20 : 50; // iterações de 10ms

        // 3. Sistema de Visualização (Refrescamento a 100 Hz)
        send2displays(toBcd(counter));
        
        // 4. Mostrar em BCD nos LEDs do Porto E (Ex 1)
        LATE = (LATE & 0xFF00) | toBcd(counter);

        // 5. Gestão do LED de alarme (Ex 4)
        if(led_timer > 0)
        {
            LATCbits.LATC14 = 1;
            led_timer--;
        }
        else
        {
            LATCbits.LATC14 = 0;
        }

        delay(10); // 10ms = Frequência de 100 Hz
        i++;

        // 6. Lógica do Contador
        if(i >= freq_limit)
        {
            i = 0;
            if(ds1 == 1) // Modo Ascendente
            {
                counter++;
                if(counter > 59) 
                {
                    counter = 0;
                    led_timer = 500; // 5 segundos
                }
            }
            else // Modo Descendente
            {
                counter--;
                if(counter < 0) 
                {
                    counter = 59;
                    led_timer = 500; // 5 segundos
                }
            }
        }
    }

    return 0;
}
