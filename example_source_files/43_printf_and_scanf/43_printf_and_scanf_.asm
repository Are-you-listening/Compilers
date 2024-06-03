.data
heap: .space 4
str0: .asciiz  "Enter two numbers:" 
str1: .asciiz  "%d%d" 
str2: .asciiz  "%d; %d" 
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
#   INT main ( ) { INT x ; 

li $t4, 0
addiu $29, $29, -4
sw $t4, 4($29)
addiu $t5, $29, 4
#INT y ; 

la $t6, str0
addiu $29, $29, -4
sw $t6, 4($29)
jal function_printf
lw $t6, 4($29)
addiu $29, $29, 4
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
addiu $29, $29, -4
sw $s5, -172($30)
addiu $29, $29, -4
sw $s6, -176($30)
addiu $29, $29, -4
sw $s7, -180($30)
move $t0, $v0
#printf ( "Enter two numbers:" ) ; 

la $t1, str1
addiu $29, $29, -4
sw $t0, -184($30)
addiu $29, $29, -4
sw $t2, -188($30)
addiu $29, $29, -4
sw $t3, -192($30)
addiu $29, $29, -4
sw $t4, -196($30)
addiu $29, $29, -4
sw $t5, -200($30)
addiu $29, $29, -4
sw $t6, -204($30)
addiu $29, $29, -4
sw $t7, -208($30)
addiu $29, $29, -4
sw $t8, -212($30)
addiu $29, $29, -4
sw $t9, -216($30)
addiu $29, $29, -4
sw $s0, -220($30)
addiu $29, $29, -4
sw $s1, -224($30)
addiu $29, $29, -4
sw $s2, -228($30)
addiu $29, $29, -4
sw $s3, -232($30)
addiu $29, $29, -4
sw $s4, -236($30)
addiu $29, $29, -4
sw $s5, -240($30)
addiu $29, $29, -4
sw $s6, -244($30)
addiu $29, $29, -4
sw $s7, -248($30)
lw $t0, -120($30)
lw $t2, -132($30)
addiu $29, $29, -12
sw $t1, 4($29)
sw $t0, 8($29)
sw $t2, 12($29)
jal function_scanf
lw $t1, 4($29)
lw $t0, 8($29)
lw $t2, 12($29)
addiu $29, $29, 12
move $t3, $v0
#scanf ( "%d%d" , & x , & y ) ; 

la $t4, str2
lw $t5, 0($t0)
#printf ( "%d; %d" , x , y ) ; 

lw $t6, 0($t2)
addiu $29, $29, -12
sw $t4, 4($29)
sw $t5, 8($29)
sw $t6, 12($29)
jal function_printf
lw $t4, 4($29)
lw $t5, 8($29)
lw $t6, 12($29)
addiu $29, $29, 12
move $t7, $v0
addiu $t8, $0, 0
move $v0, $t8
j function_main_load
#return 0 ; 

sw $t0, -120($30)
addiu $29, $29, -4
sw $t1, -252($30)
sw $t2, -132($30)
addiu $29, $29, -4
sw $t3, -256($30)
addiu $29, $29, -4
sw $t4, -260($30)
addiu $29, $29, -4
sw $t5, -264($30)
addiu $29, $29, -4
sw $t6, -268($30)
addiu $29, $29, -4
sw $t7, -272($30)
addiu $29, $29, -4
sw $t8, -276($30)

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
addiu $8, $8, 1
j L5

L9:
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
lw $9, 0($11)

L12:
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
function_scanf:
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
L25:

L26:
addiu $t3, $fp, 4
lw $t0, 0($t3)
addiu $t3, $t3, 4

L27:
lb $t1, 0($t0)
beq $t1, $0, L54
beq $t1, 37, L28
scanf_char_loop_temp:
addi $t0, $t0, 1
j L27

L28:
addi $t0, $t0, 1
lb $t2, 0($t0)
beq $t2, 100, L29
beq $t2, 99, L30
beq $t2, 120, L31
beq $t2, 115, L32
beq $t2, 102, L33
move $t1, $t2
j scanf_char_loop_temp

L29:
li $v0, 5
syscall
lw $t6, 0($t3)
sw $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L27

L30:
li $v0, 12
syscall
lw $t6, 0($t3)
sb $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L27

L31:
addi $a0, $sp, 8
li $a1, 9
li $v0, 8
sw $0, 0($a0)
sw $0, 4($a0)
syscall
lw $s0, 0($a0)
lw $s1, 4($a0)
add $v0, $0, $0
move $a0, $s1
srl $a0, $a0, 24
add $a1, $0, $0
la $v1, scanf_char_special_token_x_return_7
bne $a0, $0, L34
addi $a1, $a1, -1
scanf_char_special_token_x_return_7:
move $a0, $s1
sll $a0, $a0, 8
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_6
bne $a0, $0, L34
addi $a1, $a1, -1
scanf_char_special_token_x_return_6:
move $a0, $s1
sll $a0, $a0, 16
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_5
bne $a0, $0, L34
addi $a1, $a1, -1
scanf_char_special_token_x_return_5:
move $a0, $s1
sll $a0, $a0, 24
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_4
bne $a0, $0, L34
addi $a1, $a1, -1
scanf_char_special_token_x_return_4:
move $a0, $s0
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_3
bne $a0, $0, L34
addi $a1, $a1, -1
scanf_char_special_token_x_return_3:
move $a0, $s0
sll $a0, $a0, 8
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_2
bne $a0, $0, L34
addi $a1, $a1, -1
scanf_char_special_token_x_return_2:
move $a0, $s0
sll $a0, $a0, 16
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_1
bne $a0, $0, L34
addi $a1, $a1, -1
scanf_char_special_token_x_return_1:
move $a0, $s0
sll $a0, $a0, 24
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_0
bne $a0, $0, L34
addi $a1, $a1, -1
scanf_char_special_token_x_return_0:
lw $t6, 0($t3)
sw $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L27

L32:
li $v0, 8
li $a1, 512
lw $a0, 0($t3)
syscall
addi $t3, $t3, 4
addi $t0, $t0, 1
j L27

L33:
li $v0, 6
syscall
mfc1 $v0, $f0
lw $t6, 0($t3)
sw $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L27

L34:
beq $a0, 48, L35
beq $a0, 49, L36
beq $a0, 50, L37
beq $a0, 51, L38
beq $a0, 52, L39
beq $a0, 53, L40
beq $a0, 54, L41
beq $a0, 55, L42
beq $a0, 56, L43
beq $a0, 57, L44
beq $a0, 97, L45
beq $a0, 98, L46
beq $a0, 99, L47
beq $a0, 100, L48
beq $a0, 101, L49
beq $a0, 102, L50
addi $a1, $a1, -1
jr $v1

L35:
li $a0, 0
j L51

L36:
li $a0, 1
j L51

L37:
li $a0, 2
j L51

L38:
li $a0, 3
j L51

L39:
li $a0, 4
j L51

L40:
li $a0, 5
j L51

L41:
li $a0, 6
j L51

L42:
li $a0, 7
j L51

L43:
li $a0, 8
j L51

L44:
li $a0, 9
j L51

L45:
li $a0, 10
j L51

L46:
li $a0, 11
j L51

L47:
li $a0, 12
j L51

L48:
li $a0, 13
j L51

L49:
li $a0, 14
j L51

L50:
li $a0, 15
j L51

L51:
move $a2, $a1
li $a3, 1
beq $a2, $0, L53

L52:
li $s7, 16
addiu $29, $29, -4
sw $a0, -100($30)
addiu $29, $29, -4
sw $a0, -104($30)
addiu $29, $29, -4
sw $a0, -108($30)
addiu $29, $29, -4
sw $a0, -112($30)
addiu $29, $29, -4
sw $a0, -116($30)
addiu $29, $29, -4
sw $a0, -120($30)
addiu $29, $29, -4
sw $a0, -124($30)
addiu $29, $29, -4
sw $a0, -128($30)
addiu $29, $29, -4
sw $a0, -132($30)
addiu $29, $29, -4
sw $a0, -136($30)
addiu $29, $29, -4
sw $a0, -140($30)
addiu $29, $29, -4
sw $a0, -144($30)
addiu $29, $29, -4
sw $a0, -148($30)
addiu $29, $29, -4
sw $a0, -152($30)
addiu $29, $29, -4
sw $a0, -156($30)
addiu $29, $29, -4
sw $a0, -160($30)
addiu $29, $29, -4
sw $a3, -164($30)
addiu $29, $29, -4
sw $s7, -168($30)
lw $t1, -168($30)
mul $a3, $a3, $t1
addi $a2, $a2, -1
bne $a2, $0, L52

L53:
mul $a3, $a3, $a0
add $v0, $a3, $v0
jr $v1

L54:
li $v0, 1

function_scanf_load:
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
