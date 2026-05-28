
	.eqv STR_MAX_SIZE, 30
	.eqv print_string, 4
	.eqv print_int, 1
	.data
str1:	.asciiz "I serodatupmoC ed arutetiuqrA"
str2:	.space 31
	
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
	

	
strcpy:				# char *strcpy(char *dst, char *src) {
	li  $t0, 0		# i = 0;
				#
do:				# do {
	addu $t1, $a0, $t0	#	$t1 = dst+i;
	addu $t2, $a1, $t0	#	$t2 = src+i;
				#
	lb  $t3, 0($t2)		#	$t3 = src[i];
	sb  $t3, 0($t1)		#	dst[i] = $t3;
				#
	addi $t0, $t0, i	#	i++;
	bne $t3, '\0', do	# } while (str[i] != '\0');
				#
	move $v0, $a0		#
	jr  $ra			# } fim da subrotina;
	
	
main:				#
	la  $t0, str1		# $t0 = str1;
	la  $t1, str2		# $t1 = str2;
				#
	li  $t2, 0		# exit_value = 0;
				#
	addiu $sp, $sp, -4	#
	sw  $ra, 0($sp)		#
	move $a0, $t0		#
	jal  strlen		#
	move $t3, $v0		#
	lw $ra, 0($sp)		#
	addiu $sp, $sp, 4	#
				#
if:	bgt $t3, STR_MAX_SIZE, else	# if (strlen(str1) <= STR_MAX_SIZE) {
					#
	addiu $sp, $sp, -4		#
	sw  $ra, 0($sp)			#
					#
	move $a0, $t1			#
	move $a1, $t2			#
	jal strcpy			#
	move $a0, $v0			#
					#
	lw  $ra, 0($sp)			#
	addiu $sp, $sp, 4		#
					#
	li  $v0, print_string		#
	syscall				#
					#
	j endif				# }
else:					# else {
					#
endif:					# }
	
	
	