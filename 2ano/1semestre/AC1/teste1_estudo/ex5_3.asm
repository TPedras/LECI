	.eqv SIZE, 8
	.eqv print_string, 4
	.eqv print_char, 11
	.eqv print_int10, 1
	.data
array:	.word 8, 4, 15, -1987, 327, -9, 27, 16
str:	.asciiz "Result is: "
str2:	.asciiz ","
	.text
	.globl main

	#Mapa de registos
	#t0: val
	#t1: i
	#t2: v
	#t3: val[i]
	#t5: val[i + SIZE/2]
main: 	la $t0, array		#t0 = array
	li $t1, 0		#i = 0
	li $t4, SIZE
	srl $t4, $t4, 1		#t4 = SIZE/2
	sll $t7, $t4, 2		#t4 = t4 * 4
	
	
do:	sll $t3, $t1, 2		#i = i << 2
	addu $t3, $t3, $t0 	#t3 = &val[i]
	lw $t2, 0($t3)		#v = val[i]
	addu $t5, $t3, $t7	# t5 = &val[i + size/2]
	lw $t6, 0($t5)		# t6 = val[i + size/2]
	sw $t6, 0($t3)		# v[i] = val[i + size/2] 
	sw $t2, 0($t5)		# v i + .. = v
	
while: 	addiu $t1, $t1, 1
	blt $t1, $t4, do
	
	la $a0, str
	li $v0, print_string
	syscall
	li $t1, 0
	
do2:	sll $t3, $t1, 2
	addiu $t1,$t1, 1
	addu $t3, $t3, $t0
	lw $a0, 0($t3)
	li $v0, print_int10
	syscall
	
	la $a0, str2
	li $v0, print_char
	syscall
	
while2:	blt $t1, SIZE, do2
	
	
end: 	jr $ra
	
	
	
	
	