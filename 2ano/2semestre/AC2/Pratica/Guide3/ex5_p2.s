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
    andi $t1, $t1, 0xFFE1   # Bits 4-1 = 0 [cite: 766]
    sw   $t1, TRISE($t0)

    li   $t2, 0             # Inicializar contador (0000) [cite: 781, 822]

loop:
    # 2. Atualizar LEDs (RE4-RE1) [cite: 787]
    lw   $t1, LATE($t0)
    andi $t1, $t1, 0xFFE1   # Limpa bits 4-1 [cite: 793]
    sll  $t3, $t2, 1        # Alinha contador com os pinos [cite: 795]
    or   $t1, $t1, $t3      # Merge [cite: 797]
    sw   $t1, LATE($t0)     # Update [cite: 799]

    # 3. Atraso de 1.5 Hz (aprox. 0.66s) 
    li   $v0, RESET_CORE_TIMER
    syscall
wait:
    li   $v0, READ_CORE_TIMER
    syscall
    blt  $v0, 13333333, wait # [cite: 809]

    # 4. Lógica Johnson: novo_bit = !(bit3) 
    move $t4, $t2           # Copia estado atual
    srl  $t4, $t4, 3        # Isola o bit 3 (o mais significativo do contador)
    xori $t4, $t4, 1        # Inverte o bit (0->1 ou 1->0) 
    
    sll  $t2, $t2, 1        # Desloca o contador para a esquerda 
    or   $t2, $t2, $t4      # Insere o novo bit na posição 0 
    andi $t2, $t2, 0x000F   # Mantém apenas 4 bits

    j    loop