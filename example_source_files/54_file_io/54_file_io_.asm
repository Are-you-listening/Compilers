.data
heap: .space 4
str0: .asciiz  "../includes/io.txt" 
str1: .asciiz  "r" 
str2: .asciiz  "w" 
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
addiu $29, $29, -4
sw $t0, -104($30)
addiu $29, $29, -4
sw $t1, -108($30)
addiu $29, $29, -4
sw $t2, -112($30)
addiu $29, $29, -4
sw $t3, -116($30)
addiu $29, $29, -4
sw $t4, -120($30)
addiu $29, $29, -4
sw $t5, -124($30)
addiu $29, $29, -4
sw $t6, -128($30)
addiu $29, $29, -4
sw $t7, -132($30)
addiu $29, $29, -4
sw $t8, -136($30)
addiu $29, $29, -4
sw $t9, -140($30)
addiu $29, $29, -4
sw $s0, -144($30)
addiu $29, $29, -4
sw $s1, -148($30)
addiu $29, $29, -4
sw $s2, -152($30)
addiu $29, $29, -4
sw $s3, -156($30)
addiu $29, $29, -4
sw $s4, -160($30)
addiu $29, $29, -4
sw $s5, -164($30)
addiu $29, $29, -4
sw $s6, -168($30)
addiu $29, $29, -4
sw $s7, -172($30)
addiu $t0, $0, 50
#   INT main ( ) { CHAR * buf = calloc ( 50 , sizeof ( CHAR ) ) ; 

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
addiu $29, $29, -4
sw $t0, -184($30)
addiu $29, $29, -4
sw $t1, -188($30)
addiu $29, $29, -4
sw $t2, -192($30)
addiu $29, $29, -4
sw $t3, -196($30)
addiu $29, $29, -4
sw $t4, -200($30)
addiu $29, $29, -4
sw $t5, -204($30)
addiu $29, $29, -4
sw $t6, -208($30)
addiu $29, $29, -4
sw $t7, -212($30)
addiu $29, $29, -4
sw $t8, -216($30)
addiu $29, $29, -4
sw $t9, -220($30)
addiu $29, $29, -4
sw $s0, -224($30)
addiu $29, $29, -4
sw $s1, -228($30)
addiu $29, $29, -4
sw $s2, -232($30)
addiu $29, $29, -4
sw $s3, -236($30)
addiu $29, $29, -4
sw $s4, -240($30)
addiu $29, $29, -4
sw $s5, -244($30)
addiu $29, $29, -4
sw $s6, -248($30)
addiu $29, $29, -4
sw $s7, -252($30)
la $t0, str0
# FILE * fp = fopen ( "../includes/io.txt" , "r" ) ; 

la $t1, str1
addiu $29, $29, -8
sw $t0, 4($29)
sw $t1, 8($29)
jal function_fopen
lw $t0, 4($29)
lw $t1, 8($29)
addiu $29, $29, 8
move $t2, $v0
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t5, $29, 4
addiu $29, $29, -20
sw $t4, 4($29)
sw $t5, 8($29)
addiu $t6, $29, 4
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
addiu $29, $29, -4
sw $t7, 4($29)
addiu $t8, $29, 4
sw $t2, 0($t8)
addiu $29, $29, -4
sw $t0, -292($30)
addiu $29, $29, -4
sw $t1, -296($30)
addiu $29, $29, -4
sw $t2, -300($30)
addiu $29, $29, -4
sw $t3, -304($30)
addiu $29, $29, -4
sw $t4, -308($30)
addiu $29, $29, -4
sw $t5, -312($30)
addiu $29, $29, -4
sw $t6, -316($30)
addiu $29, $29, -4
sw $t7, -320($30)
addiu $29, $29, -4
sw $t8, -324($30)
addiu $29, $29, -4
sw $t9, -328($30)
addiu $29, $29, -4
sw $s0, -332($30)
addiu $29, $29, -4
sw $s1, -336($30)
addiu $29, $29, -4
sw $s2, -340($30)
addiu $29, $29, -4
sw $s3, -344($30)
addiu $29, $29, -4
sw $s4, -348($30)
addiu $29, $29, -4
sw $s5, -352($30)
addiu $29, $29, -4
sw $s6, -356($30)
addiu $29, $29, -4
sw $s7, -360($30)
lw $t0, -204($30)
lw $t1, 0($t0)
# fgets ( buf , 50 , fp ) ; 

addiu $t2, $0, 50
lw $t3, -324($30)
lw $t4, 0($t3)
addiu $29, $29, -12
sw $t1, 4($29)
sw $t2, 8($29)
sw $t4, 12($29)
jal function_fgets
lw $t1, 4($29)
lw $t2, 8($29)
lw $t4, 12($29)
addiu $29, $29, 12
move $t5, $v0
la $t6, str0
# fp = fopen ( "../includes/io.txt" , "w" ) ; 

la $t7, str2
addiu $29, $29, -8
sw $t6, 4($29)
sw $t7, 8($29)
jal function_fopen
lw $t6, 4($29)
lw $t7, 8($29)
addiu $29, $29, 8
move $t8, $v0
sw $t8, 0($t3)
sw $t0, -204($30)
addiu $29, $29, -4
sw $t1, -364($30)
addiu $29, $29, -4
sw $t2, -368($30)
sw $t3, -324($30)
addiu $29, $29, -4
sw $t4, -372($30)
addiu $29, $29, -4
sw $t5, -376($30)
addiu $29, $29, -4
sw $t6, -380($30)
addiu $29, $29, -4
sw $t7, -384($30)
addiu $29, $29, -4
sw $t8, -388($30)
addiu $29, $29, -4
sw $t9, -392($30)
addiu $29, $29, -4
sw $s0, -396($30)
addiu $29, $29, -4
sw $s1, -400($30)
addiu $29, $29, -4
sw $s2, -404($30)
addiu $29, $29, -4
sw $s3, -408($30)
addiu $29, $29, -4
sw $s4, -412($30)
addiu $29, $29, -4
sw $s5, -416($30)
addiu $29, $29, -4
sw $s6, -420($30)
addiu $29, $29, -4
sw $s7, -424($30)
lw $t1, -204($30)
lw $t0, 0($t1)
# fputs ( buf , fp ) ; 

lw $t2, -324($30)
lw $t3, 0($t2)
addiu $29, $29, -8
sw $t0, 4($29)
sw $t3, 8($29)
jal function_fputs
lw $t0, 4($29)
lw $t3, 8($29)
addiu $29, $29, 8
move $t4, $v0
addiu $29, $29, -4
sw $t0, -428($30)
sw $t1, -204($30)
sw $t2, -324($30)
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
lw $t1, -324($30)
lw $t0, 0($t1)
# fclose ( fp ) ; 

addiu $29, $29, -4
sw $t0, 4($29)
jal function_fclose
lw $t0, 4($29)
addiu $29, $29, 4
move $t2, $v0
addiu $t3, $0, 0
move $v0, $t3
j function_main_load
# return 0 ; 

addiu $29, $29, -4
sw $t0, -492($30)
sw $t1, -324($30)
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
L3:

L4:
lw $t0, 4($30)
lw $t1, 8($30)
mul $t2, $t0, $t1
move $4, $t2
li $2, 9
syscall
j L5

L5:
addiu $t2, $t2, -1
addiu $t5, $2, 0
addu $t6, $t5, $t2
li $t7, 0
sb $t7, 0($t6)
bne $t7, $t2, L5

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
function_fopen:
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
L6:

L7:
lw $t0, 4($30)
lw $t1, 8($30)
lb $t2, 0($t1)
li $t3, 114
beq $t2, $t3, L8
li $t4, 97
beq $t2, $t4, L10
li $t5, 119
beq $t2, $t5, L9

L8:
li $t2, 0
j L11

L9:
li $t2, 1
j L11

L10:
li $t2, 9
j L11

L11:
li $6, 0
move $5, $t2
move $4, $t0
li $2, 13
syscall
addiu $s1, $2, 0
move $2, $s1

function_fopen_load:
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
function_fgets:
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
L12:

L13:
lw $t0, 4($30)
lw $t1, 8($30)
addiu $t1, $t1, -1
lw $t3, 12($30)
move $4, $t3
move $5, $t0
move $6, $t1
li $2, 14
syscall

function_fgets_load:
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
function_fputs:
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
L14:

L15:
lw $t0, 4($30)
li $t1, 0
lw $t2, 8($30)
j L16

L16:
move $4, $t2
move $5, $t0
move $6, $t1
li $2, 15
syscall

function_fputs_load:
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
function_fclose:
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
L17:

L18:
lw $t0, 4($30)
move $4, $t0
li $2, 16
syscall

function_fclose_load:
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
