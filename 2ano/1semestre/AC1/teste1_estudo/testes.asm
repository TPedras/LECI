#Mapa de registos
#num:	$t0
#i:	$t1
#order:	$t2

	.data
	.eqv	print_int10,1
	.eqv	print_string,4
	.eqv	read_int,5
str:	.asciiz	"No set bits\n"
	.text
	.globl	main
	
main:
	li	$t2,-1
	li	$v0,5
	syscall
	move	$t0,$v0
	li	$t1,0
	
do:
	li	$t4,1
	and	$t3,$t0,$t4
if:
	bne	$t3,1,endif
	move	$t2,$t1
endif:
	srl	$t0,$t0,1
	addi	$t1,$t1,1
while:
	blt	$t1,32,do
if2:
	beq	$t2,-1,else
	move	$a0,$t2
	li	$v0,1
	syscall
	j	endif2
else:
	la	$a0,str
	li	$v0,4
	syscall
endif2:
	jr	$ra
	