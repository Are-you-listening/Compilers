.data
heap: .space 4
.text
main:
li $a0, 8192
li $v0, 9
syscall
la $t0, heap
sw $v0, 0($t0)
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
addiu $29, $29, -4
sw $t0, -100($30)
addiu $sp, $sp, 0
j L3

L3:
addiu $t0, $sp, 0
# INT main ( ) {  while ( 1 ) { 

addiu $t1, $0, 1
addiu $29, $29, -4
sw $t0, -104($30)
addiu $29, $29, -4
sw $t1, -108($30)
addiu $sp, $sp, 0
j L4

L4:
addiu $t0, $sp, 0
addiu $t2, $0, 0
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
sw $t2, 0($t4)
#INT a = 0 ; 

lw $t5, 0($t4)
#if ( a % 2 == 1 ) { 

addiu $t6, $0, 2
div $t7 $t5 $t6
mfhi $t7
addiu $t8, $0, 1
xor $t9, $t7, $t8
sltiu $s0, $t9, 1
move $v0, $s0
addiu $29, $29, -4
sw $t0, -116($30)
addiu $29, $29, -4
sw $t1, -120($30)
addiu $29, $29, -4
sw $t2, -124($30)
addiu $29, $29, -4
sw $t3, -128($30)
addiu $29, $29, -4
sw $t4, -132($30)
addiu $29, $29, -4
sw $t5, -136($30)
addiu $29, $29, -4
sw $t6, -140($30)
addiu $29, $29, -4
sw $t7, -144($30)
addiu $29, $29, -4
sw $t8, -148($30)
addiu $29, $29, -4
sw $t9, -152($30)
addiu $29, $29, -4
sw $s0, -156($30)
addiu $sp, $sp, 0
beq $v0, $zero, L6
addiu $sp, $sp, 0
addiu $sp, $sp, 0
j L5

L5:
addiu $t0, $sp, 0
#continue ; 

addiu $29, $29, -4
sw $t0, -160($30)
addiu $sp, $sp, 60
addiu $29, $29, -4
sw $t0, -164($30)
addiu $29, $29, -4
sw $t1, -168($30)
addiu $29, $29, -4
sw $t2, -172($30)
addiu $29, $29, -4
sw $t3, -176($30)
addiu $29, $29, -4
sw $t4, -180($30)
addiu $29, $29, -4
sw $t5, -184($30)
addiu $29, $29, -4
sw $t6, -188($30)
addiu $29, $29, -4
sw $t7, -192($30)
addiu $29, $29, -4
sw $t8, -196($30)
addiu $29, $29, -4
sw $t9, -200($30)
addiu $29, $29, -4
sw $s0, -204($30)
addiu $29, $29, -4
sw $s1, -208($30)
addiu $29, $29, -4
sw $s2, -212($30)
addiu $29, $29, -4
sw $s3, -216($30)
addiu $29, $29, -4
sw $s4, -220($30)
addiu $29, $29, -4
sw $s5, -224($30)
addiu $29, $29, -4
sw $s6, -228($30)
addiu $29, $29, -4
sw $s7, -232($30)
lw $t0, -104($30)
move $sp, $t0
j L3

L6:
addiu $t0, $sp, 0
lw $t1, -132($30)
lw $t2, 0($t1)
#INT c = 0 ; } if ( a > 10 ) { 

addiu $t3, $0, 10
sgt $t4, $t2, $t3
move $v0, $t4
addiu $29, $29, -4
sw $t0, -160($30)
sw $t1, -132($30)
addiu $29, $29, -4
sw $t2, -164($30)
addiu $29, $29, -4
sw $t3, -168($30)
addiu $29, $29, -4
sw $t4, -172($30)
addiu $sp, $sp, 0
beq $v0, $zero, L8
addiu $sp, $sp, 0
addiu $sp, $sp, 0
j L7

L7:
addiu $t0, $sp, 0
#break ; 

addiu $29, $29, -4
sw $t0, -176($30)
addiu $sp, $sp, 0
j L9

L8:
addiu $t0, $sp, 0
lw $t1, -132($30)
lw $t2, 0($t1)
#INT g = 0 ; }  a ++ ; 

addi $t3, $t2, 1
sw $t3, 0($t1)
addiu $29, $29, -4
sw $t0, -176($30)
sw $t1, -132($30)
addiu $29, $29, -4
sw $t2, -180($30)
addiu $29, $29, -4
sw $t3, -184($30)
addiu $sp, $sp, 84
move $sp, $t0
j L3

L9:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
# } return 0 ; 

addiu $29, $29, -4
sw $t0, -180($30)
addiu $29, $29, -4
sw $t1, -184($30)

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
