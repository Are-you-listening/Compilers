.data
heap: .space 4
.text
main:
jal function_main
li 	$v0, 10 #exit system call
syscall
function_factorial:
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

L4:
addiu $29, $29, -4
sw $t0, -100($30)
addiu $29, $29, -4
sw $t1, -104($30)
addiu $29, $29, -4
sw $t2, -108($30)
addiu $29, $29, -4
sw $t3, -112($30)
addiu $29, $29, -4
sw $t4, -116($30)
addiu $29, $29, -4
sw $t5, -120($30)
addiu $29, $29, -4
sw $t6, -124($30)
addiu $29, $29, -4
sw $t7, -128($30)
addiu $29, $29, -4
sw $t8, -132($30)
addiu $29, $29, -4
sw $t9, -136($30)
addiu $29, $29, -4
sw $s0, -140($30)
addiu $29, $29, -4
sw $s1, -144($30)
addiu $29, $29, -4
sw $s2, -148($30)
addiu $29, $29, -4
sw $s3, -152($30)
addiu $29, $29, -4
sw $s4, -156($30)
addiu $29, $29, -4
sw $s5, -160($30)
addiu $29, $29, -4
sw $s6, -164($30)
addiu $29, $29, -4
sw $s7, -168($30)
addiu $t0, $sp, 0
addiu $t2, $fp, 4
move $v0, $t2
addiu $29, $29, -4
sw $t0, -172($30)
addiu $29, $29, -4
sw $t1, -176($30)
addiu $29, $29, -4
sw $t2, -180($30)
lw $t0, -180($30)
lw $t1, 0($t0)
#}  INT factorial ( INT n ) { if ( n == 0 ) { 

addiu $t2, $0, 0
xor $t3, $t1, $t2
sltiu $t4, $t3, 1
move $v0, $t4
sw $t0, -180($30)
addiu $29, $29, -4
sw $t1, -184($30)
addiu $29, $29, -4
sw $t2, -188($30)
addiu $29, $29, -4
sw $t3, -192($30)
addiu $29, $29, -4
sw $t4, -196($30)
addiu $sp, $sp, 0
beq $v0, $zero, L6
addiu $sp, $sp, 0
addiu $sp, $sp, 0
j L5

L5:
addiu $t0, $sp, 0
addiu $t1, $0, 1
move $v0, $t1
j function_factorial_load
#return 1 ; 

addiu $29, $29, -4
sw $t0, -200($30)
addiu $29, $29, -4
sw $t1, -204($30)

L6:
addiu $t0, $sp, 0
lw $t1, -180($30)
lw $t2, 0($t1)
#} else { return n * factorial ( n - 1 ) ; 

lw $t3, 0($t1)
addiu $t4, $0, 1
sub $t5, $t3, $t4
addiu $29, $29, -4
sw $t5, 4($29)
jal function_factorial
lw $t5, 4($29)
addiu $29, $29, 4
move $t6, $v0
mul $t7, $t2, $t6
move $v0, $t7
j function_factorial_load
addiu $29, $29, -4
sw $t0, -200($30)
sw $t1, -180($30)
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

function_factorial_load:
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
L2:

L3:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 5
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#   INT factorial ( INT c ) ;  INT main ( ) { INT n = 5 ; 

li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
la $t8, function_factorial
sw $t8, 0($t7)
#INT ( * factorial_ptr ) ( INT ) = & factorial ; 

lw $s0, 0($t7)
#INT fact = factorial_ptr ( n ) ; 

addiu $s1, $0, 5
addiu $29, $29, -4
sw $s1, 4($29)
jalr $s0
lw $s1, 4($29)
addiu $29, $29, 4
move $s2, $v0
li $s3, 0
addiu $29, $29, -4
sw $s3, 4($29)
addiu $s4, $29, 4
sw $s2, 0($s4)
addiu $s5, $0, 0
move $v0, $s5
j function_main_load
#return 0 ; 

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
