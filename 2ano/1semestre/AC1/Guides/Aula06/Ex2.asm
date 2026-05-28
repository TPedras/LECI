
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_char, 11
	
	.data
str1:	.asciiz "Array"
str2: 	.asciiz "de"
str3:	.asciiz "ponteiros"
array:	.word str1, str2, str3

	.text
	.globl main
main:
	# Mapa de registos:
	#	$t1: p
	#	$t2: pultimo
					#
	la  $t1, array			# p = &(array[0]);
	li  $t0, SIZE			# $t0 = SIZE;
	sll $t0, $t0, 2			# $t0 = $t0 << 2;
	addu $t2, $t1, $t0		# pultimo = array + SIZE;
					#
for:	bge $t1, $t2, endf		# for (p < pultimo) {
					#
	lw $t3, 0($t1)			# 	$t3 = *p;
					#
	move $a0, $t3			#
	li  $v0, print_string		#
	syscall				#	print_string(*p);
					#
	li  $a0, '\n'			#
	li  $v0, print_char		#
	syscall				#	print_char('\n');
					#
	addiu $t1, $t1, 4		# 	p+=4;
	j for				# }
endf:					#
	jr  $ra				# Fim do Programa