
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv read_float, 6
	.eqv print_float, 2

	.data
k1:	.float 1.0
str1:	.asciiz "Digite o valor de x: "
str2:	.asciiz "Digite o valor de y: "
str3:	.asciiz "\nResultado: "

	.text
	.globl main
	
	# Mapa de Registos(abs):
	#	$a0:	val;
abs:					# int abs(int val) {
	bge	$a0, 0, endif1		#	if (val < 0) {
					#
	li	$t0, -1			#
	mul	$a0, $a0, $t0		#		val = va*(-1);
endif1:					#	}
	move	$v0, $a0		#
	jr	$ra			# } Fim da sub-rotina abs
					#
					#
					#
	# Mapa de Registos(xtoy):	#
	#	$f12 -> $f20:	x;
	#	$a0 -> $s0:	y:
	#	$s1:	i;
	#	$f22:	result;
xtoy:					# float xtoy(float x, int y) {
	addiu	$sp, $sp, -20		#	Reservar espaço na stack;
	sw	$ra, 0($sp)		# 	Salvaguardar o valor $ra;
	sw	$s0, 4($sp)		# 	Salvaguardar o valor $s0;
	sw	$s1, 8($sp)		# 	Salvaguardar o valor $s1;
	sw	$s2, 12($sp)		# 	Salvaguardar o valor $s2;
	sw	$s3, 16($sp)		# 	Salvaguardar o valor $s3;
					#
	move	$s0, $a0		#	$s0 = y;
	mov.s	$f20, $f12		#	$f20 = x;
	li	$s1, 0			#	i = 0;
	la	$t0, k1			#
	l.s	$f22, 0($t0)		#	result = 1.0;
					#
	move	$a0, $s0		#	
	jal	abs			#	$v0 = abs(y);
					#
for1:	bge	$s1, $v0, endf1		#	for (i < abs(y)) {
					#
if2:	ble	$s0, 0, else2		#		if (y > 0) {
					#
	mul.s	$f22, $f22, $f20	#			result *= x;
					#
	j	endif2			#		}
else2:					#		else {
					#
	div.s	$f22, $f22, $f20	#			result /= x;
endif2:					# 		}
					#
	addi	$s1, $s1, 1		#		i++;
	j	for1			#	}
endf1:					#
	mov.s	$f0, $f22		#
					#
	lw	$ra, 0($sp)		# 	Repor o valor $ra;
	lw	$s0, 4($sp)		# 	Repor o valor $s0;
	lw	$s1, 8($sp)		# 	Repor o valor $s1;
	lw	$s2, 12($sp)		# 	Repor o valor $s2;
	lw	$s3, 16($sp)		# 	Repor o valor $s3;
	addiu	$sp, $sp, 20		#	Libertar espaço na stack;
					#
	jr	$ra			# } Fim da sub-rotina xtoy
					#
					#
					#
	# Mapa de Registos(main):
	#	
main:					#
	addiu	$sp, $sp, -4		# Reservar espaço na stack;
	sw	$ra, 0($sp)		# Salvaguardar o valor de $ra;
					#
	la	$a0, str1		#
	li	$v0, print_string	#
	syscall				# print_string(str1);
					#
	li	$v0, read_float		#
	syscall				# $f0 = read_float();
					#
	la	$a0, str2		#
	li	$v0, print_string	#
	syscall				# print_string(str2);
					#
	li	$v0, read_int		#
	syscall				# $v0 = read_int();
					#
	mov.d	$f12, $f0		#
	move	$a0, $v0		#
	jal	xtoy			# $f0 = xtoy(x, y);
					#
	la	$a0, str3		#
	li	$v0, print_string	#
	syscall				# print_string(str3)
					#
	mov.d	$f12, $f0		#
	li	$v0, print_float	#
	syscall				# print_float(x^y);
					#
	lw	$ra, 0($sp)		# Repor o valor de $ra;
	addiu	$sp, $sp, 4		# Libertar espaço na stack;
					#
	jr	$ra			# Fim do Programa