	.equ READ_CORE_TIMER,11
	.equ RESET_CORE_TIMER,12
	.equ PUT_CHAR,3
	.equ PRINT_INT,6
	.data
	.text
	.globl main
main: li $t1,0 # counter=0

while: # while (1) {

	li $v0,PUT_CHAR
	li $a0,'\r'
	syscall
	li $v0,PRINT_INT
	
	move $a0,$t0
	li $a1,4
	sll $a1,$a1,16
	or $a1,$a1,10
	syscall
	
	li $v0,RESET_CORE_TIMER #
	syscall # resetCoreTimer()
	
while1:
	li $v0,READ_CORE_TIMER
	syscall
	bge $v0,20000000,endw
	#bge $v0,200000,endw
	j while1
endw:	addi $t0,$t0,1
	
	j while # }
	jr $ra #
