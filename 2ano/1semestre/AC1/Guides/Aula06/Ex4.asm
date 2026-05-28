
	.eqv print_string, 4
	.eqv print_int, 1
	
	.data
str1:	.asciiz "Nr. de parametros: "
str2:	.asciiz "\nP"
str3:	.asciiz ": "
	
	.text
	.globl main
main:
	li $t0, 0			# i = 0;
	move $t2, $a0			# $t2 = argv
					#
	move $t1, $a0			# $t1 = argc
					#
	la $a0, str1			#
	li  $v0, print_string		#
	syscall				# print_string(str1)
					#
	move $a0, $t1			#
	li  $v0, print_int		#
	syscall				# print_int10(argc)
					#
for:	bge $t0, $t1, endf		# for (i < argc) {
					#
	la $a0, str2			#
	li  $v0, print_string		#
	syscall				# 	print_string(str2)
					#
	move $a0, $t0			#
	li  $v0, print_int		#
	syscall				# 	print_int10(i)
					#
	la $a0, str3			#
	li  $v0, print_string		#
	syscall				# 	print_string(str3)
					#
	sll $t3, $t0, 2			#	i*=4;
	addu $t3, $t2, $t3		#	$t3 = &argv[i];
	lw $t3, 0($t3)			#	$t3 = argv[i]
					#
	move $a0, $t3			#
	li  $v0, print_string		#
	syscall				#	print_string($t3)
					#
					#
					#
	addi $t0, $t0, 1		#	i++;
	j for				# }
endf:					#
	jr $ra				# Fim do Programa