.data
heap: .space 4
float...index_0: .float 3.14
str0: .asciiz  "%c" 
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
addiu $t4, $t3, 0
addiu $t5, $t3, 4
li $a0, 12
li $v0, 9
syscall
addiu $t8, $v0, 0
sw $t4, 0($t8)
sw $t5, 4($t8)
li $a0, 4
li $v0, 9
syscall
addiu $s1, $v0, 0
sw $t8, 0($s1)
addiu $s2, $0, 0
lw $s3, 0($s1)
li $s4, 4
mul $s5, $s2, $s4
addu $s6, $s3, $s5
addiu $s7, $0, 0
addiu $29, $29, -4
sw $t0, -352($30)
sw $t1, -344($30)
addiu $29, $29, -4
sw $t2, -356($30)
addiu $29, $29, -4
sw $t3, -360($30)
addiu $29, $29, -4
sw $t4, -364($30)
addiu $29, $29, -4
sw $t5, -368($30)
addiu $29, $29, -4
sw $a0, -372($30)
addiu $29, $29, -4
sw $v0, -376($30)
addiu $29, $29, -4
sw $t8, -380($30)
addiu $29, $29, -4
sw $a0, -384($30)
addiu $29, $29, -4
sw $v0, -388($30)
addiu $29, $29, -4
sw $s1, -392($30)
addiu $29, $29, -4
sw $s2, -396($30)
addiu $29, $29, -4
sw $s3, -400($30)
addiu $29, $29, -4
sw $s4, -404($30)
addiu $29, $29, -4
sw $s5, -408($30)
addiu $29, $29, -4
sw $s6, -412($30)
addiu $29, $29, -4
sw $s7, -416($30)
lw $t1, -412($30)
lw $t0, 0($t1)
li $t2, 1
lw $t4, -416($30)
mul $t3, $t4, $t2
addu $t5, $t0, $t3
addiu $t6, $0, 97
sb $t6, 0($t5)
la $t7, str0
# printf ( "%c" , ( * safety_ptr ) . as_str [ 0 ] [ 0 ] ) ; 

lw $t8, -220($30)
lw $t9, 0($t8)
addiu $s0, $0, 0
lw $s1, 0($t9)
li $s2, 0
addu $s3, $s1, $s2
addiu $s4, $s3, 0
addiu $s5, $s3, 4
li $a0, 12
li $v0, 9
syscall
addiu $29, $29, -4
sw $t0, -420($30)
sw $t1, -412($30)
addiu $29, $29, -4
sw $t2, -424($30)
addiu $29, $29, -4
sw $t3, -428($30)
sw $t4, -416($30)
addiu $29, $29, -4
sw $t5, -432($30)
addiu $29, $29, -4
sw $t6, -436($30)
addiu $29, $29, -4
sw $t7, -440($30)
sw $t8, -220($30)
addiu $29, $29, -4
sw $t9, -444($30)
addiu $29, $29, -4
sw $s0, -448($30)
addiu $29, $29, -4
sw $s1, -452($30)
addiu $29, $29, -4
sw $s2, -456($30)
addiu $29, $29, -4
sw $s3, -460($30)
addiu $29, $29, -4
sw $s4, -464($30)
addiu $29, $29, -4
sw $s5, -468($30)
addiu $29, $29, -4
sw $a0, -472($30)
addiu $29, $29, -4
sw $v0, -476($30)
addiu $t0, $v0, 0
lw $t1, -464($30)
sw $t1, 0($t0)
lw $t2, -468($30)
sw $t2, 4($t0)
li $a0, 4
li $v0, 9
syscall
addiu $t5, $v0, 0
sw $t0, 0($t5)
addiu $t6, $0, 0
lw $t7, 0($t5)
li $t8, 4
mul $t9, $t6, $t8
addu $s0, $t7, $t9
addiu $s1, $0, 0
lw $s2, 0($s0)
li $s3, 1
mul $s4, $s1, $s3
addu $s5, $s2, $s4
lb $s6, 0($s5)
addiu $29, $29, -4
sw $t0, -480($30)
sw $t1, -464($30)
sw $t2, -468($30)
addiu $29, $29, -4
sw $2, -484($30)
addiu $29, $29, -4
sw $18, -488($30)
addiu $29, $29, -4
sw $t5, -492($30)
addiu $29, $29, -4
sw $t6, -496($30)
addiu $29, $29, -4
sw $t7, -500($30)
addiu $29, $29, -4
sw $t8, -504($30)
addiu $29, $29, -4
sw $t9, -508($30)
addiu $29, $29, -4
sw $s0, -512($30)
addiu $29, $29, -4
sw $s1, -516($30)
addiu $29, $29, -4
sw $s2, -520($30)
addiu $29, $29, -4
sw $s3, -524($30)
addiu $29, $29, -4
sw $s4, -528($30)
addiu $29, $29, -4
sw $s5, -532($30)
addiu $29, $29, -4
sw $s7, -536($30)
lw $t0, -440($30)
addiu $29, $29, -8
sw $t0, 4($29)
sw $s6, 8($29)
jal function_printf
lw $t0, 4($29)
lw $s6, 8($29)
addiu $29, $29, 8
move $t1, $v0
addiu $t2, $0, 0
move $v0, $t2
j function_main_load
# return 0 ; 

sw $t0, -440($30)
addiu $29, $29, -4
sw $t1, -540($30)
addiu $29, $29, -4
sw $t2, -544($30)
addiu $29, $29, -4
sw $s6, -548($30)

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
sw $a0, -16($30)
sw $v0, -20($30)
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
addiu $11, $30, 4
lw $8, 0($11)
addiu $11, $11, 4

L5:
li $25, 0
lb $9, 0($8)
beq $9, $0, L24
addiu $2, $0, 11
addiu $12, $0, 37
beq $9, $12, L9

L6:

L7:
li $24, 1
slt $15, $25, $24
beq $15, $24, L8
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L7

L8:
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $29, $29, -4
sw $11, -100($30)
addiu $29, $29, -4
sw $8, -104($30)
addiu $29, $29, -4
sw $11, -108($30)
addiu $29, $29, -4
sw $a0, -112($30)
addiu $29, $29, -4
sw $v0, -116($30)
addiu $29, $29, -4
sw $25, -120($30)
addiu $29, $29, -4
sw $9, -124($30)
addiu $29, $29, -4
sw $2, -128($30)
addiu $29, $29, -4
sw $12, -132($30)
addiu $29, $29, -4
sw $24, -136($30)
addiu $29, $29, -4
sw $15, -140($30)
addiu $29, $29, -4
sw $2, -144($30)
addiu $29, $29, -4
sw $4, -148($30)
addiu $29, $29, -4
sw $18, -152($30)
addiu $29, $29, -4
sw $25, -156($30)
addiu $29, $29, -4
sw $24, -160($30)
addiu $29, $29, -4
sw $4, -164($30)
addiu $29, $29, -4
sw $18, -168($30)
addiu $8, $8, 1
j L5

L9:
addiu $8, $8, 1
lb $10, 0($8)
addiu $12, $0, 100
beq $10, $12, L11
addiu $12, $0, 99
beq $10, $12, L14
addiu $12, $0, 115
beq $10, $12, L15
addiu $12, $0, 120
beq $10, $12, L18
addiu $12, $0, 102
beq $10, $12, L23
li $15, 47
li $24, 58
slt $15, $15, $10
sgt $24, $24, $10
and $15, $15, $24
move $9, $10
li $24, 1
bne $15, $24, L10
addiu $15, $10, -48
li $24, 10
mul $25, $25, $24
add $25, $25, $15
j L9

L10:
j L6

L11:
addiu $29, $29, -4
sw $8, -172($30)
addiu $29, $29, -4
sw $8, -176($30)
addiu $29, $29, -4
sw $10, -180($30)
addiu $29, $29, -4
sw $12, -184($30)
addiu $29, $29, -4
sw $12, -188($30)
addiu $29, $29, -4
sw $12, -192($30)
addiu $29, $29, -4
sw $12, -196($30)
addiu $29, $29, -4
sw $12, -200($30)
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
sw $15, -228($30)
addiu $29, $29, -4
sw $24, -232($30)
addiu $29, $29, -4
sw $25, -236($30)
addiu $29, $29, -4
sw $25, -240($30)
lw $9, 0($11)

L12:
li $15, 10
div $9 $9 $15
addiu $18, $18, 1
li $15, 1
sub $25, $25, $15
li $15, 0
bne $15, $9, L12

L13:
addiu $18, $18, -1
addiu $2, $0, 1
lw $9, 0($11)
addiu $11, $11, 4
j L10

L14:
addi $25, $25, -1
addiu $2, $0, 11
lb $9, 0($11)
addiu $11, $11, 4
j L10

L15:
lw $15, 0($11)

L16:
lb $9, 0($15)
li $24, 0
beq $9, $24, L17
addiu $18, $18, 1
addi $15, $15, 1
addi $25, $25, -1
j L16

L17:
addiu $2, $0, 4
addiu $18, $18, -1
lw $9, 0($11)
addiu $11, $11, 4
j L10

L18:
addiu $2, $0, 11
li $16, 0
addi $25, $25, -8
j L20

L19:
li $24, 1
slt $15, $25, $24
beq $15, $24, L21
move $15, $2
li $2, 11
addiu $29, $29, -4
sw $9, -316($30)
addiu $29, $29, -4
sw $11, -320($30)
addiu $29, $29, -4
sw $15, -324($30)
addiu $29, $29, -4
sw $9, -328($30)
addiu $29, $29, -4
sw $24, -332($30)
addiu $29, $29, -4
sw $18, -336($30)
addiu $29, $29, -4
sw $15, -340($30)
addiu $29, $29, -4
sw $25, -344($30)
addiu $29, $29, -4
sw $2, -348($30)
addiu $29, $29, -4
sw $18, -352($30)
addiu $29, $29, -4
sw $9, -356($30)
addiu $29, $29, -4
sw $11, -360($30)
addiu $29, $29, -4
sw $2, -364($30)
addiu $29, $29, -4
sw $16, -368($30)
addiu $29, $29, -4
sw $25, -372($30)
addiu $29, $29, -4
sw $24, -376($30)
addiu $29, $29, -4
sw $15, -380($30)
addiu $29, $29, -4
sw $2, -384($30)
li $4, 32
addiu $18, $18, 1
syscall
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L19
j L21

L20:
lw $9, 0($11)
sllv $9, $9, $16
srl $9, $9, 28
li $14, 0
bne $9, $14, L19
li $14, 28
beq $14, $16, L19
addi $25, $25, 1
addiu $16, $16, 4
j L20

L21:
lw $9, 0($11)
li $17, 28
beq $16, $17, L22
sllv $9, $9, $16
srl $9, $9, 28
addiu $9, $9, 48
addiu $13, $0, 58
div $12 $9 $13
mflo $12
addiu $29, $29, -4
sw $4, -388($30)
addiu $29, $29, -4
sw $18, -392($30)
addiu $29, $29, -4
sw $25, -396($30)
addiu $29, $29, -4
sw $24, -400($30)
addiu $29, $29, -4
sw $9, -404($30)
addiu $29, $29, -4
sw $9, -408($30)
addiu $29, $29, -4
sw $9, -412($30)
addiu $29, $29, -4
sw $14, -416($30)
addiu $29, $29, -4
sw $14, -420($30)
addiu $29, $29, -4
sw $25, -424($30)
addiu $29, $29, -4
sw $16, -428($30)
addiu $29, $29, -4
sw $9, -432($30)
addiu $29, $29, -4
sw $17, -436($30)
addiu $29, $29, -4
sw $9, -440($30)
addiu $29, $29, -4
sw $9, -444($30)
addiu $29, $29, -4
sw $9, -448($30)
addiu $29, $29, -4
sw $13, -452($30)
addiu $29, $29, -4
sw $12, -456($30)
andi $13, $12, 1
addi $12, $12, 38
mul $13, $13, $12
add $9, $13, $9
addiu $2, $0, 11
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $16, $16, 4
li $17, 28
beq $16, $17, L22
j L21

L22:
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
j L10

L23:
addi $25, $25, -8
addiu $18, $18, 7
addiu $2, $0, 2
addiu $29, $29, -4
sw $9, -244($30)
addiu $29, $29, -4
sw $15, -248($30)
addiu $29, $29, -4
sw $9, -252($30)
addiu $29, $29, -4
sw $18, -256($30)
addiu $29, $29, -4
sw $15, -260($30)
addiu $29, $29, -4
sw $25, -264($30)
addiu $29, $29, -4
sw $15, -268($30)
addiu $29, $29, -4
sw $18, -272($30)
addiu $29, $29, -4
sw $2, -276($30)
addiu $29, $29, -4
sw $9, -280($30)
addiu $29, $29, -4
sw $11, -284($30)
addiu $29, $29, -4
sw $25, -288($30)
addiu $29, $29, -4
sw $2, -292($30)
addiu $29, $29, -4
sw $9, -296($30)
addiu $29, $29, -4
sw $11, -300($30)
addiu $29, $29, -4
sw $25, -304($30)
addiu $29, $29, -4
sw $18, -308($30)
addiu $29, $29, -4
sw $2, -312($30)
lw $9, 0($11)
mtc1 $9, $f12
addiu $11, $11, 4
j L10

L24:
move $2, $18

function_printf_load:
lw $t0, -4($30)
lw $t1, -8($30)
lw $t2, -12($30)
lw $a0, -16($30)
lw $v0, -20($30)
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
