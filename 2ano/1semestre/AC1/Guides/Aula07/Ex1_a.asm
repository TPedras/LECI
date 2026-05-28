
	.eqv print_int10, 1

	.data
str:	.asciiz "Arquitetura de Computadores I"

	.text
	.globl main
	
strlen:	
	li  $t1, 0		# len = 0;
				#
while:	lb  $t0, 0($a0)		# $t0 = *s;	
	addiu $a0, $a0, 1	# s *= 1;
	beq $t0, '\0', endw	# while (*s != '\0') {
				#
	addi $t1, $t1, 1	#	len++;
				#
	j while			# }
endw:				#
	move  $v0, $t1		#
	jr  $ra			# Fim da sub-rotina.

main:
	la  $t0, str		# $t0 = str;
				#
	addiu $sp, $sp, -4	# reserva espaço na stack;
	sw  $ra, 0($sp)		#
	
	move $a0, $t0		# $a0 = $t0;
	jal strlen		#
	move $a0, $v0		# $a0 = $v0;
				#
	lw  $ra, 0($sp)		#
	addiu $sp, $sp, 4	#
	
	li  $v0, print_int10	#
	syscall			#
	jr $ra
	
	
	


	
	
	