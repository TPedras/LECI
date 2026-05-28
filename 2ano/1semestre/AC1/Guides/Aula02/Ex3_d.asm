
	.data
str1:	.asciiz "Introduza 2 numeros: "
str2:	.asciiz "A soma dos dois numeros é: "
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	
	.text
	.globl main
	
main:
	la  $a0, str1		#
	li  $v0, print_string	#
	syscall			# chama a syscall "print_string()"
				#
	li  $v0, read_int	#
	syscall 		# chama a syscall "read_int()"
	or  $t0, $0, $v0 	# $t0 = $v0 = x
				#
	li $v0, read_int	#
	syscall			# chama a syscall "read_int()"
	or  $t1, $0, $v0	# $t1 = $v0 = y
				#
	add $t0, $t0, $t1	# $t0 = $t0 + $t1 = x + y
				#
	or  $a0, $0, $t0	# $a0 = $t0
	li  $v0, print_int10    # 
	syscall			# chama a syscall "print_int10"
	
	jr  $ra
	