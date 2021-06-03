.data

p : .word 5

.text 

##### MAIN #####

addiu $29,$29,-4
lui $8,0x1001
lw $4,0($8)

jal fact 
or $4,$2,$0
ori $2,$0,1
syscall

addiu $29,$29,+4
ori $2,$0,10
syscall

##### FONCTION #####

fact :
addiu $29,$29,-8
sw $31,4($29)
sw $16,0($29)
sw $4,8($29)

if :
	bne $4,$0,else
	ori $2,$0,1
	
	lw $31,4($29)
	lw $16,0($29)
	addiu $29,$29,8
	jr $31
	 
else :
	lw $5,8($29)
	addiu $4,$5,-1
	jal fact
	ori $16,$2,0
	lw $5,8($29)
	mult $5,$16
	mflo $2

lw $31,4($29)
lw $16,0($29)
addiu $29,$29,8
jr $31