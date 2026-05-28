
	.eqv TRUE, 1
	.eqv FALSE, 0
	.eqv SIZE, 7
	.eqv print_string, 4
	.eqv print_double, 3
	
	.data
str1:	.asciiz "Array Original: "
str2:	.asciiz ", "
str3:	.asciiz "\nMedian: "
array:	.double 1, 4, 5, 6, 2, 3, 9
	
	.text
	.globl main
	
	# Mapa de Registos(median):
	#	$a0:	array;
	#	$a1: 	nval;
	#	$t0:	i;
	#	$t1:	houveTroca;
	#	$t3:	array+i;
	#	$f0:	array[i];
	#	$f2:	array[i+1];
	#	$f4:	aux;
median:					# double median(double *array, int nval) {
					#
do:					#	do {
	li	$t1, FALSE		#		houveTroca = FALSE;
	addi	$t4, $a1, -1		#		$t4 = nval - 1;
	li	$t0, 0			#		i = 0;
					#
for1:	bge	$t0, $t4, endf1		#		for (i < $t4) {
					#
	sll	$t3, $t0, 3		#			$t3 = i << 3;
	addu	$t3, $a0, $t3		#			$t3 = array+i;
	l.d	$f0, 0($t3)		#			$f0 = array[i];
	l.d	$f2, 8($t3)		#			$f2 = array[i+1];
					#
if1:	c.le.d 	$f0, $f2		#
	bc1t	endif1			#			if (array[i] > array[i+1]) {
					#
	mov.d	$f4, $f0		#				aux = array[i];
	s.d	$f2, 0($t3)		#				array[i] = array[i+1];
	s.d	$f4, 8($t3)		#				array[i+1] = aux;
	li	$t1, TRUE		#				houveTroca = TRUE;
endif1:					#			}
					#
	addi	$t0, $t0, 1		#			i++;
	j	for1			#		}
endf1:					#
	beq	$t1, TRUE, do		#	} while (houvwTroca == TRUE);
					#
	li	$t0, 2			#
	div	$t0, $a1, $t0		#	$t0 = nval / 2;
	sll	$t0, $t0, 3		#	$t0 = $t0 << 3;
	addu	$t0, $a0, $t0		#	$t0 = array + $t0;
	l.d	$f0, 0($t0)		#	$f0 = array[nval/2]
					#
	jr	$ra			# } FIm da subrotina median;
					#
					#
					#
	# Mapa de Registos(main):
	#	$t0: 	i;
	#	$t1:	array;
	#	$f12:	median;
	#	$f0:	array[i];
main:					#
	addiu	$sp, $sp, -4		# Reservar espaço na stack;
	sw	$ra, 0($sp)		# Salvaguardar o valor de $ra;
					#
	la	$a0, str1		#
	li	$v0, print_string	#
	syscall				# print_string(str1);
					#
	li	$t0, 0			# i = 0;
	la	$t1, array
for2:	bge	$t0, SIZE, endf2	# for (i < SIZE) {
					#
	sll	$t2, $t0, 3		#	$t1 = i << 3;
	addu	$t2, $t1, $t2		#	$t2 = array + $t2;
					#
	l.d	$f12, 0($t2)		#	$f12 = array[i];
	li	$v0, print_double	#
	syscall				#	print_double();
					#
	la	$a0, str2		#
	li	$v0, print_string	#
	syscall				#	print_string(str2);
					#
	addi	$t0, $t0, 1		#	i++;
	j	for2			# }
endf2:					#
					#
	move	$a0, $t1		#
	li	$a1, SIZE		#
	jal	median			# $f0 = median
	mov.d	$f12, $f0		#
					#
	la	$a0, str3		#
	li	$v0, print_string	#
	syscall				# print_string(str3);
					#
	li	$v0, print_double	#
	syscall				# print_double($f12);
					#
	lw	$ra, 0($sp)		# Repor o valor de $ra;
	addiu	$sp, $sp, 4		# Libertar espaço na stack;
					#
	jr	$ra			# Fim do Programa;
					