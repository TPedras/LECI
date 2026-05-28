
	.eqv SIZE, 3
	.eqv print_string, 4
	.eqv print_int10, 1
	.eqv print_char, 11
	
	.data
str1:	.asciiz "\nString #"
str2:	.asciiz ": "
s1:	.asciiz "Array"
s2:	.asciiz "de"
s3:	.asciiz "ponteiros"
array:	.word s1, s2, s3
	
	.text
	.globl main
main:
	# Mapa de registos
	#	$t0: i
	#	$t1: j
	#	$t2: array[i][j]
	#	$t3: array
					#
	li $t0, 0			#  i = 0;
					#
for:	bge $t0, SIZE, endf		# for (i < SIZE) {
					#
	la  $a0, str1			#
	li  $v0, print_string		#
	syscall				# 	print_string(str1);
					#
	move $a0, $t0			#
	li  $v0, print_int10		#
	syscall				#	print_int10($t0);
					#
	la  $a0, str2			#
	li  $v0, print_string		#
	syscall				#	print_string(str2);
					#
	li  $t1, 0			#	j = 0;
					#
					#
	la $t3, array			# 	$t3 = array;
	sll $t2, $t0, 2			#	$t2 = i << 2;
	addu $t3, $t2, $t3		#       $t3 = &(array[i])
	lw  $t3, 0($t3)			#	$t3 = array[i] = array[i][0];
					#
while:					#	while (array[i][j] != '\0') {
	addu $t4, $t3, $t1		#		$t4 = &(array[i][j]);
	lb  $t4, 0($t4)			# 		$t4 = array[i][j];
	beq $t4, '\0', endw		#
					#
	move $a0, $t4			#
	li  $v0, print_char		#
	syscall				# 		print_char(array[i][j]);
					#
	li  $a0, '-'			#
	li  $v0, print_char		#
	syscall				#		print_char('-');
					#
	addi $t1, $t1, 1		#		j++;
	j while				#
endw:					#	}		 	
					#
	addi $t0, $t0, 1		#	i++;
	j for				# }
endf:					#
	jr $ra				# Fim do Programa