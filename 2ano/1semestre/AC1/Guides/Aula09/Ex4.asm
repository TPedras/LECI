
	.eqv print_string, 4
	.eqv read_int, 5
	.eqv print_double, 3
	.eqv read_double, 7
	
	.data
str1:	.asciiz "Numero de elementos do array: "
str2:	.asciiz "Digite um valor: "
str3:	.asciiz "Valor max do array: "
	.align 3
array:	.space 100
	
	.text
	.globl main
	
	# Mapa de Registos(mmax):
	#	$a0: 	p;
	#	$a1:	i;
	#	$t0:	u;
	#	$f0:	max;
	#	$f2:	*p;
max:					# double max(double *p, unsigned int n) {
	addi	$t0, $a1, -1		#	$t0 = n - 1;
	sll	$t0, $t0, 3		#	$t0 = $t0 << 3;
	addu	$t0, $a0, $t0		#	u = p+$t0;
					#
	l.d	$f2, 0($a0)		#	$f2 = *p;
	mov.d	$f0, $f2		#	max = $f2;
	addiu	$a0, $a0, 8		#	p+=8;
					#
for1:	bgt	$a0, $t0, endf1		#	for (p <= u) {
					#
	l.d	$f2, 0($a0)		#		$f2 = *p;
if1:	c.le.d 	$f2, $f0		#
	bc1t	endif1			#		if (*p > max) {
					#
	mov.d	$f0, $f2		#			max = *p;
					#
endif1:					#		}
					#
	addiu	$a0, $a0, 8		#		p+=8;
	j	for1			#	}
endf1:					#
	jr	$ra			# } Fim da sub-rotina max;
					#
					#
					#
	# Mapa de Registos(main):
	#	$t0: 	n;
	#	$t1:	i;
	#	$t2:	array
	#	$t3:	array+i;
main:					#
	addiu	$sp, $sp, -4		# Reserva espaço na stack;
	sw	$ra, 0($sp)		# Salvaguardar o valor de $ra;
					#
	la	$a0, str1		#
	li	$v0, print_string	#
	syscall				# print_stirng(str1);
					#
	li	$v0, read_int		#
	syscall				# $v0 = read_int()
	move	$t0, $v0		# n = $v0;
					#
	li	$t1, 0			# i = 0;
	la	$t2, array		# $t2 = array;
					#
for2:	bge	$t1, $t0, endf2		# for ( i <= n) {
					#
	sll	$t3, $t1, 3		#	$t3 = i << 3;
	addu	$t3, $t2, $t3		#	$t3 = array + $t3;
					#
	la	$a0, str2		#
	li	$v0, print_string	#
	syscall				#	 print_stirng(str2);
					#
	li	$v0, read_double	#
	syscall				#	$f0 = read_double();
	s.d	$f0, 0($t3)		#	array[i] = $f0;
					#
	addi	$t1, $t1, 1		#	i++;
	j	for2			# }
endf2:					#
					#
	move	$a0, $t2		#
	move	$a1, $t0		#
	jal	max			# $f0 = max(array, n);
	mov.d	$f12, $f0		#
					#
	li	$v0, print_double	#
	syscall				# print_double($f12);
					#
	lw	$ra, 0($sp)		# Repor o valor de $ra;
	addiu	$sp, $sp, 4		# Liberta espaço na stack;
					#
	jr	$ra			# Fim do Programa