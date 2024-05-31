.data
heap: .space 4
float...index_0: .float 3.14
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
addiu $29, $29, -4
sw $t1, 4($29)
addiu $t2, $29, 4
#   union NotTypeSafe { INT as_integer ; FLOAT as_float ; CHAR as_str [ 2 ] [ 2 ] ; } ;  INT main ( ) { INT k ; 

li $t4, 0
addiu $29, $29, -4
sw $t4, 4($29)
addiu $t5, $29, 4
#FLOAT s ; 

li $t7, 0
addiu $29, $29, -8
sb $t7, 4($29)
sb $t7, 5($29)
sb $t7, 6($29)
sb $t7, 7($29)
sb $t7, 8($29)
sb $t7, 9($29)
sb $t7, 10($29)
sb $t7, 11($29)
addiu $t8, $29, 4
addiu $29, $29, -8
sw $t8, 4($29)
addiu $t9, $29, 4
addiu $29, $29, -4
sw $t9, 4($29)
addiu $s0, $29, 4
#union NotTypeSafe safety ; 

li $s2, 0
addiu $29, $29, -8
sb $s2, 4($29)
sb $s2, 5($29)
sb $s2, 6($29)
sb $s2, 7($29)
sb $s2, 8($29)
sb $s2, 9($29)
sb $s2, 10($29)
sb $s2, 11($29)
addiu $s3, $29, 4
addiu $29, $29, -8
sw $s3, 4($29)
addiu $s4, $29, 4
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
addiu $29, $29, -4
sw $s5, 4($29)
addiu $s6, $29, 4
#union NotTypeSafe * safety_ptr ; 

# safety . as_integer = 5 ; 

addiu $s7, $0, 0
addiu $29, $29, -4
sw $t0, -156($30)
addiu $29, $29, -4
sw $t1, -160($30)
addiu $29, $29, -4
sw $t2, -164($30)
addiu $29, $29, -4
sw $t3, -168($30)
addiu $29, $29, -4
sw $t4, -172($30)
addiu $29, $29, -4
sw $t5, -176($30)
addiu $29, $29, -4
sw $t6, -180($30)
addiu $29, $29, -4
sw $t7, -184($30)
addiu $29, $29, -4
sw $t8, -188($30)
addiu $29, $29, -4
sw $t9, -192($30)
addiu $29, $29, -4
sw $s0, -196($30)
addiu $29, $29, -4
sw $s1, -200($30)
addiu $29, $29, -4
sw $s2, -204($30)
addiu $29, $29, -4
sw $s3, -208($30)
addiu $29, $29, -4
sw $s4, -212($30)
addiu $29, $29, -4
sw $s5, -216($30)
addiu $29, $29, -4
sw $s6, -220($30)
addiu $29, $29, -4
sw $s7, -224($30)
lw $t1, -196($30)
lw $t0, 0($t1)
li $t2, 0
addu $t3, $t0, $t2
lw $t4, 0($t3)
addiu $t5, $0, 5
sw $t5, 0($t4)
#k = safety . as_integer ; 

addiu $t6, $0, 0
lw $t7, 0($t1)
li $t8, 0
addu $t9, $t7, $t8
lw $s0, 0($t9)
lw $s1, 0($s0)
lw $s2, -164($30)
sw $s1, 0($s2)
# safety_ptr -> as_float = 3.14 ; 

lw $s3, -220($30)
lw $s4, 0($s3)
addiu $s5, $0, 0
lw $s6, 0($s4)
li $s7, 0
addiu $29, $29, -4
sw $t0, -228($30)
sw $t1, -196($30)
addiu $29, $29, -4
sw $t2, -232($30)
addiu $29, $29, -4
sw $t3, -236($30)
addiu $29, $29, -4
sw $t4, -240($30)
addiu $29, $29, -4
sw $t5, -244($30)
addiu $29, $29, -4
sw $t6, -248($30)
addiu $29, $29, -4
sw $t7, -252($30)
addiu $29, $29, -4
sw $t8, -256($30)
addiu $29, $29, -4
sw $t9, -260($30)
addiu $29, $29, -4
sw $s0, -264($30)
addiu $29, $29, -4
sw $s1, -268($30)
sw $s2, -164($30)
sw $s3, -220($30)
addiu $29, $29, -4
sw $s4, -272($30)
addiu $29, $29, -4
sw $s5, -276($30)
addiu $29, $29, -4
sw $s6, -280($30)
addiu $29, $29, -4
sw $s7, -284($30)
lw $t1, -280($30)
lw $t2, -284($30)
addu $t0, $t1, $t2
lw $t3, 0($t0)
l.s $f0, float...index_0
mfc1 $t4, $f0
sw $t4, 0($t3)
# INT q = safety_ptr -> as_integer ; 

lw $t6, -220($30)
lw $t7, 0($t6)
addiu $t8, $0, 0
lw $t9, 0($t7)
li $s0, 0
addu $s1, $t9, $s0
lw $s2, 0($s1)
lw $s3, 0($s2)
li $s4, 0
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
sw $s3, 0($s5)
# ( * safety_ptr ) . as_str [ 0 ] [ 0 ] = 'a' ; 

lw $s6, 0($t6)
addiu $s7, $0, 0
addiu $29, $29, -4
sw $t0, -292($30)
sw $t1, -280($30)
sw $t2, -284($30)
addiu $29, $29, -4
sw $t3, -296($30)
addiu $29, $29, -4
sw $t4, -300($30)
addiu $29, $29, -4
sw $t5, -304($30)
sw $t6, -220($30)
addiu $29, $29, -4
sw $t7, -308($30)
addiu $29, $29, -4
sw $t8, -312($30)
addiu $29, $29, -4
sw $t9, -316($30)
addiu $29, $29, -4
sw $s0, -320($30)
addiu $29, $29, -4
sw $s1, -324($30)
addiu $29, $29, -4
sw $s2, -328($30)
addiu $29, $29, -4
sw $s3, -332($30)
addiu $29, $29, -4
sw $s4, -336($30)
addiu $29, $29, -4
sw $s5, -340($30)
addiu $29, $29, -4
sw $s6, -344($30)
addiu $29, $29, -4
sw $s7, -348($30)
lw $t1, -344($30)
lw $t0, 0($t1)
li $t2, 0
addu $t3, $t0, $t2
addiu $t4, $t3, 4
addiu $t5, $t3, 8
li $a0, 12
li $v0, 9
addiu $t8, $v0, 0
sw $t4, 0($t8)
sw $t5, 4($t8)
li $a0, 4
li $v0, 9
addiu $s1, $v0, 0

jr $ra
