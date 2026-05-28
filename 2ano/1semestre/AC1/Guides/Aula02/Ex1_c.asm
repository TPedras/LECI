
	.data
	.text
	.globl main

main:
	ori $t0, $0, 0xe543	# $t0 = x
	nor $t1, $0, $t0	# $t1 =  ~( $t0 | $0)
				#
	jr  $ra			# Fim Programa 