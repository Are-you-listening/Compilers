.data
heap: .space 4
.text
main:
jal function_main
li 	$v0, 10 #exit system call
syscall
function_main:
sw $30, 0($29)
add $30, $29, $0
addiu $29, $29, -100
sw $t0, -4($30)
sw $t1, -8($30)
sw $t2, -12($30)
sw $t3, -16($30)
sw $t4, -20($30)
sw $t5, -24($30)
sw $t6, -28($30)
sw $t7, -32($30)
sw $t8, -36($30)
sw $t9, -40($30)
sw $s0, -44($30)
sw $s1, -48($30)
sw $s2, -52($30)
sw $s3, -56($30)
sw $s4, -60($30)
sw $s5, -64($30)
sw $s6, -68($30)
sw $s7, -72($30)
sw $v1, -76($30)
sw $a0, -80($30)
sw $a1, -84($30)
sw $a2, -88($30)
sw $a3, -92($30)
sw $ra, -96($30)
L1:

L2:
addiu $t0, $sp, 0
move $v0, $t0
addiu $29, $29, -4
sw $t0, -100($30)
li $t1, 0
addiu $29, $29, -4
sw $t1, 4($29)
addiu $t2, $29, 4
#   INT main ( ) { INT b ; 

addiu $t4, $0, 1
li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
sw $t4, 0($t6)
#INT a = 1 ; 

lw $t7, 0($t6)
#switch ( a ) { 

addiu $t8, $0, 1
xor $t9, $t7, $t8
sltiu $s0, $t9, 1
move $v0, $s0
addiu $29, $29, -4
sw $t0, -112($30)
addiu $29, $29, -4
sw $t1, -116($30)
addiu $29, $29, -4
sw $t2, -120($30)
addiu $29, $29, -4
sw $t3, -124($30)
addiu $29, $29, -4
sw $t4, -128($30)
addiu $29, $29, -4
sw $t5, -132($30)
addiu $29, $29, -4
sw $t6, -136($30)
addiu $29, $29, -4
sw $t7, -140($30)
addiu $29, $29, -4
sw $t8, -144($30)
addiu $29, $29, -4
sw $t9, -148($30)
addiu $29, $29, -4
sw $s0, -152($30)
addiu $sp, $sp, -8
beq $v0, $zero, L4
addiu $sp, $sp, 8
addiu $sp, $sp, 0
j L3

L3:
addiu $t0, $sp, 0
#case 1 : b = 1 ; 

addiu $t1, $0, 1
lw $t2, -120($30)
sw $t1, 0($t2)
addiu $29, $29, -4
sw $t0, -156($30)
addiu $29, $29, -4
sw $t1, -160($30)
sw $t2, -120($30)
addiu $sp, $sp, 0
j L4

L4:
addiu $t0, $sp, 0
lw $t1, -136($30)
lw $t2, 0($t1)
addiu $t3, $0, 1
xor $t4, $t2, $t3
sltiu $t5, $t4, 1
sltiu $t6, $t5, 1
move $v0, $t6
addiu $29, $29, -4
sw $t0, -164($30)
sw $t1, -136($30)
addiu $29, $29, -4
sw $t2, -168($30)
addiu $29, $29, -4
sw $t3, -172($30)
addiu $29, $29, -4
sw $t4, -176($30)
addiu $29, $29, -4
sw $t5, -180($30)
addiu $29, $29, -4
sw $t6, -184($30)
addiu $sp, $sp, -8
beq $v0, $zero, L6
addiu $sp, $sp, 8
addiu $sp, $sp, 0
j L5

L5:
addiu $t0, $sp, 0
#break ; default : b = 3 ; 

addiu $t1, $0, 3
lw $t2, -120($30)
sw $t1, 0($t2)
addiu $29, $29, -4
sw $t0, -188($30)
addiu $29, $29, -4
sw $t1, -192($30)
sw $t2, -120($30)
addiu $sp, $sp, 0
j L6

L6:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#break ;  } return 0 ; 

addiu $29, $29, -4
sw $t0, -196($30)
addiu $29, $29, -4
sw $t1, -200($30)

function_main_load:
lw $t0, -4($30)
lw $t1, -8($30)
lw $t2, -12($30)
lw $t3, -16($30)
lw $t4, -20($30)
lw $t5, -24($30)
lw $t6, -28($30)
lw $t7, -32($30)
lw $t8, -36($30)
lw $t9, -40($30)
lw $s0, -44($30)
lw $s1, -48($30)
lw $s2, -52($30)
lw $s3, -56($30)
lw $s4, -60($30)
lw $s5, -64($30)
lw $s6, -68($30)
lw $s7, -72($30)
lw $v1, -76($30)
lw $a0, -80($30)
lw $a1, -84($30)
lw $a2, -88($30)
lw $a3, -92($30)
lw $ra, -96($30)
add $29, $30, $0
lw $30, 0($29)
jr $ra
