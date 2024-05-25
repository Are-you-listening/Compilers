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
addiu $t2, $t1, 8
addiu $29, $29, -8
addiu $t3, $sp, 4
sw $t2, 0($t3)
addiu $29, $29, -4
sw $t3, 4($sp)
addiu $t4, $sp, 4
li $t5, 0
addiu $29, $29, -8
sw $t5, 4($29)
addiu $t6, $29, 4
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
addiu $29, $29, -4
sw $t7, 4($29)
addiu $t8, $29, 4
sw $t4, 0($t8)
# gouda_ptr = realloc ( gouda_ptr , sizeof ( struct cheese ) * 2 ) ; 

addiu $29, $29, -4
sw $t0, -216($30)
addiu $29, $29, -4
sw $t1, -220($30)
addiu $29, $29, -4
sw $t2, -224($30)
addiu $29, $29, -4
sw $t3, -228($30)
addiu $29, $29, -4
sw $t4, -232($30)
addiu $29, $29, -4
sw $t5, -236($30)
addiu $29, $29, -4
sw $t6, -240($30)
addiu $29, $29, -4
sw $t7, -244($30)
addiu $29, $29, -4
sw $t8, -248($30)
addiu $29, $29, -4
sw $t9, -252($30)
addiu $29, $29, -4
sw $s0, -256($30)
addiu $29, $29, -4
sw $s1, -260($30)
addiu $29, $29, -4
sw $s2, -264($30)
addiu $29, $29, -4
sw $s3, -268($30)
addiu $29, $29, -4
sw $s4, -272($30)
addiu $29, $29, -4
sw $s5, -276($30)
addiu $29, $29, -4
sw $s6, -280($30)
addiu $29, $29, -4
sw $s7, -284($30)
lw $t1, -248($30)
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
addiu $t5, $t4, 8
addiu $29, $29, -8
addiu $t6, $sp, 4
sw $t5, 0($t6)
addiu $29, $29, -4
sw $t6, 4($sp)
addiu $t7, $sp, 4
sw $t7, 0($t1)
# free ( gouda_ptr ) ; 

addiu $29, $29, -4
sw $t0, -300($30)
sw $t1, -248($30)
addiu $29, $29, -4
sw $t2, -304($30)
addiu $29, $29, -4
sw $t3, -308($30)
addiu $29, $29, -4
sw $t4, -312($30)
addiu $29, $29, -4
sw $t5, -316($30)
addiu $29, $29, -4
sw $t6, -320($30)
addiu $29, $29, -4
sw $t7, -324($30)
addiu $29, $29, -4
sw $t8, -328($30)
addiu $29, $29, -4
sw $t9, -332($30)
addiu $29, $29, -4
sw $s0, -336($30)
addiu $29, $29, -4
sw $s1, -340($30)
addiu $29, $29, -4
sw $s2, -344($30)
addiu $29, $29, -4
sw $s3, -348($30)
addiu $29, $29, -4
sw $s4, -352($30)
addiu $29, $29, -4
sw $s5, -356($30)
addiu $29, $29, -4
sw $s6, -360($30)
addiu $29, $29, -4
sw $s7, -364($30)
lw $t1, -248($30)
lw $t0, 0($t1)
lw $t2, 0($t0)
addiu $29, $29, -4
sw $t2, 4($29)
jal function_free
lw $t2, 4($29)
addiu $29, $29, 4
move $t3, $v0
addiu $29, $29, -4
sw $t0, -368($30)
sw $t1, -248($30)
addiu $29, $29, -4
sw $t2, -372($30)
addiu $29, $29, -4
sw $t3, -376($30)
addiu $29, $29, -4
sw $t4, -380($30)
addiu $29, $29, -4
sw $t5, -384($30)
addiu $29, $29, -4
sw $t6, -388($30)
addiu $29, $29, -4
sw $t7, -392($30)
addiu $29, $29, -4
sw $t8, -396($30)
addiu $29, $29, -4
sw $t9, -400($30)
addiu $29, $29, -4
sw $s0, -404($30)
addiu $29, $29, -4
sw $s1, -408($30)
addiu $29, $29, -4
sw $s2, -412($30)
addiu $29, $29, -4
sw $s3, -416($30)
addiu $29, $29, -4
sw $s4, -420($30)
addiu $29, $29, -4
sw $s5, -424($30)
addiu $29, $29, -4
sw $s6, -428($30)
addiu $29, $29, -4
sw $s7, -432($30)
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
sw $t0, -444($30)
addiu $29, $29, -4
sw $t1, -448($30)
addiu $29, $29, -4
sw $t2, -452($30)
addiu $29, $29, -4
sw $t3, -456($30)
addiu $29, $29, -4
sw $t4, -460($30)
addiu $29, $29, -4
sw $t5, -464($30)
addiu $29, $29, -4
sw $t6, -468($30)
addiu $29, $29, -4
sw $t7, -472($30)
addiu $29, $29, -4
sw $t8, -476($30)
addiu $29, $29, -4
sw $t9, -480($30)
addiu $29, $29, -4
sw $s0, -484($30)
addiu $29, $29, -4
sw $s1, -488($30)
addiu $29, $29, -4
sw $s2, -492($30)
addiu $29, $29, -4
sw $s3, -496($30)
addiu $29, $29, -4
sw $s4, -500($30)
addiu $29, $29, -4
sw $s5, -504($30)
addiu $29, $29, -4
sw $s6, -508($30)
addiu $29, $29, -4
sw $s7, -512($30)
lw $t1, -464($30)
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
sw $t0, -516($30)
sw $t1, -464($30)
addiu $29, $29, -4
sw $t2, -520($30)
addiu $29, $29, -4
sw $t3, -524($30)

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
addiu $t4, $2, 0
addu $t5, $t4, $t1
addu $t6, $t0, $t1
lb $t7, 0($t6)
sb $t7, 0($t5)
li $t8, 0
bne $t8, $t1, L7

function_realloc_load:
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
L8:

function_free_load:
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
