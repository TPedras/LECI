
	.data
str1:	.asciiz "Só para chatear"
str2:	.asciiz "AC1 - P"
	.eqv print_string, 4

	.text
	.globl main
	
main:
	la  $a0, str2			# Instrução Virtual
	li  $v0, print_string		# $v0 = 4
	syscall				# Faz a chamada do syscall
	
	jr  $ra				#Fim do programa