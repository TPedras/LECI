	.eqv read_int, 5
	.eqv print_string, 4
	.eqv print_int10, 1
	.data
str:	.asciiz "No set bits\n"
	.text
	.globl main
	#Mapa de Registos
	#t0: i
	#t1: order
	#t2: num
main: 	li $t1, -1
	
	li $v0, read_int
	syscall
	move $t2, $v0	 #num = read_int();
	
	li $t0, 0	#i = 0
	
do:	li $t3, 1
	and $t4, $t2, $t3
	
	
if:	bne $t4, 1, endif	# if ((num & 1) == 1)
	move $t1, $t0		# order = i;

endif:
	srl $t2, $t2, 1		# num = num >> 1;
	addi $t0, $t0, 1	#i++
	bge $t0, 32, endwhile	
	j do
endwhile:

if2:	beq $t1, -1, else	# if (order != -1)
	move $a0, $t1		
	li $v0, print_int10
	syscall			# print_int10(order);
	
	j endif2

else:	la $a0, str		#
	li $v0, print_string	
	syscall			# print_string("No set bits"\n);

endif2:

end: jr $ra
	
