.data

p : .word 3
m : .word 5

.text

##### MAIN #####
addiu $29,$29,-8

lui $8,0x1001
lw $4,0($8)
lw $5,4($8)
jal puissance 

or $4,$2,$0
ori $2,$0,1
syscall

addiu $29,$29,8
ori $2,$0,10
syscall

##### FNCTION #####
puissance : 
addiu $29,$29,-16
sw $31,4($29)
sw $4,8($29)
sw $5,12($29)

if_:
	bne $5,$0,i_f
	ori $2, $0,1
	j fin 
	
i_f: 
	ori $8,$0,1
	bne $5,$8,_if
	or $2,$4,$0
	j fin

_if :
	lw $4,8($29)
	ori $9,$0,2
	lw $5,12($29)
	div $5,$9
	mflo $5
	jal puissance
	sw $2,0($29)
	lw $5,12($29)
	ori $9,$0,1
	andi $8,$5,0x01
	bne $9,$8,else
	lw $8,8($29)
	lw $9,0($29)
	mult $8,$9
	mflo $8
	mult $8,$9
	mflo $2
	j fin
	
else :
	lw $9,0($29)
	mult $9,$9
	mflo $2
	j fin 
fin : 
lw $31, 4($29)
#lw $16, 0($29)
lw $4, 8($29)
lw $5 , 12($29)
addiu $29,$29,16
jr $31
