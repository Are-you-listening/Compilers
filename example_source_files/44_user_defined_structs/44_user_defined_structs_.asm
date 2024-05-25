.data
heap: .space 4
Sun: .word 6
Sat: .word 5
Fri: .word 4
Thur: .word 3
Wed: .word 2
Tue: .word 1
Mon: .word 0
str0: .asciiz  "../includes/io.txt" 
str1: .asciiz  "r" 
str2: .asciiz  "w" 
str3: .asciiz  "Enter two numbers:" 
str4: .asciiz  "%d%d" 
str5: .asciiz  "%d; %d" 
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

L7:
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
addiu $29, $29, -4
sw $t0, -172($30)
li $t1, 0
addiu $29, $29, -8
sw $t1, 4($29)
addiu $t2, $29, 4
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
#   struct water { INT has_nemo ; } ;  struct bottle { struct water perier ; struct water spa ; struct water sea ; } ;  INT main ( ) { struct water perier ; 

addiu $t4, $0, 0
lw $t5, 0($t3)
li $t6, 0
addu $t7, $t5, $t6
#perier . has_nemo = 0 ; 

addiu $t8, $0, 0
sw $t8, 0($t7)
li $s0, 0
addiu $29, $29, -8
sw $s0, 4($29)
addiu $s1, $29, 4
addiu $29, $29, -4
sw $s1, 4($29)
addiu $s2, $29, 4
#struct water spa ; 

addiu $s3, $0, 0
lw $s4, 0($s2)
li $s5, 0
addu $s6, $s4, $s5
#spa . has_nemo = 0 ; 

addiu $s7, $0, 0
sw $s7, 0($s6)
addiu $29, $29, -4
sw $t0, -200($30)
addiu $29, $29, -4
sw $t1, -204($30)
addiu $29, $29, -4
sw $t2, -208($30)
addiu $29, $29, -4
sw $t3, -212($30)
addiu $29, $29, -4
sw $t4, -216($30)
addiu $29, $29, -4
sw $t5, -220($30)
addiu $29, $29, -4
sw $t6, -224($30)
addiu $29, $29, -4
sw $t7, -228($30)
addiu $29, $29, -4
sw $t8, -232($30)
addiu $29, $29, -4
sw $t9, -236($30)
addiu $29, $29, -4
sw $s0, -240($30)
addiu $29, $29, -4
sw $s1, -244($30)
addiu $29, $29, -4
sw $s2, -248($30)
addiu $29, $29, -4
sw $s3, -252($30)
addiu $29, $29, -4
sw $s4, -256($30)
addiu $29, $29, -4
sw $s5, -260($30)
addiu $29, $29, -4
sw $s6, -264($30)
addiu $29, $29, -4
sw $s7, -268($30)
li $t1, 0
addiu $29, $29, -8
sw $t1, 4($29)
addiu $t2, $29, 4
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
#struct water sea ; 

addiu $t4, $0, 0
lw $t5, 0($t3)
li $t6, 0
addu $t7, $t5, $t6
#sea . has_nemo = 1 ; 

addiu $t8, $0, 1
sw $t8, 0($t7)
li $s0, 0
addiu $29, $29, -8
sw $s0, 4($29)
addiu $s1, $29, 4
addiu $29, $29, -8
sw $s0, 4($29)
addiu $s2, $29, 4
addiu $29, $29, -8
sw $s0, 4($29)
addiu $s3, $29, 4
addiu $29, $29, -16
sw $s1, 4($29)
sw $s2, 8($29)
sw $s3, 12($29)
addiu $s4, $29, 4
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
# struct bottle boo ; 

addiu $s6, $0, 0
lw $s7, 0($s5)
addiu $29, $29, -4
sw $t0, -328($30)
addiu $29, $29, -4
sw $t1, -332($30)
addiu $29, $29, -4
sw $t2, -336($30)
addiu $29, $29, -4
sw $t3, -340($30)
addiu $29, $29, -4
sw $t4, -344($30)
addiu $29, $29, -4
sw $t5, -348($30)
addiu $29, $29, -4
sw $t6, -352($30)
addiu $29, $29, -4
sw $t7, -356($30)
addiu $29, $29, -4
sw $t8, -360($30)
addiu $29, $29, -4
sw $t9, -364($30)
addiu $29, $29, -4
sw $s0, -368($30)
addiu $29, $29, -4
sw $s1, -372($30)
addiu $29, $29, -4
sw $s2, -376($30)
addiu $29, $29, -4
sw $s3, -380($30)
addiu $29, $29, -4
sw $s4, -384($30)
addiu $29, $29, -4
sw $s5, -388($30)
addiu $29, $29, -4
sw $s6, -392($30)
addiu $29, $29, -4
sw $s7, -396($30)
li $t0, 0
lw $t2, -396($30)
addu $t1, $t2, $t0
#boo . perier = perier ; 

lw $t3, -212($30)
lw $t4, 0($t3)
sw $t4, 0($t1)
addiu $t5, $0, 1
lw $t7, -388($30)
lw $t6, 0($t7)
li $t8, 4
addu $t9, $t6, $t8
#boo . spa = spa ; 

lw $s0, -248($30)
lw $s1, 0($s0)
sw $s1, 0($t9)
addiu $s2, $0, 2
lw $s3, 0($t7)
li $s4, 8
addu $s5, $s3, $s4
#boo . sea = sea ; 

lw $s6, -340($30)
lw $s7, 0($s6)
sw $s7, 0($s5)
addiu $29, $29, -4
sw $t0, -400($30)
addiu $29, $29, -4
sw $t1, -404($30)
sw $t2, -396($30)
sw $t3, -212($30)
addiu $29, $29, -4
sw $t4, -408($30)
addiu $29, $29, -4
sw $t5, -412($30)
addiu $29, $29, -4
sw $t6, -416($30)
sw $t7, -388($30)
addiu $29, $29, -4
sw $t8, -420($30)
addiu $29, $29, -4
sw $t9, -424($30)
sw $s0, -248($30)
addiu $29, $29, -4
sw $s1, -428($30)
addiu $29, $29, -4
sw $s2, -432($30)
addiu $29, $29, -4
sw $s3, -436($30)
addiu $29, $29, -4
sw $s4, -440($30)
addiu $29, $29, -4
sw $s5, -444($30)
sw $s6, -340($30)
addiu $29, $29, -4
sw $s7, -448($30)
addiu $t0, $0, 0
move $v0, $t0
j function_main_load
# return 0 ; 

addiu $29, $29, -4
sw $t0, -452($30)

L8:
addiu $t7, $sp, 0
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
li $t1, 0
addiu $29, $29, -4
sw $t1, 4($29)
addiu $t2, $29, 4
#   enum week { Mon , Tue , Wed , Thur , Fri , Sat , Sun } ;  INT main ( ) { enum week day ; 

addiu $t3, $0, 2
sw $t3, 0($t2)
#day = Wed ; 

addiu $t4, $0, 0
move $v0, $t4
j function_main_load
#return 0 ; 

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

L9:
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

L10:
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

L11:
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

L12:
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

L13:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#   INT main ( ) { INT a = 0 ; 

li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
#INT i ; 

addiu $t7, $0, 0
sw $t7, 0($t6)
#for ( i = 0 ; i < 5 ; i ++ ) { 

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

L14:
addiu $t0, $sp, 0
lw $t1, -136($30)
lw $t2, 0($t1)
addiu $t3, $0, 5
slt $t4, $t2, $t3
move $v0, $t4
addiu $29, $29, -4
sw $t0, -144($30)
sw $t1, -136($30)
addiu $29, $29, -4
sw $t2, -148($30)
addiu $29, $29, -4
sw $t3, -152($30)
addiu $29, $29, -4
sw $t4, -156($30)

L15:
addiu $t0, $sp, 0
lw $t2, -136($30)
lw $t3, 0($t2)
#INT b = i ; 

li $t4, 0
addiu $29, $29, -4
sw $t4, 4($29)
addiu $t5, $29, 4
sw $t3, 0($t5)
lw $t6, 0($t2)
addi $t7, $t6, 1
sw $t7, 0($t2)
addiu $29, $29, -4
sw $t0, -164($30)
addiu $29, $29, -4
sw $t1, -168($30)
sw $t2, -136($30)
addiu $29, $29, -4
sw $t3, -172($30)
addiu $29, $29, -4
sw $t4, -176($30)
addiu $29, $29, -4
sw $t5, -180($30)
addiu $29, $29, -4
sw $t6, -184($30)
addiu $29, $29, -4
sw $t7, -188($30)

L16:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -160($30)

L17:
addiu $t0, $sp, 0
#}  while ( a < 2 ) { 

lw $t1, -124($30)
lw $t2, 0($t1)
addiu $t3, $0, 2
slt $t4, $t2, $t3
move $v0, $t4
addiu $29, $29, -4
sw $t0, -164($30)
sw $t1, -124($30)
addiu $29, $29, -4
sw $t2, -168($30)
addiu $29, $29, -4
sw $t3, -172($30)
addiu $29, $29, -4
sw $t4, -176($30)

L18:
addiu $t0, $sp, 0
lw $t1, -124($30)
lw $t2, 0($t1)
#a ++ ; 

addi $t3, $t2, 1
sw $t3, 0($t1)
addiu $29, $29, -4
sw $t0, -180($30)
sw $t1, -124($30)
addiu $29, $29, -4
sw $t2, -184($30)
addiu $29, $29, -4
sw $t3, -188($30)

L19:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -180($30)

L20:
addiu $t0, $sp, 0
#continue ; } while ( 1 ) { 

addiu $t1, $0, 1
addiu $29, $29, -4
sw $t0, -184($30)
addiu $29, $29, -4
sw $t1, -188($30)

L21:
addiu $t0, $sp, 0
#break ; 

addiu $29, $29, -4
sw $t0, -192($30)

L22:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#} return 0 ; 

addiu $29, $29, -4
sw $t0, -196($30)
addiu $29, $29, -4
sw $t1, -200($30)

L23:
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
# INT main ( ) { INT x = 1 ; 

addiu $t5, $0, 2
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#INT y = 2 ; 

lw $t8, 0($t3)
#if ( x == y ) 

lw $t9, 0($t7)
xor $s0, $t8, $t9
sltiu $s1, $s0, 1
move $v0, $s1
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

L24:
addiu $t0, $sp, 0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
#{ CHAR z ; 

addiu $29, $29, -4
sw $t0, -164($30)
addiu $29, $29, -4
sw $t1, -168($30)
addiu $29, $29, -4
sw $t2, -172($30)
addiu $29, $29, -4
sw $t3, -176($30)

L25:
addiu $t0, $sp, 0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
#} else { INT z ; 

addiu $29, $29, -4
sw $t0, -164($30)
addiu $29, $29, -4
sw $t1, -168($30)
addiu $29, $29, -4
sw $t2, -172($30)
addiu $29, $29, -4
sw $t3, -176($30)

L26:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#} return 0 ; 

addiu $29, $29, -4
sw $t0, -180($30)
addiu $29, $29, -4
sw $t1, -184($30)

L27:
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

L44:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
li $t1, 0
addiu $29, $29, -20
sw $t1, 4($29)
sw $t1, 8($29)
sw $t1, 12($29)
sw $t1, 16($29)
sw $t1, 20($29)
addiu $t2, $29, 4
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
#   INT main ( ) { INT c [ 5 ] = { 1 , 2 , 3 , 4 , 5 } ; 

addiu $t4, $0, 4
lw $t5, 0($t3)
li $t6, 4
mul $t7, $t4, $t6
addu $t8, $t5, $t7
addiu $t9, $0, 5
sw $t9, 0($t8)
addiu $s0, $0, 3
lw $s1, 0($t3)
li $s2, 4
mul $s3, $s0, $s2
addu $s4, $s1, $s3
addiu $s5, $0, 4
sw $s5, 0($s4)
addiu $s6, $0, 2
lw $s7, 0($t3)
addiu $29, $29, -4
sw $t0, -128($30)
addiu $29, $29, -4
sw $t1, -132($30)
addiu $29, $29, -4
sw $t2, -136($30)
addiu $29, $29, -4
sw $t3, -140($30)
addiu $29, $29, -4
sw $t4, -144($30)
addiu $29, $29, -4
sw $t5, -148($30)
addiu $29, $29, -4
sw $t6, -152($30)
addiu $29, $29, -4
sw $t7, -156($30)
addiu $29, $29, -4
sw $t8, -160($30)
addiu $29, $29, -4
sw $t9, -164($30)
addiu $29, $29, -4
sw $s0, -168($30)
addiu $29, $29, -4
sw $s1, -172($30)
addiu $29, $29, -4
sw $s2, -176($30)
addiu $29, $29, -4
sw $s3, -180($30)
addiu $29, $29, -4
sw $s4, -184($30)
addiu $29, $29, -4
sw $s5, -188($30)
addiu $29, $29, -4
sw $s6, -192($30)
addiu $29, $29, -4
sw $s7, -196($30)
li $t0, 4
lw $t2, -192($30)
mul $t1, $t2, $t0
lw $t4, -196($30)
addu $t3, $t4, $t1
addiu $t5, $0, 3
sw $t5, 0($t3)
addiu $t6, $0, 1
lw $t8, -140($30)
lw $t7, 0($t8)
li $t9, 4
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 2
sw $s2, 0($s1)
addiu $s3, $0, 0
lw $s4, 0($t8)
li $s5, 4
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -200($30)
addiu $29, $29, -4
sw $t1, -204($30)
sw $t2, -192($30)
addiu $29, $29, -4
sw $t3, -208($30)
sw $t4, -196($30)
addiu $29, $29, -4
sw $t5, -212($30)
addiu $29, $29, -4
sw $t6, -216($30)
addiu $29, $29, -4
sw $t7, -220($30)
sw $t8, -140($30)
addiu $29, $29, -4
sw $t9, -224($30)
addiu $29, $29, -4
sw $s0, -228($30)
addiu $29, $29, -4
sw $s1, -232($30)
addiu $29, $29, -4
sw $s2, -236($30)
addiu $29, $29, -4
sw $s3, -240($30)
addiu $29, $29, -4
sw $s4, -244($30)
addiu $29, $29, -4
sw $s5, -248($30)
addiu $29, $29, -4
sw $s6, -252($30)
addiu $29, $29, -4
sw $s7, -256($30)
addiu $t0, $0, 1
lw $t1, -256($30)
sw $t0, 0($t1)
addiu $t2, $0, 1
lw $t4, -140($30)
lw $t3, 0($t4)
li $t5, 4
mul $t6, $t2, $t5
addu $t7, $t3, $t6
#c [ 1 ] = 0 ; 

addiu $t8, $0, 0
sw $t8, 0($t7)
addiu $t9, $0, 0
move $v0, $t9
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -260($30)
sw $t1, -256($30)
addiu $29, $29, -4
sw $t2, -264($30)
addiu $29, $29, -4
sw $t3, -268($30)
sw $t4, -140($30)
addiu $29, $29, -4
sw $t5, -272($30)
addiu $29, $29, -4
sw $t6, -276($30)
addiu $29, $29, -4
sw $t7, -280($30)
addiu $29, $29, -4
sw $t8, -284($30)
addiu $29, $29, -4
sw $t9, -288($30)

L45:
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

la $t6, str3
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

la $t1, str4
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

la $t4, str5
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

L98:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)

L99:
addiu $t0, $sp, 0
# INT main ( ) {  while ( 1 ) { 

addiu $t1, $0, 1
addiu $29, $29, -4
sw $t0, -104($30)
addiu $29, $29, -4
sw $t1, -108($30)

L100:
addiu $t0, $sp, 0
addiu $t2, $0, 0
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
sw $t2, 0($t4)
#INT a = 0 ; 

lw $t5, 0($t4)
#if ( a % 2 == 1 ) { 

addiu $t6, $0, 2
div $t7 $t5 $t6
mfhi $t7
addiu $t8, $0, 1
xor $t9, $t7, $t8
sltiu $s0, $t9, 1
move $v0, $s0
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

L101:
addiu $t0, $sp, 0
#continue ; 

addiu $29, $29, -4
sw $t0, -160($30)

L102:
addiu $t0, $sp, 0
lw $t1, -132($30)
lw $t2, 0($t1)
#INT c = 0 ; } if ( a > 10 ) { 

addiu $t3, $0, 10
sgt $t4, $t2, $t3
move $v0, $t4
addiu $29, $29, -4
sw $t0, -160($30)
sw $t1, -132($30)
addiu $29, $29, -4
sw $t2, -164($30)
addiu $29, $29, -4
sw $t3, -168($30)
addiu $29, $29, -4
sw $t4, -172($30)

L103:
addiu $t0, $sp, 0
#break ; 

addiu $29, $29, -4
sw $t0, -176($30)

L104:
addiu $t0, $sp, 0
lw $t1, -132($30)
lw $t2, 0($t1)
#INT g = 0 ; }  a ++ ; 

addi $t3, $t2, 1
sw $t3, 0($t1)
addiu $29, $29, -4
sw $t0, -176($30)
sw $t1, -132($30)
addiu $29, $29, -4
sw $t2, -180($30)
addiu $29, $29, -4
sw $t3, -184($30)

L105:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
# } return 0 ; 

addiu $29, $29, -4
sw $t0, -180($30)
addiu $29, $29, -4
sw $t1, -184($30)

L106:
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

L116:
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
L28:

L29:
lw $t0, 4($30)
lw $t1, 8($30)
mul $t2, $t0, $t1
move $4, $t2
li $2, 9
syscall
j L30

L30:
addiu $t2, $t2, -1
addiu $t5, $2, 0
addu $t6, $t5, $t2
li $t7, 0
sb $t7, 0($t6)
bne $t7, $t2, L30

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
L31:

L32:
lw $t0, 4($30)
lw $t1, 8($30)
lb $t2, 0($t1)
li $t3, 114
beq $t2, $t3, L33
li $t4, 97
beq $t2, $t4, L35
li $t5, 119
beq $t2, $t5, L34

L33:
li $t2, 0
j L36

L34:
li $t2, 1
j L36

L35:
li $t2, 9
j L36

L36:
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
L37:

L38:
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
L39:

L40:
lw $t0, 4($30)
li $t1, 0
lw $t2, 8($30)
j L41

L41:
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
L42:

L43:
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
L46:

L47:
addiu $11, $30, 4
lw $8, 0($11)
addiu $11, $11, 4

L48:
li $25, 0
lb $9, 0($8)
beq $9, $0, L67
addiu $2, $0, 11
addiu $12, $0, 37
beq $9, $12, L52

L49:

L50:
li $24, 1
slt $15, $25, $24
beq $15, $24, L51
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L50

L51:
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $8, $8, 1
j L48

L52:
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
beq $10, $12, L54
addiu $12, $0, 99
beq $10, $12, L57
addiu $12, $0, 115
beq $10, $12, L58
addiu $12, $0, 120
beq $10, $12, L61
addiu $12, $0, 102
beq $10, $12, L66
li $15, 47
li $24, 58
slt $15, $15, $10
sgt $24, $24, $10
and $15, $15, $24
move $9, $10
li $24, 1
bne $15, $24, L53
addiu $15, $10, -48
li $24, 10
mul $25, $25, $24
add $25, $25, $15
j L52

L53:
j L49

L54:
lw $9, 0($11)

L55:
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
bne $15, $9, L55

L56:
addiu $18, $18, -1
addiu $2, $0, 1
lw $9, 0($11)
addiu $11, $11, 4
j L53

L57:
addi $25, $25, -1
addiu $2, $0, 11
lb $9, 0($11)
addiu $11, $11, 4
j L53

L58:
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

L59:
lb $9, 0($15)
li $24, 0
beq $9, $24, L60
addiu $18, $18, 1
addi $15, $15, 1
addi $25, $25, -1
j L59

L60:
addiu $2, $0, 4
addiu $18, $18, -1
lw $9, 0($11)
addiu $11, $11, 4
j L53

L61:
addiu $2, $0, 11
li $16, 0
addi $25, $25, -8
j L63

L62:
li $24, 1
slt $15, $25, $24
beq $15, $24, L64
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
bne $25, $24, L62
j L64

L63:
lw $9, 0($11)
sllv $9, $9, $16
srl $9, $9, 28
li $14, 0
bne $9, $14, L62
li $14, 28
beq $14, $16, L62
addi $25, $25, 1
addiu $16, $16, 4
j L63

L64:
lw $9, 0($11)
li $17, 28
beq $16, $17, L65
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
beq $16, $17, L65
j L64

L65:
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
j L53

L66:
addi $25, $25, -8
addiu $18, $18, 7
addiu $2, $0, 2
lw $9, 0($11)
mtc1 $9, $f12
addiu $11, $11, 4
j L53

L67:
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
L68:

L69:
addiu $t3, $fp, 4
lw $t0, 0($t3)
addiu $t3, $t3, 4

L70:
lb $t1, 0($t0)
beq $t1, $0, L97
beq $t1, 37, L71
scanf_char_loop_temp:
addi $t0, $t0, 1
j L70

L71:
addi $t0, $t0, 1
lb $t2, 0($t0)
beq $t2, 100, L72
beq $t2, 99, L73
beq $t2, 120, L74
beq $t2, 115, L75
beq $t2, 102, L76
move $t1, $t2
j scanf_char_loop_temp

L72:
li $v0, 5
syscall
lw $t6, 0($t3)
sw $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L70

L73:
li $v0, 12
syscall
lw $t6, 0($t3)
sb $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L70

L74:
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
bne $a0, $0, L77
addi $a1, $a1, -1
scanf_char_special_token_x_return_7:
move $a0, $s1
sll $a0, $a0, 8
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_6
bne $a0, $0, L77
addi $a1, $a1, -1
scanf_char_special_token_x_return_6:
move $a0, $s1
sll $a0, $a0, 16
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_5
bne $a0, $0, L77
addi $a1, $a1, -1
scanf_char_special_token_x_return_5:
move $a0, $s1
sll $a0, $a0, 24
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_4
bne $a0, $0, L77
addi $a1, $a1, -1
scanf_char_special_token_x_return_4:
move $a0, $s0
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_3
bne $a0, $0, L77
addi $a1, $a1, -1
scanf_char_special_token_x_return_3:
move $a0, $s0
sll $a0, $a0, 8
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_2
bne $a0, $0, L77
addi $a1, $a1, -1
scanf_char_special_token_x_return_2:
move $a0, $s0
sll $a0, $a0, 16
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_1
bne $a0, $0, L77
addi $a1, $a1, -1
scanf_char_special_token_x_return_1:
move $a0, $s0
sll $a0, $a0, 24
srl $a0, $a0, 24
addi $a1, $a1, 1
la $v1, scanf_char_special_token_x_return_0
bne $a0, $0, L77
addi $a1, $a1, -1
scanf_char_special_token_x_return_0:
lw $t6, 0($t3)
sw $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L70

L75:
li $v0, 8
li $a1, 512
lw $a0, 0($t3)
syscall
addi $t3, $t3, 4
addi $t0, $t0, 1
j L70

L76:
li $v0, 6
syscall
mfc1 $v0, $f0
lw $t6, 0($t3)
sw $v0, 0($t6)
addi $t3, $t3, 4
addi $t0, $t0, 1
j L70

L77:
beq $a0, 48, L78
beq $a0, 49, L79
beq $a0, 50, L80
beq $a0, 51, L81
beq $a0, 52, L82
beq $a0, 53, L83
beq $a0, 54, L84
beq $a0, 55, L85
beq $a0, 56, L86
beq $a0, 57, L87
beq $a0, 97, L88
beq $a0, 98, L89
beq $a0, 99, L90
beq $a0, 100, L91
beq $a0, 101, L92
beq $a0, 102, L93
addi $a1, $a1, -1
jr $v1

L78:
li $a0, 0
j L94

L79:
li $a0, 1
j L94

L80:
li $a0, 2
j L94

L81:
li $a0, 3
j L94

L82:
li $a0, 4
j L94

L83:
li $a0, 5
j L94

L84:
li $a0, 6
j L94

L85:
li $a0, 7
j L94

L86:
li $a0, 8
j L94

L87:
li $a0, 9
j L94

L88:
li $a0, 10
j L94

L89:
li $a0, 11
j L94

L90:
li $a0, 12
j L94

L91:
li $a0, 13
j L94

L92:
li $a0, 14
j L94

L93:
li $a0, 15
j L94

L94:
move $a2, $a1
li $a3, 1
beq $a2, $0, L96

L95:
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
bne $a2, $0, L95

L96:
mul $a3, $a3, $a0
add $v0, $a3, $v0
jr $v1

L97:
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
L107:

L108:
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
L109:

L110:
lw $t0, 4($30)
lw $t1, 8($30)
move $4, $t1
li $2, 9
syscall
j L111

L111:
addiu $t1, $t1, -1
addiu $t4, $2, 0
addu $t5, $t4, $t1
addu $t6, $t0, $t1
lb $t7, 0($t6)
sb $t7, 0($t5)
li $t8, 0
bne $t8, $t1, L111

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
L112:

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
L113:

L114:
lw $t0, 4($30)
lw $t1, 8($30)
mul $t2, $t0, $t1
move $4, $t2
li $2, 9
syscall
j L115

L115:
addiu $t2, $t2, -1
addiu $t5, $2, 0
addu $t6, $t5, $t2
li $t7, 0
sb $t7, 0($t6)
bne $t7, $t2, L115

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
