.data
ch: .asciiz "l exemple d'exemple\n"

.text
	#prologue 
	addiu $29, $29, -8
	
	xor $9, $9, $9 # i = 0
	
	#printf("%s",ch)
	lui $4, 0x1001 		# $8 <- @ch
	ori $2, $0, 4
	syscall
	
	ori $8, $4, 0
bwhile: 
	
	#ch[i]!='\0'
 	addu $4, $8, $9 	# $4 <- @ch + i
	lb $14, 0($4)
	beq $14, $0, end_while	
	
	jal min_to_maj_ptr_char
	
	#i++
	addiu $9, $9, 1
	
	j bwhile

end_while:
	#printf("%s",ch)
	ori $4, $8, 0
	ori $2, $0, 4
	syscall
	
	#epilogue 
	addiu $29, $29, -8
	
	#exit
	ori $2, $0, 10
	syscall

min_to_maj_ptr_char:
	
	#prologue 
	addiu $29, $29, -4
	sw $31, 0($29)
	
	lb $10,0($4)
	
	#c >='a'
	ori $11, $0, 0x61
	slt $12, $10, $11 
	bne $12, $0, suite
	
	#c<='z'
	ori $11, $0, 0x7A
	slt $12, $11, $10
	bne $12, $0, suite
	
	#*c = *c - 0x20
	addiu $10, $10, -0x20
	sb $10, 0($4)
				
suite:
	lw $31,0($29)				
	addiu $29,$29,4				
	jr $31					
				

	