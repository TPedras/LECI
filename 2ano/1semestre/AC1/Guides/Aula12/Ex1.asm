# Tabela de Alinhamento:
#
# Align	| SIZE	| Offset
#  4	|  4	|   0
#  1	|  18	|   4
#  1	|  15 	|   22
#  4	|  4	|   37->40
#-------|-------|---------
#  4 	|  44	|--------

	.eqv MAX_STUDENTS, 4
	.eqv print_string, 4
	.eqv print_float, 2
	.eqv read_string, 8
	.eqv read_int, 5
	.eqv read_float, 6
	.eqv print_intu10, 36
	
	.data
str1:	.asciiz "N. Mec: "
str2:	.asciiz "Primeiro Nome: "
str3:	.asciiz "Ultimo Nome: "
str4:	.asciiz "Nota: "

	.align 2
std:	.space 176

k1:	.float -20.0
k2:	.float 0.0

media:	.float 0.0

str5:	.asciiz "\nMedia: "

	.text
	.globl main
	
	# Mapa de Registos(read_data):
	#	$a0:	st;
	#	$a1:	ns;
	#	$t0:	i;
	#	$t1:	st[i];
read_data:				# void read_data(student *st, int ns) {
	li	$t0, 0			#	i = 0;
	move	$t3, $a0
	move	$t2, $a1
					#
for1:	bge	$t0, $t2, endf1		#	for (i < ns) {
					#
	mul	$t1, $t0, 44		#		$t1 = i * 44;
	addu	$t1, $t3, $t1		#		$t1 = st+i;
					#
	la	$a0, str1		#
	li	$v0, print_string	#
	syscall				# 		print_string(str1);
					#
	li	$v0, read_int		#
	syscall				#		$v0 = read_int();
	sw	$v0, 0($t1)		#		st[i].id_number = $v0;
					#
	la	$a0, str2		#
	li	$v0, print_string	#
	syscall				#		print_string(str2);
					#
	li	$v0, read_string	#
	addiu	$a0, $t1, 4		#		$a0 = $t1+4;
	li	$a1, 17			#		$a1 = 18;
	syscall				#		read_string(st[i].first_name);
					#
	la	$a0, str3		#
	li	$v0, print_string	#
	syscall				#		print_string(str3);
					#
	li	$v0, read_string	#
	addiu	$a0, $t1, 22		#		$a0 = $t1 + 22;
	li	$a1, 14			#		$a1 = 15;
	syscall				#		read_string(st[i].last_name);
					#
	la	$a0, str4		#		
	li	$v0, print_string	#	
	syscall				#		print_string(str4);
					#
	li	$v0, read_float		#
	syscall				#		$f0 = read_float();
	s.s	$f0, 40($t1)		#		st[i].grade = $f0;
					#
	addi	$t0, $t0, 1		#		i++;
	j	for1			#	}
endf1:					#
	jr	$ra			# } Fim do Programa;
					#
					#
					#
	# Mapa de Registos(max):
	#	$a0:	st;
	#	$a1:	ns;
	#	$a2:	media;
	#	$t0: 	p;
	#	$t1:	st+ns;
	#	$v0:	pmax;
	#	$f0:	sum;
	#	$f2:	max_grade;
	#	$f4:	p->grade
max:					# student *max(student *st, int ns, float *media) {
	la	$t0, k1			#
	l.s	$f2, 0($t0)		#	max_grade = k1;
	la	$t0, k2			#
	l.s	$f0, 0($t0)		#	sum = k2;
					#
	move	$t0, $a0		#	p = st;
					#
	mul	$t1, $a1, 44		#
	addu	$t1, $a0, $t1		#	$t1 = st + ns;
					#
for2:	bge	$t0, $t1, endf2		#	for (p < st+ns) {
					#
	l.s	$f4, 40($t0)		#		$f4 = p->grade;
	add.s	$f0, $f0, $f4		#		sum += $f4;
					#
if1:	c.le.s	$f4, $f2		#		if ($f4 > max_grade) {
	bc1t	endif1
					#
	mov.s	$f2, $f4		#			max_grade = $f4;
	move	$v0, $t0		#			pmax = p;
endif1:					#		}
					#
	addiu	$t0, $t0, 44		#		p+=44;
	j	for2			#	}
endf2:					#
	mtc1	$a1, $f2		#
	cvt.s.w	$f2, $f2		#	$f0 = (float) ns;
					#
	div.s	$f0, $f0, $f2		#	media = sum / (float)ns;
	s.s	$f0, 0($a2)		#	*media = media;
					#
	jr	$ra			# } Fim do Programa;
					#
					#
					#
	# Mapa de Registos(print_student):
	#	$a0: 	st;
print_student:				# void print_student(student *p) {
	move	$t0, $a0
					#
	lw	$t1, 0($t0)		#	$t0 = p->id_number;
					#
	move	$a0, $t1		#
	li	$v0, print_intu10	#
	syscall				#	print_intu($t1);
					#
	addiu	$a0, $t0, 4		#
	li	$v0, print_string	#
	syscall				# 	print_string(p->first_name);
					#
	addiu	$a0, $t0, 22		#
	li	$v0, print_string	#
	syscall				#	print_string(p->last_name);
					#
	l.s	$f12, 40($t0)		#
	li	$v0, print_float	#
	syscall				#	print_float(p->grade);
					#
	jr	$ra			# } Fim da subrotina print_student;
					#
					#
					#
	# Mapa de Registos(main):
	#	$s0:	st_array;
main:					#
	addiu	$sp, $sp, -8		# Reservar espaço na stack;
	sw	$ra, 0($sp)		# Salvaguardar o valor de $ra;
	sw	$s0, 4($sp)		# Salvaguardar o valor de $s0;
					#
	la	$s0, std		# st_array = std;
					#
	move	$a0, $s0		#
	li	$a1, MAX_STUDENTS	#
	jal	read_data		# read_data(st_array, MAX_STUDENT);
					#
	move	$a0, $s0		#
	li	$a1, MAX_STUDENTS	#
	la	$a2, media		#
	jal	max			# $v0 = max(st_array, MAX_STUDENT, media);
	move	$t0, $v0		# pmax = $v0;
					#
	la	$a0, str5		#
	li	$v0, print_string	#
	syscall				# print_strig(str1);
					#
	la	$t3, media
	l.s	$f12, 0($t3)		#
	li	$v0, print_float	#
	syscall				# print_flaot($f12)
					#
	move	$a0, $t0		#
	jal	print_student		#
					#		
	lw	$ra, 0($sp)		# Repor o valor de $ra;
	lw	$s0, 4($sp)		# Repor o valor de $s0;
	addiu	$sp, $sp, 8		# Libertar espaço na stack;
					#
	jr	$ra			# Fim do Programa



















	
