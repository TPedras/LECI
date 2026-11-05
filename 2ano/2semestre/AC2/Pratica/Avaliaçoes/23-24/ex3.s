    .equ ADDR_BASE_HI, 0xBF88
    .equ TRISE, 0x6100
    .equ TRISB, 0x6040
    .equ LATE, 0x6120
    .equ PORTB, 0x6050

    .equ READ_CORE_TIMER, 11
    .equ RESET_CORE_TIMER, 12
    
    .data
    .text
    .globl main

main:

    lui $t1, ADDR_BASE_HI
    lw $t2, TRISE($t1)
    andi $t2, $t2, 0xFFC1
    sw $t2, TRISE($t1)      #Trise register

    li $t0, 0x0001

loop:
    lw $t2, LATE($t1)
    andi $t2, $t2, 0xFFC1
    sll $t3, $t2, 1     #Shift left to toggle bit 1

    or $t2, $t2, $t3     #merge with LATE register
    sw $t3, LATE($t1)   #Write back to LATE register

    li $v0, RESET_CORE_TIMER
    syscall
while:
    li $v0, READ_CORE_TIMER
    syscall

    blt $v0, 8695652, while

    sll $t0, $t0, 1     #Shift left to toggle bit 0
    srl $t4, $t0, 5
    
    or $t0, $t0, $t4     #merge with TRISB register
    andi $t0, $t0, 0x003F

    j loop

end:
    jr $ra



    

    


