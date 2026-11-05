#include <detpic32.h>

int main(void)
{
    // 1. Configurações de I/O
    // RE6-RE3 como saídas (Máscara 0xFF87 -> bits 6,5,4,3 a 0)
    TRISE = TRISE & 0xFF87;
    // RC14 como saída (Exercício 1)
    TRISCbits.TRISC14 = 0;

    int counter = 0;

    while(1)
    {
        // 2. Atualizar LEDs RE6-RE3 com o valor do contador
        LATE = (LATE & 0xFF87) | (counter << 3);

        // 3. Alternar o LED em RC14 (Toggle do Exercício 1)
        LATCbits.LATC14 = !LATCbits.LATC14;

        // 4. Esperar o tempo correspondente a 2.7 Hz (Exercício 3)
        // 20,000,000 / 2.7 = 7,407,407 ciclos
        resetCoreTimer();
        while(readCoreTimer() < 7407407);

        // 5. Decrementar o contador, módulo 10 (0 a 9)
        // Somamos 10 antes de aplicar o módulo para evitar números negativos
        counter = (counter - 1 + 10) % 10;
    }

    return 0;
}
