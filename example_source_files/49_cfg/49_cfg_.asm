.data
heap: .space 4
str0: .asciiz  "Something went wrong" 
str1: .asciiz  "Hello world!\n" 
str2: .asciiz  "Something went wrong here" 
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
move $v0, $t0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 5
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#   INT main ( ) { INT x = 5 ; 

lw $t4, 0($t3)
# if ( x < 5 ) { 

addiu $t5, $0, 5
slt $t6, $t4, $t5
move $v0, $t6
addiu $29, $29, -4
sw $t0, -108($30)
addiu $29, $29, -4
sw $t1, -112($30)
addiu $29, $29, -4
sw $t2, -116($30)
addiu $29, $29, -4
sw $t3, -120($30)
addiu $29, $29, -4
sw $t4, -124($30)
addiu $29, $29, -4
sw $t5, -128($30)
addiu $29, $29, -4
sw $t6, -132($30)
addiu $sp, $sp, 0
beq $v0, $zero, L26
addiu $sp, $sp, 0
addiu $sp, $sp, 0
j L3

L3:
addiu $t0, $sp, 0
la $t1, str0
addiu $29, $29, -4
sw $t1, 4($29)
jal function_printf
lw $t1, 4($29)
addiu $29, $29, 4
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
move $t0, $v0
#printf ( "Something went wrong" ) ; 

addiu $29, $29, -4
sw $t0, -208($30)
addiu $sp, $sp, 0
j L29

L26:
addiu $t0, $sp, 0
lw $t1, -120($30)
lw $t2, 0($t1)
#} else if ( x == 5 ) { 

addiu $t3, $0, 5
xor $t4, $t2, $t3
sltiu $t5, $t4, 1
move $v0, $t5
addiu $29, $29, -4
sw $t0, -136($30)
sw $t1, -120($30)
addiu $29, $29, -4
sw $t2, -140($30)
addiu $29, $29, -4
sw $t3, -144($30)
addiu $29, $29, -4
sw $t4, -148($30)
addiu $29, $29, -4
sw $t5, -152($30)
addiu $sp, $sp, 0
beq $v0, $zero, L28
addiu $sp, $sp, 0
addiu $sp, $sp, 0
j L27

L27:
addiu $t0, $sp, 0
la $t1, str1
addiu $29, $29, -4
sw $t1, 4($29)
jal function_printf
lw $t1, 4($29)
addiu $29, $29, 4
move $t2, $v0
#printf ( "Hello world!\n" ) ; 

addiu $29, $29, -4
sw $t0, -156($30)
addiu $29, $29, -4
sw $t1, -160($30)
addiu $29, $29, -4
sw $t2, -164($30)
addiu $sp, $sp, -44
j L29

L28:
addiu $t0, $sp, 0
la $t1, str2
addiu $29, $29, -4
sw $t1, 4($29)
jal function_printf
lw $t1, 4($29)
addiu $29, $29, 4
move $t2, $v0
#} else { printf ( "Something went wrong here" ) ; 

addiu $29, $29, -4
sw $t0, -156($30)
addiu $29, $29, -4
sw $t1, -160($30)
addiu $29, $29, -4
sw $t2, -164($30)
addiu $sp, $sp, -44
j L29

L29:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#} return 0 ; 

addiu $29, $29, -4
sw $t0, -212($30)
addiu $29, $29, -4
sw $t1, -216($30)

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
function_printf:
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
L4:

L5:
addiu $11, $30, 4
lw $8, 0($11)
addiu $11, $11, 4

L6:
li $25, 0
lb $9, 0($8)
beq $9, $0, L25
addiu $2, $0, 11
addiu $12, $0, 37
beq $9, $12, L10

L7:

L8:
li $24, 1
slt $15, $25, $24
beq $15, $24, L9
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L8

L9:
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $8, $8, 1
j L6

L10:
addiu $8, $8, 1
addiu $29, $29, -4
sw $11, -100($30)
addiu $29, $29, -4
sw $8, -104($30)
addiu $29, $29, -4
sw $11, -108($30)
addiu $29, $29, -4
sw $25, -112($30)
addiu $29, $29, -4
sw $9, -116($30)
addiu $29, $29, -4
sw $2, -120($30)
addiu $29, $29, -4
sw $12, -124($30)
addiu $29, $29, -4
sw $24, -128($30)
addiu $29, $29, -4
sw $15, -132($30)
addiu $29, $29, -4
sw $2, -136($30)
addiu $29, $29, -4
sw $4, -140($30)
addiu $29, $29, -4
sw $18, -144($30)
addiu $29, $29, -4
sw $25, -148($30)
addiu $29, $29, -4
sw $24, -152($30)
addiu $29, $29, -4
sw $4, -156($30)
addiu $29, $29, -4
sw $18, -160($30)
addiu $29, $29, -4
sw $8, -164($30)
addiu $29, $29, -4
sw $8, -168($30)
lb $10, 0($8)
addiu $12, $0, 100
beq $10, $12, L12
addiu $12, $0, 99
beq $10, $12, L15
addiu $12, $0, 115
beq $10, $12, L16
addiu $12, $0, 120
beq $10, $12, L19
addiu $12, $0, 102
beq $10, $12, L24
li $15, 47
li $24, 58
slt $15, $15, $10
sgt $24, $24, $10
and $15, $15, $24
move $9, $10
li $24, 1
bne $15, $24, L11
addiu $15, $10, -48
li $24, 10
mul $25, $25, $24
add $25, $25, $15
j L10

L11:
j L7

L12:
lw $9, 0($11)

L13:
li $15, 10
addiu $29, $29, -4
sw $10, -172($30)
addiu $29, $29, -4
sw $12, -176($30)
addiu $29, $29, -4
sw $12, -180($30)
addiu $29, $29, -4
sw $12, -184($30)
addiu $29, $29, -4
sw $12, -188($30)
addiu $29, $29, -4
sw $12, -192($30)
addiu $29, $29, -4
sw $15, -196($30)
addiu $29, $29, -4
sw $24, -200($30)
addiu $29, $29, -4
sw $15, -204($30)
addiu $29, $29, -4
sw $24, -208($30)
addiu $29, $29, -4
sw $15, -212($30)
addiu $29, $29, -4
sw $24, -216($30)
addiu $29, $29, -4
sw $15, -220($30)
addiu $29, $29, -4
sw $24, -224($30)
addiu $29, $29, -4
sw $25, -228($30)
addiu $29, $29, -4
sw $25, -232($30)
addiu $29, $29, -4
sw $9, -236($30)
addiu $29, $29, -4
sw $15, -240($30)
div $9 $9 $15
addiu $18, $18, 1
li $15, 1
sub $25, $25, $15
li $15, 0
bne $15, $9, L13

L14:
addiu $18, $18, -1
addiu $2, $0, 1
lw $9, 0($11)
addiu $11, $11, 4
j L11

L15:
addi $25, $25, -1
addiu $2, $0, 11
lb $9, 0($11)
addiu $11, $11, 4
j L11

L16:
addiu $29, $29, -4
sw $9, -244($30)
addiu $29, $29, -4
sw $18, -248($30)
addiu $29, $29, -4
sw $15, -252($30)
addiu $29, $29, -4
sw $25, -256($30)
addiu $29, $29, -4
sw $15, -260($30)
addiu $29, $29, -4
sw $18, -264($30)
addiu $29, $29, -4
sw $2, -268($30)
addiu $29, $29, -4
sw $9, -272($30)
addiu $29, $29, -4
sw $11, -276($30)
addiu $29, $29, -4
sw $25, -280($30)
addiu $29, $29, -4
sw $2, -284($30)
addiu $29, $29, -4
sw $9, -288($30)
addiu $29, $29, -4
sw $11, -292($30)
addiu $29, $29, -4
sw $25, -296($30)
addiu $29, $29, -4
sw $18, -300($30)
addiu $29, $29, -4
sw $2, -304($30)
addiu $29, $29, -4
sw $9, -308($30)
addiu $29, $29, -4
sw $11, -312($30)
lw $15, 0($11)

L17:
lb $9, 0($15)
li $24, 0
beq $9, $24, L18
addiu $18, $18, 1
addi $15, $15, 1
addi $25, $25, -1
j L17

L18:
addiu $2, $0, 4
addiu $18, $18, -1
lw $9, 0($11)
addiu $11, $11, 4
j L11

L19:
addiu $2, $0, 11
li $16, 0
addi $25, $25, -8
j L21

L20:
li $24, 1
slt $15, $25, $24
beq $15, $24, L22
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $29, $29, -4
sw $15, -316($30)
addiu $29, $29, -4
sw $9, -320($30)
addiu $29, $29, -4
sw $24, -324($30)
addiu $29, $29, -4
sw $18, -328($30)
addiu $29, $29, -4
sw $15, -332($30)
addiu $29, $29, -4
sw $25, -336($30)
addiu $29, $29, -4
sw $2, -340($30)
addiu $29, $29, -4
sw $18, -344($30)
addiu $29, $29, -4
sw $9, -348($30)
addiu $29, $29, -4
sw $11, -352($30)
addiu $29, $29, -4
sw $2, -356($30)
addiu $29, $29, -4
sw $16, -360($30)
addiu $29, $29, -4
sw $25, -364($30)
addiu $29, $29, -4
sw $24, -368($30)
addiu $29, $29, -4
sw $15, -372($30)
addiu $29, $29, -4
sw $2, -376($30)
addiu $29, $29, -4
sw $4, -380($30)
addiu $29, $29, -4
sw $18, -384($30)
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L20
j L22

L21:
lw $9, 0($11)
sllv $9, $9, $16
srl $9, $9, 28
li $14, 0
bne $9, $14, L20
li $14, 28
beq $14, $16, L20
addi $25, $25, 1
addiu $16, $16, 4
j L21

L22:
lw $9, 0($11)
li $17, 28
beq $16, $17, L23
sllv $9, $9, $16
srl $9, $9, 28
addiu $9, $9, 48
addiu $13, $0, 58
div $12 $9 $13
mflo $12
andi $13, $12, 1
addi $12, $12, 38
addiu $29, $29, -4
sw $25, -388($30)
addiu $29, $29, -4
sw $24, -392($30)
addiu $29, $29, -4
sw $9, -396($30)
addiu $29, $29, -4
sw $9, -400($30)
addiu $29, $29, -4
sw $9, -404($30)
addiu $29, $29, -4
sw $14, -408($30)
addiu $29, $29, -4
sw $14, -412($30)
addiu $29, $29, -4
sw $25, -416($30)
addiu $29, $29, -4
sw $16, -420($30)
addiu $29, $29, -4
sw $9, -424($30)
addiu $29, $29, -4
sw $17, -428($30)
addiu $29, $29, -4
sw $9, -432($30)
addiu $29, $29, -4
sw $9, -436($30)
addiu $29, $29, -4
sw $9, -440($30)
addiu $29, $29, -4
sw $13, -444($30)
addiu $29, $29, -4
sw $12, -448($30)
addiu $29, $29, -4
sw $13, -452($30)
addiu $29, $29, -4
sw $12, -456($30)
mul $13, $13, $12
add $9, $13, $9
addiu $2, $0, 11
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $16, $16, 4
li $17, 28
beq $16, $17, L23
j L22

L23:
lb $9, 0($11)
sll $9, $9, 28
srl $9, $9, 28
addiu $9, $9, 48
addiu $13, $0, 58
div $12 $9 $13
mflo $12
andi $13, $12, 1
addi $12, $12, 38
mul $13, $13, $12
add $9, $13, $9
addiu $11, $11, 4
j L11

L24:
addi $25, $25, -8
addiu $18, $18, 7
addiu $2, $0, 2
lw $9, 0($11)
mtc1 $9, $f12
addiu $11, $11, 4
j L11

L25:
move $2, $18

function_printf_load:
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
