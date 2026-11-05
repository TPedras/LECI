    .equ base, 0xBF88
    .equ TRISE, 0x6100
    .equ TRISB, 0x6040
    .equ LATE, 0x6120
    .equ PORTB, 0x6050
    .equ freq, 286
    .equ    PRINT_INT, 6
    .equ    PUT_CHAR, 3

    .equ READ_CORE_TIMER, 11
    .equ RESET_CORE_TIMER, 12

    .data
    .text
    .globl main
main:
    lui $t0, base
    #leds
    lw $t1, TRISE($t0)
    andi $t1, $t1, 0xFFC3
    sw $t1, TRISE($t0)
    li $s0, 0 #contador

while:
    
    lw $t1, LATE($t0)
    andi $t1, $t1, 0xFFC3
    
    sll $t2, $s0, 2
    or $t1, $t1, $t2
    sw $t1, LATE($t0)
    
    li $v0, PRINT_INT
    move $a0, $s0
    li $a1, 5
    sll     $a1, $a1, 16
    ori     $a1, $a1, 2
    syscall                                 #   printInt(counter, 2 | 5 << 16)
    li      $v0, PUT_CHAR
    li      $a0, '\n'
    syscall                                 #   putChar('\n')
    
    addi $s0, 24
    rem $s0, $s0, 25
    
endif1: li      $a0, 286                        #   // 1000 / 3.5 = 285,7 (aprox igual a 286)
        jal     delay                           #   delay(286)

        j       while                           # }

        lw      $ra, 4($sp)
        lw      $s0, 0($sp)
        addiu   $sp, $sp, 8

        jr      $ra



delay:  li      $v0, RESET_CORE_TIMER
        syscall
        mul     $a0, $a0, 20000
whiled: li      $v0, READ_CORE_TIMER
        syscall
        bge     $v0, $a0, endwd
        j       whiled
endwd:  jr      $ra
    
