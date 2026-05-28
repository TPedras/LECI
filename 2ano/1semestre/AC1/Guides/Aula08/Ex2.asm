	
	.eqv MAX_STR_SIZE, 33
	.eqv print_string, 4
	.eqv read_int, 5
	
	.data
str:	.space 34
	
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
	
	
	
	# Mapa de Registos(itoa):
	#	v:	$a0 -> $v0;
toascii:			#
	move $v0, $a0		# 
	addi $v0, $v0, '0'	# v += '0';
				#
	ble $v0, '9', endf	# if (v > '9') {
				#
	addi $v0, $v0, 7	#	v += 7;
				#
endf:				# }
	jr $ra			# Fim do Programa
	
	
	
	# Mapa de Registos(itoa):
	#	n:	$a0 -> $s0;
	#	b:	$a1 -> $s1;
	#	s:	$a2 -> $s2;
	#	p	$s3;
	#	digit:	$t0
itoa:				#
	addiu $sp, $sp, -20	# Reserva espaço na stack;
	sw  $ra, 0($sp)		#
	sw  $s0, 4($sp)		#
	sw  $s1, 8($sp)		#
	sw  $s2, 12($sp)	#
	sw  $s3, 16($sp)	# Slavaguarda os registos: $ra, $v0, $v1, $v2, $v3;
				#
	move $s0, $a0		# Copia o registo n para $s0
	move $s1, $a1		# Copia o registo b para $s1
	move $s2, $a2		# Copia o registo s para $s2
	move $s3, $a2		# Copia o registo p para $s3
				#
do:				# do {
	rem $t0, $s0, $s1	#	digit = n % b;
	div $s0, $s0, $s1	#	n /= b;
				#
	move $a0, $t0		#
	jal  toascii		#       toascii(digit);
				#
	sb  $v0, 0($s3)		#	*p = toascii(digit);
	addiu $s3, $s3, 1	# 	p++;
				#
	bgt $s0, 0, do		# } while (n > 0);
				#
	li $t1, '\0'		# $t1 = '\0';
	sb $t1, 0($s3)		# *p = '\0';
				#
	move $a0, $s2		#
	jal strrev		# strrev(s);
				#
	lw  $ra, 0($sp)		# repõe os registos: $ra, $v0, $v1, $v2, $v3;
	lw  $s0, 4($sp)		#
	lw  $s1, 8($sp)		#
	lw  $s2, 12($sp)	#
	lw  $s3, 16($sp)	# 
	addiu $sp, $sp, -20	# Liberta espaço na stack;
				#
	jr  $ra			# Fim da subrotina itoa;



	# Mapa de Registos:
	#	val:	$s0;
	#	str:	$s1;
	# O main é, neste caso, uma sub-rotina intermédia
main:				#
	addiu $sp, $sp, -12	# Reserva espaço na stack
	sw  $ra, 0($sp)		# Salvagurada o valor de $ra
	sw  $s0, 4($sp)		# Salvaguarda o valor $s0;
	sw  $s1, 8($sp)		# Salvaguarda o valor $s1;
				#
	la  $s1, str		# str = &str[0];
				#
do1:				# do {
	li  $v0, read_int	#	
	syscall			#	$v0 = read_int();
	move $s0, $v0		#	val = $v0;
				#
	move $a0, $s0		#
	li $a1, 2		#
	move $a2, $s1		#
	jal itoa		# 	$v0 = itoa(val, 2, str);
				#
	move $a0, $v0		#
	li  $v0, print_string	#
	syscall			#	print_string($v0);
				#
	move $a0, $s0		#
	li $a1, 8		#
	move $a2, $s1		#
	jal itoa		# 	$v0 = itoa(val, 8, str);
				#
	move $a0, $v0		#
	li  $v0, print_string	#
	syscall			#	print_string($v0);
				#
	move $a0, $s0		#
	li $a1, 16		#
	move $a2, $s1		#
	jal itoa		# 	$v0 = itoa(val, 16, str);
				#
	move $a0, $v0		#
	li  $v0, print_string	#
	syscall			#	print_string($v0);
				#
	bne $s0, '0', do1	# } while (val != 0);
				#
	lw  $ra, 0($sp)		# repoe o valor de $ra
	lw  $s0, 4($sp)		# repoe o valor $s0;
	lw  $s1, 8($sp)		# repoe o valor $s1;
	addiu $sp, $sp, -12	# Liberta espaço na stack
				#
	jr  $ra			# Fim do Programa