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
addiu $29, $29, -8
sw $t1, 4($29)
addiu $t2, $29, 4
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
#   struct cheese { INT milk ; } ;  INT main ( ) { struct cheese gouda ; 

addiu $t4, $0, 0
lw $t5, 0($t3)
li $t6, 0
addu $t7, $t5, $t6
#gouda . milk = 3 ; 

addiu $t8, $0, 3
sw $t8, 0($t7)
# struct cheese * gouda_ptr = ( struct cheese * ) malloc ( sizeof ( struct cheese ) ) ; 

addiu $29, $29, -4
sw $t0, -116($30)
addiu $29, $29, -4
sw $t1, -120($30)
addiu $29, $29, -4
sw $t2, -124($30)
addiu $29, $29, -4
sw $t3, -128($30)
addiu $29, $29, -4
sw $t4, -132($30)
addiu $29, $29, -4
sw $t5, -136($30)
addiu $29, $29, -4
sw $t6, -140($30)
addiu $29, $29, -4
sw $t7, -144($30)
addiu $29, $29, -4
sw $t8, -148($30)
addiu $29, $29, -4
sw $t9, -152($30)
addiu $29, $29, -4
sw $s0, -156($30)
addiu $29, $29, -4
sw $s1, -160($30)
addiu $29, $29, -4
sw $s2, -164($30)
addiu $29, $29, -4
sw $s3, -168($30)
addiu $29, $29, -4
sw $s4, -172($30)
addiu $29, $29, -4
sw $s5, -176($30)
addiu $29, $29, -4
sw $s6, -180($30)
addiu $29, $29, -4
sw $s7, -184($30)
addiu $t0, $0, 4
addiu $29, $29, -4
sw $t0, 4($29)
jal function_malloc
lw $t0, 4($29)
addiu $29, $29, 4
move $t1, $v0
addiu $t2, $t1, 0
li $a0, 8
li $v0, 9
syscall
addiu $t5, $v0, 0
sw $t2, 0($t5)
li $a0, 4
li $v0, 9
syscall
addiu $t8, $v0, 0
sw $t5, 0($t8)
li $t9, 0
addiu $29, $29, -8
sw $t9, 4($29)
addiu $s0, $29, 4
addiu $29, $29, -4
sw $s0, 4($29)
addiu $s1, $29, 4
addiu $29, $29, -4
sw $s1, 4($29)
addiu $s2, $29, 4
sw $t8, 0($s2)
# gouda_ptr = realloc ( gouda_ptr , sizeof ( struct cheese ) * 2 ) ; 

addiu $29, $29, -4
sw $t0, -204($30)
addiu $29, $29, -4
sw $t1, -208($30)
addiu $29, $29, -4
sw $t2, -212($30)
addiu $29, $29, -4
sw $a0, -216($30)
addiu $29, $29, -4
sw $v0, -220($30)
addiu $29, $29, -4
sw $t5, -224($30)
addiu $29, $29, -4
sw $a0, -228($30)
addiu $29, $29, -4
sw $v0, -232($30)
addiu $29, $29, -4
sw $t8, -236($30)
addiu $29, $29, -4
sw $t9, -240($30)
addiu $29, $29, -4
sw $s0, -244($30)
addiu $29, $29, -4
sw $s1, -248($30)
addiu $29, $29, -4
sw $s2, -252($30)
addiu $29, $29, -4
sw $s3, -256($30)
addiu $29, $29, -4
sw $s4, -260($30)
addiu $29, $29, -4
sw $s5, -264($30)
addiu $29, $29, -4
sw $s6, -268($30)
addiu $29, $29, -4
sw $s7, -272($30)
lw $t1, -252($30)
lw $t0, 0($t1)
lw $t2, 0($t0)
addiu $t3, $0, 8
addiu $29, $29, -8
sw $t2, 4($29)
sw $t3, 8($29)
jal function_realloc
lw $t2, 4($29)
lw $t3, 8($29)
addiu $29, $29, 8
move $t4, $v0
addiu $t5, $t4, 0
li $a0, 8
li $v0, 9
syscall
addiu $t8, $v0, 0
sw $t5, 0($t8)
li $a0, 4
li $v0, 9
syscall
addiu $s1, $v0, 0
sw $t8, 0($s1)
sw $s1, 0($t1)
# free ( gouda_ptr ) ; 

addiu $29, $29, -4
sw $t0, -276($30)
sw $t1, -252($30)
addiu $29, $29, -4
sw $t2, -280($30)
addiu $29, $29, -4
sw $t3, -284($30)
addiu $29, $29, -4
sw $t4, -288($30)
addiu $29, $29, -4
sw $t5, -292($30)
addiu $29, $29, -4
sw $a0, -296($30)
addiu $29, $29, -4
sw $v0, -300($30)
addiu $29, $29, -4
sw $t8, -304($30)
addiu $29, $29, -4
sw $a0, -308($30)
addiu $29, $29, -4
sw $v0, -312($30)
addiu $29, $29, -4
sw $s1, -316($30)
addiu $29, $29, -4
sw $s2, -320($30)
addiu $29, $29, -4
sw $s3, -324($30)
addiu $29, $29, -4
sw $s4, -328($30)
addiu $29, $29, -4
sw $s5, -332($30)
addiu $29, $29, -4
sw $s6, -336($30)
addiu $29, $29, -4
sw $s7, -340($30)
lw $t1, -252($30)
lw $t0, 0($t1)
lw $t2, 0($t0)
addiu $29, $29, -4
sw $t2, 4($29)
jal function_free
lw $t2, 4($29)
addiu $29, $29, 4
move $t3, $v0
addiu $29, $29, -4
sw $t0, -344($30)
sw $t1, -252($30)
addiu $29, $29, -4
sw $t2, -348($30)
addiu $29, $29, -4
sw $t3, -352($30)
addiu $29, $29, -4
sw $t4, -356($30)
addiu $29, $29, -4
sw $t5, -360($30)
addiu $29, $29, -4
sw $t6, -364($30)
addiu $29, $29, -4
sw $t7, -368($30)
addiu $29, $29, -4
sw $t8, -372($30)
addiu $29, $29, -4
sw $t9, -376($30)
addiu $29, $29, -4
sw $s0, -380($30)
addiu $29, $29, -4
sw $s1, -384($30)
addiu $29, $29, -4
sw $s2, -388($30)
addiu $29, $29, -4
sw $s3, -392($30)
addiu $29, $29, -4
sw $s4, -396($30)
addiu $29, $29, -4
sw $s5, -400($30)
addiu $29, $29, -4
sw $s6, -404($30)
addiu $29, $29, -4
sw $s7, -408($30)
addiu $t0, $0, 2
# CHAR * z = calloc ( 2 , sizeof ( CHAR ) ) ; 

addiu $t1, $0, 1
addiu $29, $29, -8
sw $t0, 4($29)
sw $t1, 8($29)
jal function_calloc
lw $t0, 4($29)
lw $t1, 8($29)
addiu $29, $29, 8
move $t2, $v0
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
addiu $29, $29, -4
sw $t4, 4($29)
addiu $t5, $29, 4
sw $t2, 0($t5)
addiu $t6, $0, 0
lw $t7, 0($t5)
li $t8, 1
mul $t9, $t6, $t8
addu $s0, $t7, $t9
#z [ 0 ] = 'O' ; 

addiu $s1, $0, 79
sb $s1, 0($s0)
addiu $s2, $0, 1
lw $s3, 0($t5)
li $s4, 1
mul $s5, $s2, $s4
addu $s6, $s3, $s5
#z [ 1 ] = 'Y' ; 

addiu $s7, $0, 89
sb $s7, 0($s6)
addiu $29, $29, -4
sw $t0, -420($30)
addiu $29, $29, -4
sw $t1, -424($30)
addiu $29, $29, -4
sw $t2, -428($30)
addiu $29, $29, -4
sw $t3, -432($30)
addiu $29, $29, -4
sw $t4, -436($30)
addiu $29, $29, -4
sw $t5, -440($30)
addiu $29, $29, -4
sw $t6, -444($30)
addiu $29, $29, -4
sw $t7, -448($30)
addiu $29, $29, -4
sw $t8, -452($30)
addiu $29, $29, -4
sw $t9, -456($30)
addiu $29, $29, -4
sw $s0, -460($30)
addiu $29, $29, -4
sw $s1, -464($30)
addiu $29, $29, -4
sw $s2, -468($30)
addiu $29, $29, -4
sw $s3, -472($30)
addiu $29, $29, -4
sw $s4, -476($30)
addiu $29, $29, -4
sw $s5, -480($30)
addiu $29, $29, -4
sw $s6, -484($30)
addiu $29, $29, -4
sw $s7, -488($30)
lw $t1, -440($30)
lw $t0, 0($t1)
# free ( z ) ; 

addiu $29, $29, -4
sw $t0, 4($29)
jal function_free
lw $t0, 4($29)
addiu $29, $29, 4
move $t2, $v0
addiu $t3, $0, 0
move $v0, $t3
j function_main_load
# return 0 ; 

addiu $29, $29, -4
sw $t0, -492($30)
sw $t1, -440($30)
addiu $29, $29, -4
sw $t2, -496($30)
addiu $29, $29, -4
sw $t3, -500($30)

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
function_malloc:
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
L3:

L4:
lw $4, 4($30)
li $2, 9
syscall

function_malloc_load:
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
function_realloc:
sw $30, 0($29)
add $30, $29, $0
addiu $29, $29, -100
sw $t0, -4($30)
sw $t1, -8($30)
sw $t2, -12($30)
sw $a0, -16($30)
sw $v0, -20($30)
sw $t5, -24($30)
sw $a0, -28($30)
sw $v0, -32($30)
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
L5:

L6:
lw $t0, 4($30)
lw $t1, 8($30)
move $4, $t1
li $2, 9
syscall
j L7

L7:
addiu $t1, $t1, -1
addiu $t8, $2, 0
addu $t9, $t8, $t1
addu $s0, $t0, $t1
lb $s1, 0($s0)
sb $s1, 0($t9)
li $s2, 0
bne $s2, $t1, L7

function_realloc_load:
lw $t0, -4($30)
lw $t1, -8($30)
lw $t2, -12($30)
lw $a0, -16($30)
lw $v0, -20($30)
lw $t5, -24($30)
lw $a0, -28($30)
lw $v0, -32($30)
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
function_free:
sw $30, 0($29)
add $30, $29, $0
addiu $29, $29, -100
sw $t0, -4($30)
sw $t1, -8($30)
sw $t2, -12($30)
sw $t3, -16($30)
sw $t4, -20($30)
sw $t5, -24($30)
sw $a0, -28($30)
sw $v0, -32($30)
sw $t8, -36($30)
sw $a0, -40($30)
sw $v0, -44($30)
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
L8:

function_free_load:
lw $t0, -4($30)
lw $t1, -8($30)
lw $t2, -12($30)
lw $t3, -16($30)
lw $t4, -20($30)
lw $t5, -24($30)
lw $a0, -28($30)
lw $v0, -32($30)
lw $t8, -36($30)
lw $a0, -40($30)
lw $v0, -44($30)
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
function_calloc:
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
L9:

L10:
lw $t0, 4($30)
lw $t1, 8($30)
mul $t2, $t0, $t1
move $4, $t2
li $2, 9
syscall
j L11

L11:
addiu $t2, $t2, -1
addiu $t5, $2, 0
addu $t6, $t5, $t2
li $t7, 0
sb $t7, 0($t6)
bne $t7, $t2, L11

function_calloc_load:
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
