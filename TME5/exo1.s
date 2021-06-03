.data
   .align 2
p: .space 4
   .align 2
q: .space 4

.text
	ori $2, $0, 5		#Entree utilisateur
	syscall
	
	lui $8, 0x1001		# adresse de p
	sw $2, 0($8)		# on place à l'adresse de p la valeur contenue dans $2
	
	ori $2, $0, 5 		#Entree utilisateur
	syscall
	
	sw $2, 4($8)		# On place à l'adresse de q la valeur contenue dans $2
	
	lw $9, 0($8)
	lw $10, 4($8)
	xor $11, $11, $11	#somme=0
	
loop: 
	slt $12, $9, $10	# Le registre $12 vaut 1 si p < q 
	beq $12, $0, finloop	# si p >= q
	
	addu $11, $11, $9	# somme = somme + p
	addiu $9, $9, 1		# p = p + 1
	j loop
	
finloop:
	
	#Affichage du registre $11 contenant le resultat 
	or $4,$11,$0  
	ori $2,$0,1
	syscall
	
	ori $2, $0, 10
	syscall
