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
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 4
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { INT x = 4 ; 

addiu $t5, $0, 4
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#INT y = x ; 

li $t9, 0
addiu $29, $29, -12
sw $t9, 4($29)
sw $t9, 8($29)
sw $t9, 12($29)
addiu $s0, $29, 4
addiu $29, $29, -4
sw $s0, 4($29)
addiu $s1, $29, 4
#INT array [ 3 ] = { 1 , 2 , 3 } ; 

addiu $s2, $0, 2
lw $s3, 0($s1)
li $s4, 4
mul $s5, $s2, $s4
addu $s6, $s3, $s5
addiu $s7, $0, 3
sw $s7, 0($s6)
addiu $29, $29, -4
sw $t0, -128($30)
addiu $29, $29, -4
sw $t1, -132($30)
addiu $29, $29, -4
sw $t2, -136($30)
addiu $29, $29, -4
sw $t3, -140($30)
addiu $29, $29, -4
sw $t4, -144($30)
addiu $29, $29, -4
sw $t5, -148($30)
addiu $29, $29, -4
sw $t6, -152($30)
addiu $29, $29, -4
sw $t7, -156($30)
addiu $29, $29, -4
sw $t8, -160($30)
addiu $29, $29, -4
sw $t9, -164($30)
addiu $29, $29, -4
sw $s0, -168($30)
addiu $29, $29, -4
sw $s1, -172($30)
addiu $29, $29, -4
sw $s2, -176($30)
addiu $29, $29, -4
sw $s3, -180($30)
addiu $29, $29, -4
sw $s4, -184($30)
addiu $29, $29, -4
sw $s5, -188($30)
addiu $29, $29, -4
sw $s6, -192($30)
addiu $29, $29, -4
sw $s7, -196($30)
addiu $t0, $0, 1
lw $t2, -172($30)
lw $t1, 0($t2)
li $t3, 4
mul $t4, $t0, $t3
addu $t5, $t1, $t4
addiu $t6, $0, 2
sw $t6, 0($t5)
addiu $t7, $0, 0
lw $t8, 0($t2)
li $t9, 4
mul $s0, $t7, $t9
addu $s1, $t8, $s0
addiu $s2, $0, 1
sw $s2, 0($s1)
addiu $s3, $0, 0
move $v0, $s3
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -200($30)
addiu $29, $29, -4
sw $t1, -204($30)
sw $t2, -172($30)
addiu $29, $29, -4
sw $t3, -208($30)
addiu $29, $29, -4
sw $t4, -212($30)
addiu $29, $29, -4
sw $t5, -216($30)
addiu $29, $29, -4
sw $t6, -220($30)
addiu $29, $29, -4
sw $t7, -224($30)
addiu $29, $29, -4
sw $t8, -228($30)
addiu $29, $29, -4
sw $t9, -232($30)
addiu $29, $29, -4
sw $s0, -236($30)
addiu $29, $29, -4
sw $s1, -240($30)
addiu $29, $29, -4
sw $s2, -244($30)
addiu $29, $29, -4
sw $s3, -248($30)

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
