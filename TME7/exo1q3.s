.data
ch: .asciiz "l exemple d'exemple\n"

.text
	#prologue 
	addiu $29, $29, -8
	
	xor $9, $9, $9 # i =0
	
	#printf("%s",ch)
	lui $4, 0x1001 # $8 <- @ch
	ori $2, $0, 4
	syscall
	
	ori $8, $4, 0
	
bwhile: 
	
	#ch[i]!='\0'
 	addu $10, $8, $9
	lb $4, 0($10)
	beq $4, $0, end_while
	
	jal min_to_maj_char
	sb $2, 0($10)
	
	addiu $9, $9, 1
	j bwhile

end_while:
	#printf("%s",ch)
	ori $4, $8, 0
	ori $2, $0, 4
	syscall
	
	#exit 
	ori $2, $0, 10
	syscall
	
min_to_maj_char:

	#prologue 
	addiu $29, $29, -4
	sw $31, 0($29)
	
	#c >='a'
	ori $11, $0, 0x61
	slt $12, $4, $11 
	bne $12, $0, else
	
	#c<='z'
	ori $11, $0, 0x7A
	slt $12, $11, $4
	bne $12, $0, else
	
	#c-0x20
	addiu $2, $4, -0x20
	j suite
	
else:
	ori $2, $4, 0
	
suite:
	#epilogue
	lw $31, 0($29)
	addiu $29, $29, 4
	jr $31