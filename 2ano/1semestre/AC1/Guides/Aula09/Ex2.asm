
	.eqv print_string, 4
	.eqv print_double, 3
	.eqv read_double, 7
	
	.data
str1:	.asciiz "Digite a temperatura em Fahrenheit: "
str2:	.asciiz "Resultado em Celsius: "
	.align 4
k1:	.double 5.0
k2:	.double 9.0
k3:	.double -32.0
	
	.text
	.globl main
	
	#Mapa de Registos(f2c):
	#	$f12:	ft;
	#	$f0:	cl;
f2c:					# double f2c(double ft) {
	la	$t0, k1			#
	l.d	$f2, 0($t0)		#	$f2 = 5.0;
	la	$t0, k2			#
	l.d	$f4, 0($t0)		#	$f4 = 9.0;
	la	$t0, k3			#
	l.d	$f6, 0($t0)		#	$f6 = -32.0;
					#
	add.d	$f0, $f12, $f6		#	$f0 = ft - 32.0;
	div.d	$f2, $f2, $f4		#	$f2 = 5.0 / 9.0;
	mul.d	$f0, $f2, $f0		#	cl = $f0 * $f2;
					#
	jr	$ra			# } Fim do Programa;
					#
					#
					#
	# Mapa de Registos(main):
	#	$f12:	ft;
	#	$f0:	cl;
main:					#
	addiu	$sp, $sp, -4		# Reservar espaço an stack;
	sw	$ra, 0($sp)		# Salvaguardar o valor de $ra;
					#
	la	$a0, str1		#
	li	$v0, print_string	#
	syscall				# print_string(str1);
					#
	li	$v0, read_double	#
	syscall				# $f0 = read_double();
	mov.d	$f12, $f0		# ft = $f0;
					#
	jal	f2c			# $f0 = f2c(ft);
					#
	la	$a0, str2		#
	li	$v0, print_string	#
	syscall				# print_string(str2);
					#
	mov.d	$f12, $f0		#
	li	$v0, print_double	#
	syscall				# print_double(cl);
					#
	lw	$ra, 0($sp)		# Repor o valor de $ra;
	addiu	$sp, $sp, 4		# Libertar espaço an stack;
					#
	jr	$ra			# Fim do Programa;
	