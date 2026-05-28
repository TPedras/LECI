	.eqv SIZE, 20
	.eqv read_string,  8
	.eqv print_int10, 1
	
	.data
str:	.space 21		# static char str[SIZE+1]
	
	.text
	.globl main
main:
	#  Mapa de registos:
	#	num: $t0;
	#	p: $t1;
	#	*p: $t2;
					#
	li  $t0, 0			# num = 0;
	li  $t1, 0			# p = 0;
					#
	la  $a0, str			#
	li  $a1, SIZE			#
	li  $v0, read_string		#
	syscall				#
					#
	la  $t1, str			# p = read_string;
					#
while:					#
	lb  $t2, 0($t1)			#
	beq $t2, '\0', endw		# while (*p != '\0') {
					#
if:	blt $t2, '0', endif		# 	if ( (*p >= '0') &&
	bgt $t2, '9', endif		#	     (*p <= '9') {
	
	addi $t0, $t0, 1		#		num++;
endif:					#  	}
					#
	addiu $t1, $t1, 1		#	p++;
	j while				# }
endw:					#
	move $a0, $t0			#
	li  $v0, print_int10		#
	syscall				# print_int10(num)
					#
	jr  $ra				# Fim do Programa