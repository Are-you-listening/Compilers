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
addiu $t1, $0, 5
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#   INT main ( ) { INT q = 5 ; 

li $t5, 0
addiu $29, $29, -12
sb $t5, 4($29)
sb $t5, 5($29)
sb $t5, 6($29)
sb $t5, 7($29)
sb $t5, 8($29)
sb $t5, 9($29)
sb $t5, 10($29)
sb $t5, 11($29)
sb $t5, 12($29)
sb $t5, 13($29)
addiu $t6, $29, 4
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
#CHAR y [ 10 ] ; 

addiu $t8, $0, 5
lw $t9, 0($t7)
li $s0, 1
mul $s1, $t8, $s0
addu $s2, $t9, $s1
#y [ 5 ] = 'a' ; 

addiu $s3, $0, 97
sb $s3, 0($s2)
li $s5, 0
addiu $29, $29, -12
sw $s5, 4($29)
sw $s5, 8($29)
sw $s5, 12($29)
addiu $s6, $29, 4
addiu $29, $29, -12
sw $s5, 4($29)
sw $s5, 8($29)
sw $s5, 12($29)
addiu $s7, $29, 4
addiu $29, $29, -24
sw $s7, 4($29)
sw $s6, 8($29)
addiu $29, $29, -4
sw $t0, -172($30)
addiu $29, $29, -4
sw $t1, -176($30)
addiu $29, $29, -4
sw $t2, -180($30)
addiu $29, $29, -4
sw $t3, -184($30)
addiu $29, $29, -4
sw $t4, -188($30)
addiu $29, $29, -4
sw $t5, -192($30)
addiu $29, $29, -4
sw $t6, -196($30)
addiu $29, $29, -4
sw $t7, -200($30)
addiu $29, $29, -4
sw $t8, -204($30)
addiu $29, $29, -4
sw $t9, -208($30)
addiu $29, $29, -4
sw $s0, -212($30)
addiu $29, $29, -4
sw $s1, -216($30)
addiu $29, $29, -4
sw $s2, -220($30)
addiu $29, $29, -4
sw $s3, -224($30)
addiu $29, $29, -4
sw $s4, -228($30)
addiu $29, $29, -4
sw $s5, -232($30)
addiu $29, $29, -4
sw $s6, -236($30)
addiu $29, $29, -4
sw $s7, -240($30)
addiu $t0, $29, 4
addiu $29, $29, -4
sw $t0, 4($29)
addiu $t1, $29, 4
#INT x [ 2 ] [ 3 ] ; 

addiu $t2, $0, 1
lw $t3, 0($t1)
li $t4, 4
mul $t5, $t2, $t4
addu $t6, $t3, $t5
# x [ 1 ] [ 2 ] = 1 ; 

addiu $t7, $0, 2
lw $t8, 0($t6)
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
sw $t0, -248($30)
addiu $29, $29, -4
sw $t1, -252($30)
addiu $29, $29, -4
sw $t2, -256($30)
addiu $29, $29, -4
sw $t3, -260($30)
addiu $29, $29, -4
sw $t4, -264($30)
addiu $29, $29, -4
sw $t5, -268($30)
addiu $29, $29, -4
sw $t6, -272($30)
addiu $29, $29, -4
sw $t7, -276($30)
addiu $29, $29, -4
sw $t8, -280($30)
addiu $29, $29, -4
sw $t9, -284($30)
addiu $29, $29, -4
sw $s0, -288($30)
addiu $29, $29, -4
sw $s1, -292($30)
addiu $29, $29, -4
sw $s2, -296($30)
addiu $29, $29, -4
sw $s3, -300($30)

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
