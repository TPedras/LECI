# Explicação Detalhada: Comunicação UART no PIC32

Este documento explica passo a passo o funcionamento do código `f13.c`, detalhando como funciona a comunicação série (UART) no microcontrolador PIC32 e a configuração exigida no exercício.

---

## 1. O que é a UART?
A **UART** (*Universal Asynchronous Receiver-Transmitter*) é um periférico de hardware que traduz dados entre formato paralelo (como o microcontrolador os processa internamente) e formato série (transmitidos bit a bit por um único fio).

É **assíncrona** porque não existe um sinal de *clock* (relógio) partilhado entre o emissor e o recetor. Em vez disso, ambos os lados têm de ser pré-configurados com a mesma velocidade de transmissão, conhecida como **Baudrate**.

---

## 2. Especificações do Exercício
O exercício pede uma configuração muito específica:
*   **Baudrate:** 9600 bps (bits por segundo)
*   **Formato (Frame):** 8 data bits, *Odd parity* (paridade ímpar), 2 *stop bits*.
*   **Transmissão (Tx):** Feita por **Polling** (interrogação).
*   **Receção (Rx):** Feita por **Interrupção** (o CPU é avisado quando chega um caráter).

---

## 3. Explicação Passo a Passo do Código

### A. Funções de Transmissão (Polling)
Como não podemos usar a função `printf`, temos de criar as nossas próprias funções para enviar dados.

```c
void putc(char c) {
    while(U2STAbits.UTXBF == 1); // Espera enquanto o buffer estiver cheio
    U2TXREG = c;                 // Envia o caráter
}
```
**Como funciona o Polling aqui?**
O ciclo `while` prenO periférico UART tem um pequeno espaço de memória temporária (Buffer) para a transmissão. A flag `UTXBF` (*UART Transmit Buffer Full*) indica se esse espaço está cheio (1) ou se tem espaço livre (0). 
de o processador até que haja espaço. Assim que houver espaço, o caráter é escrito no registo `U2TXREG` e o hardware trata de o enviar.

### B. Configuração da UART2 no `main()`

Para o PIC32 comunicar corretamente, temos de configurar os seus registos:

**1. Baudrate (Velocidade):**
```c
U2BRG = 129;
```
O gerador de baudrate (`U2BRG`) dita a velocidade. A fórmula predefinida é: 
`U2BRG = (PBCLK / (16 * Baudrate)) - 1`
Assumindo um Peripheral Bus Clock (PBCLK) de 20 MHz:
`U2BRG = (20.000.000 / (16 * 9600)) - 1 = 129.2` -> Arredonda-se para **129**.

**2. Formato de Dados (Data bits e Paridade):**
```c
U2MODEbits.PDSEL = 2; // 8-bit data, odd parity
```
O registo `PDSEL` aceita os seguintes valores:
*   `00` (0): 8-bit, sem paridade
*   `01` (1): 8-bit, paridade par (*even*)
*   `10` (2): 8-bit, paridade ímpar (*odd*) -> **É este que queremos.**
*   `11` (3): 9-bit, sem paridade

**3. Stop Bits:**
```c
U2MODEbits.STSEL = 1; // 2 stop bits
```
O registo `STSEL` define o final da *frame*:
*   `0`: 1 stop bit
*   `1`: 2 stop bits

**4. Ativação:**
```c
U2STAbits.URXEN = 1; // Ativar Recetor (Rx)
U2STAbits.UTXEN = 1; // Ativar Transmissor (Tx)
U2MODEbits.ON = 1;   // Ligar módulo UART2 (deve ser o último passo da configuração da UART)
```

### C. Configuração das Interrupções de Receção
Para que o programa não tenha de ficar bloqueado à espera de receber dados, usamos interrupções.

```c
U2STAbits.URXISEL = 0;  // Gera interrupção assim que recebe 1 caráter
IPC8bits.U2IP = 2;      // Prioridade da interrupção = 2
IEC1bits.U2RXIE = 1;    // Enable (ativa) a interrupção de receção da UART2
IFS1bits.U2RXIF = 0;    // Limpa a flag (marca que ainda não ocorreu nenhuma interrupção)
EnableInterrupts();     // Ativa globalmente as interrupções do CPU
```

### D. A Rotina de Interrupção (ISR)
Quando a UART recebe um caráter do PC, o hardware do PIC32 sinaliza a flag `U2RXIF` e o processador salta automaticamente para esta função, interrompendo o ciclo `while(1)` do main.

```c
void _int_(32) isr_uart2(void) {
    if (IFS1bits.U2RXIF) { // Confirmação de segurança
        char c = U2RXREG;  // O caráter recebido está neste registo
        
        putc(c);           // Faz o eco (envia de volta ao PC o que recebeu)
        
        LATEbits.LATE7 = !LATEbits.LATE7; // Troca o estado do LED
        
        if (c == 'D') {    // Lógica do exercício
            puts("\r\nDSD=");
            int sw_value = PORTB & 0x000F; // Lê portos RB0 a RB3 (Switches)
            putint(sw_value);              // Imprime o valor em decimal
            puts("\r\n");
        }
        
        IFS1bits.U2RXIF = 0; // OBRIGATÓRIO: Limpar a flag no final para sair da ISR
    }
}
```
**Nota sobre leitura de I/O:**
*   Para acender um LED (saída), escrevemos no registo `LAT` (ex: `LATEbits.LATE7`).
*   Para ler o estado de um Switch (entrada), lemos do registo `PORT` (ex: `PORTB & 0x000F` para isolar os 4 primeiros bits: RB3, RB2, RB1 e RB0).

---

## 4. Resumo da Dinâmica
1. O programa principal (`main`) configura tudo e depois entra num `while(1)` infinito sem fazer absolutamente nada.
2. Quando não há dados, o CPU não perde tempo a verificar a UART.
3. Se tu carregares numa tecla no PC, o caráter viaja pelo cabo série até ao PIC32.
4. O PIC32 guarda o caráter no `U2RXREG`, gera um sinal de interrupção e força o CPU a correr a `isr_uart2`.
5. A ISR reage, processa as regras (acender LED, imprimir 'DSD=', etc.), limpa a flag, e devolve o controlo ao `while(1)` do main.
