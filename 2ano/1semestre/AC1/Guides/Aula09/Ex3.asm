
	.eqv SIZE, 10
	.eqv read_double, 7
	.eqv print_double, 3
	
	.data
k1:	.double 0.0
a:	.space 80

	.text
	.globl main
	
	# Mapa de Registoos(average):
	#	$a0:	*array;
	#	$a1:	n;
	#	$t0: 	i;
	#	$t1:	array+i;
	#	$f0:	sum;
	#	$f2:	(float)n;
	#	$f4:	array[i];
average:				# double average(double *array, int n) {
	addi	$t0, $a1, -1		#	i = n-1;
	la	$t1, k1			#
	l.d	$f0, 0($t1)		#	sum = 0.0;
					#
for1:	blt	$t0, 0, endf1		#	for (i >= 0) {
					#
	sll	$t1, $t0, 3		#		$t1 = i << 3;
	addu	$t1, $a0, $t1		#		$t1 = array + (i << 3);
					#
	l.d	$f4, 0($t1)		#		$f4 = array[i];
					#
	add.d	$f0, $f0, $f4		#		sum += $f4;
					#
	addi	$t0, $t0, -1		#		i--;
	j	for1			#	}
endf1:					#
	mtc1 	$a1, $f2		#
	cvt.d.w	$f2, $f2		#	$f2 = (float)n;
	div.d	$f0, $f0, $f2		#	$f0 = sum / $f2;
					#
	jr	$ra			# } Fim da subrotina average;
					#
					#
					#
	# Mapa de Registos(main):
	#	$t0:	i;
	#	$t1:	a;
	#	$t2:	a+i;
	#	$f0:	a[i];
main:					#
	addiu	$sp, $sp, -4		# Reservar espaço na stack;
	sw	$ra, 0($sp)		# Salvaguarda o valor de $ra;
					#
	li	$t0, 0			# i = 0;
	la	$t1, a			# $t1 = &a[0];
					#
for2:	bge	$t0, SIZE, endf2	# for (i < SIZE) {
					#
	sll	$t2, $t0, 3		#	$t3 = i << 3;
	addu	$t2, $t1, $t2		#	$t3 = a + (i << 3);
					#
	li	$v0, read_double	#
	syscall				#	$f0 = read_double();
	s.d	$f0, 0($t2)		#	a[i] = $f0
					#
	addi	$t0, $t0, 1		#	i++;
	j	for2			# }
endf2:					#
	move	$a0, $t1		#
	li	$a1, SIZE		#
	jal 	average			# $f0 = average(a, SIZE);
	mov.d	$f12, $f0		#
					#
	li	$v0, print_double	#
	syscall				# print_double($f0);
					#
	lw	$ra, 0($sp)		# Repor o valor de $ra;
	addiu	$sp, $sp, 4		# Libertar espaço na stack;
					#
	jr	$ra			# Fim do Programa;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	