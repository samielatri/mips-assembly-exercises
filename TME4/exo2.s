.data 
	v1: .word -1
	v2: .word 0xFF
	
.text 
	lui $7, 0x1001
	
	lw $8, 0($7)
	addiu $8, $8, 1
	sw $8, 0($7)
	
	lw $9, 4($7)
	addiu $9, $9, 1
	sw $9, 4($7)
	
	#Affichage du registre $8
	or $4, $0, $8 
	ori $2, $0, 1 
	syscall
	
	#retour à la ligne 
	ori $4, $0, 10 
	ori $2, $0, 11 
	syscall
    	
    	#Affichage du registre $9
	or $4, $0, $9
	ori $2, $0, 1  
	syscall
	
	ori $2, $0, 10
	syscall