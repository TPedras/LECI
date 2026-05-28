
	.data
	.text
	.globl main
	
main:
	ori $v0, $0, 5		#
	syscall			# chama o syscall "read_int()"
	or  $t0, $0, $v0	# $t1 = $v0 = valor lido = num
				#
	srl $t1, $t0, 4		# $t1 = $t0 >> 4
	xor $t0, $t0, $t1	# $t0 = $t0 ^ $t1
				#
	srl $t1, $t0, 2		# $t1 = $t0 >> 2
	xor $t0, $t0, $t1	# $t0 = t0 ^ $t1
				#
	srl $t1, $t0, 1		# $t1 = $t0 >> 1
	xor $t0, $t0, $t1	# $t0 = $t0 ^ $t1
				#
	jr $ra			# Fim do programa