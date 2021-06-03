.data
ch: .asciiz "1 exemple d'exemple\n"

.text 
	#prologue 
	addiu $29, $29, -4
	
	xor $8, $8, $8 # i=0
	
	lui $9, 0x1001 # $9 <- @ch
	
	#printf("%s",ch)
	ori $4, $9, 0
	ori $2, $0, 4
	syscall
	
bwhile:
	#ch[i]!='\0'
 	addu $10, $9, $8
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
	addiu $13, $13, -0x20
	sb $13, 0($10)
	
suite : 
	addiu $8, $8, 1 #i++
	j bwhile 
	
end_while: 
	
	#printf("%s",ch)
	ori $4, $9, 0
	ori $2, $0, 4
	syscall
	
	#epilogue
	addiu $29, $29, 4

	#exit
	ori $2, $0, 10
	syscall