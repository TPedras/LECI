.equ ADDR_BASE_HI, 0xBF88   # Base dos registos [cite: 673]
.equ TRISB, 0x6040          # Offset TRISB [cite: 856]
.equ PORTB, 0x6050          # Offset PORTB [cite: 856]
.equ TRISE, 0x6100          # Offset TRISE [cite: 856]
.equ LATE,  0x6120          # Offset LATE [cite: 856]

.equ READ_CORE_TIMER, 11    # System call 11 [cite: 533]
.equ RESET_CORE_TIMER, 12   # System call 12 [cite: 535]

.data
.text
.globl main

main:
    lui $t0, ADDR_BASE_HI   # $t0 = 0xBF880000 [cite: 679]

    # --- Configuração ---
    # RE4-RE1 como saídas (bits 4-1 = 0) [cite: 761]
    lw   $t1, TRISE($t0)    # Read [cite: 762]
    andi $t1, $t1, 0xFFE1   # Modify (0xFFE1 = 1111 1111 1110 0001 binário) [cite: 766]
    sw   $t1, TRISE($t0)    # Write [cite: 769]

    # RB3 como entrada (bit 3 = 1) [cite: 761]
    lw   $t1, TRISB($t0)    # Read [cite: 771]
    ori  $t1, $t1, 0x0008   # Modify (bit 3 = 1) [cite: 775]
    sw   $t1, TRISB($t0)    # Write [cite: 778]

    li   $t2, 0             # Inicializar contador (cnt = 0) [cite: 781, 782]

loop:
    # --- Atualizar LEDs ---
    lw   $t1, LATE($t0)     # Read LATE [cite: 789, 790]
    andi $t1, $t1, 0xFFE1   # Limpa bits 4-1 [cite: 793, 794]
    sll  $t3, $t2, 1        # Shift counter para posição 1 [cite: 795, 796]
    or   $t1, $t1, $t3      # Merge [cite: 797, 798]
    sw   $t1, LATE($t0)     # Write LATE [cite: 799, 800]

    # --- Delay 0.5s (2 Hz) ---
    li   $v0, RESET_CORE_TIMER # [cite: 806]
    syscall                 # [cite: 806]

wait:
    li   $v0, READ_CORE_TIMER  # [cite: 807]
    syscall                 # [cite: 808]
    blt  $v0, 10000000, wait # 10 milhões = 0.5s @ 20MHz [cite: 496, 809]

    # --- Lógica Up/Down ---
    lw   $t4, PORTB($t0)    # Ler switches [cite: 665]
    andi $t4, $t4, 0x0008   # Isolar RB3 [cite: 818]

    beq  $t4, $zero, down   # Se RB3 == 0, salta para decremento [cite: 818, 819]
    addi $t2, $t2, 1        # Up: cnt++ [cite: 811]
    j    check_mod

down:
    addi $t2, $t2, -1       # Down: cnt-- [cite: 817]

check_mod:
    andi $t2, $t2, 0x000F   # MOD 16 
    j    loop               # [cite: 813]