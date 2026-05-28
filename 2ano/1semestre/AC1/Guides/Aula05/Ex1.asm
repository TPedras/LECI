
	.eqv SIZE, 5
	.eqv print_string, 4
	.eqv read_int, 5
	
	.data
str1:	.asciiz "\nIntroduza um número: "
	.align 2
lista:	.space 20

	.text
	.globl main

main:
	# Mapa de registos
	# 	$t0: i
	# 	$t1: lista
	#	$t2: lista+i
					#
	li  $t0, 0			# i=0;
	la  $t1, lista			# $t1 = lista; // &lista[0];
					#
for:	bge $t0, SIZE, endf		# for (i < SIZE) {
					#
	la  $a0, str1			#
	li  $v0, print_string		#
	syscall				# 	print_string(str1);
					#
	sll $t2, $t0, 2			#	$t2 = i << 2;
	addu $t2, $t1, $t2		#	$t2 = lista+i;
					#
	li  $v0, read_int		#
	syscall				#	$v0 = read_int();
	sw $v0, 0($t2)			#	lista[i] = $v0;
					#
	addi $t0, $t0, 1		# 	i++;
	j for				# }
endf:					#
	jr $ra				# Fim do Programa