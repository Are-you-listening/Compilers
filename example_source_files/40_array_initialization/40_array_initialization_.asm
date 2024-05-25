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
li $t1, 0
addiu $29, $29, -20
sw $t1, 4($29)
sw $t1, 8($29)
sw $t1, 12($29)
sw $t1, 16($29)
sw $t1, 20($29)
addiu $t2, $29, 4
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
#   INT main ( ) { INT c [ 5 ] = { 1 , 2 , 3 , 4 , 5 } ; 

addiu $t4, $0, 4
lw $t5, 0($t3)
li $t6, 4
mul $t7, $t4, $t6
addu $t8, $t5, $t7
addiu $t9, $0, 5
sw $t9, 0($t8)
addiu $s0, $0, 3
lw $s1, 0($t3)
li $s2, 4
mul $s3, $s0, $s2
addu $s4, $s1, $s3
addiu $s5, $0, 4
sw $s5, 0($s4)
addiu $s6, $0, 2
lw $s7, 0($t3)
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
li $t0, 4
lw $t2, -192($30)
mul $t1, $t2, $t0
lw $t4, -196($30)
addu $t3, $t4, $t1
addiu $t5, $0, 3
sw $t5, 0($t3)
addiu $t6, $0, 1
lw $t8, -140($30)
lw $t7, 0($t8)
li $t9, 4
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 2
sw $s2, 0($s1)
addiu $s3, $0, 0
lw $s4, 0($t8)
li $s5, 4
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -200($30)
addiu $29, $29, -4
sw $t1, -204($30)
sw $t2, -192($30)
addiu $29, $29, -4
sw $t3, -208($30)
sw $t4, -196($30)
addiu $29, $29, -4
sw $t5, -212($30)
addiu $29, $29, -4
sw $t6, -216($30)
addiu $29, $29, -4
sw $t7, -220($30)
sw $t8, -140($30)
addiu $29, $29, -4
sw $t9, -224($30)
addiu $29, $29, -4
sw $s0, -228($30)
addiu $29, $29, -4
sw $s1, -232($30)
addiu $29, $29, -4
sw $s2, -236($30)
addiu $29, $29, -4
sw $s3, -240($30)
addiu $29, $29, -4
sw $s4, -244($30)
addiu $29, $29, -4
sw $s5, -248($30)
addiu $29, $29, -4
sw $s6, -252($30)
addiu $29, $29, -4
sw $s7, -256($30)
addiu $t0, $0, 1
lw $t1, -256($30)
sw $t0, 0($t1)
addiu $t2, $0, 1
lw $t4, -140($30)
lw $t3, 0($t4)
li $t5, 4
mul $t6, $t2, $t5
addu $t7, $t3, $t6
#c [ 1 ] = 0 ; 

addiu $t8, $0, 0
sw $t8, 0($t7)
addiu $t9, $0, 0
move $v0, $t9
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -260($30)
sw $t1, -256($30)
addiu $29, $29, -4
sw $t2, -264($30)
addiu $29, $29, -4
sw $t3, -268($30)
sw $t4, -140($30)
addiu $29, $29, -4
sw $t5, -272($30)
addiu $29, $29, -4
sw $t6, -276($30)
addiu $29, $29, -4
sw $t7, -280($30)
addiu $29, $29, -4
sw $t8, -284($30)
addiu $29, $29, -4
sw $t9, -288($30)

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
