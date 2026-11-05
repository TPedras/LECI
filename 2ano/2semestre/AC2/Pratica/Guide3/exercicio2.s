	# Definições de endereços [cite: 673, 856]
	.equ ADDR_BASE_HI, 0xBF88   
	.equ TRISB, 0x6040          
	.equ PORTB, 0x6050          
	.equ TRISE, 0x6100          
	.equ LATE,  0x6120          
	.data
	.text
	.globl main

main:
    lui $t0, ADDR_BASE_HI   # t0 = 0xBF880000 [cite: 679, 686]

    # --- Configuração (Setup) ---
    # RE0 como saída (bit 0 de TRISE = 0) [cite: 662, 677]
    lw   $t1, TRISE($t0)    
    andi $t1, $t1, 0xFFFE   # Limpa o bit 0 [cite: 683, 688]
    sw   $t1, TRISE($t0)    

    # RB0 como entrada (bit 0 de TRISB = 1) [cite: 661, 706]
    lw   $t1, TRISB($t0)    
    ori  $t1, $t1, 0x0001   # Coloca o bit 0 a 1
    sw   $t1, TRISB($t0)    

loop:
    # --- Corpo do Ciclo ---
    # 1. Ler o porto de entrada RB0 [cite: 665, 733]
    lw   $t2, PORTB($t0)    
    andi $t2, $t2, 0x0001   # Isolar o bit 0

    # 2. NEGAR o valor lido (Lógica: RE0 = RB0\) 
    # Usamos xori para inverter o bit 0
    xori $t2, $t2, 0x0001   

    # 3. Escrever o valor negado no porto de saída RE0 [cite: 665, 734]
    lw   $t1, LATE($t0)     # Ler valor atual do Latch [cite: 714]
    andi $t1, $t1, 0xFFFE   # Limpar o bit 0 [cite: 715]
    or   $t1, $t1, $t2      # Inserir o novo valor (negado)
    sw   $t1, LATE($t0)     # Atualizar o porto de saída [cite: 684, 705]

    j    loop               # Ciclo infinito [cite: 733]