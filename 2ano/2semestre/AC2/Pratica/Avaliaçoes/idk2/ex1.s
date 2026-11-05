    .equ base, 0xBF88
    .equ trise, 0x6100
    .equ late, 0x6120
    .equ trisb, 0x6040
    .equ portb, 0x6050
    .equ read_core_timer, 11
    .equ reset_core_timer, 12
    .data
    .text
    .globl main
main:
    lui $t0, base
    # leds 7 a 0 a zero
    lw $t1, trise($t0)
    andi $t1, $t1, 0xFF00
    sw $t1, trise($t0)      #Trise register

    # dip switch 3 a 0 a 1
    lw $t1, trisb($t0)
    ori $t1, $t1, 0x000F
    sw $t1, trisb($t0)      #Trisb register

while:
    lw $t1, portb($t0)
    andi $t1, $t1, 0x000F
    andi $t2, $t1, 0x0008 # t2 = ds3

    beq $t2, $zero, positivo
    andi $t3, $t1, 0x0007 # t3 = ds0 a 2
    not $t3, $t3 # inverter os bits 0 a 2
    andi $t3, $t3, 0x0007 #garantir que só os bits 0 a 2 estão ativos
    ori $t4, $t3, 0x80

    j output
positivo:
    move $t4, $t1
    j output

output:    
    sw $t4, late($t0)   #Write back to LATE register
    j while

end:
    jr $ra





