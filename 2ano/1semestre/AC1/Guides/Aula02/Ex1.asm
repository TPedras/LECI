	
	.data
	.text
	.globl main
	
main:
	ori $t0, $0, 0x5c1b	# $t0 = x
	ori $t1, $0, 0xa3e4	# $t1 = y
				#
	and $t2, $t1, $t0	# $t2 = $t1 & $t0
	or  $t3, $t1, $t0	# $t3 = $t1 | $t0
	nor $t4, $t1, $t0	# $t4 = ~($t1 | $t0)
	xor $t5, $t1, $t0	# $t5 = $t1 ^ $t2
				#
	jr $ra			# Fim do programa