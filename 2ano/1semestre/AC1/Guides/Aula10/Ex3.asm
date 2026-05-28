
	.eqv SIZE, 10
	.eqv read_double, 7
	.eqv print_double, 3
	
	.data
k1:	.double 0.0
k2:	.double 1.0
k3:	.double 0.5
aar:	.space 80

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
	mtc1	$a1, $f2		#
	cvt.d.w	$f2, $f2		#	$f2 = (float)n;
	div.d	$f0, $f0, $f2		#	$f0 = sum / $f2;
					#
	jr	$ra			# } Fim da subrotina average;
					#
					#
					#
	# Mapa de Registos(sqrt):
	#	$f12: 	val;
	#	$t0:	i;
	#	$f0:	xn;
	#	$f2:	aux;
sqrt:					# double aqrt(double val) {
	la	$t0, k2			#
	l.d	$f0, 0($t0)		#	xn = 1.0;
	la	$t0, k1			#
	l.d	$f4, 0($t0)		#	$f4 = 0.0;
	la	$t0, k3			#
	l.d	$f6, 0($t0)		#	$f6 = 0.5;
					#
	li	$t0, 0			#	i = 0;
if1:	c.le.d	$f12, $f4		#
	bc1t	else1			#	if (val > 0.0) {
					#
do1:					#		do {
	mov.d	$f2, $f0		#			aux = xn;
					#
	div.d	$f8, $f12, $f0		#			$f8 = val/xn;
	add.d	$f8, $f0, $f8		#			$f8 = xn + $f8;
	mul.d	$f0, $f6, $f8		#			xn = 0.5 * $f8;
					#
while1:	c.eq.d	$f2, $f0		#
	bc1t	enddo1			#		} while ((aux != xn) &&
	bge	$t0, 25, enddo1		#			(++i < 25));
	addi	$t0, $t0, 1		#			i++;
	j	do1			#
enddo1:					#
					#
	j	endif1			#	}
else1:					#	else {
	mov.d	$f0, $f4		#		xn = 0.0;
endif1:					#	}
	jr	$ra			# } Fim da sub-rotina sqrt;
					#
					#
					#
	
	# Mapa de Registos(abs):
	#	$a0:	val;
abs:					# int abs(int val) {
	bge	$a0, 0, endif3		#	if (val < 0) {
					#
	li	$t0, -1			#
	mul	$a0, $a0, $t0		#		val = va*(-1);
endif3:					#	}
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
for3:	bge	$s1, $v0, endf3		#	for (i < abs(y)) {
					#
if4:	ble	$s0, 0, else4		#		if (y > 0) {
					#
	mul.s	$f22, $f22, $f20	#			result *= x;
					#
	j	endif4			#		}
else4:					#		else {
					#
	div.s	$f22, $f22, $f20	#			result /= x;
endif4:					# 		}
					#
	addi	$s1, $s1, 1		#		i++;
	j	for3			#	}
endf3:					#
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
	# Mapa de Registos(var):
	#	$a0->$s0:	array;
	#	$a1->$s1:	nval;
	#	$s2:	i;
	#	$f20:	media;
	#	$f22:	soma;
var:					# double var(double *array, int nval) {
	addiu	$sp, $sp, -28		#	Reservar espaço na stack;
	sw	$ra, 0($sp)		#	Salvaguardar o valor de $ra;
	sw	$s0, 4($sp)		#	Salvaguardar o valor de $s0;
	sw	$s1, 8($sp)		#	Salvaguardar o valor de $s1;
	sw	$s2, 12($sp)		#	Salvaguardar o valor de $s2;
	s.s	$f20, 16($sp)		#	Salvaguardar o valor de $f20;
	s.s	$f22, 24($sp)		#	Salvaguardar o valor de $f22;
					#
	move	$s0, $a0		#	$s0 = array;
	move	$s1, $a1		#	$s1 = nval;
					#
	jal	average			#	$f0 = average(array, nval);
	cvt.s.d	$f20, $f0		#	media = (float) $f0;
					#
	li	$s2, 0			#	i = 0;
	la	$t0, k1			#
	l.s	$f22, 0($t0)		#	sum = 0.0;
					#
for4:	bge	$s2, $s1, endf4		#	for (i < nval) {
					#
	sll	$t0, $s2, 3		#		$t0 = i << 3;
	addu	$t0, $s0, $t0		#		$t0 = array + $s0;
	l.d	$f0, 0($t0)		#		$f0 = array[i];
	cvt.s.d	$f0, $f0		#		$f0 = (float) array[i];
					#
	sub.d	$f0, $f0, $f20		#		$f0 = array[i] - media;
					#
	mov.d	$f12, $f0		#
	li	$a0, 2			#
	jal	xtoy			#		$f0 = xtoy($f0, 2);
	add.s	$f22, $f22, $f0		#		sum += $f0;
					#
	addi	$s2, $s2, 1		#		i++
	j	for4			#	}
endf4:					#
	cvt.d.s	$f22, $f22		#	$f22 = (double) sum;
	mtc1	$s1, $f0		#	$f0 = (double) nval;
	div.d	$f0, $f22, $f0		#	$f0 = $f22 / $f0;
					#
	lw	$ra, 0($sp)		#	Repor o valor de $ra;
	lw	$s0, 4($sp)		#	Repor o valor de $s0;
	lw	$s1, 8($sp)		#	Repor o valor de $s1;
	lw	$s2, 12($sp)		#	Repor o valor de $s2;
	l.s	$f20, 16($sp)		#	Repor o valor de $f20;
	l.s	$f22, 24($sp)		#	Repor o valor de $f22;
	addiu	$sp, $sp, 28		#	Liberta espaço na stack;
					#
	jr	$ra			# } FIm da sub-rotina var;
					#
					#
					#
	# Mapa de Registos(stdev):
	#	$a0:	array;
	#	$a1:	nval;
	#	$f12:	var(array, nval);
	#	$f0:	sqrt($f12);
stdev:					# double stdev(double *array, int nval) {
	addiu	$sp, $sp, -4		#	Reservar espaço na stack;
	sw	$ra, 0($sp)		#	Salvaguardar o valor $ra;
					#
	jal	var			#	$f0 = var;
	mov.d	$f12, $f0		#	$f12 = $f0;
					#
	jal 	sqrt			#	$f0 = sqrt($f12);
					#
	lw	$ra, 0($sp)		#	Repor o valor $ra;
	addiu	$sp, $sp, 4		#	Libertar espaço na stack;
					#
	jr	$ra			# } Fim da sub-rotina stdev;
					#
					#
					#
	# Mapa de Registos(main):
	#	$s0:	array:
	#	$s1:	SIZE;
	#	$t0:	i;
	#	$t1:	array+1;
	#	$f0:	array[i];
main:					#
	addiu	$sp, $sp, -8		# Reservar espaço na satck;
	sw	$ra, 0($sp)		# Salvaguardar o valor de $ra;
	sw	$s0, 4($sp)		# Salvaguardar o valor de $s0;
	sw	$s1, 8($sp)		# Salvaguardar o valor de $s1;
					#
	la	$s0, aar		# $s0 = aar;
	li	$s1, SIZE		# $s1 = 10;
	li	$t0, 0			# i = 0;
					#
for5:	bge	$t0, $s1, endf5		# for (i < SIZE) {
					#
	sll	$t1, $t0, 3		#	$t1 = i << 3;
	addu	$t1, $s0, $t1		#	$t1 = array+i;
					#
	li	$v0, read_double	#
	syscall				#	$f0 = read_double();
	s.d	$f0, 0($t1)		#	aar[i] = $f0;
					#
	addi	$t0, $t0, 1		#	i++;
	j	for5			# }
endf5:					#
					#
	move	$a0, $s0		#
	move	$a1, $s1		#
	jal	average			# $f0 = average(aar, SIZE);
	mov.d	$f12, $f0		#
					#
	li	$v0, print_double	#
	syscall				# print_float($f0)
					#
	move	$a0, $s0		#
	move	$a1, $s1		#
	jal	var			# $f0 = average(aar, SIZE);
	mov.d	$f12, $f0		#
					#
	li	$v0, print_double	#
	syscall				# print_float($f0)
					#
	move	$a0, $s0		#
	move	$a1, $s1		#
	jal	stdev			# $f0 = average(aar, SIZE);
	mov.d	$f12, $f0		#
					#
	li	$v0, print_double	#
	syscall				# print_float($f0)
					#
	lw	$ra, 0($sp)		# Salvaguardar o valor de $ra;
	lw	$s0, 4($sp)		# Salvaguardar o valor de $s0;
	lw	$s1, 8($sp)		# Salvaguardar o valor de $s1;
	addiu	$sp, $sp, 8		# Reservar espaço na satck;
					#
	jr	$ra			# Fim do Programa
					
	
	
	
	
	
	
	
	
	
	