.data

.text
	#prologue
	addiu $29, $29, -24
	
	xor $9, $9, $9 		#i = 0
	
	#scanf("%s",ch)
	or $4, $29, $0	
	ori $5, $0, 16
	ori $2, $0, 8
	syscall 
	
	#printf("%s", ch)
	ori $4, $29, 0
	ori $2, $0, 4
	syscall 
	
bwhile: 
	
	#ch[i]!='\0'
 	addu $10, $29, $9
	lb $4, 0($10)
	beq $4, $0, end_while
	
	jal min_to_maj_char
	sb $2, 0($10)
	
	addiu $9, $9, 1
	j bwhile

end_while:
	#printf("%s",ch)
	ori $4, $29, 0
	ori $2, $0, 4
	syscall
	
	#epilogue
	addiu $29, $29, 24
	
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