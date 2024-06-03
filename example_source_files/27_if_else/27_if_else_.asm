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
addiu $t1, $0, 1
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#   INT main ( ) {  INT a = 1 ; 

addiu $t5, $0, 1
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#INT b = 1 ; 

addiu $t8, $0, 1
sw $t8, 0($t3)
# a = 1 ; 

addiu $t9, $0, 0
sw $t9, 0($t7)
#b = 0 ; 

# if ( b ) { 

lw $s0, 0($t7)
li $s1, 0
xor $s2, $s0, $s1
sltiu $s3, $s2, 1
sltiu $s4, $s3, 1
move $v0, $s4
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
addiu $29, $29, -4
sw $s3, -164($30)
addiu $29, $29, -4
sw $s4, -168($30)
addiu $sp, $sp, 0
beq $v0, $zero, L4
addiu $sp, $sp, 0
addiu $sp, $sp, 0
j L3

L3:
addiu $t0, $sp, 0
addiu $t2, $0, 0
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
sw $t2, 0($t4)
#INT x = 0 ; 

addiu $29, $29, -4
sw $t0, -176($30)
addiu $29, $29, -4
sw $t1, -180($30)
addiu $29, $29, -4
sw $t2, -184($30)
addiu $29, $29, -4
sw $t3, -188($30)
addiu $29, $29, -4
sw $t4, -192($30)
addiu $sp, $sp, 0
j L5

L4:
addiu $t0, $sp, 0
addiu $t2, $0, 1
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
sw $t2, 0($t4)
#} else { INT x = 1 ; 

addiu $29, $29, -4
sw $t0, -176($30)
addiu $29, $29, -4
sw $t1, -180($30)
addiu $29, $29, -4
sw $t2, -184($30)
addiu $29, $29, -4
sw $t3, -188($30)
addiu $29, $29, -4
sw $t4, -192($30)
addiu $sp, $sp, 0
j L5

L5:
addiu $t0, $sp, 0
lw $t1, -140($30)
lw $t2, 0($t1)
#}  if ( 0 ) { INT y = 0 ; } else if ( ! b ) { 

sltiu $t3, $t2, 1
addiu $t5, $0, 1
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#INT y = 1 ; 

addiu $t8, $0, 0
move $v0, $t8
j function_main_load
#}  return 0 ; 

addiu $29, $29, -4
sw $t0, -200($30)
sw $t1, -140($30)
addiu $29, $29, -4
sw $t2, -204($30)
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
