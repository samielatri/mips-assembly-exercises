.data

.text
	#Entree utilisateur valeur de tmpa
	ori $2, $0, 5 
	syscall
	or $9, $0, $2 
	
	#Entree utilisateur valeur de tmpb
	ori $2, $0, 5 
	syscall
	or $10, $0, $2
	
loop: 
	beq $9, $10, finloop 	# si tmpa == tmpb 
	
	slt $11, $10, $9 	# Le registre $11 vaut 1 si tmpb < tmpa
	beq $11, $0, else	# si tmpb >= tmpa 
	
	subu $9, $9, $10	# tmpa = tmpa - tmpb
	j loop
	
else:	
	subu $10, $10, $9	# tmpb = tmpb - tmpa
	j loop
	
finloop:

	#Affichage du registre $9
	ori $4, $9, 0
	ori $2, $0, 1
	syscall
	
	ori $2, $0, 10
	syscall
