# Parte 3: Atrasos, Frequências e CoreTimer

Os microcontroladores executam instruções a velocidades muito altas (no caso das nossas placas PIC32 em AC2, normalmente o "Peripheral Bus Clock" - **PBCLK** - funciona a **20 MHz**, ou seja, 20 milhões de ciclos por segundo).

Se não introduzirmos pausas programadas no código, um LED que acende e apaga num ciclo `while(1)` fá-lo-á tão rápido que para o olho humano parecerá estar sempre ligado (com meia intensidade).

Para controlar o tempo, usamos o **CoreTimer**, um contador interno do processador que incrementa a cada dois ciclos do CPU (em AC2 assume-se que incrementa à taxa de 20MHz).

### Funções do detpic32.h
*   `resetCoreTimer()`: Coloca o valor do temporizador a 0.
*   `readCoreTimer()`: Devolve o valor atual do temporizador.

### A Matemática do Tempo

A frequência é $20,000,000$ *ticks* por segundo ($20 MHz$).
*   **1 segundo:** 20,000,000 ticks.
*   **1 milissegundo (1ms):** $20,000,000 / 1000 = 20,000$ ticks.
*   **1 microssegundo (1us):** $20,000,000 / 1,000,000 = 20$ ticks.

Se quiser calcular os *ticks* baseados numa frequência `f` (em Hertz):
*   `ticks = 20000000 / f`
*(Exemplo: Para piscar a 5 Hz -> 20M / 5 = 4,000,000 ticks)*

### 1. Criar uma função genérica de `delay` (Atraso)

É muito comum e prático criar uma função de atraso em milissegundos logo no início dos nossos programas C (a partir do Guião 4 e 5).

```c
void delay(unsigned int ms)
{
    // O ciclo corre 'ms' vezes
    for(; ms > 0; ms--)
    {
        resetCoreTimer();
        // Espera até que passem 20,000 ciclos (1 milissegundo)
        while(readCoreTimer() < 20000); 
    }
}
```

### 2. Atrasos diretamente no loop (Polling)

Se não quiser usar a função, pode fazer a pausa diretamente no código.
Exemplo para criar uma frequência de **2.7 Hz** (como no Guião 4):
*   Ticks = $20,000,000 / 2.7 \approx 7,407,407$

```c
while(1)
{
    // Ligar LED
    LATCbits.LATC14 = !LATCbits.LATC14;

    // Esper2r
    resetCoreTimer();
    while(readCoreTimer() < 7407407);
}
```

### O Problema do `delay()` bloqueante
Quando o programa está preso dentro de um `while(readCoreTimer() < ...);`, ele não faz mais nada. Se estiver a esperar 1 segundo (usando `delay(1000)`), não consegue ler o teclado ou atualizar os displays durante esse tempo inteiro.

**Solução:** No Guião 5, aprendemos a fazer **Refrescamento e Multiplexagem**. Em vez de esperar 1 segundo inteiro de uma vez, fazemos o atraso em "pequenos pedaços" (ex: 10 milissegundos), atualizamos os displays e contamos quantas vezes esses pedaços passaram. (Isto será explicado na Parte 5).