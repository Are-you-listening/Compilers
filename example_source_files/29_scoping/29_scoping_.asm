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
addiu $t1, $0, 0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { INT x = 0 ; 

addiu $t5, $0, 1
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#{ INT x = 1 ; 

#if ( x ) { 

addiu $t8, $0, 1
li $t9, 0
xor $s0, $t8, $t9
sltiu $s1, $s0, 1
sltiu $s2, $s1, 1
move $v0, $s2
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
addiu $29, $29, -4
sw $s1, -156($30)
addiu $29, $29, -4
sw $s2, -160($30)
addiu $sp, $sp, -24
beq $v0, $zero, L4
addiu $sp, $sp, 24
addiu $sp, $sp, 0
j L3

L3:
addiu $t0, $sp, 0
addiu $t2, $0, 2
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
sw $t2, 0($t4)
#INT x = 2 ; 

addiu $29, $29, -4
sw $t0, -168($30)
addiu $29, $29, -4
sw $t1, -172($30)
addiu $29, $29, -4
sw $t2, -176($30)
addiu $29, $29, -4
sw $t3, -180($30)
addiu $29, $29, -4
sw $t4, -184($30)
addiu $sp, $sp, 0
j L4

L4:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -188($30)
addiu $sp, $sp, 0
j L5

L5:
addiu $t0, $sp, 0
#} } while ( x ) { 

lw $t1, -124($30)
lw $t2, 0($t1)
li $t3, 0
xor $t4, $t2, $t3
sltiu $t5, $t4, 1
sltiu $t6, $t5, 1
move $v0, $t6
addiu $29, $29, -4
sw $t0, -192($30)
sw $t1, -124($30)
addiu $29, $29, -4
sw $t2, -196($30)
addiu $29, $29, -4
sw $t3, -200($30)
addiu $29, $29, -4
sw $t4, -204($30)
addiu $29, $29, -4
sw $t5, -208($30)
addiu $29, $29, -4
sw $t6, -212($30)
addiu $sp, $sp, 0
beq $v0, $zero, L7
addiu $sp, $sp, 0
addiu $sp, $sp, 0
j L6

L6:
addiu $t0, $sp, 0
#continue ; 

addiu $29, $29, -4
sw $t0, -216($30)
addiu $sp, $sp, 28
addiu $29, $29, -4
sw $t0, -220($30)
addiu $29, $29, -4
sw $t1, -224($30)
addiu $29, $29, -4
sw $t2, -228($30)
addiu $29, $29, -4
sw $t3, -232($30)
addiu $29, $29, -4
sw $t4, -236($30)
addiu $29, $29, -4
sw $t5, -240($30)
addiu $29, $29, -4
sw $t6, -244($30)
addiu $29, $29, -4
sw $t7, -248($30)
addiu $29, $29, -4
sw $t8, -252($30)
addiu $29, $29, -4
sw $t9, -256($30)
addiu $29, $29, -4
sw $s0, -260($30)
addiu $29, $29, -4
sw $s1, -264($30)
addiu $29, $29, -4
sw $s2, -268($30)
addiu $29, $29, -4
sw $s3, -272($30)
addiu $29, $29, -4
sw $s4, -276($30)
addiu $29, $29, -4
sw $s5, -280($30)
addiu $29, $29, -4
sw $s6, -284($30)
addiu $29, $29, -4
sw $s7, -288($30)
lw $t0, -192($30)
move $sp, $t0
j L5

L7:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#} return 0 ; 

addiu $29, $29, -4
sw $t0, -216($30)
addiu $29, $29, -4
sw $t1, -220($30)

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
