
	.data
str1:	.asciiz "Introduza um número: "
str2:  	.asciiz "\n0 valor em bínário é: "

	.eqv read_int, 5
	.eqv print_char, 11
	.eqv print_string, 4

	.text
	.globl main
	
main:
	#$t0 = value; $t1 = bit; $t2 = i
	li  $t0, 0		# value = 0;
	li  $t1, 0		# bit = 0;
	li  $t2, 0		# i = 0;
				#
	la  $a0, str1		#
	li  $v0, print_string	#
	syscall			# chama a syscall "print_string"
				#
	li  $v0, read_int	#
	syscall			# chama a syscall "read_int"
	or  $t0, $0, $v0 	# value = $v0
				#
	la  $a0, str2		#
	li  $v0, print_string	#
	syscall			# chama a syscall "print_string"
				#
for: 	bge $t2, 32, endfor	# for (i<32) {
				#
	li  $t3, 0x80000000	# 	$t3 = 0x80000000;
	and $t1, $t0, $t3	#	bit = value & $t3;
				#
	rem $t4, $t2, 4		#	%t4 = i % 4;
	bne $t4, $0, endif	#   	if ($t4 == 0) {
	ori  $a0, $0, 0x20	#
	li  $v0, print_char	#
	syscall			#		chama a syscall "print_char"
endif:				#	} 
				#
	bne $t1, $0, else	# 	if (bit == 0) {
	ori  $a0, $0, 0x30	#	
	li  $v0, print_char	#
	syscall 		#		chama a syscall "print_char"
				#
	j endif2		# 	}
else:				#	else {
	ori  $a0, $0, 0x31	#
	li  $v0, print_char	#
	syscall			#		chama a syscall "print_char"
				# 	}
endif2:				#
	sll $t0, $t0, 1		#	value = value << 1;
				#
	addi $t2, $t2, 1	# 	i++;
	j for			# }
				#
endfor:				#
	jr $ra			# Fim do prigrama

