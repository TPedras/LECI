	# Mapa de registos:
	#	$t0: p
	#	$t1: pultimo
	#	$t2: *p
	#	$t3: soma
	
	.eqv size, 4			# define size 4;
	.eqv print_int10, 1		
	
	.data
array:	.word 7692, 23, 5, 234

	.text
	.globl main
	
main:
	li  $t3, 0			# soma = 0;
	la  $t0, array			# p = &array[0]
					#
	li  $t4, size			# $t4 = size;
	addi $t4, $t4, -1		# $t4 = $t4 - 1;
	sll  $t4, $t4, 2		# $t4 = $t4 << 2;
					#
	addu $t1, $t0, $t4		# pultimo = &array[size-1];
					#
while:	bgt $t0, $t1, endw		# while (p <= pultimo) {
					#
	lw  $t2, 0($t0)			#
	add $t3, $t3, $t2		#	soma = soma + (*p);
					#
	addiu $t0, $t0, 4		#	p++;
	j while				# }
endw:					#
	move $a0, $t3			#
	li  $v0, print_int10		#
	syscall				# print_int10(soma);
					#
	jr $ra				# Fim do Programa