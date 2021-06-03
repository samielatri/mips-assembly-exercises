.data

.text

	#prologue 
	addiu $29, $29, -36
	
	#scanf("%s",ch1)
	or $4, $29, $0
	ori $5, $0, 16
	ori $2, $0, 8
	syscall 
	
	#scanf("%s",ch2)
	addiu $4, $4, 16
	ori $5, $0, 16
	ori $2, $0, 8
	syscall 
	
	#printf("%s", ch1)
	ori $4, $29, 0
	ori $2, $0, 4
	syscall 
	
	#min_to_maj_chaine(ch1)
	jal min_to_maj_chaine
	
	#printf("%s", ch1)
	ori $2, $0, 4
	syscall 
	
	#printf("%s", ch2)
	addiu $4, $4, 16
	ori $2, $0, 4
	syscall 
	
	#min_to_maj_chaine(ch2)
	jal min_to_maj_chaine
	
	#printf("%s", ch2)
	ori $2, $0, 4
	syscall 
	
	#epilogue
	addiu $29, $29, 36
	
	#exit 
	ori $2, $0, 10
	syscall
	
min_to_maj_chaine:

	#prologue 
	addiu $29, $29, -12
	sw $31, 8($29)
	sw $16, 4($29)
	
	xor $8, $8, $8 		# i=0

bwhile:
	#ch[i]!='\0'
 	addu $10, $4, $8
	lb $13, 0($10)
	beq $13, $0, end_while
	
	#ch[i] >='a'
	ori $11, $0, 0x61
	slt $12, $13, $11 
	bne $12, $0, suite
	
	#ch[i]<='z'
	ori $11, $0, 0x7A
	slt $12, $11, $13
	bne $12, $0, suite
	
	#ch[i]=ch[i]-0x20
	addiu $16, $13, -0x20
	sb $16, 0($10)
	
suite : 
	addiu $8, $8, 1
	j bwhile 
	
end_while: 

	#epilogue
	lw $16, 4($29)
	lw $31, 8($29)
	addiu $29, $29, 12
	jr $31