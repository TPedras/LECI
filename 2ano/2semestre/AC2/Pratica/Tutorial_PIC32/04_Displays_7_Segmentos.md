# Parte 4: Displays de 7 Segmentos e Multiplexagem

A placa de AC2 tem um módulo com dois displays de 7 segmentos. "7 segmentos" significa que existem 7 pequenos LEDs em forma de barra (A, B, C, D, E, F, G) que juntos formam os números.

*   Os segmentos estão ligados aos pinos **RB8 a RB14**.
*   O Display Mais Significativo (Esquerda/High) é ativado pelo pino **RD6**.
*   O Display Menos Significativo (Direita/Low) é ativado pelo pino **RD5**.

**Importante:** Na nossa placa, quando pomos `RD6 = 1` ligamos o display, e se pusermos o bit do segmento (ex: RB8) a `1`, ele acende. (Isto deve-se à eletrónica específica da placa, às vezes noutras placas é preciso colocar a `0` para ligar).

### A Tabela de Descodificação (Hexadecimal para Segmentos)

Para não termos de descobrir manualmente que bits precisamos de ligar para fazer o número "3" ou "A", usamos um *Array* constante predefinido. A posição no array corresponde ao número que queremos mostrar.

```c
// Tabela para os caracteres de 0 a F
static const char disp7Scodes[] = {
    0x3F, // 0 (Liga A, B, C, D, E, F)
    0x06, // 1 (Liga B, C)
    0x5B, // 2 (Liga A, B, D, E, G)
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
```

### Multiplexagem: "Como ligar os dois ao mesmo tempo?"

Os dois displays partilham as mesmas linhas de dados (RB8-RB14). Isto significa que não é possível escrever o número "2" num e o "5" no outro *exatamente no mesmo instante físico*.

Se selecionarmos os dois (`RD6=1` e `RD5=1`) e mandarmos o número "3", **ambos** vão mostrar "3".

**O Truque (Multiplexagem Temporizada):**
1.  Ligamos o Display da Direita. Desligamos o da Esquerda. Mandamos o algarismo das unidades.
2.  Esperamos um tempo muito curto (ex: 10 a 20 milissegundos).
3.  Ligamos o Display da Esquerda. Desligamos o da Direita. Mandamos o algarismo das dezenas.
4.  Esperamos o mesmo tempo.
5.  Repetir em ciclo rápido.

Como repetimos isto muito rápido (a mais de 50 vezes por segundo, ou `50Hz`), o nosso olho é enganado pela persistência retiniana e parece que ambos estão ligados permanentemente.

### Função Clássica `send2displays()` (Guião 5)

```c
void send2displays(unsigned char value)
{
    static const char disp7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
    
    // Variável que guarda qual o display a acender desta vez (0=Baixo, 1=Alto)
    static char displayFlag = 0; 
    
    // value = 0x25 (exemplo).
    // digit_low  = 0x25 & 0x0F = 0x05 (Unidades)
    // digit_high = 0x25 >> 4   = 0x02 (Dezenas)
    int digit_low = value & 0x0F;
    int digit_high = (value & 0xF0) >> 4;

    if (displayFlag == 0)
    {
        // 1. Seleciona LOW (RD5=1, RD6=0)
        LATD = (LATD & 0xFF9F) | 0x0020;
        // 2. Envia Unidades para RB14-RB8
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_low] << 8);
        displayFlag = 1;
    }
    else
    {
        // 1. Seleciona HIGH (RD6=1, RD5=0)
        LATD = (LATD & 0xFF9F) | 0x0040;
        // 2. Envia Dezenas para RB14-RB8
        LATB = (LATB & 0x80FF) | (disp7Scodes[digit_high] << 8);
        displayFlag = 0;
    }
}
```
*Cada vez que chamamos esta função, ela acende apenas UM display. Da próxima vez que for chamada, acende o OUTRO.*