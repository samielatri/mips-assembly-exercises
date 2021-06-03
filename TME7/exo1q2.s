.data
ch1: .asciiz "1 exemple d'exemple\n"
ch2: .asciiz "Hello World!\n"

.text 
	addiu $29, $29, -4
	
	lui $4, 0x1001 
	
	ori $2, $0, 4
	syscall
	
	jal min_to_maj_chaine
	
	ori $2, $0, 4
	syscall
	
	ori $4, $4, 21 
	
	ori $2, $0, 4
	syscall
	
	jal min_to_maj_chaine
	
	ori $2, $0, 4
	syscall
	

	addiu $29, $29, 4

	ori $2, $0, 10
	syscall
	
	
min_to_maj_chaine:
 
	addiu $29, $29, -12
	sw $31, 8($29)
	sw $16, 4($29)
	
	xor $8, $8, $8

bwhile:
 	addu $10, $4, $8
	lb $13, 0($10)
	beq $13, $0, end_while
	
	ori $11, $0, 0x61
	slt $12, $13, $11 
	bne $12, $0, suite
	
	ori $11, $0, 0x7A
	slt $12, $11, $13
	bne $12, $0, suite
	
	addiu $16, $13, -0x20
	sb $16, 0($10)
	
suite : 
	addiu $8, $8, 1
	j bwhile 
	
end_while: 

	lw $16, 4($29)
	lw $31, 8($29)
	addiu $29, $29, 12
	jr $31
