.data
val:	.word 13
tab:	.word 3, 23, 4, 58, 10, -1
.text
	lui $8, 0x1001		# adresse val
	lw $9, 0($8)		# valeur de val	
	ori $13, $0, -1		# chargement de -1 dans le registre 12
	xor $11, $11, $11	# somme = 0
	
loop: 
	lw $10, 0($8)		# chargement de l’element courant
	beq $10, $13, finloop	# l'element courant de tab == -1
	
	slt $12, $10, $9	# Le registre 12 vaut 1 si val > valeur courante de tab
	beq $12, $0, suite	# val <= valeur courante 
	
	addiu $11, $11, 1	# somme = somme +1
 
suite:
	addiu $8, $8, 4		# adresse de l'element suivant
	j loop

finloop:
	#affichage du resulat	
	ori $4, $11, 0
	ori $2, $0, 1
	syscall
	 
	ori $2, $0, 10
	syscall