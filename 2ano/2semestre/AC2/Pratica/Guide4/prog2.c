#include <detpic32.h>

int main(void)
{
    // 1. Tabela de conversão hexadecimal para 7-segmentos (A-G)
    // Conforme a Figura 5 do guião
    static const char disp7Scodes[] = {
        0x3F, // 0
        0x06, // 1
        0x5B, // 2
        0x4F, // 3
        0x66, // 4
        0x6D, // 5
        0x7D, // 6
        0x07, // 7
        0x7F, // 8
        0x6F, // 9
        0x77, // A
        0x7C, // b
        0x39, // C
        0x5E, // d
        0x79, // E
        0x71  // F
    };

    // 2. Configurações de I/O
    // RB3-RB0 como entradas (1); RB14-RB8 como saídas (0)
    // Máscara: 1000 0000 1111 1111 -> 0x80FF
    TRISB = (TRISB & 0x80FF) | 0x000F;

    // RD6-RD5 como saídas (0)
    // Máscara: 1111 1111 1001 1111 -> 0xFF9F
    TRISD = TRISD & 0xFF9F;

    // 3. Seleção do Display (Ex 7: Menos significativo -> RD5=1, RD6=0)
    // Para o Exercício 8 (Mais significativo), usar 0x0040 (RD6=1, RD5=0)
    LATD = (LATD & 0xFF9F) | 0x0020;

    while(1)
    {
        // 4. Ler o valor dos dip-switches (bits 3-0 do Porto B)
        int dips = PORTB & 0x000F;

        // 5. Obter o código correspondente na tabela
        char code = disp7Scodes[dips];

        // 6. Enviar para o display (bits 14-8 do Porto B)
        // Limpamos os bits antigos e fazemos OR com o novo código deslocado
        LATB = (LATB & 0x80FF) | (code << 8);
    }

    return 0;
}
