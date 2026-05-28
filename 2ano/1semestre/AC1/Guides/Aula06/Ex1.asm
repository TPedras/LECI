
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
	
	.data
array:	.word str1, str2, str3
str1:	.asciiz "Array"
str2:	.asciiz "de"
str3:	.asciiz "ponteiros"
	
	.text
	.globl main
main:
	# Mapa de variáveis:
	#	$t0: i;
	#	$t1: &(array[0])
	#	$t2: array[i]
					#
	li  $t0, 0			# i = 0;
	la  $t1, array			# $t1 = &(array[0])
					#
for: 	bge $t0, SIZE, endf		# for (i < SIZE) {
					#
	sll $t3, $t0, 2			# 	i *= 4;
	addu $t3, $t3, $t1		#	$t3 = &array[i];
	lw $t2, 0($t3)			#	$t2 = array[i]
					#
	move $a0, $t2			#
	li  $v0, print_string		#
	syscall				# 	print_string($t2)
					#

					#
	addi $t0, $t0, 1		#	i++;
	j for				# }
endf:					#
	jr  $ra				# Fim do Programa
	
