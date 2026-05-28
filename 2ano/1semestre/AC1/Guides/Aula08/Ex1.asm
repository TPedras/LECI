
	.eqv print_int10, 1
	
	.data
str:	.asciiz "2020 e 2024 sao anos bissextos"

	.text
	.globl main

	# Mapa de registos
	# 	res:	$v0
	# 	s:	$a0
	# 	*s: 	$t0
	# 	digit: 	$t1
	# Sub-rotina terminal: não devem ser usados registos $sx
atoi:	
	li  $v0, 0		# res = 0;
	li  $t1, 0		# digit = 0;
				#
while:	lb  $t0, 0($a0)		#
	blt $t0, '0', endw	# while ( (*s >= '0') &&
	bgt $t0, '9', endw	# 	(*s <= '9')) {
				#
	li  $t2, '0'		#
	sub $t1, $t0, $t2	#	digit = *s - '0';
	addiu $a0, $a0, 1	#	s++;
				#
	mul $v0, $v0, 10	#	res = res * 10;
	add $v0, $v0, $t1	#	res += digit;
				#
	j while			# }
endw:				#
	jr  $ra			# FIm da sub-rotina atoi  
				
				
	# Mapa de registos:
	#	$t0:	str;
main:				#
	addiu $sp, $sp, -4	#
	sw  $ra, 0($sp)		#
				#
	la  $t0, str		# str = &str[0];
				#
	move $a0, $t0		# 
	jal atoi		# 
	move $a0, $v0		#
				#
	li  $v0, print_int10	#
	syscall			#
				#
	lw  $ra, 0($sp)		#
	addiu $sp, $sp, 4	#
				#
	jr  $ra			# FIm do Programa