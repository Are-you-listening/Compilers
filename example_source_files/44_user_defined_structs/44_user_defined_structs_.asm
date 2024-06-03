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
li $t1, 0
addiu $29, $29, -12
sw $t1, 4($29)
sw $t1, 8($29)
addiu $t2, $29, 4
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
# struct kaas { INT melk ; INT fermtented ; } ;  INT main ( ) { struct kaas ementaler ; 

addiu $t4, $0, 0
lw $t5, 0($t3)
li $t6, 0
addu $t7, $t5, $t6
#ementaler . melk = 1 ; 

addiu $t8, $0, 1
sw $t8, 0($t7)
addiu $t9, $0, 1
lw $s0, 0($t3)
li $s1, 4
addu $s2, $s0, $s1
#ementaler . fermtented = 18 ; 

addiu $s3, $0, 18
sw $s3, 0($s2)
li $s5, 0
addiu $29, $29, -12
sw $s5, 4($29)
sw $s5, 8($29)
addiu $s6, $29, 4
addiu $29, $29, -4
sw $s6, 4($29)
addiu $s7, $29, 4
# struct kaas gouda ; 

addiu $29, $29, -4
sw $t0, -136($30)
addiu $29, $29, -4
sw $t1, -140($30)
addiu $29, $29, -4
sw $t2, -144($30)
addiu $29, $29, -4
sw $t3, -148($30)
addiu $29, $29, -4
sw $t4, -152($30)
addiu $29, $29, -4
sw $t5, -156($30)
addiu $29, $29, -4
sw $t6, -160($30)
addiu $29, $29, -4
sw $t7, -164($30)
addiu $29, $29, -4
sw $t8, -168($30)
addiu $29, $29, -4
sw $t9, -172($30)
addiu $29, $29, -4
sw $s0, -176($30)
addiu $29, $29, -4
sw $s1, -180($30)
addiu $29, $29, -4
sw $s2, -184($30)
addiu $29, $29, -4
sw $s3, -188($30)
addiu $29, $29, -4
sw $s4, -192($30)
addiu $29, $29, -4
sw $s5, -196($30)
addiu $29, $29, -4
sw $s6, -200($30)
addiu $29, $29, -4
sw $s7, -204($30)
addiu $t0, $0, 0
lw $t2, -204($30)
lw $t1, 0($t2)
li $t3, 0
addu $t4, $t1, $t3
#gouda . melk = 7 ; 

addiu $t5, $0, 7
sw $t5, 0($t4)
addiu $t6, $0, 1
lw $t7, 0($t2)
li $t8, 4
addu $t9, $t7, $t8
#gouda . fermtented = 9 ; 

addiu $s0, $0, 9
sw $s0, 0($t9)
addiu $s1, $0, 0
move $v0, $s1
j function_main_load
# return 0 ; 

addiu $29, $29, -4
sw $t0, -208($30)
addiu $29, $29, -4
sw $t1, -212($30)
sw $t2, -204($30)
addiu $29, $29, -4
sw $t3, -216($30)
addiu $29, $29, -4
sw $t4, -220($30)
addiu $29, $29, -4
sw $t5, -224($30)
addiu $29, $29, -4
sw $t6, -228($30)
addiu $29, $29, -4
sw $t7, -232($30)
addiu $29, $29, -4
sw $t8, -236($30)
addiu $29, $29, -4
sw $t9, -240($30)
addiu $29, $29, -4
sw $s0, -244($30)
addiu $29, $29, -4
sw $s1, -248($30)

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
