
	.eqv SIZE, 10
	.eqv print_string, 4
	.eqv print_int10, 1
	
	.data
str1:	.asciiz "\nConteúdo do array:\n"
str2:	.asciiz "; "
lista:	.word 8, -4, 3, 5, 124, -15, 87, 9, 27, 15

	.text
	.globl main

main:
	# Mapa de Registos:
	#	$t0: p;
	#	$t1: *p;
	#	$t2: p+SIZE;
					#
	la  $t0, lista			# $t0 = lista; //&lista[0]
					#
	li  $t2, SIZE			# $t2 = SIZE;
	sll $t2, $t2, 2			# $t2 = $t2 << 2;
	addu $t2, $t0, $t2		# $t2 = p+SIZE;
					#
	la  $a0, str1			#
	li  $v0, print_string		#
	syscall				# print_string(str1);
					#
for:	bge $t0, $t2, endf		# for (p < p+SIZE) {
					#
	lw $t1, 0($t0)     		#	*p = lista[i];
					#
	move $a0, $t1			#
	li  $v0, print_int10		#
	syscall				#	print_int10($t1);
					#
	la  $a0, str2			#
	li  $v0, print_string		#
	syscall				#	print_string(str2);
					#
	addiu $t0, $t0, 4		#	p+=4;
	j for				# }
endf:					#
	jr $ra				# Fim do programa