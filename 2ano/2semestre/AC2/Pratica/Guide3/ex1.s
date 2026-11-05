.equ ADDR_BASE_HI, 0xBF88
.equ TRISE, 0x6100
.equ LATE,  0x6120
.equ RESET_CORE_TIMER, 12
.equ READ_CORE_TIMER, 11

.data
.text
.globl main

main:
    lui $t0, ADDR_BASE_HI

    # 1. Configurar RE4-RE1 como saídas [cite: 761]
    lw   $t1, TRISE($t0)
    andi $t1, $t1, 0xFFE1   # Reset bits 4-1 (coloca-os a 0) [cite: 766, 767]
    sw   $t1, TRISE($t0)

    li   $t2, 0             # Inicializar contador (cnt = 0) [cite: 781, 782]

loop:
    # 2. Atualizar LEDs (RE4-RE1) com o valor de $t2 [cite: 787]
    lw   $t1, LATE($t0)
    andi $t1, $t1, 0xFFE1   # Limpa o estado anterior dos bits 4-1 [cite: 793, 794]
    
    # O valor em $t2 (0-15) deve ser deslocado para a esquerda 1 vez
    # para alinhar com os pinos RE1, RE2, RE3, RE4 [cite: 795, 796]
    sll  $t3, $t2, 1        
    or   $t1, $t1, $t3      # Combina o contador com o resto do registo LATE [cite: 797, 798]
    sw   $t1, LATE($t0)     # Escreve no hardware [cite: 799, 800]

    # 3. Esperar 1 segundo (1 Hz) usando Core Timer [cite: 803]
    li   $v0, RESET_CORE_TIMER
    syscall                 # Faz reset ao Core Tier [cite: 805, 806]

wait:
    li   $v0, READ_CORE_TIMER
    syscall                 # Lê o valor atual [cite: 807, 808]
    blt  $v0, 20000000, wait # Espera até atingir 20 milhões (1s) [cite: 497, 809]

    # 4. Incrementar contador módulo 16
    addi $t2, $t2, 1        # cnt = cnt + 1 [cite: 811, 812]
    andi $t2, $t2, 0x000F   # Garante que volta a 0 após o 15 (MOD 16) [cite: 811, 814]

    j    loop               # Repete o ciclo [cite: 813]