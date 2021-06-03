.data 

p1 : .asciiz "X"
     .align 2
     .word 2
     .word 6

p2: .asciiz "Y"
    .align 2
    .word 4
    .word 4

p3:
     .space 10

ptr: .align 2
     .space 4

.text 

lui $8, 0x1001
ori $9, $8, 24
sw $9, 36($8)
lw $9, 4($8)
lw $10, 16($8)
add $9, $9, $10
div $9, $9, 2
lw $11, 36($8)
sw $9, 4($11)
lw $9, 8($8)
lw $10, 20($8)
add $9, $9, $10
div $9, $9, 2
sw $9, 8($11)
and $9, $0, $9
ori $9, $9, 0x5A
sw $9, 0($11)
ori $2, $0, 4
ori $4, $8,24
syscall
ori $2, $0, 1
lw $4, 4($11)
syscall
lw $4, 8($11)
syscall
ori $2, $0, 10
syscall