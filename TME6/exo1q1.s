.data
chaine:	.space 11

.text
	addiu $29, $29, -16	#4 variables locales i, nb, r ,nbzero
	
	#Entree utilisateur valeur de nb
	ori $2, $0, 5 
	syscall
	or $12, $0, $2
	sb $12, 4($29) 
	
	#chaine[10]=0
	lui $8, 0x1001		# @chaine
	ori $9, $0, 0		# $9 <- 0
	sb $9, 11($8)		# chaine[10] = 0
	
for:
	# condition de fin 
	ori $10, $0, 0		# $10 <- 9
	sw $10, 0($29)		# i = 9
	slt $11, $10, $0	# Registre $11 vaut 1 si i<0
	bne $11, $0, finfor	# si i < 0 on arrete 
	
	# r = nb % 10
	lw $12, 4($29)		# lecture de nb
	
	ori $13, $0, 10		# $13 <- 10
	div $12, $13		# $lo <- $12 // 10  quotient
				# $hi <- $12 % 10  reste 
	mfhi $13		# $13 <- hi (reste)
	
	sw $13, 8($29)		# r <- nb % 10 
	
	#nb = nb / 10
	lw $12, 4($29)		# lecture de nb 
	ori $13, $0, 10		# $13 <- 10			
	div $12, $13		# $12 // $13
	mflo $13		# $lo <- $12 // 10  quotient
	sw $13, 4($29)		# nb <- nb / 10
	
	# chaine[i] = r + 0x30
	lw $13, 8($29)		# lecture de r
	addiu $13, $13, 0x30	# $13 <- r + 0x30
	
	lui $8, 0x1001		# @chaine
	lw $10, 0($29)		# lecture de i
	addu $8, $10, $8	# @chaine[i]	
	sw $13, 0($8)		# chaine[i] <- r + 0x30
    	
	# i = i - 1
	lw $10, 0($29)		# lecture de i
	subu $10, $10, 1	# $10 <- i - 1
	sw $10, 0($29)
	
	j for 
	
finfor:
	# affichage de la chaine de caracteres 
	lui $4, 0x1001		
	ori $2, $0, 4		
	syscall			# affichage chaine
	
	
	addiu $29, $29, 16	# desallocation
	ori $2, $0, 10
	syscall			# exit
