
	.data
str1:	.asciiz "Introduza um número: "
str2:	.asciiz "Valor ignorado!"
str3:	.asciiz "A soma dos positivos é: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1

	.text
	.globl main
	
main:
	# soma = $t0; i = $t1; value = $t2
				#
	li  $t2, 0		# value = 0
	li  $t1, 0		# i = 0
	li  $t0, 0		# soma = 0
				#
for:	bge $t1, 5, endfor	# while (i < 5) {
				#
	la  $a0, str1		# 
	li  $v0, print_string	#
	syscall			# 	chama a syscall "print_string"
				#
	li  $v0, read_int	#
	syscall			# 	chama a syscall "read_int"
	or  $t2, $0, $v0	#	 value = $v0
				#
	ble $t2, $0, else	# 	if (value <= 0) {
	add $t0, $t0, $t2	# 		soma += value
	j endif			# 	} else {
else:				#
	la $a0, str2		#
	li $v0, print_string	#
	syscall			#  		chama a syscall "print_string"
endif:				# 	}
				#
	addi $t1, $t1, 1	# 	i++
	j for			# }
endfor:				#
				#
	la $a0, str3		#
	li $v0, 4		#
	syscall			# chama a syscall "print_string"
				#
	or $a0, $0, $t0		# $a0 = soma
	li $v0, print_int10	#
	syscall			# chama syscall "print_int"
				#
	jr  $ra			# Fim do Programa
