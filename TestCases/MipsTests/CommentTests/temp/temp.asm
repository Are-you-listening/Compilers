.data
.text
jal main
li 	$v0, 10 #exit system call
syscall
main:
sw $30, 0($29)
add $30, $29, $0
addiu $29, $29, -28
sw $31, -4($30)
sw $8, -8($30)
sw $9, -12($30)
sw $10, -16($30)
sw $11, -20($30)
sw $12, -24($30)
L1:

L2:
addiu $t1, $0, 0
# INT main ( ) { return 0 ; } 
#/* Very nice comment */

lw $31, -4($30)
lw $8, -8($30)
lw $9, -12($30)
lw $10, -16($30)
lw $11, -20($30)
lw $12, -24($30)
add $29, $30, $0
lw $30, 0($29)
jr $ra
