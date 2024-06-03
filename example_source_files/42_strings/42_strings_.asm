.data
heap: .space 4
str0: .asciiz  "string he" 
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
li $t1, 0
addiu $29, $29, -12
sb $t1, 4($29)
sb $t1, 5($29)
sb $t1, 6($29)
sb $t1, 7($29)
sb $t1, 8($29)
sb $t1, 9($29)
sb $t1, 10($29)
sb $t1, 11($29)
sb $t1, 12($29)
sb $t1, 13($29)
addiu $t2, $29, 4
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
# INT main ( ) { CHAR s [ 10 ] = "string\nhe" ; 

addiu $t4, $0, 9
lw $t5, 0($t3)
li $t6, 1
mul $t7, $t4, $t6
addu $t8, $t5, $t7
addiu $t9, $0, 0
sb $t9, 0($t8)
addiu $s0, $0, 8
lw $s1, 0($t3)
li $s2, 1
mul $s3, $s0, $s2
addu $s4, $s1, $s3
addiu $s5, $0, 101
sb $s5, 0($s4)
addiu $s6, $0, 7
lw $s7, 0($t3)
addiu $29, $29, -4
sw $t0, -120($30)
addiu $29, $29, -4
sw $t1, -124($30)
addiu $29, $29, -4
sw $t2, -128($30)
addiu $29, $29, -4
sw $t3, -132($30)
addiu $29, $29, -4
sw $t4, -136($30)
addiu $29, $29, -4
sw $t5, -140($30)
addiu $29, $29, -4
sw $t6, -144($30)
addiu $29, $29, -4
sw $t7, -148($30)
addiu $29, $29, -4
sw $t8, -152($30)
addiu $29, $29, -4
sw $t9, -156($30)
addiu $29, $29, -4
sw $s0, -160($30)
addiu $29, $29, -4
sw $s1, -164($30)
addiu $29, $29, -4
sw $s2, -168($30)
addiu $29, $29, -4
sw $s3, -172($30)
addiu $29, $29, -4
sw $s4, -176($30)
addiu $29, $29, -4
sw $s5, -180($30)
addiu $29, $29, -4
sw $s6, -184($30)
addiu $29, $29, -4
sw $s7, -188($30)
li $t0, 1
lw $t2, -184($30)
mul $t1, $t2, $t0
lw $t4, -188($30)
addu $t3, $t4, $t1
addiu $t5, $0, 104
sb $t5, 0($t3)
addiu $t6, $0, 6
lw $t8, -132($30)
lw $t7, 0($t8)
li $t9, 1
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 10
sb $s2, 0($s1)
addiu $s3, $0, 5
lw $s4, 0($t8)
li $s5, 1
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -192($30)
addiu $29, $29, -4
sw $t1, -196($30)
sw $t2, -184($30)
addiu $29, $29, -4
sw $t3, -200($30)
sw $t4, -188($30)
addiu $29, $29, -4
sw $t5, -204($30)
addiu $29, $29, -4
sw $t6, -208($30)
addiu $29, $29, -4
sw $t7, -212($30)
sw $t8, -132($30)
addiu $29, $29, -4
sw $t9, -216($30)
addiu $29, $29, -4
sw $s0, -220($30)
addiu $29, $29, -4
sw $s1, -224($30)
addiu $29, $29, -4
sw $s2, -228($30)
addiu $29, $29, -4
sw $s3, -232($30)
addiu $29, $29, -4
sw $s4, -236($30)
addiu $29, $29, -4
sw $s5, -240($30)
addiu $29, $29, -4
sw $s6, -244($30)
addiu $29, $29, -4
sw $s7, -248($30)
addiu $t0, $0, 103
lw $t1, -248($30)
sb $t0, 0($t1)
addiu $t2, $0, 4
lw $t4, -132($30)
lw $t3, 0($t4)
li $t5, 1
mul $t6, $t2, $t5
addu $t7, $t3, $t6
addiu $t8, $0, 110
sb $t8, 0($t7)
addiu $t9, $0, 3
lw $s0, 0($t4)
li $s1, 1
mul $s2, $t9, $s1
addu $s3, $s0, $s2
addiu $s4, $0, 105
sb $s4, 0($s3)
addiu $s5, $0, 2
lw $s6, 0($t4)
li $s7, 1
addiu $29, $29, -4
sw $t0, -252($30)
sw $t1, -248($30)
addiu $29, $29, -4
sw $t2, -256($30)
addiu $29, $29, -4
sw $t3, -260($30)
sw $t4, -132($30)
addiu $29, $29, -4
sw $t5, -264($30)
addiu $29, $29, -4
sw $t6, -268($30)
addiu $29, $29, -4
sw $t7, -272($30)
addiu $29, $29, -4
sw $t8, -276($30)
addiu $29, $29, -4
sw $t9, -280($30)
addiu $29, $29, -4
sw $s0, -284($30)
addiu $29, $29, -4
sw $s1, -288($30)
addiu $29, $29, -4
sw $s2, -292($30)
addiu $29, $29, -4
sw $s3, -296($30)
addiu $29, $29, -4
sw $s4, -300($30)
addiu $29, $29, -4
sw $s5, -304($30)
addiu $29, $29, -4
sw $s6, -308($30)
addiu $29, $29, -4
sw $s7, -312($30)
lw $t1, -304($30)
lw $t2, -312($30)
mul $t0, $t1, $t2
lw $t4, -308($30)
addu $t3, $t4, $t0
addiu $t5, $0, 114
sb $t5, 0($t3)
addiu $t6, $0, 1
lw $t8, -132($30)
lw $t7, 0($t8)
li $t9, 1
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 116
sb $s2, 0($s1)
addiu $s3, $0, 0
lw $s4, 0($t8)
li $s5, 1
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -316($30)
sw $t1, -304($30)
sw $t2, -312($30)
addiu $29, $29, -4
sw $t3, -320($30)
sw $t4, -308($30)
addiu $29, $29, -4
sw $t5, -324($30)
addiu $29, $29, -4
sw $t6, -328($30)
addiu $29, $29, -4
sw $t7, -332($30)
sw $t8, -132($30)
addiu $29, $29, -4
sw $t9, -336($30)
addiu $29, $29, -4
sw $s0, -340($30)
addiu $29, $29, -4
sw $s1, -344($30)
addiu $29, $29, -4
sw $s2, -348($30)
addiu $29, $29, -4
sw $s3, -352($30)
addiu $29, $29, -4
sw $s4, -356($30)
addiu $29, $29, -4
sw $s5, -360($30)
addiu $29, $29, -4
sw $s6, -364($30)
addiu $29, $29, -4
sw $s7, -368($30)
addiu $t0, $0, 115
lw $t1, -368($30)
sb $t0, 0($t1)
addiu $t2, $0, 0
lw $t4, -132($30)
lw $t3, 0($t4)
li $t5, 1
mul $t6, $t2, $t5
addu $t7, $t3, $t6
# s [ 0 ] = 'a' ; 

addiu $t8, $0, 97
sb $t8, 0($t7)
addiu $t9, $0, 1
lw $s0, 0($t4)
li $s1, 1
mul $s2, $t9, $s1
addu $s3, $s0, $s2
#s [ 1 ] = 101 ; 

addiu $s4, $0, 101
sb $s4, 0($s3)
la $s6, str0
li $s7, 0
addiu $29, $29, -4
sw $s7, 4($29)
addiu $29, $29, -4
sw $t0, -376($30)
sw $t1, -368($30)
addiu $29, $29, -4
sw $t2, -380($30)
addiu $29, $29, -4
sw $t3, -384($30)
sw $t4, -132($30)
addiu $29, $29, -4
sw $t5, -388($30)
addiu $29, $29, -4
sw $t6, -392($30)
addiu $29, $29, -4
sw $t7, -396($30)
addiu $29, $29, -4
sw $t8, -400($30)
addiu $29, $29, -4
sw $t9, -404($30)
addiu $29, $29, -4
sw $s0, -408($30)
addiu $29, $29, -4
sw $s1, -412($30)
addiu $29, $29, -4
sw $s2, -416($30)
addiu $29, $29, -4
sw $s3, -420($30)
addiu $29, $29, -4
sw $s4, -424($30)
addiu $29, $29, -4
sw $s5, -428($30)
addiu $29, $29, -4
sw $s6, -432($30)
addiu $29, $29, -4
sw $s7, -436($30)
addiu $t0, $29, 4
addiu $29, $29, -4
sw $t0, 4($29)
addiu $t1, $29, 4
lw $t2, -432($30)
sw $t2, 0($t1)
# CHAR * str = "string he" ; 

addiu $t3, $0, 0
move $v0, $t3
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -444($30)
addiu $29, $29, -4
sw $t1, -448($30)
sw $t2, -432($30)
addiu $29, $29, -4
sw $t3, -452($30)

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
