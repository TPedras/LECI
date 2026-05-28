
	.data
str1:	.asciiz "Introduza um número: "
str2: 	.asciiz "\nO valor em binário é: "

	.eqv print_string, 4
	.eqv print_char, 11
	.eqv read_int, 5
	
	.text
	.globl main

main:
	# $t0 = value; $t1 = bit; $t2 = i
	li  $t0, 0		# $t0 = value = 0
	li  $t1, 0		# $t1 = bit = 0
	li  $t2, 0		# $t2 = i = 0
				#
	la  $a0, str1		#
	li  $v0, print_string	#
	syscall			# chama a syscall "print_string"
				#
	li  $v0, read_int	#
	syscall			# chama a syscall "read_int"
	or  $t0, $0, $v0	# value = $v0
				#
	la  $a0, str2		#
	li  $v0, print_string	#
	syscall 		# chama a syscall "print_string"
				#
for:	bge $t2, 32, endfor	# for (i<32) {
				#
	li  $t3, 0x80000000	# 	$t3 = 0x80000000
	and $t1, $t0, $t3	# 	$t1 = $t0 $ $t3
				#
	bne $t1, $0, else	# 	if ($t1 == $0 ) {
				#
	ori $a0, $0, 0x30	#		
	li  $v0, print_char	#
	syscall			#		chama a syscall "print_char"
	j endif			#	}
else: 				#	else {
	ori $a0, $0, 0x31	#
	li  $v0, print_char	#
	syscall			#		chama a syscall "print_char"
endif:				#	}
	sll $t0, $t0, 1		#	$t0 = $t0 << 1
	addi $t2, $t2, 1	#	i++
	j for			#
				#
endfor:				# }
	jr  $ra			# Fim do programa
