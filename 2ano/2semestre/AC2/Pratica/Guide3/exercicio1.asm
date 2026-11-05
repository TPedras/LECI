.equ ADDR_BASE_HI, 0xBF88   # Base comum para os registos de I/O [cite: 673]
.equ TRISB, 0x6040          # Offset do registo TRISB [cite: 856]
.equ PORTB, 0x6050          # Offset do registo PORTB [cite: 856]
.equ TRISE, 0x6100          # Offset do registo TRISE [cite: 856]
.equ LATE,  0x6120          # Offset do registo LATE [cite: 856]

.data
.text
.globl main

main:
    lui $t0, ADDR_BASE_HI   # $t0 aponta para a base dos registos [cite: 679, 686]
    # Configurar RE0 como Saída (TRISE bit 0 = 0) [cite: 662, 732]
    lw   $t1, TRISE($t0)    # Read [cite: 676, 680]
    andi $t1, $t1, 0xFFFE   # Modify: coloca o bit 0 a '0' (Output) [cite: 676, 683]
    sw   $t1, TRISE($t0)    # Write [cite: 676, 684]

    # Configurar RB0 como Entrada (TRISB bit 0 = 1) [cite: 661, 732]
    lw   $t1, TRISB($t0)    # Read [cite: 676]
    ori  $t1, $t1, 0x0001   # Modify: coloca o bit 0 a '1' (Input) [cite: 676]
    sw   $t1, TRISB($t0)    # Write [cite: 676]
    loop:
    # LER o valor de RB0 [cite: 665, 733]
    lw   $t2, PORTB($t0)    # Lê todo o porto B [cite: 671]
    andi $t2, $t2, 0x0001   # Isola o bit 0 (RB0) [cite: 715]

    # ESCREVER em RE0 [cite: 665, 733]
    lw   $t1, LATE($t0)     # Read LATE [cite: 676, 692]
    
    # Lógica para atualizar apenas o bit 0 de LATE com o valor de RB0
    # Primeiro limpamos o bit 0 atual:
    andi $t1, $t1, 0xFFFE   
    # Depois inserimos o valor lido de RB0 ($t2):
    or   $t1, $t1, $t2      
    
    sw   $t1, LATE($t0)     # Write LATE [cite: 676, 698]

    j    loop               # Repete o processo infinitamente [cite: 733, 813]