.data
heap: .space 4
str0: .asciiz  "test: %\n" 
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
addiu $t1, $0, 0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#   INT main ( ) { INT a = 0 ; 

la $t4, str0
addiu $29, $29, -4
sw $t4, 4($29)
jal function_scanf
lw $t4, 4($29)
addiu $29, $29, 4
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
move $t0, $v0
#scanf ( "test: %\n" ) ; 

addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#return 0 ; 




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
L3:

L4:
addiu $t3, $fp, 4
lw $t0, 0($t3)
addiu $t3, $t3, 4

L5:
lb $t1, 0($t0)
beq $t1, $0, L32
beq $t1, 37, L6
li $v0, 11
move $a0, $t1
syscall
addi $t0, $t0, 1
j L5

L6:
addi $t0, $t0, 1
lb $t2, 0($t0)
beq $t2, 100, L7
beq $t2, 99, L8
beq $t2, 120, L9
beq $t2, 115, L10
beq $t2, 102, L11
move $t1, $t2

L7:
li $v0, 5
syscall
lw $t6, 0($t3)
sw $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L5

L8:
li $v0, 12
syscall
lw $t6, 0($t3)
sb $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L5

L9:
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
bne $a0, $0, L12
addi $a1, $a1, -1
scanf_char_special_token_x_return_7:
move $a0, $s1
sll $a0, $a0, 8
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_6
bne $a0, $0, L12
addi $a1, $a1, -1
scanf_char_special_token_x_return_6:
move $a0, $s1
sll $a0, $a0, 16
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_5
bne $a0, $0, L12
addi $a1, $a1, -1
scanf_char_special_token_x_return_5:
move $a0, $s1
sll $a0, $a0, 24
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_4
bne $a0, $0, L12
addi $a1, $a1, -1
scanf_char_special_token_x_return_4:
move $a0, $s0
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_3
bne $a0, $0, L12
addi $a1, $a1, -1
scanf_char_special_token_x_return_3:
move $a0, $s0
sll $a0, $a0, 8
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_2
bne $a0, $0, L12
addi $a1, $a1, -1
scanf_char_special_token_x_return_2:
move $a0, $s0
sll $a0, $a0, 16
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_1
bne $a0, $0, L12
addi $a1, $a1, -1
scanf_char_special_token_x_return_1:
move $a0, $s0
sll $a0, $a0, 24
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_0
bne $a0, $0, L12
addi $a1, $a1, -1
scanf_char_special_token_x_return_0:
lw $t6, 0($t3)
sw $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L5

L10:
li $v0, 8
li $a1, 512
lw $a0, 0($t3)
syscall
addi $t3, $t3, 4
addi $t0, $t0, 1
j L5

L11:
li $v0, 6
syscall
mfc1 $v0, $f0
lw $t6, 0($t3)
sw $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L5

L12:
beq $a0, 48, L13
beq $a0, 49, L14
beq $a0, 50, L15
beq $a0, 51, L16
beq $a0, 52, L17
beq $a0, 53, L18
beq $a0, 54, L19
beq $a0, 55, L20
beq $a0, 56, L21
beq $a0, 57, L22
beq $a0, 97, L23
beq $a0, 98, L24
beq $a0, 99, L25
beq $a0, 100, L26
beq $a0, 101, L27
beq $a0, 102, L28
addi $a1, $a1, -1
jr $v1

L13:
li $a0, 0
j L29

L14:
li $a0, 1
j L29

L15:
li $a0, 2
j L29

L16:
li $a0, 3
j L29

L17:
li $a0, 4
j L29

L18:
li $a0, 5
j L29

L19:
li $a0, 6
j L29

L20:
li $a0, 7
j L29

L21:
li $a0, 8
j L29

L22:
li $a0, 9
j L29

L23:
li $a0, 10
j L29

L24:
li $a0, 11
j L29

L25:
li $a0, 12
j L29

L26:
li $a0, 13
j L29

L27:
li $a0, 14
j L29

L28:
li $a0, 15
j L29

L29:
move $a2, $a1
addiu $29, $29, -4
sw $t0, -100($30)
addiu $29, $29, -4
sw $t2, -104($30)
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
sw $a0, -164($30)
addiu $29, $29, -4
sw $a0, -168($30)
li $a3, 1
beq $a2, $0, L31

L30:
li $t1, 16
mul $a3, $a3, $t1
addi $a2, $a2, -1
bne $a2, $0, L30

L31:
mul $a3, $a3, $a0
add $v0, $a3, $v0
jr $v1

L32:
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
