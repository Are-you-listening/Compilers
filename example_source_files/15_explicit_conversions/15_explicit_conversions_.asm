.data
heap: .space 4
float...index_0: .float 10.0
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
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 10
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { INT a = 10 ; 

addiu $t5, $0, 10
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sb $t5, 0($t7)
#CHAR c = ( CHAR ) a ; 

l.s $f0, float...index_0
mfc1 $t9, $f0
li $s0, 0
addiu $29, $29, -4
sw $s0, 4($29)
addiu $s1, $29, 4
sw $t9, 0($s1)
#FLOAT b = ( FLOAT ) c ; 

#FLOAT * d = ( FLOAT * ) c ; 

lb $s3, 0($t7)
li $s4, 0
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
addiu $29, $29, -4
sw $s5, 4($29)
addiu $s6, $29, 4
sw $s3, 0($s6)
addiu $s7, $0, 0
move $v0, $s7
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -124($30)
addiu $29, $29, -4
sw $t1, -128($30)
addiu $29, $29, -4
sw $t2, -132($30)
addiu $29, $29, -4
sw $t3, -136($30)
addiu $29, $29, -4
sw $t4, -140($30)
addiu $29, $29, -4
sw $t5, -144($30)
addiu $29, $29, -4
sw $t6, -148($30)
addiu $29, $29, -4
sw $t7, -152($30)
addiu $29, $29, -4
sw $t8, -156($30)
addiu $29, $29, -4
sw $t9, -160($30)
addiu $29, $29, -4
sw $s0, -164($30)
addiu $29, $29, -4
sw $s1, -168($30)
addiu $29, $29, -4
sw $s2, -172($30)
addiu $29, $29, -4
sw $s3, -176($30)
addiu $29, $29, -4
sw $s4, -180($30)
addiu $29, $29, -4
sw $s5, -184($30)
addiu $29, $29, -4
sw $s6, -188($30)
addiu $29, $29, -4
sw $s7, -192($30)

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
