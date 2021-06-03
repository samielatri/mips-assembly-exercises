.data
ch:	.asciiz "Une chaine1"		
.text

	lui $9,0x1001		# adress ch		
	xor $10,$10,$10 	# i = 0         	  	
	
loop:
	ori $9, $9, 0		# @ch
	addu $11, $9, $10 	# @ch[i]
	lb $11, 0($11)		# $11 <- ch[i]
	beq $11, $0, finloop
	
	addiu $10, $10, 1
	j loop
	
finloop:
	
	#affichage du regsitre $10
	or $4,$10,$0
	ori $2,$0,1
	syscall
	
	ori $2,$0,10
	syscall 
