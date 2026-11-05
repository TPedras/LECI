# Parte 2: Operações Lógicas (Bitwise) e Máscaras

Configurar pinos individualmente (ex: `TRISBbits.TRISB14 = 0`) é útil para 1 ou 2 pinos, mas quando queremos controlar 7 pinos ao mesmo tempo (como no display de 7 segmentos), precisamos de usar **Operações Bitwise** (`&`, `|`, `~`, `^`).

A Regra de Ouro em Microcontroladores é:
> **"Altera apenas os bits que queres, nunca toques nos outros!"**

Se fizermos simplesmente `TRISB = 0x00FF;`, estamos a forçar os bits 15 a 8 a `0` e os bits 7 a 0 a `1`. Mas e se outro dispositivo já estivesse a usar o bit 15? Acabámos de o estragar!

### 1. Colocar Bits a ZERO (Máscara AND `&`)

A operação AND (`&`) com um `0` resulta sempre em `0`. A operação AND com um `1` mantém o valor original.
*   **Objetivo:** Configurar RB8 a RB14 como Saídas (`0`), sem alterar o resto de `TRISB`.
*   **O que precisamos:** Uma máscara onde os bits 8 a 14 são `0`, e todos os outros são `1`.
*   **Máscara em Binário:** `1000 0000 1111 1111`
*   **Máscara em Hexadecimal:** `0x80FF`
*   **Código C:**
    ```c
    TRISB = TRISB & 0x80FF;
    ```

### 2. Colocar Bits a UM (Máscara OR `|`)

A operação OR (`|`) com um `1` resulta sempre em `1`. A operação OR com um `0` mantém o valor original.
*   **Objetivo:** Configurar RB0 a RB3 como Entradas (`1`), sem alterar o resto.
*   **O que precisamos:** Uma máscara onde os bits 0 a 3 são `1`, e todos os outros são `0`.
*   **Máscara em Binário:** `0000 0000 0000 1111`
*   **Máscara em Hexadecimal:** `0x000F`
*   **Código C:**
    ```c
    TRISB = TRISB | 0x000F;
    ```

### 3. Combinar AND e OR (Limpar e Escrever)

Isto é extremamente comum quando queremos escrever um valor variável nuns pinos específicos. Por exemplo, escrever um valor nos LEDs `RE0-RE7`.
*   **Passo 1:** Limpar os bits antigos (meter a `0` com `&`).
*   **Passo 2:** Inserir os bits novos (meter o valor com `|`).

**Exemplo:** Escrever a variável `counter` (de 0 a 255) nos LEDs de RE0 a RE7:
```c
// 1. A máscara 0xFF00 limpa os bits 0 a 7 (deixa-os a 0), mantém 8 a 15
// 2. Fazemos OR com o valor do 'counter'
LATE = (LATE & 0xFF00) | counter;
```

### 4. Alternar um Bit (Inversão Lógica ou XOR)

Se queremos piscar um LED, temos de alternar o seu estado entre 1 e 0.
Podemos usar o operador de negação lógica `!` nas estruturas de bits:
```c
LATCbits.LATC14 = !LATCbits.LATC14; // Alterna o estado do LED no pino 14
```
Ou com XOR (`^`):
```c
LATC = LATC ^ 0x4000; // 0x4000 é o bit 14 a '1'. O XOR com 1 inverte o bit.
```

### Resumo das Máscaras mais usadas em AC2
*   **Limpar RB8 a RB14 (Displays):** `& 0x80FF`
*   **Limpar RD5 a RD6 (Seleção Disp):** `& 0xFF9F`
*   **Limpar RE0 a RE7 (LEDs Low):** `& 0xFF00`