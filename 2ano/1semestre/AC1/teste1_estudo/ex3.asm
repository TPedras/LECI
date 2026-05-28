	.eqv SIZE, 5
	.data
array:	.word 5, 27, 3, 11, 56
	.text
	.globl main
	
	#Mapa de Registos
	#i : $t0
	#max1 : $t1 
	#max2 :  $t2
main: 
	li $t0, 0		# i = 0
	li $t1, 1		# max1 = 1
	sll $t1, $t1, 31	# max1 = 1 << 31
	move $t2, $t1		#max2 = max1
	
for:	bge $t0, SIZE, endf
	
if:	
	la $t3, array		#t3 = array
	sll $t4, $t0, 2
	addu $t3, $t4, $t3	#t3 = array[i]
	lw $t5, 0($t3)		
	ble $t5, $t1, else	#if (array[i] > max1
	move $t2, $t1		#max2 = max1
	move $t1, $t5		#max1 = array[i]
	j endelse
else:
if2:	ble $t5, $t2, endelse
	bge $t5, $t1, endelse
	move $t2, $t5

endelse: 
	addiu $t0, $t0, 1
	j for
endf: 

end:	jr $ra
