.data
chaine:	.space 11

.text
	addiu $29, $29, -16	#4 variables locales i, nb, r ,nbzero
	
	ori $10, $0, 9		# i <- 9
	
	#Entree utilisateur valeur de nb
	ori $2, $0, 5 
	syscall
	or $12, $0, $2
	sb $12, 4($29) 
	
	#chaine[10]=0
	lui $8, 0x1001		# @chaine
	ori $9, $0, 0		# $9 <- 0
	sb $9, 11($8)		# chaine[10] = 0
	
	ori $13, $0, 10		# $13 <- 10
	
	
for:
	# condition de fin 
	slt $11, $10, $0	# Registre $11 vaut 1 si i<0
	bne $11, $0, finfor	# si i < 0 on arrete 
	
	# r = nb % 10	
	div $12, $13		# $lo <- $12 // 10  quotient
				# $hi <- $12 % 10  reste 
	mfhi $11		# $14 <- hi (reste)

	ori $15, $11, 0		# r optimisé dans $15 
	
	#nb = nb / 10		
	div $12, $13		# $12 // $13
	mflo $11		# $lo <- $12 // 10  quotient
	ori $12, $11, 0
	
	# chaine[i] = r + 0x30
	addiu $11, $15, 0x30	# $11 <- r + 0x30
	
	addu $14, $8, $10	# @chaine[i]	
	sw $11, 0($14)		# chaine[i] <- r + 0x30
    	
	# i = i - 1
	subu $10, $10, 1	
	
	j for 
	
finfor:
	# affichage de la chaine de caracteres 
	or $4, $0, $8		
	ori $2, $0, 4		
	syscall			# affichage chaine
	
	ori $11, $0, 0		# nbzero <- 0
	ori $10, $0, 0		# i <- 0
	
	
	
loop:  
	#condition d'arret 
	ori $13, $0, 9		# $13 <- 9
	slt $12, $10, $13 	# le registre vaut 1 si i < 9 
	beq $12, $0, finloop	# si i >= 0
	
	ori $13, $0, 0x30	# $13 <- 0x30
	addu $14, $8, $10	# @chaine + i
	lbu $14, 0($14) 
	bne $14, $13, finloop 	# si chaine[i] != $13  
	
	addiu $11, $11, 1	# nbzero+=1
	addiu $10, $10, 1	# i++
	
finloop:
	#Affichage nbzero
	ori $4, $11, 0 		# $4 <- $11
	ori $2, $0, 1		# AS entier
	
	addiu $29, $29, 16	# desallocation
	ori $2, $0, 10
	syscall			#exit