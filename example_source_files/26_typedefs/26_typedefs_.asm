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
addiu $t1, $0, 1
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# typedef INT bool ; typedef CHAR appel ; typedef const CHAR peer ; typedef const bool Cbool ;  INT main ( ) { bool x = 1 ; 

addiu $t5, $0, 0
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#bool y = 0 ; 

addiu $t9, $0, 0
li $s0, 0
addiu $29, $29, -4
sw $s0, 4($29)
addiu $s1, $29, 4
sw $t9, 0($s1)
#INT z = x && y ; 

addiu $s3, $0, 5
li $s4, 0
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
sb $s3, 0($s5)
# appel a = 5 ; 

addiu $s7, $0, 4
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
li $t0, 0
addiu $29, $29, -4
sw $t0, 4($29)
addiu $t1, $29, 4
lw $t2, -188($30)
sb $t2, 0($t1)
#peer b = 4 ; 

addiu $t4, $0, 1
li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
sw $t4, 0($t6)
#Cbool c = 1 ; 

lw $t8, -148($30)
lw $t9, 0($t8)
# bool boo = y * z * 57809 ; 

addiu $s0, $0, 0
mul $s1, $t9, $s0
ori $s2, $0 57809
mul $s3, $s1, $s2
li $s4, 0
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
sw $s3, 0($s5)
addiu $s6, $0, 0
move $v0, $s6
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -204($30)
addiu $29, $29, -4
sw $t1, -208($30)
sw $t2, -188($30)
addiu $29, $29, -4
sw $t3, -212($30)
addiu $29, $29, -4
sw $t4, -216($30)
addiu $29, $29, -4
sw $t5, -220($30)
addiu $29, $29, -4
sw $t6, -224($30)
addiu $29, $29, -4
sw $t7, -228($30)
sw $t8, -148($30)
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
addiu $29, $29, -4
sw $s4, -252($30)
addiu $29, $29, -4
sw $s5, -256($30)
addiu $29, $29, -4
sw $s6, -260($30)

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
