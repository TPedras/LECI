# Parte 5: Exemplo Prático e Lógica de Programa (Guião 4 e 5)

Quando nos pedem para construir um programa que é um Contador Base-10 (BCD) que conta mais rápido ou mais devagar dependendo de um botão (Dip-Switch), e que atualiza os displays ao mesmo tempo, precisamos de juntar todas as peças:

1.  **Configuração Inicial** (`TRIS`).
2.  **Ciclo Infinito** (`while(1)`).
3.  **Controlo de Tempo** (Atrasos e Frequências).
4.  **Descodificação BCD** (Binário para Formato Humano).

### Como contar várias coisas ao mesmo tempo sem bloquear?

Se pedem para atualizar o display a **100 Hz** (a cada $10ms$) e contar os números do relógio a **5 Hz** (a cada $200ms$), usamos o divisor comum menor: o atraso de `$10ms$`.

```c
#include <detpic32.h>

void delay(unsigned int ms) {
    for(; ms > 0; ms--) {
        resetCoreTimer();
        while(readCoreTimer() < 20000);
    }
}

// (Inserir a função send2displays() da Parte 4 aqui)

// Função que converte Hex/Binário Normal em BCD (Base-10)
// Exemplo: O número normal 25 (0x19 em Hex) 
// toBcd converte para 0x25 (2 dezenas, 5 unidades) para os displays perceberem
unsigned char toBcd(unsigned char value)
{
    return ((value / 10) << 4) + (value % 10);
}

int main(void)
{
    // --- 1. CONFIGURAÇÕES (TRIS) ---
    TRISB = (TRISB & 0x80FF) | 0x0001; // RB8-RB14 Saídas (Disp); RB0 Entrada (Switch)
    TRISD = TRISD & 0xFF9F;            // RD5, RD6 Saídas (Seleção Disp)
    
    int counter = 0; // O número a mostrar (0 a 59)
    int freq_div = 0; // O nosso "relógio mecânico" interno

    while(1)
    {
        // --- 2. MULTIPLEXAGEM DO DISPLAY (Corre sempre a cada 10ms) ---
        // Convertemos o 'counter' (ex: 45) para BCD (0x45) e mandamos
        send2displays(toBcd(counter)); 
        
        // Esperamos 10ms (Esta é a ÚNICA função delay() no loop inteiro!)
        delay(10); 
        
        // --- 3. GESTÃO DO TEMPO ---
        freq_div++; // Incrementa o nosso divisor de frequência

        // Lemos o botão (Switch 1)
        int ds1 = PORTBbits.RB0;
        
        // Se ds1 == 1, queremos 5 Hz. (5 Hz = 200ms). Como cada ciclo são 10ms, precisamos de 20 ciclos.
        // Se ds1 == 0, queremos 2 Hz. (2 Hz = 500ms). Precisamos de 50 ciclos.
        int limites_ciclos = (ds1 == 1) ? 20 : 50;

        if(freq_div >= limites_ciclos)
        {
            // Já passou o tempo necessário!
            freq_div = 0; // Fazer reset ao relógio
            
            // --- 4. LÓGICA DO CONTADOR ---
            if(ds1 == 1) // Conta para cima
            {
                counter++;
                if(counter > 59) counter = 0; // Reseta aos 60
            }
            else // Conta para baixo
            {
                counter--;
                if(counter < 0) counter = 59;
            }
        }
    }
    return 0;
}
```

### Notas Finais Importantes:
*   **A função `getChar()`:** Lida com a UART (Consola `pterm`). Bloqueia o programa até alguém carregar numa tecla.
*   **A função `putChar('c')` / `printStr("Olá
")`:** Envia texto para o `pterm`.
*   A organização do código acima (com o `freq_div`) é a forma profissional de programar microcontroladores chamada de **Máquina de Estados / Polling com Divisor de Frequência**.

Siga estes guiões pela ordem (1 a 5) e terá os fundamentos completos para resolver qualquer exercício prático das aulas 4 e 5!