.text

	#Exercice 2 
	#question 1.1
	ori $8, $0, 137 # $8 <- 137
	
	#Affichage du registre $8
	or $4, $0, $8 # On place dans dans le regsitre 4 l'entier à écrire sur la console
	ori $2, $0, 1 #appel systeme pour ecrire un entier sur la console 
	syscall
	
	#retour à la ligne 
	ori $4, $0, 10 #code ASCII 10 de retour à la ligne placé dans le registre 4
	ori $2, $0, 11 #appel systeme pour ecrire un caractere sur la console
	syscall
	
	#question 2
	
	lui $8, 0x0001 # $8 <- 0x00010000
	ori $8,$8, 0x0001 #8 <- 0x00010001
	
	#Affichage du registre $8
	or $4, $0, $8 
	ori $2, $0, 1 
	syscall
	
	#retour à la ligne 
	ori $4, $0, 10
	ori $2, $0, 11
	syscall
	
	#Exercice 3
	
	#question 1.1
	
	ori $9, $0, 84		# $9  <- 84
	ori $10, $0, 10		# $10 <- 10

	div $9, $10		# $lo <- $9 // 10  quotient
					# $hi <- $9 % 10  reste 

	mflo $11			# $11 <- lo (quotient)
	mfhi $12			# $12 <- hi (reste)

	# affichage du registre $11
	or $4, $0, $11		# $4 <- valeur de $11
	ori $2, $0, 1		# $2 <- 1
	syscall			# appel system  : affichage registre

	# affichage du charactere \n
	# permet un retour a la ligne
	ori $4, $0, 10		# $4 <- 10
	ori $2, $0, 11		# $2 <- 11
	syscall			# appel system : affichage char

	# affichage du registre $12
	or $4, $0, $12		# $4 <- valeur de $12
	ori $2, $0, 1		# $2 <- 1
	syscall			# appel system : affichage registre

	# affichage du charactere \n
	# permet un retour a la ligne
	ori $4, $0, 10		# $4 <- 10
	ori $2, $0, 11		# $2 <- 11
	syscall			# appel system : affichage char

	# Question 1.3
	
	# On veut : $13 <- $11 * $10 + $12
	or $9, $0, $10		# $9 <- 10
	mult $11, $9 		# hi <- upper($11 * $9)
					# lo <- lower($11 * $9)
					
	mflo $9			# $9 <- lo
	add $13, $9, $12	# $13 <- $9 + $12

	# affichage du registre $13
	or $4, $0, $13		# $4 <- valeur de $13
	ori $2, $0, 1		# $2 <- 1
	syscall			# appel system : affichage registre

	# affichage du charactere \n
	# permet un retour a la ligne
	ori $4, $0, 10		# $4 <- 10
	ori $2, $0, 11		# $2 <- 11
	syscall			# appel system : affichage de char
	
	# Question 2
	# Entree utilisateur
	ori $2, $0, 5		# $2 <- 5
	syscall			# appel system : Entree utilisateur entier
	or $9, $0, $2		# $9  <- $2

	ori $2, $0, 5		# $2 <- 5
	syscall			# appel system : Entree utilisateur entier 
	or $10, $0, $2		# $10 <- $2

	div $9, $10		# $lo <- $9 // 10
					# $hi <- $9 % 10  

	mflo $11			# $11 <- lo (quotient)
	mfhi $12			# $12 <- hi (reste)

	# affichage du registre $11
	or $4, $0, $11		# $4 <- valeur de $11
	ori $2, $0, 1		# $2 <- 1
	syscall			# appel system : affichage registre

	# affichage du charactere \n
	# permet un retour a la ligne
	ori $4, $0, 10		# $4 <- 10
	ori $2, $0, 11		# $2 <- 11
	syscall			# appel system : affichage char

	# affichage du registre $12
	or $4, $0, $12		# $4 <- valeur de $12
	ori $2, $0, 1		# $2 <- 1
	syscall			# appel system : affichage registre

	# affichage du charactere \n
	# permet un retour a la ligne
	ori $4, $0, 10		# $4 <- 10
	ori $2, $0, 11		# $2 <- 11
	syscall			# appel system : affichage char

	# On veut : $13 <- $11 * $10 + $12
	or $9, $0, $10		# $9 <- 10
	mult $11, $9 		# hi <- upper($11 * $9)
					# lo <- lower($11 * $9)
					
	mflo $9			# $9 <- lo
	add $13, $9, $12	# $13 <- $9 + $12

	# affichage du registre $13
	or $4, $0, $13		# $4 <- valeur de $13
	ori $2, $0, 1		# $2 <- 1
	syscall			# appel system : affichage registre

	# affichage du charactere \n
	# permet un retour a la ligne
	ori $4, $0, 10		# $4 <- 10
	ori $2, $0, 11		# $2 <- 11
	syscall			# appel system : affichage char

	# affichage du charactere \n
	# permet un retour a la ligne
	ori $4, $0, 10		# $4 <- 10
	ori $2, $0, 11		# $2 <- 11
	syscall			# appel system : affichage de char
	
	
	#Exercice 5
	#Question 1

	lui $3,0xAABB
	ori $3,$3,0xCCDD
	or $4,$0,$3
	ori $2,$0,34 		
	syscall 			# appel system : affichage en hexadécimal

	# affichage du charactere \n
	# permet un retour a la ligne
	ori $4, $0, 10		# $4 <- 10 (code ascii de \n)
	ori $2, $0, 11		# $2 <- 11
	syscall			# appel system : affichage char

	#Question 2

	#on a : 0xAABBCCDD et on veut : DDBB AACC

	lui $10,0xAA00 #AAAA AAAA 0000 0000 0000 0000 0000 0000
	lui $9,0x00BB #0000 0000 BBBB BBBB 0000 0000 0000 0000
	lui $11,0x00CC #0000 0000 CCCC CCCC 0000 0000 0000 0000
	lui $8,0xDD00 #DDDD DDDD 0000 0000 0000 0000 0000 0000


	srl $10,$10,16 #0000 0000 0000 0000 AAAA AAAA 0000 0000
	srl $11,$11,16 #0000 0000 00CC 0000 0000 0000 CCCC CCCC
	add $8,$8,$9 #DDDD DDDD BBBB BBBB 0000 0000 0000 0000
	add $10,$10,$11 #0000 0000 0000 0000 AAAA AAAA CCCC CCCC

	or $5,$8,$10 #DDDD DDDD BBBB BBBB AAAA AAAA CCCC CCCC

	or $4,$0,$5
	ori $2,$0,34
	syscall

	# affichage du charactere \n
	# permet un retour a la ligne
	ori $4, $0, 10		# $4 <- 10 (code ascii de \n)
	ori $2, $0, 11		# $2 <- 11
	syscall			# appel system : affichage char

	# On quitte le programme
	ori $2, $0, 10		# $2 <- 10
	syscall			# appel system : Exit
	
