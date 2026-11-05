#include <detpic32.h>

// Função para enviar um caráter (Polling)
void putc(char c) {
    while(U2STAbits.UTXBF == 1); // Espera enquanto o buffer de transmissão estiver cheio
    U2TXREG = c;
}


// Função para enviar uma string (Polling)
void puts(char *s) {    
    while(*s != '\0') {
        putc(*s);
        s++;
    }
}

// Função auxiliar para enviar um número decimal (0-15) sem usar printf
void putint(int n) {
    if(n >= 10) {
        putc((n / 10) + '0'); // Dezena
        putc((n % 10) + '0'); // Unidade
    } else {
        putc(n + '0');
    }
}

// Rotina de Serviço de Interrupção (ISR) para Receção
void _int_(32) isr_uart2(void) {
    if (IFS1bits.U2RXIF) { // Verifica se é interrupção de receção
        char c = U2RXREG;  // Lê o caráter recebido
        
        // 2. Eco do caráter
        putc(c);
        
        // 3. Toggle LED7 (RE7)
        LATEbits.LATE7 = !LATEbits.LATE7;
        
        // 4. Se o caráter for 'D'
        if (c == 'D') {
            puts("\r\nDSD=");
            // Lê o valor dos switches RB3 a RB0
            int sw_value = PORTB & 0x000F; 
            putint(sw_value);
            puts("\r\n");   
        }
        
        IFS1bits.U2RXIF = 0; // Limpa a flag de interrupção
    }
}

int main(void) {
    // --- Configuração de I/O ---
    TRISEbits.TRISE7 = 0;    // RE7 como saída (LED7)
    LATEbits.LATE7 = 0;     // Valor inicial 0
    
    TRISB = TRISB | 0x000F; // RB3 a RB0 como entradas (Switches)

    // --- Configuração da UART2 ---
    // Cálculo do para 9600 bps (PBCLK = 20MHz)
    // BRG = (20,000,000 / (16 * 9600)) - 1 = 129.21 -> 129
    U2BRG = 129;
    
    // PDSEL: 10 = 8-bit data, odd parity (paridade ímpar)
    U2MODEbits.PDSEL = 2; 
    
    // STSEL: 1 = 2 stop bits
    U2MODEbits.STSEL = 1;
    
    U2MODEbits.BRGH = 0;    // Standard speed
    
    U2STAbits.URXEN = 1;    // Ativar recetor
    U2STAbits.UTXEN = 1;    // Ativar transmissor
    U2MODEbits.ON = 1;      // Ativar UART2

    // --- Configuração de Interrupções ---
    U2STAbits.URXISEL = 0;  // Interrupção quando o buffer de receção tem 1 char
    IPC8bits.U2IP = 2;      // Prioridade 2
    IEC1bits.U2RXIE = 1;    // Ativar interrupções de receção da UART2
    IFS1bits.U2RXIF = 0;    // Limpar flag

    EnableInterrupts();

    while(1); // Ciclo infinito à espera de interrupções

    return 0;
}
