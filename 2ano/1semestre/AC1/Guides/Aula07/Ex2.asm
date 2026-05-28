
	.eqv print_string, 4
	.data
str: 	.asciiz "ITED - orievA ed edadisrevinU"
		
	.text
	.globl main
	
exchange: 			# void exchange(char *c1, char *c2) {
	lb $t0, 0($a0)		# 	$t0 = *c1;
	lb $t1, 0($a1)		#	$t1 = *c2;
				#
	sb $t1, 0($a0)		#	*c1 = $t1;
	sb $t0, 0($a1)		#	*c2 = $t0;
				#
	jr  $ra			# } Fim da sub-rootina;



strrev:				# char *strrev(char *str) {
	addiu $sp, $sp, -16	# 	reserva espaço na stack;
	sw  $ra, 0($sp)		# 	guarda o endereço de retorno;
	sw  $s0, 4($sp)		# 	guarda o valor dos registos:
	sw  $s1, 8($sp)		#		$ra, $s0, $s1, $s2;
	sw  $s2, 12($sp)	#
	move $s0, $a0		# 	$s0 = str;
	move $s1, $a0		# 	p1 = str;
	move $s2, $a0		# 	p2 = str;
				#
while:	lb  $t0, 0($s2)		# 	$t0 = *str;
	beq $t0, '\0', endw	# 	while (*str != '\0') {
				#
	addiu $s2, $s2, 1	#		p2++;
				#
	j while			#
endw:				# 	}
	addi $s2, $s2, -1	# 	p2--;
				#
while2:	bge $s1, $s2, endw2	# 	while (p1 < p2) {
				#
	move $a0, $s1		#		$a0 = p1;
	move $a1, $s2		#		$a1 = p2;
	jal exchange		#		exchange(p1, p2);
	addiu $s1, $s1, 1	#		p1++;
	addiu $s2, $s2, -1	#		p2--;
				#
	j while2		# 	}
endw2:				#
				#
	move $v0, $s0		# 	return str;
	lw  $ra, 0($sp)		# 	repõe o endereço de retorno;
	lw  $s0, 4($sp)		# 	repõe o valor dos registos:
	lw  $s1, 8($sp)		#		$ra, $s0, $s1, $s2;
	lw  $s2, 12($sp)	#
	addiu $sp, $sp, 16	# 	liberta espaço na stack;
				#
	jr $ra			# } fim da subrotina;
	
	
main:				#
	la  $t0, str		#
				#
	addiu $sp, $sp, -4	#
	sw  $ra, 0($sp)		# 
				#
	move $a0, $t0		#
	jal strrev		#
	move $a0, $v0		#
				#
	lw  $ra, 0($sp)		#
	addiu $sp, $sp, 4	#
				#
	li  $v0, print_string	#
	syscall			#
				#
	jr  $ra			# Fim do programa
	   