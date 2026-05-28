
	.data
str1:	.asciiz "Introduza dois números: \n"
str2:	.asciiz "Resultado: "

	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int10, 1
	
	.text
	.globl main

main:
	# Mapa de registos
	#	res: $t0;
	#	i: $t1;
	#	mdor: $t2;
	#	mdo: $t3;
				#
	li  $t0, 0		# res = 0;
	li  $t1, 0		# i = 0;
	li  $t2, 0 		# mdor = 0;
	li  $t3, 0		# mdo = 0;
				#
	li  $v0, print_string	# $v0 = 4 (system call 'print_string()')
	la  $a0, str1		# $a0 = str1;
	syscall			# chama a syscall
				#
	li  $v0, read_int	# $v0 = 5 (system call 'read_int()')
	syscall			# chama a sycall
	move $t5, $v0		# $t5 = $v0
				#
	andi $t2, $t5, 0x0F	# mdor = $t5 & 0x0F
				#
	li  $v0, read_int	# $v0 = 5 (system call 'read_int()')
	syscall			# chama a sycall
	move $t5, $v0		# $t5 = $v0
				#
	andi $t3, $t5, 0x0F	# mdo = $t5 & 0x0F
				#
while:	beq $t2, $0, endwhile	# while (( mdor !=0 ) && (i < 4) ) {
	bge $t1, 16, endwhile	#
				#
	andi $t5, $t2, 0x00000001#	$t5 = mdor & 0x00000001
if:	beq $t5, $0, endif	# 	if ($t5 != 0) {
				#
	addu $t0, $t0, $t3	#		res = res + mod;
endif:				#	}
	sll $t3, $t3, 1		#	mod = mod << 1;
	srl $t2, $t2, 1		#	mdor = mdor >> 1;
				#
	addi $t1, $t1, 1	# 	i++;
	j while			# }
endwhile:			#
				#
	li  $v0, print_string	# $v0 = 4 (system call 'print_string()')
	la  $a0, str2		# $a0 = str2;
	syscall			# chama a syscall
				#
	li  $v0, print_int10	# $v0 = 1 (system call 'print_int10()')
	move $a0, $t0		# $a0 = res;
	syscall			# chama a syscall
				#
	jr $ra			# Fim do programa
