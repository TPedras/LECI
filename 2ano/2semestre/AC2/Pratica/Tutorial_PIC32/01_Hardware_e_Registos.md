# Parte 1: Introdução ao Hardware e Registos (PIC32)

Se nunca programou um microcontrolador, o mais importante a reter é que não temos um "ecrã" ou "teclado" convencionais de forma imediata. O microcontrolador (neste caso, o PIC32) comunica com o mundo exterior através de **Pinos**, que estão agrupados em **Portos** (Port A, Port B, Port C, etc.).

Cada porto tem geralmente 16 pinos (bits 0 a 15).

Na placa que usamos nas aulas de AC2, os periféricos físicos estão ligados a pinos específicos:

### Mapa de Hardware
*   **LEDs (Saídas):**
    *   `RE0` a `RE7` (Porto E, bits 0 a 7): Um bloco de 8 LEDs.
    *   `RC14` (Porto C, bit 14): O "LED 11", muitas vezes usado como alarme.
*   **Interruptores / Dip-Switches (Entradas):**
    *   `RB0` a `RB3` (Porto B, bits 0 a 3): 4 interruptores físicos.
*   **Displays de 7 Segmentos (Saídas):**
    *   `RB8` a `RB14` (Porto B, bits 8 a 14): Controlam as luzes de cada segmento (a, b, c, d, e, f, g).
    *   `RD5` e `RD6` (Porto D, bits 5 e 6): Controlam *qual* dos dois displays está ligado (o da direita ou o da esquerda).

---

### Como controlar os Pinos (Os 3 Registos Essenciais)

Para controlar um pino, o PIC32 usa 3 registos principais para cada Porto. Vamos usar o Porto B como exemplo:

1.  **TRIS (Data Direction Register) - `TRISB`**
    *   **O que faz:** Define se o pino é uma Entrada (recebe sinal) ou Saída (envia sinal).
    *   **Mnemónica:** **1** = **I**nput (Entrada), **0** = **O**utput (Saída).
    *   *Exemplo:* Para acender um LED no pino RB14, precisamos que RB14 seja saída. Logo, o bit 14 de TRISB tem de ser `0`. Se quisermos ler um interruptor no pino RB0, o bit 0 de TRISB tem de ser `1`.

2.  **LAT (Latch Register) - `LATB`**
    *   **O que faz:** Escreve um valor num pino que esteja configurado como saída.
    *   *Exemplo:* Depois de configurar RB14 como saída (TRISB = 0), se quisermos ligar o LED (dar 3.3V), escrevemos `1` no bit 14 do registo `LATB`. Para desligar (0V), escrevemos `0`.

3.  **PORT (Port Register) - `PORTB`**
    *   **O que faz:** Lê o valor físico atual que está num pino (usado principalmente para pinos configurados como entrada).
    *   *Exemplo:* Para saber se o interruptor em RB0 está ligado ou desligado, lemos o bit 0 do registo `PORTB`.

### Acesso aos Registos em C
Em C, ao incluir `#include <detpic32.h>`, temos acesso a estes registos diretamente pelo nome (ex: `TRISB`, `LATB`, `PORTB`).
Podemos modificar todos os 16 pinos de uma vez:
```c
TRISB = 0xFFFF; // Tudo a 1 -> Tudo a entradas
```

Ou podemos modificar um pino individualmente usando estruturas de bits (muito útil!):
```c
TRISBbits.TRISB14 = 0; // Configura Apenas o pino 14 como saída
LATBbits.LATB14 = 1;   // Coloca Apenas o pino 14 a 1 (Ligar)
```

**No próximo documento (02_Operacoes_Bitwise.md), vamos ver como configurar vários pinos ao mesmo tempo sem alterar os restantes, usando Máscaras Hexadecimais.**