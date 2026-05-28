	.data
str:	.asciiz "Teste-Pratico-1"
	.text
	.globl main
	
	#Mapa de Registos
	#cc : $t2
	#ms : $t0
main:	
	la $t0, str
	
while:	lb $t1, 0($t0)
	beq $t1, '\0', endwhile
	lb $t2, 0($t0)
if:	bge $t2, '0', else
	li $t3, '*'
	sb $t3, 0($t0)
	j endelse
else:	blt $t2, 'a', endelse
	bgt $t2, 'z', endelse
	lb $t3, 0($t0)
	addi $t3, $t3, -0x20
	sb $t3, 0($t0)
endelse:
	addiu $t0, $t0, 1
	j while
	
endwhile:
	jr $ra