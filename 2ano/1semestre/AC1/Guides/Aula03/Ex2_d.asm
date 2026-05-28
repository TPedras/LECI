
	.data
str1:	.asciiz "Introduza um número: "
str2:	.asciiz "\nO valor Binário é: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_char, 11
	
	.text
	.globl main
	
main:
	# value = $t0; bit = $t1; i = $t2; flag = $t3
	li  $t0, 0		# value = 0;
	li  $t1, 0		# bit = 0;
	li  $t2, 0		# i = 0;
	li  $t3, 0		# flag = 0;
				#
	la  $a0, str1		#
	li  $v0, 4		#
	syscall			# chama a syscall "print_string"
				#
	li $v0, 5		#
	syscall			# chama a syscall "read_int"
	move $t0, $v0		#
				#
	la  $a0, str2		#
	li  $v0, 4		#
	syscall			# chama a syscall "print_string"
				#
for:	bge $t2, 32, endfor	# for (i<32) {
				#
	srl $t1, $t0, 31	#	bir = value >> 31;
				#
	li $t4, 1		# 	$t4 = 1;
	beq $t3, $t4, if	#	if (flag == 1) {
	bne $t1, $0, if		#		if (bit != 0) {
				#
	j endif			#
if:				#
	li $t3, 1		#		flag = 1;
	rem $t4, $t2, 4		#		$t4 = i % 4
	bne $t4, $0, endif1	#		if ( $t4 == 0) {
				#
	li $a0, ' '		#
	li $v0, print_char	#
	syscall			#			chama a syscall "print_char"
endif1:				#		}
				#
	addi $t4, $t1, 0x30	#		$t4 = 0x30 + bit;
	or  $a0, $0, $t4	#
	li  $v0, print_char	#
	syscall			# 		chama a syscall "print_char"
endif:				#	}
	sll $t0, $t0, 1		# 	value = value << 1;
				#
	addi $t2, $t2, 1	#	i++;
	j for			# }
endfor:				#
	jr $ra			# Fim do programa

	
