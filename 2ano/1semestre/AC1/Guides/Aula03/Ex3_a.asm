
	.data
str1:	.asciiz "Introduza um número: "
str2:	.asciiz "\nValor em código Gray: "
str3: 	.asciiz "\nValor em Binário: "
	
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_int16, 34
	
	.text
	.globl main
main:
	# Mapa de registos:
	#	gray: $t0;
	#	bin: $t1;
	#	mask: $t2;
				#
	li  $t0, 0		# gray = 0;
	li  $t1, 0		# bit = 0;
	li  $t2, 0		# mask = 0;
				#
	li  $v0, print_string	# $v0 = 4 (system call print_string()) 
	la  $a0, str1		# $a0 = str1
	syscall			# chama a syscall
				#
	li  $v0, read_int	# $v0 = 5(system call read_int())
	syscall			# chama a syscall
	move $t0, $v0		# gray = $v0;
				#
	srl $t2, $t0, 1		# mask = gray >> 1;
	move $t1, $t0		# bin = gray;
				#
while:	beq $2, $0, endwhile	# while (mask != 0) {
				#
	xor $t1, $t1, $t2	# 	bin = bin1 ^ mask;
	srl $t2, $t2, 1		#	mask = mask >> 1;
endwhile:			# }
				#
	li  $v0, print_string	# $v0 = 4 (system call print_int())
	la  $a0, str2		# $a0 = str2;
	syscall			# chama a syscall
				#
	li  $v0, print_int16	# $v0 = 34; (system call print_int16())
	move  $a0, $t0		# $a0 = gray;
	syscall			# chama a syscall
				#
	li  $v0, print_string	# $v0 = 4 (system call print_int())
	la  $a0, str3		# $a0 = str3;
	syscall			# chama a syscall
				#
	li  $v0, print_int16	# $v0 = 34; (system call print_int16())
	move  $a0, $t1		# $a0 = bin;
	syscall			# chama a syscall
				#
	jr $ra			# Fim do programa
	
	