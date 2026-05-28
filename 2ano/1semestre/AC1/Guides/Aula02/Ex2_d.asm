
	.data
	.text
	.globl main

main:
	ori $t0, $0, 10		# $t0 = bin
	sra $t1, $t0, 1		#
	xor $t2, $t0, $t1	# $t1 = $t0 ^ $t1
				#
	jr $ra			# Fim do Programa
