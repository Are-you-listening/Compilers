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
float...index_0: .float 3.14
str6: .asciiz  "Something went wrong" 
str7: .asciiz  "Hello world!\n" 
str8: .asciiz  "Something went wrong here" 
float...index_1: .float 5.0
float...index_2: .float 5.0
float...index_3: .float 10.01
str9: .asciiz  "%d" 
str10: .asciiz  "%s" 
str11: .asciiz  "Apple1" 
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

L117:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
li $t1, 0
addiu $29, $29, -4
sw $t1, 4($29)
addiu $t2, $29, 4
#   union NotTypeSafe { INT as_integer ; FLOAT as_float ; CHAR as_str [ 50 ] [ 50 ] ; } ;  INT main ( ) { INT k ; 

li $t4, 0
addiu $29, $29, -4
sw $t4, 4($29)
addiu $t5, $29, 4
#FLOAT s ; 

li $t7, 0
addiu $29, $29, -2600
sb $t7, 4($29)
sb $t7, 5($29)
sb $t7, 6($29)
sb $t7, 7($29)
sb $t7, 8($29)
sb $t7, 9($29)
sb $t7, 10($29)
sb $t7, 11($29)
sb $t7, 12($29)
sb $t7, 13($29)
sb $t7, 14($29)
sb $t7, 15($29)
sb $t7, 16($29)
sb $t7, 17($29)
sb $t7, 18($29)
sb $t7, 19($29)
sb $t7, 20($29)
sb $t7, 21($29)
sb $t7, 22($29)
sb $t7, 23($29)
sb $t7, 24($29)
sb $t7, 25($29)
sb $t7, 26($29)
sb $t7, 27($29)
sb $t7, 28($29)
sb $t7, 29($29)
sb $t7, 30($29)
sb $t7, 31($29)
sb $t7, 32($29)
sb $t7, 33($29)
sb $t7, 34($29)
sb $t7, 35($29)
sb $t7, 36($29)
sb $t7, 37($29)
sb $t7, 38($29)
sb $t7, 39($29)
sb $t7, 40($29)
sb $t7, 41($29)
sb $t7, 42($29)
sb $t7, 43($29)
sb $t7, 44($29)
sb $t7, 45($29)
sb $t7, 46($29)
sb $t7, 47($29)
sb $t7, 48($29)
sb $t7, 49($29)
sb $t7, 50($29)
sb $t7, 51($29)
sb $t7, 52($29)
sb $t7, 53($29)
sb $t7, 54($29)
sb $t7, 55($29)
sb $t7, 56($29)
sb $t7, 57($29)
sb $t7, 58($29)
sb $t7, 59($29)
sb $t7, 60($29)
sb $t7, 61($29)
sb $t7, 62($29)
sb $t7, 63($29)
sb $t7, 64($29)
sb $t7, 65($29)
sb $t7, 66($29)
sb $t7, 67($29)
sb $t7, 68($29)
sb $t7, 69($29)
sb $t7, 70($29)
sb $t7, 71($29)
sb $t7, 72($29)
sb $t7, 73($29)
sb $t7, 74($29)
sb $t7, 75($29)
sb $t7, 76($29)
sb $t7, 77($29)
sb $t7, 78($29)
sb $t7, 79($29)
sb $t7, 80($29)
sb $t7, 81($29)
sb $t7, 82($29)
sb $t7, 83($29)
sb $t7, 84($29)
sb $t7, 85($29)
sb $t7, 86($29)
sb $t7, 87($29)
sb $t7, 88($29)
sb $t7, 89($29)
sb $t7, 90($29)
sb $t7, 91($29)
sb $t7, 92($29)
sb $t7, 93($29)
sb $t7, 94($29)
sb $t7, 95($29)
sb $t7, 96($29)
sb $t7, 97($29)
sb $t7, 98($29)
sb $t7, 99($29)
sb $t7, 100($29)
sb $t7, 101($29)
sb $t7, 102($29)
sb $t7, 103($29)
sb $t7, 104($29)
sb $t7, 105($29)
sb $t7, 106($29)
sb $t7, 107($29)
sb $t7, 108($29)
sb $t7, 109($29)
sb $t7, 110($29)
sb $t7, 111($29)
sb $t7, 112($29)
sb $t7, 113($29)
sb $t7, 114($29)
sb $t7, 115($29)
sb $t7, 116($29)
sb $t7, 117($29)
sb $t7, 118($29)
sb $t7, 119($29)
sb $t7, 120($29)
sb $t7, 121($29)
sb $t7, 122($29)
sb $t7, 123($29)
sb $t7, 124($29)
sb $t7, 125($29)
sb $t7, 126($29)
sb $t7, 127($29)
sb $t7, 128($29)
sb $t7, 129($29)
sb $t7, 130($29)
sb $t7, 131($29)
sb $t7, 132($29)
sb $t7, 133($29)
sb $t7, 134($29)
sb $t7, 135($29)
sb $t7, 136($29)
sb $t7, 137($29)
sb $t7, 138($29)
sb $t7, 139($29)
sb $t7, 140($29)
sb $t7, 141($29)
sb $t7, 142($29)
sb $t7, 143($29)
sb $t7, 144($29)
sb $t7, 145($29)
sb $t7, 146($29)
sb $t7, 147($29)
sb $t7, 148($29)
sb $t7, 149($29)
sb $t7, 150($29)
sb $t7, 151($29)
sb $t7, 152($29)
sb $t7, 153($29)
sb $t7, 154($29)
sb $t7, 155($29)
sb $t7, 156($29)
sb $t7, 157($29)
sb $t7, 158($29)
sb $t7, 159($29)
sb $t7, 160($29)
sb $t7, 161($29)
sb $t7, 162($29)
sb $t7, 163($29)
sb $t7, 164($29)
sb $t7, 165($29)
sb $t7, 166($29)
sb $t7, 167($29)
sb $t7, 168($29)
sb $t7, 169($29)
sb $t7, 170($29)
sb $t7, 171($29)
sb $t7, 172($29)
sb $t7, 173($29)
sb $t7, 174($29)
sb $t7, 175($29)
sb $t7, 176($29)
sb $t7, 177($29)
sb $t7, 178($29)
sb $t7, 179($29)
sb $t7, 180($29)
sb $t7, 181($29)
sb $t7, 182($29)
sb $t7, 183($29)
sb $t7, 184($29)
sb $t7, 185($29)
sb $t7, 186($29)
sb $t7, 187($29)
sb $t7, 188($29)
sb $t7, 189($29)
sb $t7, 190($29)
sb $t7, 191($29)
sb $t7, 192($29)
sb $t7, 193($29)
sb $t7, 194($29)
sb $t7, 195($29)
sb $t7, 196($29)
sb $t7, 197($29)
sb $t7, 198($29)
sb $t7, 199($29)
sb $t7, 200($29)
sb $t7, 201($29)
sb $t7, 202($29)
sb $t7, 203($29)
sb $t7, 204($29)
sb $t7, 205($29)
sb $t7, 206($29)
sb $t7, 207($29)
sb $t7, 208($29)
sb $t7, 209($29)
sb $t7, 210($29)
sb $t7, 211($29)
sb $t7, 212($29)
sb $t7, 213($29)
sb $t7, 214($29)
sb $t7, 215($29)
sb $t7, 216($29)
sb $t7, 217($29)
sb $t7, 218($29)
sb $t7, 219($29)
sb $t7, 220($29)
sb $t7, 221($29)
sb $t7, 222($29)
sb $t7, 223($29)
sb $t7, 224($29)
sb $t7, 225($29)
sb $t7, 226($29)
sb $t7, 227($29)
sb $t7, 228($29)
sb $t7, 229($29)
sb $t7, 230($29)
sb $t7, 231($29)
sb $t7, 232($29)
sb $t7, 233($29)
sb $t7, 234($29)
sb $t7, 235($29)
sb $t7, 236($29)
sb $t7, 237($29)
sb $t7, 238($29)
sb $t7, 239($29)
sb $t7, 240($29)
sb $t7, 241($29)
sb $t7, 242($29)
sb $t7, 243($29)
sb $t7, 244($29)
sb $t7, 245($29)
sb $t7, 246($29)
sb $t7, 247($29)
sb $t7, 248($29)
sb $t7, 249($29)
sb $t7, 250($29)
sb $t7, 251($29)
sb $t7, 252($29)
sb $t7, 253($29)
sb $t7, 254($29)
sb $t7, 255($29)
sb $t7, 256($29)
sb $t7, 257($29)
sb $t7, 258($29)
sb $t7, 259($29)
sb $t7, 260($29)
sb $t7, 261($29)
sb $t7, 262($29)
sb $t7, 263($29)
sb $t7, 264($29)
sb $t7, 265($29)
sb $t7, 266($29)
sb $t7, 267($29)
sb $t7, 268($29)
sb $t7, 269($29)
sb $t7, 270($29)
sb $t7, 271($29)
sb $t7, 272($29)
sb $t7, 273($29)
sb $t7, 274($29)
sb $t7, 275($29)
sb $t7, 276($29)
sb $t7, 277($29)
sb $t7, 278($29)
sb $t7, 279($29)
sb $t7, 280($29)
sb $t7, 281($29)
sb $t7, 282($29)
sb $t7, 283($29)
sb $t7, 284($29)
sb $t7, 285($29)
sb $t7, 286($29)
sb $t7, 287($29)
sb $t7, 288($29)
sb $t7, 289($29)
sb $t7, 290($29)
sb $t7, 291($29)
sb $t7, 292($29)
sb $t7, 293($29)
sb $t7, 294($29)
sb $t7, 295($29)
sb $t7, 296($29)
sb $t7, 297($29)
sb $t7, 298($29)
sb $t7, 299($29)
sb $t7, 300($29)
sb $t7, 301($29)
sb $t7, 302($29)
sb $t7, 303($29)
sb $t7, 304($29)
sb $t7, 305($29)
sb $t7, 306($29)
sb $t7, 307($29)
sb $t7, 308($29)
sb $t7, 309($29)
sb $t7, 310($29)
sb $t7, 311($29)
sb $t7, 312($29)
sb $t7, 313($29)
sb $t7, 314($29)
sb $t7, 315($29)
sb $t7, 316($29)
sb $t7, 317($29)
sb $t7, 318($29)
sb $t7, 319($29)
sb $t7, 320($29)
sb $t7, 321($29)
sb $t7, 322($29)
sb $t7, 323($29)
sb $t7, 324($29)
sb $t7, 325($29)
sb $t7, 326($29)
sb $t7, 327($29)
sb $t7, 328($29)
sb $t7, 329($29)
sb $t7, 330($29)
sb $t7, 331($29)
sb $t7, 332($29)
sb $t7, 333($29)
sb $t7, 334($29)
sb $t7, 335($29)
sb $t7, 336($29)
sb $t7, 337($29)
sb $t7, 338($29)
sb $t7, 339($29)
sb $t7, 340($29)
sb $t7, 341($29)
sb $t7, 342($29)
sb $t7, 343($29)
sb $t7, 344($29)
sb $t7, 345($29)
sb $t7, 346($29)
sb $t7, 347($29)
sb $t7, 348($29)
sb $t7, 349($29)
sb $t7, 350($29)
sb $t7, 351($29)
sb $t7, 352($29)
sb $t7, 353($29)
sb $t7, 354($29)
sb $t7, 355($29)
sb $t7, 356($29)
sb $t7, 357($29)
sb $t7, 358($29)
sb $t7, 359($29)
sb $t7, 360($29)
sb $t7, 361($29)
sb $t7, 362($29)
sb $t7, 363($29)
sb $t7, 364($29)
sb $t7, 365($29)
sb $t7, 366($29)
sb $t7, 367($29)
sb $t7, 368($29)
sb $t7, 369($29)
sb $t7, 370($29)
sb $t7, 371($29)
sb $t7, 372($29)
sb $t7, 373($29)
sb $t7, 374($29)
sb $t7, 375($29)
sb $t7, 376($29)
sb $t7, 377($29)
sb $t7, 378($29)
sb $t7, 379($29)
sb $t7, 380($29)
sb $t7, 381($29)
sb $t7, 382($29)
sb $t7, 383($29)
sb $t7, 384($29)
sb $t7, 385($29)
sb $t7, 386($29)
sb $t7, 387($29)
sb $t7, 388($29)
sb $t7, 389($29)
sb $t7, 390($29)
sb $t7, 391($29)
sb $t7, 392($29)
sb $t7, 393($29)
sb $t7, 394($29)
sb $t7, 395($29)
sb $t7, 396($29)
sb $t7, 397($29)
sb $t7, 398($29)
sb $t7, 399($29)
sb $t7, 400($29)
sb $t7, 401($29)
sb $t7, 402($29)
sb $t7, 403($29)
sb $t7, 404($29)
sb $t7, 405($29)
sb $t7, 406($29)
sb $t7, 407($29)
sb $t7, 408($29)
sb $t7, 409($29)
sb $t7, 410($29)
sb $t7, 411($29)
sb $t7, 412($29)
sb $t7, 413($29)
sb $t7, 414($29)
sb $t7, 415($29)
sb $t7, 416($29)
sb $t7, 417($29)
sb $t7, 418($29)
sb $t7, 419($29)
sb $t7, 420($29)
sb $t7, 421($29)
sb $t7, 422($29)
sb $t7, 423($29)
sb $t7, 424($29)
sb $t7, 425($29)
sb $t7, 426($29)
sb $t7, 427($29)
sb $t7, 428($29)
sb $t7, 429($29)
sb $t7, 430($29)
sb $t7, 431($29)
sb $t7, 432($29)
sb $t7, 433($29)
sb $t7, 434($29)
sb $t7, 435($29)
sb $t7, 436($29)
sb $t7, 437($29)
sb $t7, 438($29)
sb $t7, 439($29)
sb $t7, 440($29)
sb $t7, 441($29)
sb $t7, 442($29)
sb $t7, 443($29)
sb $t7, 444($29)
sb $t7, 445($29)
sb $t7, 446($29)
sb $t7, 447($29)
sb $t7, 448($29)
sb $t7, 449($29)
sb $t7, 450($29)
sb $t7, 451($29)
sb $t7, 452($29)
sb $t7, 453($29)
sb $t7, 454($29)
sb $t7, 455($29)
sb $t7, 456($29)
sb $t7, 457($29)
sb $t7, 458($29)
sb $t7, 459($29)
sb $t7, 460($29)
sb $t7, 461($29)
sb $t7, 462($29)
sb $t7, 463($29)
sb $t7, 464($29)
sb $t7, 465($29)
sb $t7, 466($29)
sb $t7, 467($29)
sb $t7, 468($29)
sb $t7, 469($29)
sb $t7, 470($29)
sb $t7, 471($29)
sb $t7, 472($29)
sb $t7, 473($29)
sb $t7, 474($29)
sb $t7, 475($29)
sb $t7, 476($29)
sb $t7, 477($29)
sb $t7, 478($29)
sb $t7, 479($29)
sb $t7, 480($29)
sb $t7, 481($29)
sb $t7, 482($29)
sb $t7, 483($29)
sb $t7, 484($29)
sb $t7, 485($29)
sb $t7, 486($29)
sb $t7, 487($29)
sb $t7, 488($29)
sb $t7, 489($29)
sb $t7, 490($29)
sb $t7, 491($29)
sb $t7, 492($29)
sb $t7, 493($29)
sb $t7, 494($29)
sb $t7, 495($29)
sb $t7, 496($29)
sb $t7, 497($29)
sb $t7, 498($29)
sb $t7, 499($29)
sb $t7, 500($29)
sb $t7, 501($29)
sb $t7, 502($29)
sb $t7, 503($29)
sb $t7, 504($29)
sb $t7, 505($29)
sb $t7, 506($29)
sb $t7, 507($29)
sb $t7, 508($29)
sb $t7, 509($29)
sb $t7, 510($29)
sb $t7, 511($29)
sb $t7, 512($29)
sb $t7, 513($29)
sb $t7, 514($29)
sb $t7, 515($29)
sb $t7, 516($29)
sb $t7, 517($29)
sb $t7, 518($29)
sb $t7, 519($29)
sb $t7, 520($29)
sb $t7, 521($29)
sb $t7, 522($29)
sb $t7, 523($29)
sb $t7, 524($29)
sb $t7, 525($29)
sb $t7, 526($29)
sb $t7, 527($29)
sb $t7, 528($29)
sb $t7, 529($29)
sb $t7, 530($29)
sb $t7, 531($29)
sb $t7, 532($29)
sb $t7, 533($29)
sb $t7, 534($29)
sb $t7, 535($29)
sb $t7, 536($29)
sb $t7, 537($29)
sb $t7, 538($29)
sb $t7, 539($29)
sb $t7, 540($29)
sb $t7, 541($29)
sb $t7, 542($29)
sb $t7, 543($29)
sb $t7, 544($29)
sb $t7, 545($29)
sb $t7, 546($29)
sb $t7, 547($29)
sb $t7, 548($29)
sb $t7, 549($29)
sb $t7, 550($29)
sb $t7, 551($29)
sb $t7, 552($29)
sb $t7, 553($29)
sb $t7, 554($29)
sb $t7, 555($29)
sb $t7, 556($29)
sb $t7, 557($29)
sb $t7, 558($29)
sb $t7, 559($29)
sb $t7, 560($29)
sb $t7, 561($29)
sb $t7, 562($29)
sb $t7, 563($29)
sb $t7, 564($29)
sb $t7, 565($29)
sb $t7, 566($29)
sb $t7, 567($29)
sb $t7, 568($29)
sb $t7, 569($29)
sb $t7, 570($29)
sb $t7, 571($29)
sb $t7, 572($29)
sb $t7, 573($29)
sb $t7, 574($29)
sb $t7, 575($29)
sb $t7, 576($29)
sb $t7, 577($29)
sb $t7, 578($29)
sb $t7, 579($29)
sb $t7, 580($29)
sb $t7, 581($29)
sb $t7, 582($29)
sb $t7, 583($29)
sb $t7, 584($29)
sb $t7, 585($29)
sb $t7, 586($29)
sb $t7, 587($29)
sb $t7, 588($29)
sb $t7, 589($29)
sb $t7, 590($29)
sb $t7, 591($29)
sb $t7, 592($29)
sb $t7, 593($29)
sb $t7, 594($29)
sb $t7, 595($29)
sb $t7, 596($29)
sb $t7, 597($29)
sb $t7, 598($29)
sb $t7, 599($29)
sb $t7, 600($29)
sb $t7, 601($29)
sb $t7, 602($29)
sb $t7, 603($29)
sb $t7, 604($29)
sb $t7, 605($29)
sb $t7, 606($29)
sb $t7, 607($29)
sb $t7, 608($29)
sb $t7, 609($29)
sb $t7, 610($29)
sb $t7, 611($29)
sb $t7, 612($29)
sb $t7, 613($29)
sb $t7, 614($29)
sb $t7, 615($29)
sb $t7, 616($29)
sb $t7, 617($29)
sb $t7, 618($29)
sb $t7, 619($29)
sb $t7, 620($29)
sb $t7, 621($29)
sb $t7, 622($29)
sb $t7, 623($29)
sb $t7, 624($29)
sb $t7, 625($29)
sb $t7, 626($29)
sb $t7, 627($29)
sb $t7, 628($29)
sb $t7, 629($29)
sb $t7, 630($29)
sb $t7, 631($29)
sb $t7, 632($29)
sb $t7, 633($29)
sb $t7, 634($29)
sb $t7, 635($29)
sb $t7, 636($29)
sb $t7, 637($29)
sb $t7, 638($29)
sb $t7, 639($29)
sb $t7, 640($29)
sb $t7, 641($29)
sb $t7, 642($29)
sb $t7, 643($29)
sb $t7, 644($29)
sb $t7, 645($29)
sb $t7, 646($29)
sb $t7, 647($29)
sb $t7, 648($29)
sb $t7, 649($29)
sb $t7, 650($29)
sb $t7, 651($29)
sb $t7, 652($29)
sb $t7, 653($29)
sb $t7, 654($29)
sb $t7, 655($29)
sb $t7, 656($29)
sb $t7, 657($29)
sb $t7, 658($29)
sb $t7, 659($29)
sb $t7, 660($29)
sb $t7, 661($29)
sb $t7, 662($29)
sb $t7, 663($29)
sb $t7, 664($29)
sb $t7, 665($29)
sb $t7, 666($29)
sb $t7, 667($29)
sb $t7, 668($29)
sb $t7, 669($29)
sb $t7, 670($29)
sb $t7, 671($29)
sb $t7, 672($29)
sb $t7, 673($29)
sb $t7, 674($29)
sb $t7, 675($29)
sb $t7, 676($29)
sb $t7, 677($29)
sb $t7, 678($29)
sb $t7, 679($29)
sb $t7, 680($29)
sb $t7, 681($29)
sb $t7, 682($29)
sb $t7, 683($29)
sb $t7, 684($29)
sb $t7, 685($29)
sb $t7, 686($29)
sb $t7, 687($29)
sb $t7, 688($29)
sb $t7, 689($29)
sb $t7, 690($29)
sb $t7, 691($29)
sb $t7, 692($29)
sb $t7, 693($29)
sb $t7, 694($29)
sb $t7, 695($29)
sb $t7, 696($29)
sb $t7, 697($29)
sb $t7, 698($29)
sb $t7, 699($29)
sb $t7, 700($29)
sb $t7, 701($29)
sb $t7, 702($29)
sb $t7, 703($29)
sb $t7, 704($29)
sb $t7, 705($29)
sb $t7, 706($29)
sb $t7, 707($29)
sb $t7, 708($29)
sb $t7, 709($29)
sb $t7, 710($29)
sb $t7, 711($29)
sb $t7, 712($29)
sb $t7, 713($29)
sb $t7, 714($29)
sb $t7, 715($29)
sb $t7, 716($29)
sb $t7, 717($29)
sb $t7, 718($29)
sb $t7, 719($29)
sb $t7, 720($29)
sb $t7, 721($29)
sb $t7, 722($29)
sb $t7, 723($29)
sb $t7, 724($29)
sb $t7, 725($29)
sb $t7, 726($29)
sb $t7, 727($29)
sb $t7, 728($29)
sb $t7, 729($29)
sb $t7, 730($29)
sb $t7, 731($29)
sb $t7, 732($29)
sb $t7, 733($29)
sb $t7, 734($29)
sb $t7, 735($29)
sb $t7, 736($29)
sb $t7, 737($29)
sb $t7, 738($29)
sb $t7, 739($29)
sb $t7, 740($29)
sb $t7, 741($29)
sb $t7, 742($29)
sb $t7, 743($29)
sb $t7, 744($29)
sb $t7, 745($29)
sb $t7, 746($29)
sb $t7, 747($29)
sb $t7, 748($29)
sb $t7, 749($29)
sb $t7, 750($29)
sb $t7, 751($29)
sb $t7, 752($29)
sb $t7, 753($29)
sb $t7, 754($29)
sb $t7, 755($29)
sb $t7, 756($29)
sb $t7, 757($29)
sb $t7, 758($29)
sb $t7, 759($29)
sb $t7, 760($29)
sb $t7, 761($29)
sb $t7, 762($29)
sb $t7, 763($29)
sb $t7, 764($29)
sb $t7, 765($29)
sb $t7, 766($29)
sb $t7, 767($29)
sb $t7, 768($29)
sb $t7, 769($29)
sb $t7, 770($29)
sb $t7, 771($29)
sb $t7, 772($29)
sb $t7, 773($29)
sb $t7, 774($29)
sb $t7, 775($29)
sb $t7, 776($29)
sb $t7, 777($29)
sb $t7, 778($29)
sb $t7, 779($29)
sb $t7, 780($29)
sb $t7, 781($29)
sb $t7, 782($29)
sb $t7, 783($29)
sb $t7, 784($29)
sb $t7, 785($29)
sb $t7, 786($29)
sb $t7, 787($29)
sb $t7, 788($29)
sb $t7, 789($29)
sb $t7, 790($29)
sb $t7, 791($29)
sb $t7, 792($29)
sb $t7, 793($29)
sb $t7, 794($29)
sb $t7, 795($29)
sb $t7, 796($29)
sb $t7, 797($29)
sb $t7, 798($29)
sb $t7, 799($29)
sb $t7, 800($29)
sb $t7, 801($29)
sb $t7, 802($29)
sb $t7, 803($29)
sb $t7, 804($29)
sb $t7, 805($29)
sb $t7, 806($29)
sb $t7, 807($29)
sb $t7, 808($29)
sb $t7, 809($29)
sb $t7, 810($29)
sb $t7, 811($29)
sb $t7, 812($29)
sb $t7, 813($29)
sb $t7, 814($29)
sb $t7, 815($29)
sb $t7, 816($29)
sb $t7, 817($29)
sb $t7, 818($29)
sb $t7, 819($29)
sb $t7, 820($29)
sb $t7, 821($29)
sb $t7, 822($29)
sb $t7, 823($29)
sb $t7, 824($29)
sb $t7, 825($29)
sb $t7, 826($29)
sb $t7, 827($29)
sb $t7, 828($29)
sb $t7, 829($29)
sb $t7, 830($29)
sb $t7, 831($29)
sb $t7, 832($29)
sb $t7, 833($29)
sb $t7, 834($29)
sb $t7, 835($29)
sb $t7, 836($29)
sb $t7, 837($29)
sb $t7, 838($29)
sb $t7, 839($29)
sb $t7, 840($29)
sb $t7, 841($29)
sb $t7, 842($29)
sb $t7, 843($29)
sb $t7, 844($29)
sb $t7, 845($29)
sb $t7, 846($29)
sb $t7, 847($29)
sb $t7, 848($29)
sb $t7, 849($29)
sb $t7, 850($29)
sb $t7, 851($29)
sb $t7, 852($29)
sb $t7, 853($29)
sb $t7, 854($29)
sb $t7, 855($29)
sb $t7, 856($29)
sb $t7, 857($29)
sb $t7, 858($29)
sb $t7, 859($29)
sb $t7, 860($29)
sb $t7, 861($29)
sb $t7, 862($29)
sb $t7, 863($29)
sb $t7, 864($29)
sb $t7, 865($29)
sb $t7, 866($29)
sb $t7, 867($29)
sb $t7, 868($29)
sb $t7, 869($29)
sb $t7, 870($29)
sb $t7, 871($29)
sb $t7, 872($29)
sb $t7, 873($29)
sb $t7, 874($29)
sb $t7, 875($29)
sb $t7, 876($29)
sb $t7, 877($29)
sb $t7, 878($29)
sb $t7, 879($29)
sb $t7, 880($29)
sb $t7, 881($29)
sb $t7, 882($29)
sb $t7, 883($29)
sb $t7, 884($29)
sb $t7, 885($29)
sb $t7, 886($29)
sb $t7, 887($29)
sb $t7, 888($29)
sb $t7, 889($29)
sb $t7, 890($29)
sb $t7, 891($29)
sb $t7, 892($29)
sb $t7, 893($29)
sb $t7, 894($29)
sb $t7, 895($29)
sb $t7, 896($29)
sb $t7, 897($29)
sb $t7, 898($29)
sb $t7, 899($29)
sb $t7, 900($29)
sb $t7, 901($29)
sb $t7, 902($29)
sb $t7, 903($29)
sb $t7, 904($29)
sb $t7, 905($29)
sb $t7, 906($29)
sb $t7, 907($29)
sb $t7, 908($29)
sb $t7, 909($29)
sb $t7, 910($29)
sb $t7, 911($29)
sb $t7, 912($29)
sb $t7, 913($29)
sb $t7, 914($29)
sb $t7, 915($29)
sb $t7, 916($29)
sb $t7, 917($29)
sb $t7, 918($29)
sb $t7, 919($29)
sb $t7, 920($29)
sb $t7, 921($29)
sb $t7, 922($29)
sb $t7, 923($29)
sb $t7, 924($29)
sb $t7, 925($29)
sb $t7, 926($29)
sb $t7, 927($29)
sb $t7, 928($29)
sb $t7, 929($29)
sb $t7, 930($29)
sb $t7, 931($29)
sb $t7, 932($29)
sb $t7, 933($29)
sb $t7, 934($29)
sb $t7, 935($29)
sb $t7, 936($29)
sb $t7, 937($29)
sb $t7, 938($29)
sb $t7, 939($29)
sb $t7, 940($29)
sb $t7, 941($29)
sb $t7, 942($29)
sb $t7, 943($29)
sb $t7, 944($29)
sb $t7, 945($29)
sb $t7, 946($29)
sb $t7, 947($29)
sb $t7, 948($29)
sb $t7, 949($29)
sb $t7, 950($29)
sb $t7, 951($29)
sb $t7, 952($29)
sb $t7, 953($29)
sb $t7, 954($29)
sb $t7, 955($29)
sb $t7, 956($29)
sb $t7, 957($29)
sb $t7, 958($29)
sb $t7, 959($29)
sb $t7, 960($29)
sb $t7, 961($29)
sb $t7, 962($29)
sb $t7, 963($29)
sb $t7, 964($29)
sb $t7, 965($29)
sb $t7, 966($29)
sb $t7, 967($29)
sb $t7, 968($29)
sb $t7, 969($29)
sb $t7, 970($29)
sb $t7, 971($29)
sb $t7, 972($29)
sb $t7, 973($29)
sb $t7, 974($29)
sb $t7, 975($29)
sb $t7, 976($29)
sb $t7, 977($29)
sb $t7, 978($29)
sb $t7, 979($29)
sb $t7, 980($29)
sb $t7, 981($29)
sb $t7, 982($29)
sb $t7, 983($29)
sb $t7, 984($29)
sb $t7, 985($29)
sb $t7, 986($29)
sb $t7, 987($29)
sb $t7, 988($29)
sb $t7, 989($29)
sb $t7, 990($29)
sb $t7, 991($29)
sb $t7, 992($29)
sb $t7, 993($29)
sb $t7, 994($29)
sb $t7, 995($29)
sb $t7, 996($29)
sb $t7, 997($29)
sb $t7, 998($29)
sb $t7, 999($29)
sb $t7, 1000($29)
sb $t7, 1001($29)
sb $t7, 1002($29)
sb $t7, 1003($29)
sb $t7, 1004($29)
sb $t7, 1005($29)
sb $t7, 1006($29)
sb $t7, 1007($29)
sb $t7, 1008($29)
sb $t7, 1009($29)
sb $t7, 1010($29)
sb $t7, 1011($29)
sb $t7, 1012($29)
sb $t7, 1013($29)
sb $t7, 1014($29)
sb $t7, 1015($29)
sb $t7, 1016($29)
sb $t7, 1017($29)
sb $t7, 1018($29)
sb $t7, 1019($29)
sb $t7, 1020($29)
sb $t7, 1021($29)
sb $t7, 1022($29)
sb $t7, 1023($29)
sb $t7, 1024($29)
sb $t7, 1025($29)
sb $t7, 1026($29)
sb $t7, 1027($29)
sb $t7, 1028($29)
sb $t7, 1029($29)
sb $t7, 1030($29)
sb $t7, 1031($29)
sb $t7, 1032($29)
sb $t7, 1033($29)
sb $t7, 1034($29)
sb $t7, 1035($29)
sb $t7, 1036($29)
sb $t7, 1037($29)
sb $t7, 1038($29)
sb $t7, 1039($29)
sb $t7, 1040($29)
sb $t7, 1041($29)
sb $t7, 1042($29)
sb $t7, 1043($29)
sb $t7, 1044($29)
sb $t7, 1045($29)
sb $t7, 1046($29)
sb $t7, 1047($29)
sb $t7, 1048($29)
sb $t7, 1049($29)
sb $t7, 1050($29)
sb $t7, 1051($29)
sb $t7, 1052($29)
sb $t7, 1053($29)
sb $t7, 1054($29)
sb $t7, 1055($29)
sb $t7, 1056($29)
sb $t7, 1057($29)
sb $t7, 1058($29)
sb $t7, 1059($29)
sb $t7, 1060($29)
sb $t7, 1061($29)
sb $t7, 1062($29)
sb $t7, 1063($29)
sb $t7, 1064($29)
sb $t7, 1065($29)
sb $t7, 1066($29)
sb $t7, 1067($29)
sb $t7, 1068($29)
sb $t7, 1069($29)
sb $t7, 1070($29)
sb $t7, 1071($29)
sb $t7, 1072($29)
sb $t7, 1073($29)
sb $t7, 1074($29)
sb $t7, 1075($29)
sb $t7, 1076($29)
sb $t7, 1077($29)
sb $t7, 1078($29)
sb $t7, 1079($29)
sb $t7, 1080($29)
sb $t7, 1081($29)
sb $t7, 1082($29)
sb $t7, 1083($29)
sb $t7, 1084($29)
sb $t7, 1085($29)
sb $t7, 1086($29)
sb $t7, 1087($29)
sb $t7, 1088($29)
sb $t7, 1089($29)
sb $t7, 1090($29)
sb $t7, 1091($29)
sb $t7, 1092($29)
sb $t7, 1093($29)
sb $t7, 1094($29)
sb $t7, 1095($29)
sb $t7, 1096($29)
sb $t7, 1097($29)
sb $t7, 1098($29)
sb $t7, 1099($29)
sb $t7, 1100($29)
sb $t7, 1101($29)
sb $t7, 1102($29)
sb $t7, 1103($29)
sb $t7, 1104($29)
sb $t7, 1105($29)
sb $t7, 1106($29)
sb $t7, 1107($29)
sb $t7, 1108($29)
sb $t7, 1109($29)
sb $t7, 1110($29)
sb $t7, 1111($29)
sb $t7, 1112($29)
sb $t7, 1113($29)
sb $t7, 1114($29)
sb $t7, 1115($29)
sb $t7, 1116($29)
sb $t7, 1117($29)
sb $t7, 1118($29)
sb $t7, 1119($29)
sb $t7, 1120($29)
sb $t7, 1121($29)
sb $t7, 1122($29)
sb $t7, 1123($29)
sb $t7, 1124($29)
sb $t7, 1125($29)
sb $t7, 1126($29)
sb $t7, 1127($29)
sb $t7, 1128($29)
sb $t7, 1129($29)
sb $t7, 1130($29)
sb $t7, 1131($29)
sb $t7, 1132($29)
sb $t7, 1133($29)
sb $t7, 1134($29)
sb $t7, 1135($29)
sb $t7, 1136($29)
sb $t7, 1137($29)
sb $t7, 1138($29)
sb $t7, 1139($29)
sb $t7, 1140($29)
sb $t7, 1141($29)
sb $t7, 1142($29)
sb $t7, 1143($29)
sb $t7, 1144($29)
sb $t7, 1145($29)
sb $t7, 1146($29)
sb $t7, 1147($29)
sb $t7, 1148($29)
sb $t7, 1149($29)
sb $t7, 1150($29)
sb $t7, 1151($29)
sb $t7, 1152($29)
sb $t7, 1153($29)
sb $t7, 1154($29)
sb $t7, 1155($29)
sb $t7, 1156($29)
sb $t7, 1157($29)
sb $t7, 1158($29)
sb $t7, 1159($29)
sb $t7, 1160($29)
sb $t7, 1161($29)
sb $t7, 1162($29)
sb $t7, 1163($29)
sb $t7, 1164($29)
sb $t7, 1165($29)
sb $t7, 1166($29)
sb $t7, 1167($29)
sb $t7, 1168($29)
sb $t7, 1169($29)
sb $t7, 1170($29)
sb $t7, 1171($29)
sb $t7, 1172($29)
sb $t7, 1173($29)
sb $t7, 1174($29)
sb $t7, 1175($29)
sb $t7, 1176($29)
sb $t7, 1177($29)
sb $t7, 1178($29)
sb $t7, 1179($29)
sb $t7, 1180($29)
sb $t7, 1181($29)
sb $t7, 1182($29)
sb $t7, 1183($29)
sb $t7, 1184($29)
sb $t7, 1185($29)
sb $t7, 1186($29)
sb $t7, 1187($29)
sb $t7, 1188($29)
sb $t7, 1189($29)
sb $t7, 1190($29)
sb $t7, 1191($29)
sb $t7, 1192($29)
sb $t7, 1193($29)
sb $t7, 1194($29)
sb $t7, 1195($29)
sb $t7, 1196($29)
sb $t7, 1197($29)
sb $t7, 1198($29)
sb $t7, 1199($29)
sb $t7, 1200($29)
sb $t7, 1201($29)
sb $t7, 1202($29)
sb $t7, 1203($29)
sb $t7, 1204($29)
sb $t7, 1205($29)
sb $t7, 1206($29)
sb $t7, 1207($29)
sb $t7, 1208($29)
sb $t7, 1209($29)
sb $t7, 1210($29)
sb $t7, 1211($29)
sb $t7, 1212($29)
sb $t7, 1213($29)
sb $t7, 1214($29)
sb $t7, 1215($29)
sb $t7, 1216($29)
sb $t7, 1217($29)
sb $t7, 1218($29)
sb $t7, 1219($29)
sb $t7, 1220($29)
sb $t7, 1221($29)
sb $t7, 1222($29)
sb $t7, 1223($29)
sb $t7, 1224($29)
sb $t7, 1225($29)
sb $t7, 1226($29)
sb $t7, 1227($29)
sb $t7, 1228($29)
sb $t7, 1229($29)
sb $t7, 1230($29)
sb $t7, 1231($29)
sb $t7, 1232($29)
sb $t7, 1233($29)
sb $t7, 1234($29)
sb $t7, 1235($29)
sb $t7, 1236($29)
sb $t7, 1237($29)
sb $t7, 1238($29)
sb $t7, 1239($29)
sb $t7, 1240($29)
sb $t7, 1241($29)
sb $t7, 1242($29)
sb $t7, 1243($29)
sb $t7, 1244($29)
sb $t7, 1245($29)
sb $t7, 1246($29)
sb $t7, 1247($29)
sb $t7, 1248($29)
sb $t7, 1249($29)
sb $t7, 1250($29)
sb $t7, 1251($29)
sb $t7, 1252($29)
sb $t7, 1253($29)
sb $t7, 1254($29)
sb $t7, 1255($29)
sb $t7, 1256($29)
sb $t7, 1257($29)
sb $t7, 1258($29)
sb $t7, 1259($29)
sb $t7, 1260($29)
sb $t7, 1261($29)
sb $t7, 1262($29)
sb $t7, 1263($29)
sb $t7, 1264($29)
sb $t7, 1265($29)
sb $t7, 1266($29)
sb $t7, 1267($29)
sb $t7, 1268($29)
sb $t7, 1269($29)
sb $t7, 1270($29)
sb $t7, 1271($29)
sb $t7, 1272($29)
sb $t7, 1273($29)
sb $t7, 1274($29)
sb $t7, 1275($29)
sb $t7, 1276($29)
sb $t7, 1277($29)
sb $t7, 1278($29)
sb $t7, 1279($29)
sb $t7, 1280($29)
sb $t7, 1281($29)
sb $t7, 1282($29)
sb $t7, 1283($29)
sb $t7, 1284($29)
sb $t7, 1285($29)
sb $t7, 1286($29)
sb $t7, 1287($29)
sb $t7, 1288($29)
sb $t7, 1289($29)
sb $t7, 1290($29)
sb $t7, 1291($29)
sb $t7, 1292($29)
sb $t7, 1293($29)
sb $t7, 1294($29)
sb $t7, 1295($29)
sb $t7, 1296($29)
sb $t7, 1297($29)
sb $t7, 1298($29)
sb $t7, 1299($29)
sb $t7, 1300($29)
sb $t7, 1301($29)
sb $t7, 1302($29)
sb $t7, 1303($29)
sb $t7, 1304($29)
sb $t7, 1305($29)
sb $t7, 1306($29)
sb $t7, 1307($29)
sb $t7, 1308($29)
sb $t7, 1309($29)
sb $t7, 1310($29)
sb $t7, 1311($29)
sb $t7, 1312($29)
sb $t7, 1313($29)
sb $t7, 1314($29)
sb $t7, 1315($29)
sb $t7, 1316($29)
sb $t7, 1317($29)
sb $t7, 1318($29)
sb $t7, 1319($29)
sb $t7, 1320($29)
sb $t7, 1321($29)
sb $t7, 1322($29)
sb $t7, 1323($29)
sb $t7, 1324($29)
sb $t7, 1325($29)
sb $t7, 1326($29)
sb $t7, 1327($29)
sb $t7, 1328($29)
sb $t7, 1329($29)
sb $t7, 1330($29)
sb $t7, 1331($29)
sb $t7, 1332($29)
sb $t7, 1333($29)
sb $t7, 1334($29)
sb $t7, 1335($29)
sb $t7, 1336($29)
sb $t7, 1337($29)
sb $t7, 1338($29)
sb $t7, 1339($29)
sb $t7, 1340($29)
sb $t7, 1341($29)
sb $t7, 1342($29)
sb $t7, 1343($29)
sb $t7, 1344($29)
sb $t7, 1345($29)
sb $t7, 1346($29)
sb $t7, 1347($29)
sb $t7, 1348($29)
sb $t7, 1349($29)
sb $t7, 1350($29)
sb $t7, 1351($29)
sb $t7, 1352($29)
sb $t7, 1353($29)
sb $t7, 1354($29)
sb $t7, 1355($29)
sb $t7, 1356($29)
sb $t7, 1357($29)
sb $t7, 1358($29)
sb $t7, 1359($29)
sb $t7, 1360($29)
sb $t7, 1361($29)
sb $t7, 1362($29)
sb $t7, 1363($29)
sb $t7, 1364($29)
sb $t7, 1365($29)
sb $t7, 1366($29)
sb $t7, 1367($29)
sb $t7, 1368($29)
sb $t7, 1369($29)
sb $t7, 1370($29)
sb $t7, 1371($29)
sb $t7, 1372($29)
sb $t7, 1373($29)
sb $t7, 1374($29)
sb $t7, 1375($29)
sb $t7, 1376($29)
sb $t7, 1377($29)
sb $t7, 1378($29)
sb $t7, 1379($29)
sb $t7, 1380($29)
sb $t7, 1381($29)
sb $t7, 1382($29)
sb $t7, 1383($29)
sb $t7, 1384($29)
sb $t7, 1385($29)
sb $t7, 1386($29)
sb $t7, 1387($29)
sb $t7, 1388($29)
sb $t7, 1389($29)
sb $t7, 1390($29)
sb $t7, 1391($29)
sb $t7, 1392($29)
sb $t7, 1393($29)
sb $t7, 1394($29)
sb $t7, 1395($29)
sb $t7, 1396($29)
sb $t7, 1397($29)
sb $t7, 1398($29)
sb $t7, 1399($29)
sb $t7, 1400($29)
sb $t7, 1401($29)
sb $t7, 1402($29)
sb $t7, 1403($29)
sb $t7, 1404($29)
sb $t7, 1405($29)
sb $t7, 1406($29)
sb $t7, 1407($29)
sb $t7, 1408($29)
sb $t7, 1409($29)
sb $t7, 1410($29)
sb $t7, 1411($29)
sb $t7, 1412($29)
sb $t7, 1413($29)
sb $t7, 1414($29)
sb $t7, 1415($29)
sb $t7, 1416($29)
sb $t7, 1417($29)
sb $t7, 1418($29)
sb $t7, 1419($29)
sb $t7, 1420($29)
sb $t7, 1421($29)
sb $t7, 1422($29)
sb $t7, 1423($29)
sb $t7, 1424($29)
sb $t7, 1425($29)
sb $t7, 1426($29)
sb $t7, 1427($29)
sb $t7, 1428($29)
sb $t7, 1429($29)
sb $t7, 1430($29)
sb $t7, 1431($29)
sb $t7, 1432($29)
sb $t7, 1433($29)
sb $t7, 1434($29)
sb $t7, 1435($29)
sb $t7, 1436($29)
sb $t7, 1437($29)
sb $t7, 1438($29)
sb $t7, 1439($29)
sb $t7, 1440($29)
sb $t7, 1441($29)
sb $t7, 1442($29)
sb $t7, 1443($29)
sb $t7, 1444($29)
sb $t7, 1445($29)
sb $t7, 1446($29)
sb $t7, 1447($29)
sb $t7, 1448($29)
sb $t7, 1449($29)
sb $t7, 1450($29)
sb $t7, 1451($29)
sb $t7, 1452($29)
sb $t7, 1453($29)
sb $t7, 1454($29)
sb $t7, 1455($29)
sb $t7, 1456($29)
sb $t7, 1457($29)
sb $t7, 1458($29)
sb $t7, 1459($29)
sb $t7, 1460($29)
sb $t7, 1461($29)
sb $t7, 1462($29)
sb $t7, 1463($29)
sb $t7, 1464($29)
sb $t7, 1465($29)
sb $t7, 1466($29)
sb $t7, 1467($29)
sb $t7, 1468($29)
sb $t7, 1469($29)
sb $t7, 1470($29)
sb $t7, 1471($29)
sb $t7, 1472($29)
sb $t7, 1473($29)
sb $t7, 1474($29)
sb $t7, 1475($29)
sb $t7, 1476($29)
sb $t7, 1477($29)
sb $t7, 1478($29)
sb $t7, 1479($29)
sb $t7, 1480($29)
sb $t7, 1481($29)
sb $t7, 1482($29)
sb $t7, 1483($29)
sb $t7, 1484($29)
sb $t7, 1485($29)
sb $t7, 1486($29)
sb $t7, 1487($29)
sb $t7, 1488($29)
sb $t7, 1489($29)
sb $t7, 1490($29)
sb $t7, 1491($29)
sb $t7, 1492($29)
sb $t7, 1493($29)
sb $t7, 1494($29)
sb $t7, 1495($29)
sb $t7, 1496($29)
sb $t7, 1497($29)
sb $t7, 1498($29)
sb $t7, 1499($29)
sb $t7, 1500($29)
sb $t7, 1501($29)
sb $t7, 1502($29)
sb $t7, 1503($29)
sb $t7, 1504($29)
sb $t7, 1505($29)
sb $t7, 1506($29)
sb $t7, 1507($29)
sb $t7, 1508($29)
sb $t7, 1509($29)
sb $t7, 1510($29)
sb $t7, 1511($29)
sb $t7, 1512($29)
sb $t7, 1513($29)
sb $t7, 1514($29)
sb $t7, 1515($29)
sb $t7, 1516($29)
sb $t7, 1517($29)
sb $t7, 1518($29)
sb $t7, 1519($29)
sb $t7, 1520($29)
sb $t7, 1521($29)
sb $t7, 1522($29)
sb $t7, 1523($29)
sb $t7, 1524($29)
sb $t7, 1525($29)
sb $t7, 1526($29)
sb $t7, 1527($29)
sb $t7, 1528($29)
sb $t7, 1529($29)
sb $t7, 1530($29)
sb $t7, 1531($29)
sb $t7, 1532($29)
sb $t7, 1533($29)
sb $t7, 1534($29)
sb $t7, 1535($29)
sb $t7, 1536($29)
sb $t7, 1537($29)
sb $t7, 1538($29)
sb $t7, 1539($29)
sb $t7, 1540($29)
sb $t7, 1541($29)
sb $t7, 1542($29)
sb $t7, 1543($29)
sb $t7, 1544($29)
sb $t7, 1545($29)
sb $t7, 1546($29)
sb $t7, 1547($29)
sb $t7, 1548($29)
sb $t7, 1549($29)
sb $t7, 1550($29)
sb $t7, 1551($29)
sb $t7, 1552($29)
sb $t7, 1553($29)
sb $t7, 1554($29)
sb $t7, 1555($29)
sb $t7, 1556($29)
sb $t7, 1557($29)
sb $t7, 1558($29)
sb $t7, 1559($29)
sb $t7, 1560($29)
sb $t7, 1561($29)
sb $t7, 1562($29)
sb $t7, 1563($29)
sb $t7, 1564($29)
sb $t7, 1565($29)
sb $t7, 1566($29)
sb $t7, 1567($29)
sb $t7, 1568($29)
sb $t7, 1569($29)
sb $t7, 1570($29)
sb $t7, 1571($29)
sb $t7, 1572($29)
sb $t7, 1573($29)
sb $t7, 1574($29)
sb $t7, 1575($29)
sb $t7, 1576($29)
sb $t7, 1577($29)
sb $t7, 1578($29)
sb $t7, 1579($29)
sb $t7, 1580($29)
sb $t7, 1581($29)
sb $t7, 1582($29)
sb $t7, 1583($29)
sb $t7, 1584($29)
sb $t7, 1585($29)
sb $t7, 1586($29)
sb $t7, 1587($29)
sb $t7, 1588($29)
sb $t7, 1589($29)
sb $t7, 1590($29)
sb $t7, 1591($29)
sb $t7, 1592($29)
sb $t7, 1593($29)
sb $t7, 1594($29)
sb $t7, 1595($29)
sb $t7, 1596($29)
sb $t7, 1597($29)
sb $t7, 1598($29)
sb $t7, 1599($29)
sb $t7, 1600($29)
sb $t7, 1601($29)
sb $t7, 1602($29)
sb $t7, 1603($29)
sb $t7, 1604($29)
sb $t7, 1605($29)
sb $t7, 1606($29)
sb $t7, 1607($29)
sb $t7, 1608($29)
sb $t7, 1609($29)
sb $t7, 1610($29)
sb $t7, 1611($29)
sb $t7, 1612($29)
sb $t7, 1613($29)
sb $t7, 1614($29)
sb $t7, 1615($29)
sb $t7, 1616($29)
sb $t7, 1617($29)
sb $t7, 1618($29)
sb $t7, 1619($29)
sb $t7, 1620($29)
sb $t7, 1621($29)
sb $t7, 1622($29)
sb $t7, 1623($29)
sb $t7, 1624($29)
sb $t7, 1625($29)
sb $t7, 1626($29)
sb $t7, 1627($29)
sb $t7, 1628($29)
sb $t7, 1629($29)
sb $t7, 1630($29)
sb $t7, 1631($29)
sb $t7, 1632($29)
sb $t7, 1633($29)
sb $t7, 1634($29)
sb $t7, 1635($29)
sb $t7, 1636($29)
sb $t7, 1637($29)
sb $t7, 1638($29)
sb $t7, 1639($29)
sb $t7, 1640($29)
sb $t7, 1641($29)
sb $t7, 1642($29)
sb $t7, 1643($29)
sb $t7, 1644($29)
sb $t7, 1645($29)
sb $t7, 1646($29)
sb $t7, 1647($29)
sb $t7, 1648($29)
sb $t7, 1649($29)
sb $t7, 1650($29)
sb $t7, 1651($29)
sb $t7, 1652($29)
sb $t7, 1653($29)
sb $t7, 1654($29)
sb $t7, 1655($29)
sb $t7, 1656($29)
sb $t7, 1657($29)
sb $t7, 1658($29)
sb $t7, 1659($29)
sb $t7, 1660($29)
sb $t7, 1661($29)
sb $t7, 1662($29)
sb $t7, 1663($29)
sb $t7, 1664($29)
sb $t7, 1665($29)
sb $t7, 1666($29)
sb $t7, 1667($29)
sb $t7, 1668($29)
sb $t7, 1669($29)
sb $t7, 1670($29)
sb $t7, 1671($29)
sb $t7, 1672($29)
sb $t7, 1673($29)
sb $t7, 1674($29)
sb $t7, 1675($29)
sb $t7, 1676($29)
sb $t7, 1677($29)
sb $t7, 1678($29)
sb $t7, 1679($29)
sb $t7, 1680($29)
sb $t7, 1681($29)
sb $t7, 1682($29)
sb $t7, 1683($29)
sb $t7, 1684($29)
sb $t7, 1685($29)
sb $t7, 1686($29)
sb $t7, 1687($29)
sb $t7, 1688($29)
sb $t7, 1689($29)
sb $t7, 1690($29)
sb $t7, 1691($29)
sb $t7, 1692($29)
sb $t7, 1693($29)
sb $t7, 1694($29)
sb $t7, 1695($29)
sb $t7, 1696($29)
sb $t7, 1697($29)
sb $t7, 1698($29)
sb $t7, 1699($29)
sb $t7, 1700($29)
sb $t7, 1701($29)
sb $t7, 1702($29)
sb $t7, 1703($29)
sb $t7, 1704($29)
sb $t7, 1705($29)
sb $t7, 1706($29)
sb $t7, 1707($29)
sb $t7, 1708($29)
sb $t7, 1709($29)
sb $t7, 1710($29)
sb $t7, 1711($29)
sb $t7, 1712($29)
sb $t7, 1713($29)
sb $t7, 1714($29)
sb $t7, 1715($29)
sb $t7, 1716($29)
sb $t7, 1717($29)
sb $t7, 1718($29)
sb $t7, 1719($29)
sb $t7, 1720($29)
sb $t7, 1721($29)
sb $t7, 1722($29)
sb $t7, 1723($29)
sb $t7, 1724($29)
sb $t7, 1725($29)
sb $t7, 1726($29)
sb $t7, 1727($29)
sb $t7, 1728($29)
sb $t7, 1729($29)
sb $t7, 1730($29)
sb $t7, 1731($29)
sb $t7, 1732($29)
sb $t7, 1733($29)
sb $t7, 1734($29)
sb $t7, 1735($29)
sb $t7, 1736($29)
sb $t7, 1737($29)
sb $t7, 1738($29)
sb $t7, 1739($29)
sb $t7, 1740($29)
sb $t7, 1741($29)
sb $t7, 1742($29)
sb $t7, 1743($29)
sb $t7, 1744($29)
sb $t7, 1745($29)
sb $t7, 1746($29)
sb $t7, 1747($29)
sb $t7, 1748($29)
sb $t7, 1749($29)
sb $t7, 1750($29)
sb $t7, 1751($29)
sb $t7, 1752($29)
sb $t7, 1753($29)
sb $t7, 1754($29)
sb $t7, 1755($29)
sb $t7, 1756($29)
sb $t7, 1757($29)
sb $t7, 1758($29)
sb $t7, 1759($29)
sb $t7, 1760($29)
sb $t7, 1761($29)
sb $t7, 1762($29)
sb $t7, 1763($29)
sb $t7, 1764($29)
sb $t7, 1765($29)
sb $t7, 1766($29)
sb $t7, 1767($29)
sb $t7, 1768($29)
sb $t7, 1769($29)
sb $t7, 1770($29)
sb $t7, 1771($29)
sb $t7, 1772($29)
sb $t7, 1773($29)
sb $t7, 1774($29)
sb $t7, 1775($29)
sb $t7, 1776($29)
sb $t7, 1777($29)
sb $t7, 1778($29)
sb $t7, 1779($29)
sb $t7, 1780($29)
sb $t7, 1781($29)
sb $t7, 1782($29)
sb $t7, 1783($29)
sb $t7, 1784($29)
sb $t7, 1785($29)
sb $t7, 1786($29)
sb $t7, 1787($29)
sb $t7, 1788($29)
sb $t7, 1789($29)
sb $t7, 1790($29)
sb $t7, 1791($29)
sb $t7, 1792($29)
sb $t7, 1793($29)
sb $t7, 1794($29)
sb $t7, 1795($29)
sb $t7, 1796($29)
sb $t7, 1797($29)
sb $t7, 1798($29)
sb $t7, 1799($29)
sb $t7, 1800($29)
sb $t7, 1801($29)
sb $t7, 1802($29)
sb $t7, 1803($29)
sb $t7, 1804($29)
sb $t7, 1805($29)
sb $t7, 1806($29)
sb $t7, 1807($29)
sb $t7, 1808($29)
sb $t7, 1809($29)
sb $t7, 1810($29)
sb $t7, 1811($29)
sb $t7, 1812($29)
sb $t7, 1813($29)
sb $t7, 1814($29)
sb $t7, 1815($29)
sb $t7, 1816($29)
sb $t7, 1817($29)
sb $t7, 1818($29)
sb $t7, 1819($29)
sb $t7, 1820($29)
sb $t7, 1821($29)
sb $t7, 1822($29)
sb $t7, 1823($29)
sb $t7, 1824($29)
sb $t7, 1825($29)
sb $t7, 1826($29)
sb $t7, 1827($29)
sb $t7, 1828($29)
sb $t7, 1829($29)
sb $t7, 1830($29)
sb $t7, 1831($29)
sb $t7, 1832($29)
sb $t7, 1833($29)
sb $t7, 1834($29)
sb $t7, 1835($29)
sb $t7, 1836($29)
sb $t7, 1837($29)
sb $t7, 1838($29)
sb $t7, 1839($29)
sb $t7, 1840($29)
sb $t7, 1841($29)
sb $t7, 1842($29)
sb $t7, 1843($29)
sb $t7, 1844($29)
sb $t7, 1845($29)
sb $t7, 1846($29)
sb $t7, 1847($29)
sb $t7, 1848($29)
sb $t7, 1849($29)
sb $t7, 1850($29)
sb $t7, 1851($29)
sb $t7, 1852($29)
sb $t7, 1853($29)
sb $t7, 1854($29)
sb $t7, 1855($29)
sb $t7, 1856($29)
sb $t7, 1857($29)
sb $t7, 1858($29)
sb $t7, 1859($29)
sb $t7, 1860($29)
sb $t7, 1861($29)
sb $t7, 1862($29)
sb $t7, 1863($29)
sb $t7, 1864($29)
sb $t7, 1865($29)
sb $t7, 1866($29)
sb $t7, 1867($29)
sb $t7, 1868($29)
sb $t7, 1869($29)
sb $t7, 1870($29)
sb $t7, 1871($29)
sb $t7, 1872($29)
sb $t7, 1873($29)
sb $t7, 1874($29)
sb $t7, 1875($29)
sb $t7, 1876($29)
sb $t7, 1877($29)
sb $t7, 1878($29)
sb $t7, 1879($29)
sb $t7, 1880($29)
sb $t7, 1881($29)
sb $t7, 1882($29)
sb $t7, 1883($29)
sb $t7, 1884($29)
sb $t7, 1885($29)
sb $t7, 1886($29)
sb $t7, 1887($29)
sb $t7, 1888($29)
sb $t7, 1889($29)
sb $t7, 1890($29)
sb $t7, 1891($29)
sb $t7, 1892($29)
sb $t7, 1893($29)
sb $t7, 1894($29)
sb $t7, 1895($29)
sb $t7, 1896($29)
sb $t7, 1897($29)
sb $t7, 1898($29)
sb $t7, 1899($29)
sb $t7, 1900($29)
sb $t7, 1901($29)
sb $t7, 1902($29)
sb $t7, 1903($29)
sb $t7, 1904($29)
sb $t7, 1905($29)
sb $t7, 1906($29)
sb $t7, 1907($29)
sb $t7, 1908($29)
sb $t7, 1909($29)
sb $t7, 1910($29)
sb $t7, 1911($29)
sb $t7, 1912($29)
sb $t7, 1913($29)
sb $t7, 1914($29)
sb $t7, 1915($29)
sb $t7, 1916($29)
sb $t7, 1917($29)
sb $t7, 1918($29)
sb $t7, 1919($29)
sb $t7, 1920($29)
sb $t7, 1921($29)
sb $t7, 1922($29)
sb $t7, 1923($29)
sb $t7, 1924($29)
sb $t7, 1925($29)
sb $t7, 1926($29)
sb $t7, 1927($29)
sb $t7, 1928($29)
sb $t7, 1929($29)
sb $t7, 1930($29)
sb $t7, 1931($29)
sb $t7, 1932($29)
sb $t7, 1933($29)
sb $t7, 1934($29)
sb $t7, 1935($29)
sb $t7, 1936($29)
sb $t7, 1937($29)
sb $t7, 1938($29)
sb $t7, 1939($29)
sb $t7, 1940($29)
sb $t7, 1941($29)
sb $t7, 1942($29)
sb $t7, 1943($29)
sb $t7, 1944($29)
sb $t7, 1945($29)
sb $t7, 1946($29)
sb $t7, 1947($29)
sb $t7, 1948($29)
sb $t7, 1949($29)
sb $t7, 1950($29)
sb $t7, 1951($29)
sb $t7, 1952($29)
sb $t7, 1953($29)
sb $t7, 1954($29)
sb $t7, 1955($29)
sb $t7, 1956($29)
sb $t7, 1957($29)
sb $t7, 1958($29)
sb $t7, 1959($29)
sb $t7, 1960($29)
sb $t7, 1961($29)
sb $t7, 1962($29)
sb $t7, 1963($29)
sb $t7, 1964($29)
sb $t7, 1965($29)
sb $t7, 1966($29)
sb $t7, 1967($29)
sb $t7, 1968($29)
sb $t7, 1969($29)
sb $t7, 1970($29)
sb $t7, 1971($29)
sb $t7, 1972($29)
sb $t7, 1973($29)
sb $t7, 1974($29)
sb $t7, 1975($29)
sb $t7, 1976($29)
sb $t7, 1977($29)
sb $t7, 1978($29)
sb $t7, 1979($29)
sb $t7, 1980($29)
sb $t7, 1981($29)
sb $t7, 1982($29)
sb $t7, 1983($29)
sb $t7, 1984($29)
sb $t7, 1985($29)
sb $t7, 1986($29)
sb $t7, 1987($29)
sb $t7, 1988($29)
sb $t7, 1989($29)
sb $t7, 1990($29)
sb $t7, 1991($29)
sb $t7, 1992($29)
sb $t7, 1993($29)
sb $t7, 1994($29)
sb $t7, 1995($29)
sb $t7, 1996($29)
sb $t7, 1997($29)
sb $t7, 1998($29)
sb $t7, 1999($29)
sb $t7, 2000($29)
sb $t7, 2001($29)
sb $t7, 2002($29)
sb $t7, 2003($29)
sb $t7, 2004($29)
sb $t7, 2005($29)
sb $t7, 2006($29)
sb $t7, 2007($29)
sb $t7, 2008($29)
sb $t7, 2009($29)
sb $t7, 2010($29)
sb $t7, 2011($29)
sb $t7, 2012($29)
sb $t7, 2013($29)
sb $t7, 2014($29)
sb $t7, 2015($29)
sb $t7, 2016($29)
sb $t7, 2017($29)
sb $t7, 2018($29)
sb $t7, 2019($29)
sb $t7, 2020($29)
sb $t7, 2021($29)
sb $t7, 2022($29)
sb $t7, 2023($29)
sb $t7, 2024($29)
sb $t7, 2025($29)
sb $t7, 2026($29)
sb $t7, 2027($29)
sb $t7, 2028($29)
sb $t7, 2029($29)
sb $t7, 2030($29)
sb $t7, 2031($29)
sb $t7, 2032($29)
sb $t7, 2033($29)
sb $t7, 2034($29)
sb $t7, 2035($29)
sb $t7, 2036($29)
sb $t7, 2037($29)
sb $t7, 2038($29)
sb $t7, 2039($29)
sb $t7, 2040($29)
sb $t7, 2041($29)
sb $t7, 2042($29)
sb $t7, 2043($29)
sb $t7, 2044($29)
sb $t7, 2045($29)
sb $t7, 2046($29)
sb $t7, 2047($29)
sb $t7, 2048($29)
sb $t7, 2049($29)
sb $t7, 2050($29)
sb $t7, 2051($29)
sb $t7, 2052($29)
sb $t7, 2053($29)
sb $t7, 2054($29)
sb $t7, 2055($29)
sb $t7, 2056($29)
sb $t7, 2057($29)
sb $t7, 2058($29)
sb $t7, 2059($29)
sb $t7, 2060($29)
sb $t7, 2061($29)
sb $t7, 2062($29)
sb $t7, 2063($29)
sb $t7, 2064($29)
sb $t7, 2065($29)
sb $t7, 2066($29)
sb $t7, 2067($29)
sb $t7, 2068($29)
sb $t7, 2069($29)
sb $t7, 2070($29)
sb $t7, 2071($29)
sb $t7, 2072($29)
sb $t7, 2073($29)
sb $t7, 2074($29)
sb $t7, 2075($29)
sb $t7, 2076($29)
sb $t7, 2077($29)
sb $t7, 2078($29)
sb $t7, 2079($29)
sb $t7, 2080($29)
sb $t7, 2081($29)
sb $t7, 2082($29)
sb $t7, 2083($29)
sb $t7, 2084($29)
sb $t7, 2085($29)
sb $t7, 2086($29)
sb $t7, 2087($29)
sb $t7, 2088($29)
sb $t7, 2089($29)
sb $t7, 2090($29)
sb $t7, 2091($29)
sb $t7, 2092($29)
sb $t7, 2093($29)
sb $t7, 2094($29)
sb $t7, 2095($29)
sb $t7, 2096($29)
sb $t7, 2097($29)
sb $t7, 2098($29)
sb $t7, 2099($29)
sb $t7, 2100($29)
sb $t7, 2101($29)
sb $t7, 2102($29)
sb $t7, 2103($29)
sb $t7, 2104($29)
sb $t7, 2105($29)
sb $t7, 2106($29)
sb $t7, 2107($29)
sb $t7, 2108($29)
sb $t7, 2109($29)
sb $t7, 2110($29)
sb $t7, 2111($29)
sb $t7, 2112($29)
sb $t7, 2113($29)
sb $t7, 2114($29)
sb $t7, 2115($29)
sb $t7, 2116($29)
sb $t7, 2117($29)
sb $t7, 2118($29)
sb $t7, 2119($29)
sb $t7, 2120($29)
sb $t7, 2121($29)
sb $t7, 2122($29)
sb $t7, 2123($29)
sb $t7, 2124($29)
sb $t7, 2125($29)
sb $t7, 2126($29)
sb $t7, 2127($29)
sb $t7, 2128($29)
sb $t7, 2129($29)
sb $t7, 2130($29)
sb $t7, 2131($29)
sb $t7, 2132($29)
sb $t7, 2133($29)
sb $t7, 2134($29)
sb $t7, 2135($29)
sb $t7, 2136($29)
sb $t7, 2137($29)
sb $t7, 2138($29)
sb $t7, 2139($29)
sb $t7, 2140($29)
sb $t7, 2141($29)
sb $t7, 2142($29)
sb $t7, 2143($29)
sb $t7, 2144($29)
sb $t7, 2145($29)
sb $t7, 2146($29)
sb $t7, 2147($29)
sb $t7, 2148($29)
sb $t7, 2149($29)
sb $t7, 2150($29)
sb $t7, 2151($29)
sb $t7, 2152($29)
sb $t7, 2153($29)
sb $t7, 2154($29)
sb $t7, 2155($29)
sb $t7, 2156($29)
sb $t7, 2157($29)
sb $t7, 2158($29)
sb $t7, 2159($29)
sb $t7, 2160($29)
sb $t7, 2161($29)
sb $t7, 2162($29)
sb $t7, 2163($29)
sb $t7, 2164($29)
sb $t7, 2165($29)
sb $t7, 2166($29)
sb $t7, 2167($29)
sb $t7, 2168($29)
sb $t7, 2169($29)
sb $t7, 2170($29)
sb $t7, 2171($29)
sb $t7, 2172($29)
sb $t7, 2173($29)
sb $t7, 2174($29)
sb $t7, 2175($29)
sb $t7, 2176($29)
sb $t7, 2177($29)
sb $t7, 2178($29)
sb $t7, 2179($29)
sb $t7, 2180($29)
sb $t7, 2181($29)
sb $t7, 2182($29)
sb $t7, 2183($29)
sb $t7, 2184($29)
sb $t7, 2185($29)
sb $t7, 2186($29)
sb $t7, 2187($29)
sb $t7, 2188($29)
sb $t7, 2189($29)
sb $t7, 2190($29)
sb $t7, 2191($29)
sb $t7, 2192($29)
sb $t7, 2193($29)
sb $t7, 2194($29)
sb $t7, 2195($29)
sb $t7, 2196($29)
sb $t7, 2197($29)
sb $t7, 2198($29)
sb $t7, 2199($29)
sb $t7, 2200($29)
sb $t7, 2201($29)
sb $t7, 2202($29)
sb $t7, 2203($29)
sb $t7, 2204($29)
sb $t7, 2205($29)
sb $t7, 2206($29)
sb $t7, 2207($29)
sb $t7, 2208($29)
sb $t7, 2209($29)
sb $t7, 2210($29)
sb $t7, 2211($29)
sb $t7, 2212($29)
sb $t7, 2213($29)
sb $t7, 2214($29)
sb $t7, 2215($29)
sb $t7, 2216($29)
sb $t7, 2217($29)
sb $t7, 2218($29)
sb $t7, 2219($29)
sb $t7, 2220($29)
sb $t7, 2221($29)
sb $t7, 2222($29)
sb $t7, 2223($29)
sb $t7, 2224($29)
sb $t7, 2225($29)
sb $t7, 2226($29)
sb $t7, 2227($29)
sb $t7, 2228($29)
sb $t7, 2229($29)
sb $t7, 2230($29)
sb $t7, 2231($29)
sb $t7, 2232($29)
sb $t7, 2233($29)
sb $t7, 2234($29)
sb $t7, 2235($29)
sb $t7, 2236($29)
sb $t7, 2237($29)
sb $t7, 2238($29)
sb $t7, 2239($29)
sb $t7, 2240($29)
sb $t7, 2241($29)
sb $t7, 2242($29)
sb $t7, 2243($29)
sb $t7, 2244($29)
sb $t7, 2245($29)
sb $t7, 2246($29)
sb $t7, 2247($29)
sb $t7, 2248($29)
sb $t7, 2249($29)
sb $t7, 2250($29)
sb $t7, 2251($29)
sb $t7, 2252($29)
sb $t7, 2253($29)
sb $t7, 2254($29)
sb $t7, 2255($29)
sb $t7, 2256($29)
sb $t7, 2257($29)
sb $t7, 2258($29)
sb $t7, 2259($29)
sb $t7, 2260($29)
sb $t7, 2261($29)
sb $t7, 2262($29)
sb $t7, 2263($29)
sb $t7, 2264($29)
sb $t7, 2265($29)
sb $t7, 2266($29)
sb $t7, 2267($29)
sb $t7, 2268($29)
sb $t7, 2269($29)
sb $t7, 2270($29)
sb $t7, 2271($29)
sb $t7, 2272($29)
sb $t7, 2273($29)
sb $t7, 2274($29)
sb $t7, 2275($29)
sb $t7, 2276($29)
sb $t7, 2277($29)
sb $t7, 2278($29)
sb $t7, 2279($29)
sb $t7, 2280($29)
sb $t7, 2281($29)
sb $t7, 2282($29)
sb $t7, 2283($29)
sb $t7, 2284($29)
sb $t7, 2285($29)
sb $t7, 2286($29)
sb $t7, 2287($29)
sb $t7, 2288($29)
sb $t7, 2289($29)
sb $t7, 2290($29)
sb $t7, 2291($29)
sb $t7, 2292($29)
sb $t7, 2293($29)
sb $t7, 2294($29)
sb $t7, 2295($29)
sb $t7, 2296($29)
sb $t7, 2297($29)
sb $t7, 2298($29)
sb $t7, 2299($29)
sb $t7, 2300($29)
sb $t7, 2301($29)
sb $t7, 2302($29)
sb $t7, 2303($29)
sb $t7, 2304($29)
sb $t7, 2305($29)
sb $t7, 2306($29)
sb $t7, 2307($29)
sb $t7, 2308($29)
sb $t7, 2309($29)
sb $t7, 2310($29)
sb $t7, 2311($29)
sb $t7, 2312($29)
sb $t7, 2313($29)
sb $t7, 2314($29)
sb $t7, 2315($29)
sb $t7, 2316($29)
sb $t7, 2317($29)
sb $t7, 2318($29)
sb $t7, 2319($29)
sb $t7, 2320($29)
sb $t7, 2321($29)
sb $t7, 2322($29)
sb $t7, 2323($29)
sb $t7, 2324($29)
sb $t7, 2325($29)
sb $t7, 2326($29)
sb $t7, 2327($29)
sb $t7, 2328($29)
sb $t7, 2329($29)
sb $t7, 2330($29)
sb $t7, 2331($29)
sb $t7, 2332($29)
sb $t7, 2333($29)
sb $t7, 2334($29)
sb $t7, 2335($29)
sb $t7, 2336($29)
sb $t7, 2337($29)
sb $t7, 2338($29)
sb $t7, 2339($29)
sb $t7, 2340($29)
sb $t7, 2341($29)
sb $t7, 2342($29)
sb $t7, 2343($29)
sb $t7, 2344($29)
sb $t7, 2345($29)
sb $t7, 2346($29)
sb $t7, 2347($29)
sb $t7, 2348($29)
sb $t7, 2349($29)
sb $t7, 2350($29)
sb $t7, 2351($29)
sb $t7, 2352($29)
sb $t7, 2353($29)
sb $t7, 2354($29)
sb $t7, 2355($29)
sb $t7, 2356($29)
sb $t7, 2357($29)
sb $t7, 2358($29)
sb $t7, 2359($29)
sb $t7, 2360($29)
sb $t7, 2361($29)
sb $t7, 2362($29)
sb $t7, 2363($29)
sb $t7, 2364($29)
sb $t7, 2365($29)
sb $t7, 2366($29)
sb $t7, 2367($29)
sb $t7, 2368($29)
sb $t7, 2369($29)
sb $t7, 2370($29)
sb $t7, 2371($29)
sb $t7, 2372($29)
sb $t7, 2373($29)
sb $t7, 2374($29)
sb $t7, 2375($29)
sb $t7, 2376($29)
sb $t7, 2377($29)
sb $t7, 2378($29)
sb $t7, 2379($29)
sb $t7, 2380($29)
sb $t7, 2381($29)
sb $t7, 2382($29)
sb $t7, 2383($29)
sb $t7, 2384($29)
sb $t7, 2385($29)
sb $t7, 2386($29)
sb $t7, 2387($29)
sb $t7, 2388($29)
sb $t7, 2389($29)
sb $t7, 2390($29)
sb $t7, 2391($29)
sb $t7, 2392($29)
sb $t7, 2393($29)
sb $t7, 2394($29)
sb $t7, 2395($29)
sb $t7, 2396($29)
sb $t7, 2397($29)
sb $t7, 2398($29)
sb $t7, 2399($29)
sb $t7, 2400($29)
sb $t7, 2401($29)
sb $t7, 2402($29)
sb $t7, 2403($29)
sb $t7, 2404($29)
sb $t7, 2405($29)
sb $t7, 2406($29)
sb $t7, 2407($29)
sb $t7, 2408($29)
sb $t7, 2409($29)
sb $t7, 2410($29)
sb $t7, 2411($29)
sb $t7, 2412($29)
sb $t7, 2413($29)
sb $t7, 2414($29)
sb $t7, 2415($29)
sb $t7, 2416($29)
sb $t7, 2417($29)
sb $t7, 2418($29)
sb $t7, 2419($29)
sb $t7, 2420($29)
sb $t7, 2421($29)
sb $t7, 2422($29)
sb $t7, 2423($29)
sb $t7, 2424($29)
sb $t7, 2425($29)
sb $t7, 2426($29)
sb $t7, 2427($29)
sb $t7, 2428($29)
sb $t7, 2429($29)
sb $t7, 2430($29)
sb $t7, 2431($29)
sb $t7, 2432($29)
sb $t7, 2433($29)
sb $t7, 2434($29)
sb $t7, 2435($29)
sb $t7, 2436($29)
sb $t7, 2437($29)
sb $t7, 2438($29)
sb $t7, 2439($29)
sb $t7, 2440($29)
sb $t7, 2441($29)
sb $t7, 2442($29)
sb $t7, 2443($29)
sb $t7, 2444($29)
sb $t7, 2445($29)
sb $t7, 2446($29)
sb $t7, 2447($29)
sb $t7, 2448($29)
sb $t7, 2449($29)
sb $t7, 2450($29)
sb $t7, 2451($29)
sb $t7, 2452($29)
sb $t7, 2453($29)
sb $t7, 2454($29)
sb $t7, 2455($29)
sb $t7, 2456($29)
sb $t7, 2457($29)
sb $t7, 2458($29)
sb $t7, 2459($29)
sb $t7, 2460($29)
sb $t7, 2461($29)
sb $t7, 2462($29)
sb $t7, 2463($29)
sb $t7, 2464($29)
sb $t7, 2465($29)
sb $t7, 2466($29)
sb $t7, 2467($29)
sb $t7, 2468($29)
sb $t7, 2469($29)
sb $t7, 2470($29)
sb $t7, 2471($29)
sb $t7, 2472($29)
sb $t7, 2473($29)
sb $t7, 2474($29)
sb $t7, 2475($29)
sb $t7, 2476($29)
sb $t7, 2477($29)
sb $t7, 2478($29)
sb $t7, 2479($29)
sb $t7, 2480($29)
sb $t7, 2481($29)
sb $t7, 2482($29)
sb $t7, 2483($29)
sb $t7, 2484($29)
sb $t7, 2485($29)
sb $t7, 2486($29)
sb $t7, 2487($29)
sb $t7, 2488($29)
sb $t7, 2489($29)
sb $t7, 2490($29)
sb $t7, 2491($29)
sb $t7, 2492($29)
sb $t7, 2493($29)
sb $t7, 2494($29)
sb $t7, 2495($29)
sb $t7, 2496($29)
sb $t7, 2497($29)
sb $t7, 2498($29)
sb $t7, 2499($29)
sb $t7, 2500($29)
sb $t7, 2501($29)
sb $t7, 2502($29)
sb $t7, 2503($29)
sb $t7, 2504($29)
sb $t7, 2505($29)
sb $t7, 2506($29)
sb $t7, 2507($29)
sb $t7, 2508($29)
sb $t7, 2509($29)
sb $t7, 2510($29)
sb $t7, 2511($29)
sb $t7, 2512($29)
sb $t7, 2513($29)
sb $t7, 2514($29)
sb $t7, 2515($29)
sb $t7, 2516($29)
sb $t7, 2517($29)
sb $t7, 2518($29)
sb $t7, 2519($29)
sb $t7, 2520($29)
sb $t7, 2521($29)
sb $t7, 2522($29)
sb $t7, 2523($29)
sb $t7, 2524($29)
sb $t7, 2525($29)
sb $t7, 2526($29)
sb $t7, 2527($29)
sb $t7, 2528($29)
sb $t7, 2529($29)
sb $t7, 2530($29)
sb $t7, 2531($29)
sb $t7, 2532($29)
sb $t7, 2533($29)
sb $t7, 2534($29)
sb $t7, 2535($29)
sb $t7, 2536($29)
sb $t7, 2537($29)
sb $t7, 2538($29)
sb $t7, 2539($29)
sb $t7, 2540($29)
sb $t7, 2541($29)
sb $t7, 2542($29)
sb $t7, 2543($29)
sb $t7, 2544($29)
sb $t7, 2545($29)
sb $t7, 2546($29)
sb $t7, 2547($29)
sb $t7, 2548($29)
sb $t7, 2549($29)
sb $t7, 2550($29)
sb $t7, 2551($29)
sb $t7, 2552($29)
sb $t7, 2553($29)
sb $t7, 2554($29)
sb $t7, 2555($29)
sb $t7, 2556($29)
sb $t7, 2557($29)
sb $t7, 2558($29)
sb $t7, 2559($29)
sb $t7, 2560($29)
sb $t7, 2561($29)
sb $t7, 2562($29)
sb $t7, 2563($29)
sb $t7, 2564($29)
sb $t7, 2565($29)
sb $t7, 2566($29)
sb $t7, 2567($29)
sb $t7, 2568($29)
sb $t7, 2569($29)
sb $t7, 2570($29)
sb $t7, 2571($29)
sb $t7, 2572($29)
sb $t7, 2573($29)
sb $t7, 2574($29)
sb $t7, 2575($29)
sb $t7, 2576($29)
sb $t7, 2577($29)
sb $t7, 2578($29)
sb $t7, 2579($29)
sb $t7, 2580($29)
sb $t7, 2581($29)
sb $t7, 2582($29)
sb $t7, 2583($29)
sb $t7, 2584($29)
sb $t7, 2585($29)
sb $t7, 2586($29)
sb $t7, 2587($29)
sb $t7, 2588($29)
sb $t7, 2589($29)
sb $t7, 2590($29)
sb $t7, 2591($29)
sb $t7, 2592($29)
sb $t7, 2593($29)
sb $t7, 2594($29)
sb $t7, 2595($29)
sb $t7, 2596($29)
sb $t7, 2597($29)
sb $t7, 2598($29)
sb $t7, 2599($29)
sb $t7, 2600($29)
sb $t7, 2601($29)
sb $t7, 2602($29)
sb $t7, 2603($29)
addiu $t8, $29, 4
addiu $29, $29, -8
sw $t8, 4($29)
addiu $t9, $29, 4
addiu $29, $29, -4
sw $t9, 4($29)
addiu $s0, $29, 4
#union NotTypeSafe safety ; 

li $s2, 0
addiu $29, $29, -2600
sb $s2, 4($29)
sb $s2, 5($29)
sb $s2, 6($29)
sb $s2, 7($29)
sb $s2, 8($29)
sb $s2, 9($29)
sb $s2, 10($29)
sb $s2, 11($29)
sb $s2, 12($29)
sb $s2, 13($29)
sb $s2, 14($29)
sb $s2, 15($29)
sb $s2, 16($29)
sb $s2, 17($29)
sb $s2, 18($29)
sb $s2, 19($29)
sb $s2, 20($29)
sb $s2, 21($29)
sb $s2, 22($29)
sb $s2, 23($29)
sb $s2, 24($29)
sb $s2, 25($29)
sb $s2, 26($29)
sb $s2, 27($29)
sb $s2, 28($29)
sb $s2, 29($29)
sb $s2, 30($29)
sb $s2, 31($29)
sb $s2, 32($29)
sb $s2, 33($29)
sb $s2, 34($29)
sb $s2, 35($29)
sb $s2, 36($29)
sb $s2, 37($29)
sb $s2, 38($29)
sb $s2, 39($29)
sb $s2, 40($29)
sb $s2, 41($29)
sb $s2, 42($29)
sb $s2, 43($29)
sb $s2, 44($29)
sb $s2, 45($29)
sb $s2, 46($29)
sb $s2, 47($29)
sb $s2, 48($29)
sb $s2, 49($29)
sb $s2, 50($29)
sb $s2, 51($29)
sb $s2, 52($29)
sb $s2, 53($29)
sb $s2, 54($29)
sb $s2, 55($29)
sb $s2, 56($29)
sb $s2, 57($29)
sb $s2, 58($29)
sb $s2, 59($29)
sb $s2, 60($29)
sb $s2, 61($29)
sb $s2, 62($29)
sb $s2, 63($29)
sb $s2, 64($29)
sb $s2, 65($29)
sb $s2, 66($29)
sb $s2, 67($29)
sb $s2, 68($29)
sb $s2, 69($29)
sb $s2, 70($29)
sb $s2, 71($29)
sb $s2, 72($29)
sb $s2, 73($29)
sb $s2, 74($29)
sb $s2, 75($29)
sb $s2, 76($29)
sb $s2, 77($29)
sb $s2, 78($29)
sb $s2, 79($29)
sb $s2, 80($29)
sb $s2, 81($29)
sb $s2, 82($29)
sb $s2, 83($29)
sb $s2, 84($29)
sb $s2, 85($29)
sb $s2, 86($29)
sb $s2, 87($29)
sb $s2, 88($29)
sb $s2, 89($29)
sb $s2, 90($29)
sb $s2, 91($29)
sb $s2, 92($29)
sb $s2, 93($29)
sb $s2, 94($29)
sb $s2, 95($29)
sb $s2, 96($29)
sb $s2, 97($29)
sb $s2, 98($29)
sb $s2, 99($29)
sb $s2, 100($29)
sb $s2, 101($29)
sb $s2, 102($29)
sb $s2, 103($29)
sb $s2, 104($29)
sb $s2, 105($29)
sb $s2, 106($29)
sb $s2, 107($29)
sb $s2, 108($29)
sb $s2, 109($29)
sb $s2, 110($29)
sb $s2, 111($29)
sb $s2, 112($29)
sb $s2, 113($29)
sb $s2, 114($29)
sb $s2, 115($29)
sb $s2, 116($29)
sb $s2, 117($29)
sb $s2, 118($29)
sb $s2, 119($29)
sb $s2, 120($29)
sb $s2, 121($29)
sb $s2, 122($29)
sb $s2, 123($29)
sb $s2, 124($29)
sb $s2, 125($29)
sb $s2, 126($29)
sb $s2, 127($29)
sb $s2, 128($29)
sb $s2, 129($29)
sb $s2, 130($29)
sb $s2, 131($29)
sb $s2, 132($29)
sb $s2, 133($29)
sb $s2, 134($29)
sb $s2, 135($29)
sb $s2, 136($29)
sb $s2, 137($29)
sb $s2, 138($29)
sb $s2, 139($29)
sb $s2, 140($29)
sb $s2, 141($29)
sb $s2, 142($29)
sb $s2, 143($29)
sb $s2, 144($29)
sb $s2, 145($29)
sb $s2, 146($29)
sb $s2, 147($29)
sb $s2, 148($29)
sb $s2, 149($29)
sb $s2, 150($29)
sb $s2, 151($29)
sb $s2, 152($29)
sb $s2, 153($29)
sb $s2, 154($29)
sb $s2, 155($29)
sb $s2, 156($29)
sb $s2, 157($29)
sb $s2, 158($29)
sb $s2, 159($29)
sb $s2, 160($29)
sb $s2, 161($29)
sb $s2, 162($29)
sb $s2, 163($29)
sb $s2, 164($29)
sb $s2, 165($29)
sb $s2, 166($29)
sb $s2, 167($29)
sb $s2, 168($29)
sb $s2, 169($29)
sb $s2, 170($29)
sb $s2, 171($29)
sb $s2, 172($29)
sb $s2, 173($29)
sb $s2, 174($29)
sb $s2, 175($29)
sb $s2, 176($29)
sb $s2, 177($29)
sb $s2, 178($29)
sb $s2, 179($29)
sb $s2, 180($29)
sb $s2, 181($29)
sb $s2, 182($29)
sb $s2, 183($29)
sb $s2, 184($29)
sb $s2, 185($29)
sb $s2, 186($29)
sb $s2, 187($29)
sb $s2, 188($29)
sb $s2, 189($29)
sb $s2, 190($29)
sb $s2, 191($29)
sb $s2, 192($29)
sb $s2, 193($29)
sb $s2, 194($29)
sb $s2, 195($29)
sb $s2, 196($29)
sb $s2, 197($29)
sb $s2, 198($29)
sb $s2, 199($29)
sb $s2, 200($29)
sb $s2, 201($29)
sb $s2, 202($29)
sb $s2, 203($29)
sb $s2, 204($29)
sb $s2, 205($29)
sb $s2, 206($29)
sb $s2, 207($29)
sb $s2, 208($29)
sb $s2, 209($29)
sb $s2, 210($29)
sb $s2, 211($29)
sb $s2, 212($29)
sb $s2, 213($29)
sb $s2, 214($29)
sb $s2, 215($29)
sb $s2, 216($29)
sb $s2, 217($29)
sb $s2, 218($29)
sb $s2, 219($29)
sb $s2, 220($29)
sb $s2, 221($29)
sb $s2, 222($29)
sb $s2, 223($29)
sb $s2, 224($29)
sb $s2, 225($29)
sb $s2, 226($29)
sb $s2, 227($29)
sb $s2, 228($29)
sb $s2, 229($29)
sb $s2, 230($29)
sb $s2, 231($29)
sb $s2, 232($29)
sb $s2, 233($29)
sb $s2, 234($29)
sb $s2, 235($29)
sb $s2, 236($29)
sb $s2, 237($29)
sb $s2, 238($29)
sb $s2, 239($29)
sb $s2, 240($29)
sb $s2, 241($29)
sb $s2, 242($29)
sb $s2, 243($29)
sb $s2, 244($29)
sb $s2, 245($29)
sb $s2, 246($29)
sb $s2, 247($29)
sb $s2, 248($29)
sb $s2, 249($29)
sb $s2, 250($29)
sb $s2, 251($29)
sb $s2, 252($29)
sb $s2, 253($29)
sb $s2, 254($29)
sb $s2, 255($29)
sb $s2, 256($29)
sb $s2, 257($29)
sb $s2, 258($29)
sb $s2, 259($29)
sb $s2, 260($29)
sb $s2, 261($29)
sb $s2, 262($29)
sb $s2, 263($29)
sb $s2, 264($29)
sb $s2, 265($29)
sb $s2, 266($29)
sb $s2, 267($29)
sb $s2, 268($29)
sb $s2, 269($29)
sb $s2, 270($29)
sb $s2, 271($29)
sb $s2, 272($29)
sb $s2, 273($29)
sb $s2, 274($29)
sb $s2, 275($29)
sb $s2, 276($29)
sb $s2, 277($29)
sb $s2, 278($29)
sb $s2, 279($29)
sb $s2, 280($29)
sb $s2, 281($29)
sb $s2, 282($29)
sb $s2, 283($29)
sb $s2, 284($29)
sb $s2, 285($29)
sb $s2, 286($29)
sb $s2, 287($29)
sb $s2, 288($29)
sb $s2, 289($29)
sb $s2, 290($29)
sb $s2, 291($29)
sb $s2, 292($29)
sb $s2, 293($29)
sb $s2, 294($29)
sb $s2, 295($29)
sb $s2, 296($29)
sb $s2, 297($29)
sb $s2, 298($29)
sb $s2, 299($29)
sb $s2, 300($29)
sb $s2, 301($29)
sb $s2, 302($29)
sb $s2, 303($29)
sb $s2, 304($29)
sb $s2, 305($29)
sb $s2, 306($29)
sb $s2, 307($29)
sb $s2, 308($29)
sb $s2, 309($29)
sb $s2, 310($29)
sb $s2, 311($29)
sb $s2, 312($29)
sb $s2, 313($29)
sb $s2, 314($29)
sb $s2, 315($29)
sb $s2, 316($29)
sb $s2, 317($29)
sb $s2, 318($29)
sb $s2, 319($29)
sb $s2, 320($29)
sb $s2, 321($29)
sb $s2, 322($29)
sb $s2, 323($29)
sb $s2, 324($29)
sb $s2, 325($29)
sb $s2, 326($29)
sb $s2, 327($29)
sb $s2, 328($29)
sb $s2, 329($29)
sb $s2, 330($29)
sb $s2, 331($29)
sb $s2, 332($29)
sb $s2, 333($29)
sb $s2, 334($29)
sb $s2, 335($29)
sb $s2, 336($29)
sb $s2, 337($29)
sb $s2, 338($29)
sb $s2, 339($29)
sb $s2, 340($29)
sb $s2, 341($29)
sb $s2, 342($29)
sb $s2, 343($29)
sb $s2, 344($29)
sb $s2, 345($29)
sb $s2, 346($29)
sb $s2, 347($29)
sb $s2, 348($29)
sb $s2, 349($29)
sb $s2, 350($29)
sb $s2, 351($29)
sb $s2, 352($29)
sb $s2, 353($29)
sb $s2, 354($29)
sb $s2, 355($29)
sb $s2, 356($29)
sb $s2, 357($29)
sb $s2, 358($29)
sb $s2, 359($29)
sb $s2, 360($29)
sb $s2, 361($29)
sb $s2, 362($29)
sb $s2, 363($29)
sb $s2, 364($29)
sb $s2, 365($29)
sb $s2, 366($29)
sb $s2, 367($29)
sb $s2, 368($29)
sb $s2, 369($29)
sb $s2, 370($29)
sb $s2, 371($29)
sb $s2, 372($29)
sb $s2, 373($29)
sb $s2, 374($29)
sb $s2, 375($29)
sb $s2, 376($29)
sb $s2, 377($29)
sb $s2, 378($29)
sb $s2, 379($29)
sb $s2, 380($29)
sb $s2, 381($29)
sb $s2, 382($29)
sb $s2, 383($29)
sb $s2, 384($29)
sb $s2, 385($29)
sb $s2, 386($29)
sb $s2, 387($29)
sb $s2, 388($29)
sb $s2, 389($29)
sb $s2, 390($29)
sb $s2, 391($29)
sb $s2, 392($29)
sb $s2, 393($29)
sb $s2, 394($29)
sb $s2, 395($29)
sb $s2, 396($29)
sb $s2, 397($29)
sb $s2, 398($29)
sb $s2, 399($29)
sb $s2, 400($29)
sb $s2, 401($29)
sb $s2, 402($29)
sb $s2, 403($29)
sb $s2, 404($29)
sb $s2, 405($29)
sb $s2, 406($29)
sb $s2, 407($29)
sb $s2, 408($29)
sb $s2, 409($29)
sb $s2, 410($29)
sb $s2, 411($29)
sb $s2, 412($29)
sb $s2, 413($29)
sb $s2, 414($29)
sb $s2, 415($29)
sb $s2, 416($29)
sb $s2, 417($29)
sb $s2, 418($29)
sb $s2, 419($29)
sb $s2, 420($29)
sb $s2, 421($29)
sb $s2, 422($29)
sb $s2, 423($29)
sb $s2, 424($29)
sb $s2, 425($29)
sb $s2, 426($29)
sb $s2, 427($29)
sb $s2, 428($29)
sb $s2, 429($29)
sb $s2, 430($29)
sb $s2, 431($29)
sb $s2, 432($29)
sb $s2, 433($29)
sb $s2, 434($29)
sb $s2, 435($29)
sb $s2, 436($29)
sb $s2, 437($29)
sb $s2, 438($29)
sb $s2, 439($29)
sb $s2, 440($29)
sb $s2, 441($29)
sb $s2, 442($29)
sb $s2, 443($29)
sb $s2, 444($29)
sb $s2, 445($29)
sb $s2, 446($29)
sb $s2, 447($29)
sb $s2, 448($29)
sb $s2, 449($29)
sb $s2, 450($29)
sb $s2, 451($29)
sb $s2, 452($29)
sb $s2, 453($29)
sb $s2, 454($29)
sb $s2, 455($29)
sb $s2, 456($29)
sb $s2, 457($29)
sb $s2, 458($29)
sb $s2, 459($29)
sb $s2, 460($29)
sb $s2, 461($29)
sb $s2, 462($29)
sb $s2, 463($29)
sb $s2, 464($29)
sb $s2, 465($29)
sb $s2, 466($29)
sb $s2, 467($29)
sb $s2, 468($29)
sb $s2, 469($29)
sb $s2, 470($29)
sb $s2, 471($29)
sb $s2, 472($29)
sb $s2, 473($29)
sb $s2, 474($29)
sb $s2, 475($29)
sb $s2, 476($29)
sb $s2, 477($29)
sb $s2, 478($29)
sb $s2, 479($29)
sb $s2, 480($29)
sb $s2, 481($29)
sb $s2, 482($29)
sb $s2, 483($29)
sb $s2, 484($29)
sb $s2, 485($29)
sb $s2, 486($29)
sb $s2, 487($29)
sb $s2, 488($29)
sb $s2, 489($29)
sb $s2, 490($29)
sb $s2, 491($29)
sb $s2, 492($29)
sb $s2, 493($29)
sb $s2, 494($29)
sb $s2, 495($29)
sb $s2, 496($29)
sb $s2, 497($29)
sb $s2, 498($29)
sb $s2, 499($29)
sb $s2, 500($29)
sb $s2, 501($29)
sb $s2, 502($29)
sb $s2, 503($29)
sb $s2, 504($29)
sb $s2, 505($29)
sb $s2, 506($29)
sb $s2, 507($29)
sb $s2, 508($29)
sb $s2, 509($29)
sb $s2, 510($29)
sb $s2, 511($29)
sb $s2, 512($29)
sb $s2, 513($29)
sb $s2, 514($29)
sb $s2, 515($29)
sb $s2, 516($29)
sb $s2, 517($29)
sb $s2, 518($29)
sb $s2, 519($29)
sb $s2, 520($29)
sb $s2, 521($29)
sb $s2, 522($29)
sb $s2, 523($29)
sb $s2, 524($29)
sb $s2, 525($29)
sb $s2, 526($29)
sb $s2, 527($29)
sb $s2, 528($29)
sb $s2, 529($29)
sb $s2, 530($29)
sb $s2, 531($29)
sb $s2, 532($29)
sb $s2, 533($29)
sb $s2, 534($29)
sb $s2, 535($29)
sb $s2, 536($29)
sb $s2, 537($29)
sb $s2, 538($29)
sb $s2, 539($29)
sb $s2, 540($29)
sb $s2, 541($29)
sb $s2, 542($29)
sb $s2, 543($29)
sb $s2, 544($29)
sb $s2, 545($29)
sb $s2, 546($29)
sb $s2, 547($29)
sb $s2, 548($29)
sb $s2, 549($29)
sb $s2, 550($29)
sb $s2, 551($29)
sb $s2, 552($29)
sb $s2, 553($29)
sb $s2, 554($29)
sb $s2, 555($29)
sb $s2, 556($29)
sb $s2, 557($29)
sb $s2, 558($29)
sb $s2, 559($29)
sb $s2, 560($29)
sb $s2, 561($29)
sb $s2, 562($29)
sb $s2, 563($29)
sb $s2, 564($29)
sb $s2, 565($29)
sb $s2, 566($29)
sb $s2, 567($29)
sb $s2, 568($29)
sb $s2, 569($29)
sb $s2, 570($29)
sb $s2, 571($29)
sb $s2, 572($29)
sb $s2, 573($29)
sb $s2, 574($29)
sb $s2, 575($29)
sb $s2, 576($29)
sb $s2, 577($29)
sb $s2, 578($29)
sb $s2, 579($29)
sb $s2, 580($29)
sb $s2, 581($29)
sb $s2, 582($29)
sb $s2, 583($29)
sb $s2, 584($29)
sb $s2, 585($29)
sb $s2, 586($29)
sb $s2, 587($29)
sb $s2, 588($29)
sb $s2, 589($29)
sb $s2, 590($29)
sb $s2, 591($29)
sb $s2, 592($29)
sb $s2, 593($29)
sb $s2, 594($29)
sb $s2, 595($29)
sb $s2, 596($29)
sb $s2, 597($29)
sb $s2, 598($29)
sb $s2, 599($29)
sb $s2, 600($29)
sb $s2, 601($29)
sb $s2, 602($29)
sb $s2, 603($29)
sb $s2, 604($29)
sb $s2, 605($29)
sb $s2, 606($29)
sb $s2, 607($29)
sb $s2, 608($29)
sb $s2, 609($29)
sb $s2, 610($29)
sb $s2, 611($29)
sb $s2, 612($29)
sb $s2, 613($29)
sb $s2, 614($29)
sb $s2, 615($29)
sb $s2, 616($29)
sb $s2, 617($29)
sb $s2, 618($29)
sb $s2, 619($29)
sb $s2, 620($29)
sb $s2, 621($29)
sb $s2, 622($29)
sb $s2, 623($29)
sb $s2, 624($29)
sb $s2, 625($29)
sb $s2, 626($29)
sb $s2, 627($29)
sb $s2, 628($29)
sb $s2, 629($29)
sb $s2, 630($29)
sb $s2, 631($29)
sb $s2, 632($29)
sb $s2, 633($29)
sb $s2, 634($29)
sb $s2, 635($29)
sb $s2, 636($29)
sb $s2, 637($29)
sb $s2, 638($29)
sb $s2, 639($29)
sb $s2, 640($29)
sb $s2, 641($29)
sb $s2, 642($29)
sb $s2, 643($29)
sb $s2, 644($29)
sb $s2, 645($29)
sb $s2, 646($29)
sb $s2, 647($29)
sb $s2, 648($29)
sb $s2, 649($29)
sb $s2, 650($29)
sb $s2, 651($29)
sb $s2, 652($29)
sb $s2, 653($29)
sb $s2, 654($29)
sb $s2, 655($29)
sb $s2, 656($29)
sb $s2, 657($29)
sb $s2, 658($29)
sb $s2, 659($29)
sb $s2, 660($29)
sb $s2, 661($29)
sb $s2, 662($29)
sb $s2, 663($29)
sb $s2, 664($29)
sb $s2, 665($29)
sb $s2, 666($29)
sb $s2, 667($29)
sb $s2, 668($29)
sb $s2, 669($29)
sb $s2, 670($29)
sb $s2, 671($29)
sb $s2, 672($29)
sb $s2, 673($29)
sb $s2, 674($29)
sb $s2, 675($29)
sb $s2, 676($29)
sb $s2, 677($29)
sb $s2, 678($29)
sb $s2, 679($29)
sb $s2, 680($29)
sb $s2, 681($29)
sb $s2, 682($29)
sb $s2, 683($29)
sb $s2, 684($29)
sb $s2, 685($29)
sb $s2, 686($29)
sb $s2, 687($29)
sb $s2, 688($29)
sb $s2, 689($29)
sb $s2, 690($29)
sb $s2, 691($29)
sb $s2, 692($29)
sb $s2, 693($29)
sb $s2, 694($29)
sb $s2, 695($29)
sb $s2, 696($29)
sb $s2, 697($29)
sb $s2, 698($29)
sb $s2, 699($29)
sb $s2, 700($29)
sb $s2, 701($29)
sb $s2, 702($29)
sb $s2, 703($29)
sb $s2, 704($29)
sb $s2, 705($29)
sb $s2, 706($29)
sb $s2, 707($29)
sb $s2, 708($29)
sb $s2, 709($29)
sb $s2, 710($29)
sb $s2, 711($29)
sb $s2, 712($29)
sb $s2, 713($29)
sb $s2, 714($29)
sb $s2, 715($29)
sb $s2, 716($29)
sb $s2, 717($29)
sb $s2, 718($29)
sb $s2, 719($29)
sb $s2, 720($29)
sb $s2, 721($29)
sb $s2, 722($29)
sb $s2, 723($29)
sb $s2, 724($29)
sb $s2, 725($29)
sb $s2, 726($29)
sb $s2, 727($29)
sb $s2, 728($29)
sb $s2, 729($29)
sb $s2, 730($29)
sb $s2, 731($29)
sb $s2, 732($29)
sb $s2, 733($29)
sb $s2, 734($29)
sb $s2, 735($29)
sb $s2, 736($29)
sb $s2, 737($29)
sb $s2, 738($29)
sb $s2, 739($29)
sb $s2, 740($29)
sb $s2, 741($29)
sb $s2, 742($29)
sb $s2, 743($29)
sb $s2, 744($29)
sb $s2, 745($29)
sb $s2, 746($29)
sb $s2, 747($29)
sb $s2, 748($29)
sb $s2, 749($29)
sb $s2, 750($29)
sb $s2, 751($29)
sb $s2, 752($29)
sb $s2, 753($29)
sb $s2, 754($29)
sb $s2, 755($29)
sb $s2, 756($29)
sb $s2, 757($29)
sb $s2, 758($29)
sb $s2, 759($29)
sb $s2, 760($29)
sb $s2, 761($29)
sb $s2, 762($29)
sb $s2, 763($29)
sb $s2, 764($29)
sb $s2, 765($29)
sb $s2, 766($29)
sb $s2, 767($29)
sb $s2, 768($29)
sb $s2, 769($29)
sb $s2, 770($29)
sb $s2, 771($29)
sb $s2, 772($29)
sb $s2, 773($29)
sb $s2, 774($29)
sb $s2, 775($29)
sb $s2, 776($29)
sb $s2, 777($29)
sb $s2, 778($29)
sb $s2, 779($29)
sb $s2, 780($29)
sb $s2, 781($29)
sb $s2, 782($29)
sb $s2, 783($29)
sb $s2, 784($29)
sb $s2, 785($29)
sb $s2, 786($29)
sb $s2, 787($29)
sb $s2, 788($29)
sb $s2, 789($29)
sb $s2, 790($29)
sb $s2, 791($29)
sb $s2, 792($29)
sb $s2, 793($29)
sb $s2, 794($29)
sb $s2, 795($29)
sb $s2, 796($29)
sb $s2, 797($29)
sb $s2, 798($29)
sb $s2, 799($29)
sb $s2, 800($29)
sb $s2, 801($29)
sb $s2, 802($29)
sb $s2, 803($29)
sb $s2, 804($29)
sb $s2, 805($29)
sb $s2, 806($29)
sb $s2, 807($29)
sb $s2, 808($29)
sb $s2, 809($29)
sb $s2, 810($29)
sb $s2, 811($29)
sb $s2, 812($29)
sb $s2, 813($29)
sb $s2, 814($29)
sb $s2, 815($29)
sb $s2, 816($29)
sb $s2, 817($29)
sb $s2, 818($29)
sb $s2, 819($29)
sb $s2, 820($29)
sb $s2, 821($29)
sb $s2, 822($29)
sb $s2, 823($29)
sb $s2, 824($29)
sb $s2, 825($29)
sb $s2, 826($29)
sb $s2, 827($29)
sb $s2, 828($29)
sb $s2, 829($29)
sb $s2, 830($29)
sb $s2, 831($29)
sb $s2, 832($29)
sb $s2, 833($29)
sb $s2, 834($29)
sb $s2, 835($29)
sb $s2, 836($29)
sb $s2, 837($29)
sb $s2, 838($29)
sb $s2, 839($29)
sb $s2, 840($29)
sb $s2, 841($29)
sb $s2, 842($29)
sb $s2, 843($29)
sb $s2, 844($29)
sb $s2, 845($29)
sb $s2, 846($29)
sb $s2, 847($29)
sb $s2, 848($29)
sb $s2, 849($29)
sb $s2, 850($29)
sb $s2, 851($29)
sb $s2, 852($29)
sb $s2, 853($29)
sb $s2, 854($29)
sb $s2, 855($29)
sb $s2, 856($29)
sb $s2, 857($29)
sb $s2, 858($29)
sb $s2, 859($29)
sb $s2, 860($29)
sb $s2, 861($29)
sb $s2, 862($29)
sb $s2, 863($29)
sb $s2, 864($29)
sb $s2, 865($29)
sb $s2, 866($29)
sb $s2, 867($29)
sb $s2, 868($29)
sb $s2, 869($29)
sb $s2, 870($29)
sb $s2, 871($29)
sb $s2, 872($29)
sb $s2, 873($29)
sb $s2, 874($29)
sb $s2, 875($29)
sb $s2, 876($29)
sb $s2, 877($29)
sb $s2, 878($29)
sb $s2, 879($29)
sb $s2, 880($29)
sb $s2, 881($29)
sb $s2, 882($29)
sb $s2, 883($29)
sb $s2, 884($29)
sb $s2, 885($29)
sb $s2, 886($29)
sb $s2, 887($29)
sb $s2, 888($29)
sb $s2, 889($29)
sb $s2, 890($29)
sb $s2, 891($29)
sb $s2, 892($29)
sb $s2, 893($29)
sb $s2, 894($29)
sb $s2, 895($29)
sb $s2, 896($29)
sb $s2, 897($29)
sb $s2, 898($29)
sb $s2, 899($29)
sb $s2, 900($29)
sb $s2, 901($29)
sb $s2, 902($29)
sb $s2, 903($29)
sb $s2, 904($29)
sb $s2, 905($29)
sb $s2, 906($29)
sb $s2, 907($29)
sb $s2, 908($29)
sb $s2, 909($29)
sb $s2, 910($29)
sb $s2, 911($29)
sb $s2, 912($29)
sb $s2, 913($29)
sb $s2, 914($29)
sb $s2, 915($29)
sb $s2, 916($29)
sb $s2, 917($29)
sb $s2, 918($29)
sb $s2, 919($29)
sb $s2, 920($29)
sb $s2, 921($29)
sb $s2, 922($29)
sb $s2, 923($29)
sb $s2, 924($29)
sb $s2, 925($29)
sb $s2, 926($29)
sb $s2, 927($29)
sb $s2, 928($29)
sb $s2, 929($29)
sb $s2, 930($29)
sb $s2, 931($29)
sb $s2, 932($29)
sb $s2, 933($29)
sb $s2, 934($29)
sb $s2, 935($29)
sb $s2, 936($29)
sb $s2, 937($29)
sb $s2, 938($29)
sb $s2, 939($29)
sb $s2, 940($29)
sb $s2, 941($29)
sb $s2, 942($29)
sb $s2, 943($29)
sb $s2, 944($29)
sb $s2, 945($29)
sb $s2, 946($29)
sb $s2, 947($29)
sb $s2, 948($29)
sb $s2, 949($29)
sb $s2, 950($29)
sb $s2, 951($29)
sb $s2, 952($29)
sb $s2, 953($29)
sb $s2, 954($29)
sb $s2, 955($29)
sb $s2, 956($29)
sb $s2, 957($29)
sb $s2, 958($29)
sb $s2, 959($29)
sb $s2, 960($29)
sb $s2, 961($29)
sb $s2, 962($29)
sb $s2, 963($29)
sb $s2, 964($29)
sb $s2, 965($29)
sb $s2, 966($29)
sb $s2, 967($29)
sb $s2, 968($29)
sb $s2, 969($29)
sb $s2, 970($29)
sb $s2, 971($29)
sb $s2, 972($29)
sb $s2, 973($29)
sb $s2, 974($29)
sb $s2, 975($29)
sb $s2, 976($29)
sb $s2, 977($29)
sb $s2, 978($29)
sb $s2, 979($29)
sb $s2, 980($29)
sb $s2, 981($29)
sb $s2, 982($29)
sb $s2, 983($29)
sb $s2, 984($29)
sb $s2, 985($29)
sb $s2, 986($29)
sb $s2, 987($29)
sb $s2, 988($29)
sb $s2, 989($29)
sb $s2, 990($29)
sb $s2, 991($29)
sb $s2, 992($29)
sb $s2, 993($29)
sb $s2, 994($29)
sb $s2, 995($29)
sb $s2, 996($29)
sb $s2, 997($29)
sb $s2, 998($29)
sb $s2, 999($29)
sb $s2, 1000($29)
sb $s2, 1001($29)
sb $s2, 1002($29)
sb $s2, 1003($29)
sb $s2, 1004($29)
sb $s2, 1005($29)
sb $s2, 1006($29)
sb $s2, 1007($29)
sb $s2, 1008($29)
sb $s2, 1009($29)
sb $s2, 1010($29)
sb $s2, 1011($29)
sb $s2, 1012($29)
sb $s2, 1013($29)
sb $s2, 1014($29)
sb $s2, 1015($29)
sb $s2, 1016($29)
sb $s2, 1017($29)
sb $s2, 1018($29)
sb $s2, 1019($29)
sb $s2, 1020($29)
sb $s2, 1021($29)
sb $s2, 1022($29)
sb $s2, 1023($29)
sb $s2, 1024($29)
sb $s2, 1025($29)
sb $s2, 1026($29)
sb $s2, 1027($29)
sb $s2, 1028($29)
sb $s2, 1029($29)
sb $s2, 1030($29)
sb $s2, 1031($29)
sb $s2, 1032($29)
sb $s2, 1033($29)
sb $s2, 1034($29)
sb $s2, 1035($29)
sb $s2, 1036($29)
sb $s2, 1037($29)
sb $s2, 1038($29)
sb $s2, 1039($29)
sb $s2, 1040($29)
sb $s2, 1041($29)
sb $s2, 1042($29)
sb $s2, 1043($29)
sb $s2, 1044($29)
sb $s2, 1045($29)
sb $s2, 1046($29)
sb $s2, 1047($29)
sb $s2, 1048($29)
sb $s2, 1049($29)
sb $s2, 1050($29)
sb $s2, 1051($29)
sb $s2, 1052($29)
sb $s2, 1053($29)
sb $s2, 1054($29)
sb $s2, 1055($29)
sb $s2, 1056($29)
sb $s2, 1057($29)
sb $s2, 1058($29)
sb $s2, 1059($29)
sb $s2, 1060($29)
sb $s2, 1061($29)
sb $s2, 1062($29)
sb $s2, 1063($29)
sb $s2, 1064($29)
sb $s2, 1065($29)
sb $s2, 1066($29)
sb $s2, 1067($29)
sb $s2, 1068($29)
sb $s2, 1069($29)
sb $s2, 1070($29)
sb $s2, 1071($29)
sb $s2, 1072($29)
sb $s2, 1073($29)
sb $s2, 1074($29)
sb $s2, 1075($29)
sb $s2, 1076($29)
sb $s2, 1077($29)
sb $s2, 1078($29)
sb $s2, 1079($29)
sb $s2, 1080($29)
sb $s2, 1081($29)
sb $s2, 1082($29)
sb $s2, 1083($29)
sb $s2, 1084($29)
sb $s2, 1085($29)
sb $s2, 1086($29)
sb $s2, 1087($29)
sb $s2, 1088($29)
sb $s2, 1089($29)
sb $s2, 1090($29)
sb $s2, 1091($29)
sb $s2, 1092($29)
sb $s2, 1093($29)
sb $s2, 1094($29)
sb $s2, 1095($29)
sb $s2, 1096($29)
sb $s2, 1097($29)
sb $s2, 1098($29)
sb $s2, 1099($29)
sb $s2, 1100($29)
sb $s2, 1101($29)
sb $s2, 1102($29)
sb $s2, 1103($29)
sb $s2, 1104($29)
sb $s2, 1105($29)
sb $s2, 1106($29)
sb $s2, 1107($29)
sb $s2, 1108($29)
sb $s2, 1109($29)
sb $s2, 1110($29)
sb $s2, 1111($29)
sb $s2, 1112($29)
sb $s2, 1113($29)
sb $s2, 1114($29)
sb $s2, 1115($29)
sb $s2, 1116($29)
sb $s2, 1117($29)
sb $s2, 1118($29)
sb $s2, 1119($29)
sb $s2, 1120($29)
sb $s2, 1121($29)
sb $s2, 1122($29)
sb $s2, 1123($29)
sb $s2, 1124($29)
sb $s2, 1125($29)
sb $s2, 1126($29)
sb $s2, 1127($29)
sb $s2, 1128($29)
sb $s2, 1129($29)
sb $s2, 1130($29)
sb $s2, 1131($29)
sb $s2, 1132($29)
sb $s2, 1133($29)
sb $s2, 1134($29)
sb $s2, 1135($29)
sb $s2, 1136($29)
sb $s2, 1137($29)
sb $s2, 1138($29)
sb $s2, 1139($29)
sb $s2, 1140($29)
sb $s2, 1141($29)
sb $s2, 1142($29)
sb $s2, 1143($29)
sb $s2, 1144($29)
sb $s2, 1145($29)
sb $s2, 1146($29)
sb $s2, 1147($29)
sb $s2, 1148($29)
sb $s2, 1149($29)
sb $s2, 1150($29)
sb $s2, 1151($29)
sb $s2, 1152($29)
sb $s2, 1153($29)
sb $s2, 1154($29)
sb $s2, 1155($29)
sb $s2, 1156($29)
sb $s2, 1157($29)
sb $s2, 1158($29)
sb $s2, 1159($29)
sb $s2, 1160($29)
sb $s2, 1161($29)
sb $s2, 1162($29)
sb $s2, 1163($29)
sb $s2, 1164($29)
sb $s2, 1165($29)
sb $s2, 1166($29)
sb $s2, 1167($29)
sb $s2, 1168($29)
sb $s2, 1169($29)
sb $s2, 1170($29)
sb $s2, 1171($29)
sb $s2, 1172($29)
sb $s2, 1173($29)
sb $s2, 1174($29)
sb $s2, 1175($29)
sb $s2, 1176($29)
sb $s2, 1177($29)
sb $s2, 1178($29)
sb $s2, 1179($29)
sb $s2, 1180($29)
sb $s2, 1181($29)
sb $s2, 1182($29)
sb $s2, 1183($29)
sb $s2, 1184($29)
sb $s2, 1185($29)
sb $s2, 1186($29)
sb $s2, 1187($29)
sb $s2, 1188($29)
sb $s2, 1189($29)
sb $s2, 1190($29)
sb $s2, 1191($29)
sb $s2, 1192($29)
sb $s2, 1193($29)
sb $s2, 1194($29)
sb $s2, 1195($29)
sb $s2, 1196($29)
sb $s2, 1197($29)
sb $s2, 1198($29)
sb $s2, 1199($29)
sb $s2, 1200($29)
sb $s2, 1201($29)
sb $s2, 1202($29)
sb $s2, 1203($29)
sb $s2, 1204($29)
sb $s2, 1205($29)
sb $s2, 1206($29)
sb $s2, 1207($29)
sb $s2, 1208($29)
sb $s2, 1209($29)
sb $s2, 1210($29)
sb $s2, 1211($29)
sb $s2, 1212($29)
sb $s2, 1213($29)
sb $s2, 1214($29)
sb $s2, 1215($29)
sb $s2, 1216($29)
sb $s2, 1217($29)
sb $s2, 1218($29)
sb $s2, 1219($29)
sb $s2, 1220($29)
sb $s2, 1221($29)
sb $s2, 1222($29)
sb $s2, 1223($29)
sb $s2, 1224($29)
sb $s2, 1225($29)
sb $s2, 1226($29)
sb $s2, 1227($29)
sb $s2, 1228($29)
sb $s2, 1229($29)
sb $s2, 1230($29)
sb $s2, 1231($29)
sb $s2, 1232($29)
sb $s2, 1233($29)
sb $s2, 1234($29)
sb $s2, 1235($29)
sb $s2, 1236($29)
sb $s2, 1237($29)
sb $s2, 1238($29)
sb $s2, 1239($29)
sb $s2, 1240($29)
sb $s2, 1241($29)
sb $s2, 1242($29)
sb $s2, 1243($29)
sb $s2, 1244($29)
sb $s2, 1245($29)
sb $s2, 1246($29)
sb $s2, 1247($29)
sb $s2, 1248($29)
sb $s2, 1249($29)
sb $s2, 1250($29)
sb $s2, 1251($29)
sb $s2, 1252($29)
sb $s2, 1253($29)
sb $s2, 1254($29)
sb $s2, 1255($29)
sb $s2, 1256($29)
sb $s2, 1257($29)
sb $s2, 1258($29)
sb $s2, 1259($29)
sb $s2, 1260($29)
sb $s2, 1261($29)
sb $s2, 1262($29)
sb $s2, 1263($29)
sb $s2, 1264($29)
sb $s2, 1265($29)
sb $s2, 1266($29)
sb $s2, 1267($29)
sb $s2, 1268($29)
sb $s2, 1269($29)
sb $s2, 1270($29)
sb $s2, 1271($29)
sb $s2, 1272($29)
sb $s2, 1273($29)
sb $s2, 1274($29)
sb $s2, 1275($29)
sb $s2, 1276($29)
sb $s2, 1277($29)
sb $s2, 1278($29)
sb $s2, 1279($29)
sb $s2, 1280($29)
sb $s2, 1281($29)
sb $s2, 1282($29)
sb $s2, 1283($29)
sb $s2, 1284($29)
sb $s2, 1285($29)
sb $s2, 1286($29)
sb $s2, 1287($29)
sb $s2, 1288($29)
sb $s2, 1289($29)
sb $s2, 1290($29)
sb $s2, 1291($29)
sb $s2, 1292($29)
sb $s2, 1293($29)
sb $s2, 1294($29)
sb $s2, 1295($29)
sb $s2, 1296($29)
sb $s2, 1297($29)
sb $s2, 1298($29)
sb $s2, 1299($29)
sb $s2, 1300($29)
sb $s2, 1301($29)
sb $s2, 1302($29)
sb $s2, 1303($29)
sb $s2, 1304($29)
sb $s2, 1305($29)
sb $s2, 1306($29)
sb $s2, 1307($29)
sb $s2, 1308($29)
sb $s2, 1309($29)
sb $s2, 1310($29)
sb $s2, 1311($29)
sb $s2, 1312($29)
sb $s2, 1313($29)
sb $s2, 1314($29)
sb $s2, 1315($29)
sb $s2, 1316($29)
sb $s2, 1317($29)
sb $s2, 1318($29)
sb $s2, 1319($29)
sb $s2, 1320($29)
sb $s2, 1321($29)
sb $s2, 1322($29)
sb $s2, 1323($29)
sb $s2, 1324($29)
sb $s2, 1325($29)
sb $s2, 1326($29)
sb $s2, 1327($29)
sb $s2, 1328($29)
sb $s2, 1329($29)
sb $s2, 1330($29)
sb $s2, 1331($29)
sb $s2, 1332($29)
sb $s2, 1333($29)
sb $s2, 1334($29)
sb $s2, 1335($29)
sb $s2, 1336($29)
sb $s2, 1337($29)
sb $s2, 1338($29)
sb $s2, 1339($29)
sb $s2, 1340($29)
sb $s2, 1341($29)
sb $s2, 1342($29)
sb $s2, 1343($29)
sb $s2, 1344($29)
sb $s2, 1345($29)
sb $s2, 1346($29)
sb $s2, 1347($29)
sb $s2, 1348($29)
sb $s2, 1349($29)
sb $s2, 1350($29)
sb $s2, 1351($29)
sb $s2, 1352($29)
sb $s2, 1353($29)
sb $s2, 1354($29)
sb $s2, 1355($29)
sb $s2, 1356($29)
sb $s2, 1357($29)
sb $s2, 1358($29)
sb $s2, 1359($29)
sb $s2, 1360($29)
sb $s2, 1361($29)
sb $s2, 1362($29)
sb $s2, 1363($29)
sb $s2, 1364($29)
sb $s2, 1365($29)
sb $s2, 1366($29)
sb $s2, 1367($29)
sb $s2, 1368($29)
sb $s2, 1369($29)
sb $s2, 1370($29)
sb $s2, 1371($29)
sb $s2, 1372($29)
sb $s2, 1373($29)
sb $s2, 1374($29)
sb $s2, 1375($29)
sb $s2, 1376($29)
sb $s2, 1377($29)
sb $s2, 1378($29)
sb $s2, 1379($29)
sb $s2, 1380($29)
sb $s2, 1381($29)
sb $s2, 1382($29)
sb $s2, 1383($29)
sb $s2, 1384($29)
sb $s2, 1385($29)
sb $s2, 1386($29)
sb $s2, 1387($29)
sb $s2, 1388($29)
sb $s2, 1389($29)
sb $s2, 1390($29)
sb $s2, 1391($29)
sb $s2, 1392($29)
sb $s2, 1393($29)
sb $s2, 1394($29)
sb $s2, 1395($29)
sb $s2, 1396($29)
sb $s2, 1397($29)
sb $s2, 1398($29)
sb $s2, 1399($29)
sb $s2, 1400($29)
sb $s2, 1401($29)
sb $s2, 1402($29)
sb $s2, 1403($29)
sb $s2, 1404($29)
sb $s2, 1405($29)
sb $s2, 1406($29)
sb $s2, 1407($29)
sb $s2, 1408($29)
sb $s2, 1409($29)
sb $s2, 1410($29)
sb $s2, 1411($29)
sb $s2, 1412($29)
sb $s2, 1413($29)
sb $s2, 1414($29)
sb $s2, 1415($29)
sb $s2, 1416($29)
sb $s2, 1417($29)
sb $s2, 1418($29)
sb $s2, 1419($29)
sb $s2, 1420($29)
sb $s2, 1421($29)
sb $s2, 1422($29)
sb $s2, 1423($29)
sb $s2, 1424($29)
sb $s2, 1425($29)
sb $s2, 1426($29)
sb $s2, 1427($29)
sb $s2, 1428($29)
sb $s2, 1429($29)
sb $s2, 1430($29)
sb $s2, 1431($29)
sb $s2, 1432($29)
sb $s2, 1433($29)
sb $s2, 1434($29)
sb $s2, 1435($29)
sb $s2, 1436($29)
sb $s2, 1437($29)
sb $s2, 1438($29)
sb $s2, 1439($29)
sb $s2, 1440($29)
sb $s2, 1441($29)
sb $s2, 1442($29)
sb $s2, 1443($29)
sb $s2, 1444($29)
sb $s2, 1445($29)
sb $s2, 1446($29)
sb $s2, 1447($29)
sb $s2, 1448($29)
sb $s2, 1449($29)
sb $s2, 1450($29)
sb $s2, 1451($29)
sb $s2, 1452($29)
sb $s2, 1453($29)
sb $s2, 1454($29)
sb $s2, 1455($29)
sb $s2, 1456($29)
sb $s2, 1457($29)
sb $s2, 1458($29)
sb $s2, 1459($29)
sb $s2, 1460($29)
sb $s2, 1461($29)
sb $s2, 1462($29)
sb $s2, 1463($29)
sb $s2, 1464($29)
sb $s2, 1465($29)
sb $s2, 1466($29)
sb $s2, 1467($29)
sb $s2, 1468($29)
sb $s2, 1469($29)
sb $s2, 1470($29)
sb $s2, 1471($29)
sb $s2, 1472($29)
sb $s2, 1473($29)
sb $s2, 1474($29)
sb $s2, 1475($29)
sb $s2, 1476($29)
sb $s2, 1477($29)
sb $s2, 1478($29)
sb $s2, 1479($29)
sb $s2, 1480($29)
sb $s2, 1481($29)
sb $s2, 1482($29)
sb $s2, 1483($29)
sb $s2, 1484($29)
sb $s2, 1485($29)
sb $s2, 1486($29)
sb $s2, 1487($29)
sb $s2, 1488($29)
sb $s2, 1489($29)
sb $s2, 1490($29)
sb $s2, 1491($29)
sb $s2, 1492($29)
sb $s2, 1493($29)
sb $s2, 1494($29)
sb $s2, 1495($29)
sb $s2, 1496($29)
sb $s2, 1497($29)
sb $s2, 1498($29)
sb $s2, 1499($29)
sb $s2, 1500($29)
sb $s2, 1501($29)
sb $s2, 1502($29)
sb $s2, 1503($29)
sb $s2, 1504($29)
sb $s2, 1505($29)
sb $s2, 1506($29)
sb $s2, 1507($29)
sb $s2, 1508($29)
sb $s2, 1509($29)
sb $s2, 1510($29)
sb $s2, 1511($29)
sb $s2, 1512($29)
sb $s2, 1513($29)
sb $s2, 1514($29)
sb $s2, 1515($29)
sb $s2, 1516($29)
sb $s2, 1517($29)
sb $s2, 1518($29)
sb $s2, 1519($29)
sb $s2, 1520($29)
sb $s2, 1521($29)
sb $s2, 1522($29)
sb $s2, 1523($29)
sb $s2, 1524($29)
sb $s2, 1525($29)
sb $s2, 1526($29)
sb $s2, 1527($29)
sb $s2, 1528($29)
sb $s2, 1529($29)
sb $s2, 1530($29)
sb $s2, 1531($29)
sb $s2, 1532($29)
sb $s2, 1533($29)
sb $s2, 1534($29)
sb $s2, 1535($29)
sb $s2, 1536($29)
sb $s2, 1537($29)
sb $s2, 1538($29)
sb $s2, 1539($29)
sb $s2, 1540($29)
sb $s2, 1541($29)
sb $s2, 1542($29)
sb $s2, 1543($29)
sb $s2, 1544($29)
sb $s2, 1545($29)
sb $s2, 1546($29)
sb $s2, 1547($29)
sb $s2, 1548($29)
sb $s2, 1549($29)
sb $s2, 1550($29)
sb $s2, 1551($29)
sb $s2, 1552($29)
sb $s2, 1553($29)
sb $s2, 1554($29)
sb $s2, 1555($29)
sb $s2, 1556($29)
sb $s2, 1557($29)
sb $s2, 1558($29)
sb $s2, 1559($29)
sb $s2, 1560($29)
sb $s2, 1561($29)
sb $s2, 1562($29)
sb $s2, 1563($29)
sb $s2, 1564($29)
sb $s2, 1565($29)
sb $s2, 1566($29)
sb $s2, 1567($29)
sb $s2, 1568($29)
sb $s2, 1569($29)
sb $s2, 1570($29)
sb $s2, 1571($29)
sb $s2, 1572($29)
sb $s2, 1573($29)
sb $s2, 1574($29)
sb $s2, 1575($29)
sb $s2, 1576($29)
sb $s2, 1577($29)
sb $s2, 1578($29)
sb $s2, 1579($29)
sb $s2, 1580($29)
sb $s2, 1581($29)
sb $s2, 1582($29)
sb $s2, 1583($29)
sb $s2, 1584($29)
sb $s2, 1585($29)
sb $s2, 1586($29)
sb $s2, 1587($29)
sb $s2, 1588($29)
sb $s2, 1589($29)
sb $s2, 1590($29)
sb $s2, 1591($29)
sb $s2, 1592($29)
sb $s2, 1593($29)
sb $s2, 1594($29)
sb $s2, 1595($29)
sb $s2, 1596($29)
sb $s2, 1597($29)
sb $s2, 1598($29)
sb $s2, 1599($29)
sb $s2, 1600($29)
sb $s2, 1601($29)
sb $s2, 1602($29)
sb $s2, 1603($29)
sb $s2, 1604($29)
sb $s2, 1605($29)
sb $s2, 1606($29)
sb $s2, 1607($29)
sb $s2, 1608($29)
sb $s2, 1609($29)
sb $s2, 1610($29)
sb $s2, 1611($29)
sb $s2, 1612($29)
sb $s2, 1613($29)
sb $s2, 1614($29)
sb $s2, 1615($29)
sb $s2, 1616($29)
sb $s2, 1617($29)
sb $s2, 1618($29)
sb $s2, 1619($29)
sb $s2, 1620($29)
sb $s2, 1621($29)
sb $s2, 1622($29)
sb $s2, 1623($29)
sb $s2, 1624($29)
sb $s2, 1625($29)
sb $s2, 1626($29)
sb $s2, 1627($29)
sb $s2, 1628($29)
sb $s2, 1629($29)
sb $s2, 1630($29)
sb $s2, 1631($29)
sb $s2, 1632($29)
sb $s2, 1633($29)
sb $s2, 1634($29)
sb $s2, 1635($29)
sb $s2, 1636($29)
sb $s2, 1637($29)
sb $s2, 1638($29)
sb $s2, 1639($29)
sb $s2, 1640($29)
sb $s2, 1641($29)
sb $s2, 1642($29)
sb $s2, 1643($29)
sb $s2, 1644($29)
sb $s2, 1645($29)
sb $s2, 1646($29)
sb $s2, 1647($29)
sb $s2, 1648($29)
sb $s2, 1649($29)
sb $s2, 1650($29)
sb $s2, 1651($29)
sb $s2, 1652($29)
sb $s2, 1653($29)
sb $s2, 1654($29)
sb $s2, 1655($29)
sb $s2, 1656($29)
sb $s2, 1657($29)
sb $s2, 1658($29)
sb $s2, 1659($29)
sb $s2, 1660($29)
sb $s2, 1661($29)
sb $s2, 1662($29)
sb $s2, 1663($29)
sb $s2, 1664($29)
sb $s2, 1665($29)
sb $s2, 1666($29)
sb $s2, 1667($29)
sb $s2, 1668($29)
sb $s2, 1669($29)
sb $s2, 1670($29)
sb $s2, 1671($29)
sb $s2, 1672($29)
sb $s2, 1673($29)
sb $s2, 1674($29)
sb $s2, 1675($29)
sb $s2, 1676($29)
sb $s2, 1677($29)
sb $s2, 1678($29)
sb $s2, 1679($29)
sb $s2, 1680($29)
sb $s2, 1681($29)
sb $s2, 1682($29)
sb $s2, 1683($29)
sb $s2, 1684($29)
sb $s2, 1685($29)
sb $s2, 1686($29)
sb $s2, 1687($29)
sb $s2, 1688($29)
sb $s2, 1689($29)
sb $s2, 1690($29)
sb $s2, 1691($29)
sb $s2, 1692($29)
sb $s2, 1693($29)
sb $s2, 1694($29)
sb $s2, 1695($29)
sb $s2, 1696($29)
sb $s2, 1697($29)
sb $s2, 1698($29)
sb $s2, 1699($29)
sb $s2, 1700($29)
sb $s2, 1701($29)
sb $s2, 1702($29)
sb $s2, 1703($29)
sb $s2, 1704($29)
sb $s2, 1705($29)
sb $s2, 1706($29)
sb $s2, 1707($29)
sb $s2, 1708($29)
sb $s2, 1709($29)
sb $s2, 1710($29)
sb $s2, 1711($29)
sb $s2, 1712($29)
sb $s2, 1713($29)
sb $s2, 1714($29)
sb $s2, 1715($29)
sb $s2, 1716($29)
sb $s2, 1717($29)
sb $s2, 1718($29)
sb $s2, 1719($29)
sb $s2, 1720($29)
sb $s2, 1721($29)
sb $s2, 1722($29)
sb $s2, 1723($29)
sb $s2, 1724($29)
sb $s2, 1725($29)
sb $s2, 1726($29)
sb $s2, 1727($29)
sb $s2, 1728($29)
sb $s2, 1729($29)
sb $s2, 1730($29)
sb $s2, 1731($29)
sb $s2, 1732($29)
sb $s2, 1733($29)
sb $s2, 1734($29)
sb $s2, 1735($29)
sb $s2, 1736($29)
sb $s2, 1737($29)
sb $s2, 1738($29)
sb $s2, 1739($29)
sb $s2, 1740($29)
sb $s2, 1741($29)
sb $s2, 1742($29)
sb $s2, 1743($29)
sb $s2, 1744($29)
sb $s2, 1745($29)
sb $s2, 1746($29)
sb $s2, 1747($29)
sb $s2, 1748($29)
sb $s2, 1749($29)
sb $s2, 1750($29)
sb $s2, 1751($29)
sb $s2, 1752($29)
sb $s2, 1753($29)
sb $s2, 1754($29)
sb $s2, 1755($29)
sb $s2, 1756($29)
sb $s2, 1757($29)
sb $s2, 1758($29)
sb $s2, 1759($29)
sb $s2, 1760($29)
sb $s2, 1761($29)
sb $s2, 1762($29)
sb $s2, 1763($29)
sb $s2, 1764($29)
sb $s2, 1765($29)
sb $s2, 1766($29)
sb $s2, 1767($29)
sb $s2, 1768($29)
sb $s2, 1769($29)
sb $s2, 1770($29)
sb $s2, 1771($29)
sb $s2, 1772($29)
sb $s2, 1773($29)
sb $s2, 1774($29)
sb $s2, 1775($29)
sb $s2, 1776($29)
sb $s2, 1777($29)
sb $s2, 1778($29)
sb $s2, 1779($29)
sb $s2, 1780($29)
sb $s2, 1781($29)
sb $s2, 1782($29)
sb $s2, 1783($29)
sb $s2, 1784($29)
sb $s2, 1785($29)
sb $s2, 1786($29)
sb $s2, 1787($29)
sb $s2, 1788($29)
sb $s2, 1789($29)
sb $s2, 1790($29)
sb $s2, 1791($29)
sb $s2, 1792($29)
sb $s2, 1793($29)
sb $s2, 1794($29)
sb $s2, 1795($29)
sb $s2, 1796($29)
sb $s2, 1797($29)
sb $s2, 1798($29)
sb $s2, 1799($29)
sb $s2, 1800($29)
sb $s2, 1801($29)
sb $s2, 1802($29)
sb $s2, 1803($29)
sb $s2, 1804($29)
sb $s2, 1805($29)
sb $s2, 1806($29)
sb $s2, 1807($29)
sb $s2, 1808($29)
sb $s2, 1809($29)
sb $s2, 1810($29)
sb $s2, 1811($29)
sb $s2, 1812($29)
sb $s2, 1813($29)
sb $s2, 1814($29)
sb $s2, 1815($29)
sb $s2, 1816($29)
sb $s2, 1817($29)
sb $s2, 1818($29)
sb $s2, 1819($29)
sb $s2, 1820($29)
sb $s2, 1821($29)
sb $s2, 1822($29)
sb $s2, 1823($29)
sb $s2, 1824($29)
sb $s2, 1825($29)
sb $s2, 1826($29)
sb $s2, 1827($29)
sb $s2, 1828($29)
sb $s2, 1829($29)
sb $s2, 1830($29)
sb $s2, 1831($29)
sb $s2, 1832($29)
sb $s2, 1833($29)
sb $s2, 1834($29)
sb $s2, 1835($29)
sb $s2, 1836($29)
sb $s2, 1837($29)
sb $s2, 1838($29)
sb $s2, 1839($29)
sb $s2, 1840($29)
sb $s2, 1841($29)
sb $s2, 1842($29)
sb $s2, 1843($29)
sb $s2, 1844($29)
sb $s2, 1845($29)
sb $s2, 1846($29)
sb $s2, 1847($29)
sb $s2, 1848($29)
sb $s2, 1849($29)
sb $s2, 1850($29)
sb $s2, 1851($29)
sb $s2, 1852($29)
sb $s2, 1853($29)
sb $s2, 1854($29)
sb $s2, 1855($29)
sb $s2, 1856($29)
sb $s2, 1857($29)
sb $s2, 1858($29)
sb $s2, 1859($29)
sb $s2, 1860($29)
sb $s2, 1861($29)
sb $s2, 1862($29)
sb $s2, 1863($29)
sb $s2, 1864($29)
sb $s2, 1865($29)
sb $s2, 1866($29)
sb $s2, 1867($29)
sb $s2, 1868($29)
sb $s2, 1869($29)
sb $s2, 1870($29)
sb $s2, 1871($29)
sb $s2, 1872($29)
sb $s2, 1873($29)
sb $s2, 1874($29)
sb $s2, 1875($29)
sb $s2, 1876($29)
sb $s2, 1877($29)
sb $s2, 1878($29)
sb $s2, 1879($29)
sb $s2, 1880($29)
sb $s2, 1881($29)
sb $s2, 1882($29)
sb $s2, 1883($29)
sb $s2, 1884($29)
sb $s2, 1885($29)
sb $s2, 1886($29)
sb $s2, 1887($29)
sb $s2, 1888($29)
sb $s2, 1889($29)
sb $s2, 1890($29)
sb $s2, 1891($29)
sb $s2, 1892($29)
sb $s2, 1893($29)
sb $s2, 1894($29)
sb $s2, 1895($29)
sb $s2, 1896($29)
sb $s2, 1897($29)
sb $s2, 1898($29)
sb $s2, 1899($29)
sb $s2, 1900($29)
sb $s2, 1901($29)
sb $s2, 1902($29)
sb $s2, 1903($29)
sb $s2, 1904($29)
sb $s2, 1905($29)
sb $s2, 1906($29)
sb $s2, 1907($29)
sb $s2, 1908($29)
sb $s2, 1909($29)
sb $s2, 1910($29)
sb $s2, 1911($29)
sb $s2, 1912($29)
sb $s2, 1913($29)
sb $s2, 1914($29)
sb $s2, 1915($29)
sb $s2, 1916($29)
sb $s2, 1917($29)
sb $s2, 1918($29)
sb $s2, 1919($29)
sb $s2, 1920($29)
sb $s2, 1921($29)
sb $s2, 1922($29)
sb $s2, 1923($29)
sb $s2, 1924($29)
sb $s2, 1925($29)
sb $s2, 1926($29)
sb $s2, 1927($29)
sb $s2, 1928($29)
sb $s2, 1929($29)
sb $s2, 1930($29)
sb $s2, 1931($29)
sb $s2, 1932($29)
sb $s2, 1933($29)
sb $s2, 1934($29)
sb $s2, 1935($29)
sb $s2, 1936($29)
sb $s2, 1937($29)
sb $s2, 1938($29)
sb $s2, 1939($29)
sb $s2, 1940($29)
sb $s2, 1941($29)
sb $s2, 1942($29)
sb $s2, 1943($29)
sb $s2, 1944($29)
sb $s2, 1945($29)
sb $s2, 1946($29)
sb $s2, 1947($29)
sb $s2, 1948($29)
sb $s2, 1949($29)
sb $s2, 1950($29)
sb $s2, 1951($29)
sb $s2, 1952($29)
sb $s2, 1953($29)
sb $s2, 1954($29)
sb $s2, 1955($29)
sb $s2, 1956($29)
sb $s2, 1957($29)
sb $s2, 1958($29)
sb $s2, 1959($29)
sb $s2, 1960($29)
sb $s2, 1961($29)
sb $s2, 1962($29)
sb $s2, 1963($29)
sb $s2, 1964($29)
sb $s2, 1965($29)
sb $s2, 1966($29)
sb $s2, 1967($29)
sb $s2, 1968($29)
sb $s2, 1969($29)
sb $s2, 1970($29)
sb $s2, 1971($29)
sb $s2, 1972($29)
sb $s2, 1973($29)
sb $s2, 1974($29)
sb $s2, 1975($29)
sb $s2, 1976($29)
sb $s2, 1977($29)
sb $s2, 1978($29)
sb $s2, 1979($29)
sb $s2, 1980($29)
sb $s2, 1981($29)
sb $s2, 1982($29)
sb $s2, 1983($29)
sb $s2, 1984($29)
sb $s2, 1985($29)
sb $s2, 1986($29)
sb $s2, 1987($29)
sb $s2, 1988($29)
sb $s2, 1989($29)
sb $s2, 1990($29)
sb $s2, 1991($29)
sb $s2, 1992($29)
sb $s2, 1993($29)
sb $s2, 1994($29)
sb $s2, 1995($29)
sb $s2, 1996($29)
sb $s2, 1997($29)
sb $s2, 1998($29)
sb $s2, 1999($29)
sb $s2, 2000($29)
sb $s2, 2001($29)
sb $s2, 2002($29)
sb $s2, 2003($29)
sb $s2, 2004($29)
sb $s2, 2005($29)
sb $s2, 2006($29)
sb $s2, 2007($29)
sb $s2, 2008($29)
sb $s2, 2009($29)
sb $s2, 2010($29)
sb $s2, 2011($29)
sb $s2, 2012($29)
sb $s2, 2013($29)
sb $s2, 2014($29)
sb $s2, 2015($29)
sb $s2, 2016($29)
sb $s2, 2017($29)
sb $s2, 2018($29)
sb $s2, 2019($29)
sb $s2, 2020($29)
sb $s2, 2021($29)
sb $s2, 2022($29)
sb $s2, 2023($29)
sb $s2, 2024($29)
sb $s2, 2025($29)
sb $s2, 2026($29)
sb $s2, 2027($29)
sb $s2, 2028($29)
sb $s2, 2029($29)
sb $s2, 2030($29)
sb $s2, 2031($29)
sb $s2, 2032($29)
sb $s2, 2033($29)
sb $s2, 2034($29)
sb $s2, 2035($29)
sb $s2, 2036($29)
sb $s2, 2037($29)
sb $s2, 2038($29)
sb $s2, 2039($29)
sb $s2, 2040($29)
sb $s2, 2041($29)
sb $s2, 2042($29)
sb $s2, 2043($29)
sb $s2, 2044($29)
sb $s2, 2045($29)
sb $s2, 2046($29)
sb $s2, 2047($29)
sb $s2, 2048($29)
sb $s2, 2049($29)
sb $s2, 2050($29)
sb $s2, 2051($29)
sb $s2, 2052($29)
sb $s2, 2053($29)
sb $s2, 2054($29)
sb $s2, 2055($29)
sb $s2, 2056($29)
sb $s2, 2057($29)
sb $s2, 2058($29)
sb $s2, 2059($29)
sb $s2, 2060($29)
sb $s2, 2061($29)
sb $s2, 2062($29)
sb $s2, 2063($29)
sb $s2, 2064($29)
sb $s2, 2065($29)
sb $s2, 2066($29)
sb $s2, 2067($29)
sb $s2, 2068($29)
sb $s2, 2069($29)
sb $s2, 2070($29)
sb $s2, 2071($29)
sb $s2, 2072($29)
sb $s2, 2073($29)
sb $s2, 2074($29)
sb $s2, 2075($29)
sb $s2, 2076($29)
sb $s2, 2077($29)
sb $s2, 2078($29)
sb $s2, 2079($29)
sb $s2, 2080($29)
sb $s2, 2081($29)
sb $s2, 2082($29)
sb $s2, 2083($29)
sb $s2, 2084($29)
sb $s2, 2085($29)
sb $s2, 2086($29)
sb $s2, 2087($29)
sb $s2, 2088($29)
sb $s2, 2089($29)
sb $s2, 2090($29)
sb $s2, 2091($29)
sb $s2, 2092($29)
sb $s2, 2093($29)
sb $s2, 2094($29)
sb $s2, 2095($29)
sb $s2, 2096($29)
sb $s2, 2097($29)
sb $s2, 2098($29)
sb $s2, 2099($29)
sb $s2, 2100($29)
sb $s2, 2101($29)
sb $s2, 2102($29)
sb $s2, 2103($29)
sb $s2, 2104($29)
sb $s2, 2105($29)
sb $s2, 2106($29)
sb $s2, 2107($29)
sb $s2, 2108($29)
sb $s2, 2109($29)
sb $s2, 2110($29)
sb $s2, 2111($29)
sb $s2, 2112($29)
sb $s2, 2113($29)
sb $s2, 2114($29)
sb $s2, 2115($29)
sb $s2, 2116($29)
sb $s2, 2117($29)
sb $s2, 2118($29)
sb $s2, 2119($29)
sb $s2, 2120($29)
sb $s2, 2121($29)
sb $s2, 2122($29)
sb $s2, 2123($29)
sb $s2, 2124($29)
sb $s2, 2125($29)
sb $s2, 2126($29)
sb $s2, 2127($29)
sb $s2, 2128($29)
sb $s2, 2129($29)
sb $s2, 2130($29)
sb $s2, 2131($29)
sb $s2, 2132($29)
sb $s2, 2133($29)
sb $s2, 2134($29)
sb $s2, 2135($29)
sb $s2, 2136($29)
sb $s2, 2137($29)
sb $s2, 2138($29)
sb $s2, 2139($29)
sb $s2, 2140($29)
sb $s2, 2141($29)
sb $s2, 2142($29)
sb $s2, 2143($29)
sb $s2, 2144($29)
sb $s2, 2145($29)
sb $s2, 2146($29)
sb $s2, 2147($29)
sb $s2, 2148($29)
sb $s2, 2149($29)
sb $s2, 2150($29)
sb $s2, 2151($29)
sb $s2, 2152($29)
sb $s2, 2153($29)
sb $s2, 2154($29)
sb $s2, 2155($29)
sb $s2, 2156($29)
sb $s2, 2157($29)
sb $s2, 2158($29)
sb $s2, 2159($29)
sb $s2, 2160($29)
sb $s2, 2161($29)
sb $s2, 2162($29)
sb $s2, 2163($29)
sb $s2, 2164($29)
sb $s2, 2165($29)
sb $s2, 2166($29)
sb $s2, 2167($29)
sb $s2, 2168($29)
sb $s2, 2169($29)
sb $s2, 2170($29)
sb $s2, 2171($29)
sb $s2, 2172($29)
sb $s2, 2173($29)
sb $s2, 2174($29)
sb $s2, 2175($29)
sb $s2, 2176($29)
sb $s2, 2177($29)
sb $s2, 2178($29)
sb $s2, 2179($29)
sb $s2, 2180($29)
sb $s2, 2181($29)
sb $s2, 2182($29)
sb $s2, 2183($29)
sb $s2, 2184($29)
sb $s2, 2185($29)
sb $s2, 2186($29)
sb $s2, 2187($29)
sb $s2, 2188($29)
sb $s2, 2189($29)
sb $s2, 2190($29)
sb $s2, 2191($29)
sb $s2, 2192($29)
sb $s2, 2193($29)
sb $s2, 2194($29)
sb $s2, 2195($29)
sb $s2, 2196($29)
sb $s2, 2197($29)
sb $s2, 2198($29)
sb $s2, 2199($29)
sb $s2, 2200($29)
sb $s2, 2201($29)
sb $s2, 2202($29)
sb $s2, 2203($29)
sb $s2, 2204($29)
sb $s2, 2205($29)
sb $s2, 2206($29)
sb $s2, 2207($29)
sb $s2, 2208($29)
sb $s2, 2209($29)
sb $s2, 2210($29)
sb $s2, 2211($29)
sb $s2, 2212($29)
sb $s2, 2213($29)
sb $s2, 2214($29)
sb $s2, 2215($29)
sb $s2, 2216($29)
sb $s2, 2217($29)
sb $s2, 2218($29)
sb $s2, 2219($29)
sb $s2, 2220($29)
sb $s2, 2221($29)
sb $s2, 2222($29)
sb $s2, 2223($29)
sb $s2, 2224($29)
sb $s2, 2225($29)
sb $s2, 2226($29)
sb $s2, 2227($29)
sb $s2, 2228($29)
sb $s2, 2229($29)
sb $s2, 2230($29)
sb $s2, 2231($29)
sb $s2, 2232($29)
sb $s2, 2233($29)
sb $s2, 2234($29)
sb $s2, 2235($29)
sb $s2, 2236($29)
sb $s2, 2237($29)
sb $s2, 2238($29)
sb $s2, 2239($29)
sb $s2, 2240($29)
sb $s2, 2241($29)
sb $s2, 2242($29)
sb $s2, 2243($29)
sb $s2, 2244($29)
sb $s2, 2245($29)
sb $s2, 2246($29)
sb $s2, 2247($29)
sb $s2, 2248($29)
sb $s2, 2249($29)
sb $s2, 2250($29)
sb $s2, 2251($29)
sb $s2, 2252($29)
sb $s2, 2253($29)
sb $s2, 2254($29)
sb $s2, 2255($29)
sb $s2, 2256($29)
sb $s2, 2257($29)
sb $s2, 2258($29)
sb $s2, 2259($29)
sb $s2, 2260($29)
sb $s2, 2261($29)
sb $s2, 2262($29)
sb $s2, 2263($29)
sb $s2, 2264($29)
sb $s2, 2265($29)
sb $s2, 2266($29)
sb $s2, 2267($29)
sb $s2, 2268($29)
sb $s2, 2269($29)
sb $s2, 2270($29)
sb $s2, 2271($29)
sb $s2, 2272($29)
sb $s2, 2273($29)
sb $s2, 2274($29)
sb $s2, 2275($29)
sb $s2, 2276($29)
sb $s2, 2277($29)
sb $s2, 2278($29)
sb $s2, 2279($29)
sb $s2, 2280($29)
sb $s2, 2281($29)
sb $s2, 2282($29)
sb $s2, 2283($29)
sb $s2, 2284($29)
sb $s2, 2285($29)
sb $s2, 2286($29)
sb $s2, 2287($29)
sb $s2, 2288($29)
sb $s2, 2289($29)
sb $s2, 2290($29)
sb $s2, 2291($29)
sb $s2, 2292($29)
sb $s2, 2293($29)
sb $s2, 2294($29)
sb $s2, 2295($29)
sb $s2, 2296($29)
sb $s2, 2297($29)
sb $s2, 2298($29)
sb $s2, 2299($29)
sb $s2, 2300($29)
sb $s2, 2301($29)
sb $s2, 2302($29)
sb $s2, 2303($29)
sb $s2, 2304($29)
sb $s2, 2305($29)
sb $s2, 2306($29)
sb $s2, 2307($29)
sb $s2, 2308($29)
sb $s2, 2309($29)
sb $s2, 2310($29)
sb $s2, 2311($29)
sb $s2, 2312($29)
sb $s2, 2313($29)
sb $s2, 2314($29)
sb $s2, 2315($29)
sb $s2, 2316($29)
sb $s2, 2317($29)
sb $s2, 2318($29)
sb $s2, 2319($29)
sb $s2, 2320($29)
sb $s2, 2321($29)
sb $s2, 2322($29)
sb $s2, 2323($29)
sb $s2, 2324($29)
sb $s2, 2325($29)
sb $s2, 2326($29)
sb $s2, 2327($29)
sb $s2, 2328($29)
sb $s2, 2329($29)
sb $s2, 2330($29)
sb $s2, 2331($29)
sb $s2, 2332($29)
sb $s2, 2333($29)
sb $s2, 2334($29)
sb $s2, 2335($29)
sb $s2, 2336($29)
sb $s2, 2337($29)
sb $s2, 2338($29)
sb $s2, 2339($29)
sb $s2, 2340($29)
sb $s2, 2341($29)
sb $s2, 2342($29)
sb $s2, 2343($29)
sb $s2, 2344($29)
sb $s2, 2345($29)
sb $s2, 2346($29)
sb $s2, 2347($29)
sb $s2, 2348($29)
sb $s2, 2349($29)
sb $s2, 2350($29)
sb $s2, 2351($29)
sb $s2, 2352($29)
sb $s2, 2353($29)
sb $s2, 2354($29)
sb $s2, 2355($29)
sb $s2, 2356($29)
sb $s2, 2357($29)
sb $s2, 2358($29)
sb $s2, 2359($29)
sb $s2, 2360($29)
sb $s2, 2361($29)
sb $s2, 2362($29)
sb $s2, 2363($29)
sb $s2, 2364($29)
sb $s2, 2365($29)
sb $s2, 2366($29)
sb $s2, 2367($29)
sb $s2, 2368($29)
sb $s2, 2369($29)
sb $s2, 2370($29)
sb $s2, 2371($29)
sb $s2, 2372($29)
sb $s2, 2373($29)
sb $s2, 2374($29)
sb $s2, 2375($29)
sb $s2, 2376($29)
sb $s2, 2377($29)
sb $s2, 2378($29)
sb $s2, 2379($29)
sb $s2, 2380($29)
sb $s2, 2381($29)
sb $s2, 2382($29)
sb $s2, 2383($29)
sb $s2, 2384($29)
sb $s2, 2385($29)
sb $s2, 2386($29)
sb $s2, 2387($29)
sb $s2, 2388($29)
sb $s2, 2389($29)
sb $s2, 2390($29)
sb $s2, 2391($29)
sb $s2, 2392($29)
sb $s2, 2393($29)
sb $s2, 2394($29)
sb $s2, 2395($29)
sb $s2, 2396($29)
sb $s2, 2397($29)
sb $s2, 2398($29)
sb $s2, 2399($29)
sb $s2, 2400($29)
sb $s2, 2401($29)
sb $s2, 2402($29)
sb $s2, 2403($29)
sb $s2, 2404($29)
sb $s2, 2405($29)
sb $s2, 2406($29)
sb $s2, 2407($29)
sb $s2, 2408($29)
sb $s2, 2409($29)
sb $s2, 2410($29)
sb $s2, 2411($29)
sb $s2, 2412($29)
sb $s2, 2413($29)
sb $s2, 2414($29)
sb $s2, 2415($29)
sb $s2, 2416($29)
sb $s2, 2417($29)
sb $s2, 2418($29)
sb $s2, 2419($29)
sb $s2, 2420($29)
sb $s2, 2421($29)
sb $s2, 2422($29)
sb $s2, 2423($29)
sb $s2, 2424($29)
sb $s2, 2425($29)
sb $s2, 2426($29)
sb $s2, 2427($29)
sb $s2, 2428($29)
sb $s2, 2429($29)
sb $s2, 2430($29)
sb $s2, 2431($29)
sb $s2, 2432($29)
sb $s2, 2433($29)
sb $s2, 2434($29)
sb $s2, 2435($29)
sb $s2, 2436($29)
sb $s2, 2437($29)
sb $s2, 2438($29)
sb $s2, 2439($29)
sb $s2, 2440($29)
sb $s2, 2441($29)
sb $s2, 2442($29)
sb $s2, 2443($29)
sb $s2, 2444($29)
sb $s2, 2445($29)
sb $s2, 2446($29)
sb $s2, 2447($29)
sb $s2, 2448($29)
sb $s2, 2449($29)
sb $s2, 2450($29)
sb $s2, 2451($29)
sb $s2, 2452($29)
sb $s2, 2453($29)
sb $s2, 2454($29)
sb $s2, 2455($29)
sb $s2, 2456($29)
sb $s2, 2457($29)
sb $s2, 2458($29)
sb $s2, 2459($29)
sb $s2, 2460($29)
sb $s2, 2461($29)
sb $s2, 2462($29)
sb $s2, 2463($29)
sb $s2, 2464($29)
sb $s2, 2465($29)
sb $s2, 2466($29)
sb $s2, 2467($29)
sb $s2, 2468($29)
sb $s2, 2469($29)
sb $s2, 2470($29)
sb $s2, 2471($29)
sb $s2, 2472($29)
sb $s2, 2473($29)
sb $s2, 2474($29)
sb $s2, 2475($29)
sb $s2, 2476($29)
sb $s2, 2477($29)
sb $s2, 2478($29)
sb $s2, 2479($29)
sb $s2, 2480($29)
sb $s2, 2481($29)
sb $s2, 2482($29)
sb $s2, 2483($29)
sb $s2, 2484($29)
sb $s2, 2485($29)
sb $s2, 2486($29)
sb $s2, 2487($29)
sb $s2, 2488($29)
sb $s2, 2489($29)
sb $s2, 2490($29)
sb $s2, 2491($29)
sb $s2, 2492($29)
sb $s2, 2493($29)
sb $s2, 2494($29)
sb $s2, 2495($29)
sb $s2, 2496($29)
sb $s2, 2497($29)
sb $s2, 2498($29)
sb $s2, 2499($29)
sb $s2, 2500($29)
sb $s2, 2501($29)
sb $s2, 2502($29)
sb $s2, 2503($29)
sb $s2, 2504($29)
sb $s2, 2505($29)
sb $s2, 2506($29)
sb $s2, 2507($29)
sb $s2, 2508($29)
sb $s2, 2509($29)
sb $s2, 2510($29)
sb $s2, 2511($29)
sb $s2, 2512($29)
sb $s2, 2513($29)
sb $s2, 2514($29)
sb $s2, 2515($29)
sb $s2, 2516($29)
sb $s2, 2517($29)
sb $s2, 2518($29)
sb $s2, 2519($29)
sb $s2, 2520($29)
sb $s2, 2521($29)
sb $s2, 2522($29)
sb $s2, 2523($29)
sb $s2, 2524($29)
sb $s2, 2525($29)
sb $s2, 2526($29)
sb $s2, 2527($29)
sb $s2, 2528($29)
sb $s2, 2529($29)
sb $s2, 2530($29)
sb $s2, 2531($29)
sb $s2, 2532($29)
sb $s2, 2533($29)
sb $s2, 2534($29)
sb $s2, 2535($29)
sb $s2, 2536($29)
sb $s2, 2537($29)
sb $s2, 2538($29)
sb $s2, 2539($29)
sb $s2, 2540($29)
sb $s2, 2541($29)
sb $s2, 2542($29)
sb $s2, 2543($29)
sb $s2, 2544($29)
sb $s2, 2545($29)
sb $s2, 2546($29)
sb $s2, 2547($29)
sb $s2, 2548($29)
sb $s2, 2549($29)
sb $s2, 2550($29)
sb $s2, 2551($29)
sb $s2, 2552($29)
sb $s2, 2553($29)
sb $s2, 2554($29)
sb $s2, 2555($29)
sb $s2, 2556($29)
sb $s2, 2557($29)
sb $s2, 2558($29)
sb $s2, 2559($29)
sb $s2, 2560($29)
sb $s2, 2561($29)
sb $s2, 2562($29)
sb $s2, 2563($29)
sb $s2, 2564($29)
sb $s2, 2565($29)
sb $s2, 2566($29)
sb $s2, 2567($29)
sb $s2, 2568($29)
sb $s2, 2569($29)
sb $s2, 2570($29)
sb $s2, 2571($29)
sb $s2, 2572($29)
sb $s2, 2573($29)
sb $s2, 2574($29)
sb $s2, 2575($29)
sb $s2, 2576($29)
sb $s2, 2577($29)
sb $s2, 2578($29)
sb $s2, 2579($29)
sb $s2, 2580($29)
sb $s2, 2581($29)
sb $s2, 2582($29)
sb $s2, 2583($29)
sb $s2, 2584($29)
sb $s2, 2585($29)
sb $s2, 2586($29)
sb $s2, 2587($29)
sb $s2, 2588($29)
sb $s2, 2589($29)
sb $s2, 2590($29)
sb $s2, 2591($29)
sb $s2, 2592($29)
sb $s2, 2593($29)
sb $s2, 2594($29)
sb $s2, 2595($29)
sb $s2, 2596($29)
sb $s2, 2597($29)
sb $s2, 2598($29)
sb $s2, 2599($29)
sb $s2, 2600($29)
sb $s2, 2601($29)
sb $s2, 2602($29)
sb $s2, 2603($29)
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
sw $t0, -5340($30)
addiu $29, $29, -4
sw $t1, -5344($30)
addiu $29, $29, -4
sw $t2, -5348($30)
addiu $29, $29, -4
sw $t3, -5352($30)
addiu $29, $29, -4
sw $t4, -5356($30)
addiu $29, $29, -4
sw $t5, -5360($30)
addiu $29, $29, -4
sw $t6, -5364($30)
addiu $29, $29, -4
sw $t7, -5368($30)
addiu $29, $29, -4
sw $t8, -5372($30)
addiu $29, $29, -4
sw $t9, -5376($30)
addiu $29, $29, -4
sw $s0, -5380($30)
addiu $29, $29, -4
sw $s1, -5384($30)
addiu $29, $29, -4
sw $s2, -5388($30)
addiu $29, $29, -4
sw $s3, -5392($30)
addiu $29, $29, -4
sw $s4, -5396($30)
addiu $29, $29, -4
sw $s5, -5400($30)
addiu $29, $29, -4
sw $s6, -5404($30)
addiu $29, $29, -4
sw $s7, -5408($30)
lw $t1, -5380($30)
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
lw $s2, -5348($30)
sw $s1, 0($s2)
# safety_ptr -> as_float = 3.14 ; 

lw $s3, -5404($30)
lw $s4, 0($s3)
addiu $s5, $0, 0
lw $s6, 0($s4)
li $s7, 0
addiu $29, $29, -4
sw $t0, -5412($30)
sw $t1, -5380($30)
addiu $29, $29, -4
sw $t2, -5416($30)
addiu $29, $29, -4
sw $t3, -5420($30)
addiu $29, $29, -4
sw $t4, -5424($30)
addiu $29, $29, -4
sw $t5, -5428($30)
addiu $29, $29, -4
sw $t6, -5432($30)
addiu $29, $29, -4
sw $t7, -5436($30)
addiu $29, $29, -4
sw $t8, -5440($30)
addiu $29, $29, -4
sw $t9, -5444($30)
addiu $29, $29, -4
sw $s0, -5448($30)
addiu $29, $29, -4
sw $s1, -5452($30)
sw $s2, -5348($30)
sw $s3, -5404($30)
addiu $29, $29, -4
sw $s4, -5456($30)
addiu $29, $29, -4
sw $s5, -5460($30)
addiu $29, $29, -4
sw $s6, -5464($30)
addiu $29, $29, -4
sw $s7, -5468($30)
lw $t1, -5464($30)
lw $t2, -5468($30)
addu $t0, $t1, $t2
lw $t3, 0($t0)
l.s $f0, float...index_0
mfc1 $t4, $f0
sw $t4, 0($t3)
# INT q = safety_ptr -> as_integer ; 

lw $t6, -5404($30)
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
# ( * safety_ptr ) . as_str [ 49 ] [ 49 ] = 'a' ; 

lw $s6, 0($t6)
addiu $s7, $0, 0
addiu $29, $29, -4
sw $t0, -5476($30)
sw $t1, -5464($30)
sw $t2, -5468($30)
addiu $29, $29, -4
sw $t3, -5480($30)
addiu $29, $29, -4
sw $t4, -5484($30)
addiu $29, $29, -4
sw $t5, -5488($30)
sw $t6, -5404($30)
addiu $29, $29, -4
sw $t7, -5492($30)
addiu $29, $29, -4
sw $t8, -5496($30)
addiu $29, $29, -4
sw $t9, -5500($30)
addiu $29, $29, -4
sw $s0, -5504($30)
addiu $29, $29, -4
sw $s1, -5508($30)
addiu $29, $29, -4
sw $s2, -5512($30)
addiu $29, $29, -4
sw $s3, -5516($30)
addiu $29, $29, -4
sw $s4, -5520($30)
addiu $29, $29, -4
sw $s5, -5524($30)
addiu $29, $29, -4
sw $s6, -5528($30)
addiu $29, $29, -4
sw $s7, -5532($30)
lw $t1, -5528($30)
lw $t0, 0($t1)
li $t2, 0
addu $t3, $t0, $t2
addiu $t4, $t3, 52
addiu $t5, $t3, 104
addiu $t6, $t3, 156
addiu $t7, $t3, 208
addiu $t8, $t3, 260
addiu $t9, $t3, 312
addiu $s0, $t3, 364
addiu $s1, $t3, 416
addiu $s2, $t3, 468
addiu $s3, $t3, 520
addiu $s4, $t3, 572
addiu $s5, $t3, 624
addiu $s6, $t3, 676
addiu $s7, $t3, 728
addiu $29, $29, -4
sw $t0, -5536($30)
sw $t1, -5528($30)
addiu $29, $29, -4
sw $t2, -5540($30)
addiu $29, $29, -4
sw $t3, -5544($30)
addiu $29, $29, -4
sw $t4, -5548($30)
addiu $29, $29, -4
sw $t5, -5552($30)
addiu $29, $29, -4
sw $t6, -5556($30)
addiu $29, $29, -4
sw $t7, -5560($30)
addiu $29, $29, -4
sw $t8, -5564($30)
addiu $29, $29, -4
sw $t9, -5568($30)
addiu $29, $29, -4
sw $s0, -5572($30)
addiu $29, $29, -4
sw $s1, -5576($30)
addiu $29, $29, -4
sw $s2, -5580($30)
addiu $29, $29, -4
sw $s3, -5584($30)
addiu $29, $29, -4
sw $s4, -5588($30)
addiu $29, $29, -4
sw $s5, -5592($30)
addiu $29, $29, -4
sw $s6, -5596($30)
addiu $29, $29, -4
sw $s7, -5600($30)
lw $t1, -5544($30)
addiu $t0, $t1, 780
addiu $t2, $t1, 832
addiu $t3, $t1, 884
addiu $t4, $t1, 936
addiu $t5, $t1, 988
addiu $t6, $t1, 1040
addiu $t7, $t1, 1092
addiu $t8, $t1, 1144
addiu $t9, $t1, 1196
addiu $s0, $t1, 1248
addiu $s1, $t1, 1300
addiu $s2, $t1, 1352
addiu $s3, $t1, 1404
addiu $s4, $t1, 1456
addiu $s5, $t1, 1508
addiu $s6, $t1, 1560
addiu $s7, $t1, 1612
addiu $29, $29, -4
sw $t0, -5604($30)
sw $t1, -5544($30)
addiu $29, $29, -4
sw $t2, -5608($30)
addiu $29, $29, -4
sw $t3, -5612($30)
addiu $29, $29, -4
sw $t4, -5616($30)
addiu $29, $29, -4
sw $t5, -5620($30)
addiu $29, $29, -4
sw $t6, -5624($30)
addiu $29, $29, -4
sw $t7, -5628($30)
addiu $29, $29, -4
sw $t8, -5632($30)
addiu $29, $29, -4
sw $t9, -5636($30)
addiu $29, $29, -4
sw $s0, -5640($30)
addiu $29, $29, -4
sw $s1, -5644($30)
addiu $29, $29, -4
sw $s2, -5648($30)
addiu $29, $29, -4
sw $s3, -5652($30)
addiu $29, $29, -4
sw $s4, -5656($30)
addiu $29, $29, -4
sw $s5, -5660($30)
addiu $29, $29, -4
sw $s6, -5664($30)
addiu $29, $29, -4
sw $s7, -5668($30)
lw $t1, -5544($30)
addiu $t0, $t1, 1664
addiu $t2, $t1, 1716
addiu $t3, $t1, 1768
addiu $t4, $t1, 1820
addiu $t5, $t1, 1872
addiu $t6, $t1, 1924
addiu $t7, $t1, 1976
addiu $t8, $t1, 2028
addiu $t9, $t1, 2080
addiu $s0, $t1, 2132
addiu $s1, $t1, 2184
addiu $s2, $t1, 2236
addiu $s3, $t1, 2288
addiu $s4, $t1, 2340
addiu $s5, $t1, 2392
addiu $s6, $t1, 2444
addiu $s7, $t1, 2496
addiu $29, $29, -4
sw $t0, -5672($30)
sw $t1, -5544($30)
addiu $29, $29, -4
sw $t2, -5676($30)
addiu $29, $29, -4
sw $t3, -5680($30)
addiu $29, $29, -4
sw $t4, -5684($30)
addiu $29, $29, -4
sw $t5, -5688($30)
addiu $29, $29, -4
sw $t6, -5692($30)
addiu $29, $29, -4
sw $t7, -5696($30)
addiu $29, $29, -4
sw $t8, -5700($30)
addiu $29, $29, -4
sw $t9, -5704($30)
addiu $29, $29, -4
sw $s0, -5708($30)
addiu $29, $29, -4
sw $s1, -5712($30)
addiu $29, $29, -4
sw $s2, -5716($30)
addiu $29, $29, -4
sw $s3, -5720($30)
addiu $29, $29, -4
sw $s4, -5724($30)
addiu $29, $29, -4
sw $s5, -5728($30)
addiu $29, $29, -4
sw $s6, -5732($30)
addiu $29, $29, -4
sw $s7, -5736($30)
lw $t1, -5544($30)
addiu $t0, $t1, 2548
addiu $t2, $t1, 2600
addiu $29, $29, -204
addiu $t3, $sp, 4
lw $t4, -5548($30)
sw $t4, 0($t3)
lw $t5, -5552($30)
sw $t5, 4($t3)
lw $t6, -5556($30)
sw $t6, 8($t3)
lw $t7, -5560($30)
sw $t7, 12($t3)
lw $t8, -5564($30)
sw $t8, 16($t3)
lw $t9, -5568($30)
sw $t9, 20($t3)
lw $s0, -5572($30)
sw $s0, 24($t3)
lw $s1, -5576($30)
sw $s1, 28($t3)
lw $s2, -5580($30)
sw $s2, 32($t3)
lw $s3, -5584($30)
sw $s3, 36($t3)
lw $s4, -5588($30)
sw $s4, 40($t3)
lw $s5, -5592($30)
sw $s5, 44($t3)
lw $s6, -5596($30)
sw $s6, 48($t3)
lw $s7, -5600($30)
sw $s7, 52($t3)
addiu $29, $29, -4
sw $t0, -5944($30)
sw $t1, -5544($30)
addiu $29, $29, -4
sw $t2, -5948($30)
sw $t4, -5548($30)
sw $t5, -5552($30)
sw $t6, -5556($30)
sw $t7, -5560($30)
sw $t8, -5564($30)
sw $t9, -5568($30)
sw $s0, -5572($30)
sw $s1, -5576($30)
sw $s2, -5580($30)
sw $s3, -5584($30)
sw $s4, -5588($30)
sw $s5, -5592($30)
sw $s6, -5596($30)
sw $s7, -5600($30)
lw $t0, -5604($30)
sw $t0, 56($t3)
lw $t1, -5608($30)
sw $t1, 60($t3)
lw $t2, -5612($30)
sw $t2, 64($t3)
lw $t4, -5616($30)
sw $t4, 68($t3)
lw $t5, -5620($30)
sw $t5, 72($t3)
lw $t6, -5624($30)
sw $t6, 76($t3)
lw $t7, -5628($30)
sw $t7, 80($t3)
lw $t8, -5632($30)
sw $t8, 84($t3)
lw $t9, -5636($30)
sw $t9, 88($t3)
lw $s0, -5640($30)
sw $s0, 92($t3)
lw $s1, -5644($30)
sw $s1, 96($t3)
lw $s2, -5648($30)
sw $s2, 100($t3)
lw $s3, -5652($30)
sw $s3, 104($t3)
lw $s4, -5656($30)
sw $s4, 108($t3)
lw $s5, -5660($30)
sw $s5, 112($t3)
lw $s6, -5664($30)
sw $s6, 116($t3)
lw $s7, -5668($30)
sw $s7, 120($t3)
sw $t0, -5604($30)
sw $t1, -5608($30)
sw $t2, -5612($30)
sw $t4, -5616($30)
sw $t5, -5620($30)
sw $t6, -5624($30)
sw $t7, -5628($30)
sw $t8, -5632($30)
sw $t9, -5636($30)
sw $s0, -5640($30)
sw $s1, -5644($30)
sw $s2, -5648($30)
sw $s3, -5652($30)
sw $s4, -5656($30)
sw $s5, -5660($30)
sw $s6, -5664($30)
sw $s7, -5668($30)
lw $t0, -5672($30)
sw $t0, 124($t3)
lw $t1, -5676($30)
sw $t1, 128($t3)
lw $t2, -5680($30)
sw $t2, 132($t3)
lw $t4, -5684($30)
sw $t4, 136($t3)
lw $t5, -5688($30)
sw $t5, 140($t3)
lw $t6, -5692($30)
sw $t6, 144($t3)
lw $t7, -5696($30)
sw $t7, 148($t3)
lw $t8, -5700($30)
sw $t8, 152($t3)
lw $t9, -5704($30)
sw $t9, 156($t3)
lw $s0, -5708($30)
sw $s0, 160($t3)
lw $s1, -5712($30)
sw $s1, 164($t3)
lw $s2, -5716($30)
sw $s2, 168($t3)
lw $s3, -5720($30)
sw $s3, 172($t3)
lw $s4, -5724($30)
sw $s4, 176($t3)
lw $s5, -5728($30)
sw $s5, 180($t3)
lw $s6, -5732($30)
sw $s6, 184($t3)
lw $s7, -5736($30)
sw $s7, 188($t3)
sw $t0, -5672($30)
sw $t1, -5676($30)
sw $t2, -5680($30)
sw $t4, -5684($30)
sw $t5, -5688($30)
sw $t6, -5692($30)
sw $t7, -5696($30)
sw $t8, -5700($30)
sw $t9, -5704($30)
sw $s0, -5708($30)
sw $s1, -5712($30)
sw $s2, -5716($30)
sw $s3, -5720($30)
sw $s4, -5724($30)
sw $s5, -5728($30)
sw $s6, -5732($30)
sw $s7, -5736($30)
lw $t0, -5944($30)
sw $t0, 192($t3)
lw $t1, -5948($30)
sw $t1, 196($t3)
addiu $29, $29, -4
sw $t3, 4($sp)
addiu $t2, $sp, 4
addiu $t4, $0, 49
lw $t5, 0($t2)
li $t6, 4
mul $t7, $t4, $t6
addu $t8, $t5, $t7
addiu $t9, $0, 49
lw $s0, 0($t8)
li $s1, 1
mul $s2, $t9, $s1
addu $s3, $s0, $s2
addiu $s4, $0, 97
sb $s4, 0($s3)
addiu $s5, $0, 0
move $v0, $s5
j function_main_load
# return 0 ; 

sw $t0, -5944($30)
sw $t1, -5948($30)
addiu $29, $29, -4
sw $t2, -5956($30)
addiu $29, $29, -4
sw $t3, -5960($30)
addiu $29, $29, -4
sw $t4, -5964($30)
addiu $29, $29, -4
sw $t5, -5968($30)
addiu $29, $29, -4
sw $t6, -5972($30)
addiu $29, $29, -4
sw $t7, -5976($30)
addiu $29, $29, -4
sw $t8, -5980($30)
addiu $29, $29, -4
sw $t9, -5984($30)
addiu $29, $29, -4
sw $s0, -5988($30)
addiu $29, $29, -4
sw $s1, -5992($30)
addiu $29, $29, -4
sw $s2, -5996($30)
addiu $29, $29, -4
sw $s3, -6000($30)
addiu $29, $29, -4
sw $s4, -6004($30)
addiu $29, $29, -4
sw $s5, -6008($30)

L118:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 35
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#  INT main ( ) {  INT a = 5 * ( 4 + 3 ) ; 

addiu $t4, $0, 0
move $v0, $t4
j function_main_load
# return 0 ; 

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

L119:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 5
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { INT a = 5 ; 

addiu $t5, $0, 4
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#INT b = 4 ; 

lw $t8, 0($t3)
#a + b ; 

lw $t9, 0($t7)
add $s0, $t8, $t9
lw $s1, 0($t3)
#a - b ; 

lw $s2, 0($t7)
sub $s3, $s1, $s2
lw $s4, 0($t3)
#a / b ; 

lw $s5, 0($t7)
div $s6 $s4 $s5
lw $s7, 0($t3)
#a * b ; 

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
lw $t1, -140($30)
lw $t0, 0($t1)
lw $t3, -180($30)
mul $t2, $t3, $t0
lw $t4, -124($30)
lw $t5, 0($t4)
#a > b ; 

lw $t6, 0($t1)
sgt $t7, $t5, $t6
lw $t8, 0($t4)
#a < b ; 

lw $t9, 0($t1)
slt $s0, $t8, $t9
addiu $s1, $0, 0
move $v0, $s1
j function_main_load
#a && b ; a || b ;  return 0 ; 

addiu $29, $29, -4
sw $t0, -184($30)
sw $t1, -140($30)
addiu $29, $29, -4
sw $t2, -188($30)
sw $t3, -180($30)
sw $t4, -124($30)
addiu $29, $29, -4
sw $t5, -192($30)
addiu $29, $29, -4
sw $t6, -196($30)
addiu $29, $29, -4
sw $t7, -200($30)
addiu $29, $29, -4
sw $t8, -204($30)
addiu $29, $29, -4
sw $t9, -208($30)
addiu $29, $29, -4
sw $s0, -212($30)
addiu $29, $29, -4
sw $s1, -216($30)

L120:
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

L121:
addiu $t0, $sp, 0
la $t1, str6
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

L144:
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

L145:
addiu $t0, $sp, 0
la $t1, str7
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

L146:
addiu $t0, $sp, 0
la $t1, str8
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

L147:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#} return 0 ; 

addiu $29, $29, -4
sw $t0, -212($30)
addiu $29, $29, -4
sw $t1, -216($30)

L148:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
l.s $f0, float...index_1
mfc1 $t1, $f0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { FLOAT a = 5.0 ; 

addiu $t5, $0, 5
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#const INT b = 5 ; 

addiu $t9, $0, 101
li $s0, 0
addiu $29, $29, -4
sw $s0, 4($29)
addiu $s1, $29, 4
sb $t9, 0($s1)
#CHAR c = 'e' ; 

li $s3, 0
addiu $29, $29, -4
sw $s3, 4($29)
addiu $s4, $29, 4
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
sw $t3, 0($s5)
#FLOAT * d = & a ; 

li $s7, 0
addiu $29, $29, -4
sw $s7, 4($29)
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
addiu $t0, $29, 4
addiu $29, $29, -4
sw $t0, 4($29)
addiu $t1, $29, 4
lw $t2, -156($30)
sw $t2, 0($t1)
#INT * e = & b ; 

li $t4, 0
addiu $29, $29, -4
sw $t4, 4($29)
addiu $t5, $29, 4
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
lw $t7, -172($30)
sw $t7, 0($t6)
#const CHAR * f = & c ; 

lw $t8, 0($t6)
#f ++ ; 

addi $t9, $t8, 1
sw $t9, 0($t6)
addiu $s0, $0, 0
move $v0, $s0
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -212($30)
addiu $29, $29, -4
sw $t1, -216($30)
sw $t2, -156($30)
addiu $29, $29, -4
sw $t3, -220($30)
addiu $29, $29, -4
sw $t4, -224($30)
addiu $29, $29, -4
sw $t5, -228($30)
addiu $29, $29, -4
sw $t6, -232($30)
sw $t7, -172($30)
addiu $29, $29, -4
sw $t8, -236($30)
addiu $29, $29, -4
sw $t9, -240($30)
addiu $29, $29, -4
sw $s0, -244($30)

L149:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 1
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { INT b = 1 ; 

lw $t4, 0($t3)
#b ++ ; 

addi $t5, $t4, 1
sw $t5, 0($t3)
addiu $t6, $0, 0
move $v0, $t6
j function_main_load
#return 0 ; 

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

L150:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
l.s $f0, float...index_2
mfc1 $t1, $f0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { FLOAT a = 5.0 ; 

addiu $t5, $0, 5
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#INT b = 5 ; 

addiu $t9, $0, 101
li $s0, 0
addiu $29, $29, -4
sw $s0, 4($29)
addiu $s1, $29, 4
sb $t9, 0($s1)
#CHAR c = 'e' ; 

l.s $f0, float...index_3
mfc1 $s3, $f0
li $s4, 0
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
sw $s3, 0($s5)
#const FLOAT d = 10.01 ; 

addiu $s7, $0, 2
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
addiu $29, $29, -4
sw $s6, -184($30)
addiu $29, $29, -4
sw $s7, -188($30)
li $t0, 0
addiu $29, $29, -4
sw $t0, 4($29)
addiu $t1, $29, 4
lw $t2, -188($30)
sw $t2, 0($t1)
#const INT e = 2 ; 

addiu $t4, $0, 98
li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
sb $t4, 0($t6)
#const CHAR f = 'b' ; 

addiu $t7, $0, 0
move $v0, $t7
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -200($30)
addiu $29, $29, -4
sw $t1, -204($30)
sw $t2, -188($30)
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

L151:
addiu $t0, $sp, 0
move $v0, $t0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { INT x = 0 ; 

addiu $t5, $0, 1
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#{ INT x = 1 ; 

#if ( x ) { 

addiu $t8, $0, 1
li $t9, 0
xor $s0, $t8, $t9
sltiu $s1, $s0, 1
sltiu $s2, $s1, 1
move $v0, $s2
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

L152:
addiu $t0, $sp, 0
addiu $t2, $0, 2
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
sw $t2, 0($t4)
#INT x = 2 ; 

addiu $29, $29, -4
sw $t0, -168($30)
addiu $29, $29, -4
sw $t1, -172($30)
addiu $29, $29, -4
sw $t2, -176($30)
addiu $29, $29, -4
sw $t3, -180($30)
addiu $29, $29, -4
sw $t4, -184($30)

L153:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -188($30)

L154:
addiu $t0, $sp, 0
#} } while ( x ) { 

lw $t1, -124($30)
lw $t2, 0($t1)
li $t3, 0
xor $t4, $t2, $t3
sltiu $t5, $t4, 1
sltiu $t6, $t5, 1
move $v0, $t6
addiu $29, $29, -4
sw $t0, -192($30)
sw $t1, -124($30)
addiu $29, $29, -4
sw $t2, -196($30)
addiu $29, $29, -4
sw $t3, -200($30)
addiu $29, $29, -4
sw $t4, -204($30)
addiu $29, $29, -4
sw $t5, -208($30)
addiu $29, $29, -4
sw $t6, -212($30)

L155:
addiu $t0, $sp, 0
#continue ; 

addiu $29, $29, -4
sw $t0, -216($30)

L156:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#} return 0 ; 

addiu $29, $29, -4
sw $t0, -216($30)
addiu $29, $29, -4
sw $t1, -220($30)

L157:
addiu $t0, $sp, 0
move $v0, $t0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#  INT main ( ) {  INT a = 0 ; 

addiu $t4, $0, 0
sw $t4, 0($t3)
#a = 0 ; 

addiu $t6, $0, 5
li $t7, 0
addiu $29, $29, -4
sw $t7, 4($29)
addiu $t8, $29, 4
sw $t6, 0($t8)
# INT b = 5 ; 

addiu $t9, $0, 5
sw $t9, 0($t8)
#b = 5 ; 

addiu $s1, $0, 3
li $s2, 0
addiu $29, $29, -4
sw $s2, 4($29)
addiu $s3, $29, 4
sw $s1, 0($s3)
# INT c = 3 ; 

addiu $s4, $0, 3
sw $s4, 0($s3)
#c = 3 ; 

# INT d = ( a || b ) && c ; 

lw $s5, 0($t3)
li $s6, 0
xor $s7, $s5, $s6
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
lw $t1, -184($30)
sltiu $t0, $t1, 1
sltiu $t2, $t0, 1
move $v0, $t2
addiu $29, $29, -4
sw $t0, -188($30)
sw $t1, -184($30)
addiu $29, $29, -4
sw $t2, -192($30)

L158:
addiu $t0, $sp, 0
lw $t1, -148($30)
lw $t2, 0($t1)
li $t3, 0
xor $t4, $t2, $t3
sltiu $t5, $t4, 1
sltiu $t6, $t5, 1
move $v0, $t6
addiu $29, $29, -4
sw $t0, -196($30)
sw $t1, -148($30)
addiu $29, $29, -4
sw $t2, -200($30)
addiu $29, $29, -4
sw $t3, -204($30)
addiu $29, $29, -4
sw $t4, -208($30)
addiu $29, $29, -4
sw $t5, -212($30)
addiu $29, $29, -4
sw $t6, -216($30)
li $t2, 0
move $a1, $t2

L159:
addiu $t0, $sp, 0
lw $t1, -168($30)
lw $t2, 0($t1)
li $t3, 0
xor $t4, $t2, $t3
sltiu $t5, $t4, 1
sltiu $t6, $t5, 1
addiu $29, $29, -4
sw $t0, -220($30)
sw $t1, -168($30)
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
lw $t3, -240($30)
move $a1, $t3

L160:
addiu $t0, $sp, 0
addiu $t4, $a1, 0
li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
sw $t4, 0($t6)
# INT e = ! a ; 

#/*Explain using CFG*/

lw $t8, -128($30)
lw $t9, 0($t8)
sltiu $s0, $t9, 1
li $s1, 0
addiu $29, $29, -4
sw $s1, 4($29)
addiu $s2, $29, 4
sw $s0, 0($s2)
lw $s4, 0($t8)
# INT f = a & b ; 

lw $s5, -148($30)
lw $s6, 0($s5)
and $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -252($30)
addiu $29, $29, -4
sw $t1, -256($30)
addiu $29, $29, -4
sw $t2, -260($30)
sw $t3, -240($30)
addiu $29, $29, -4
sw $t4, -264($30)
addiu $29, $29, -4
sw $t5, -268($30)
addiu $29, $29, -4
sw $t6, -272($30)
addiu $29, $29, -4
sw $t7, -276($30)
sw $t8, -128($30)
addiu $29, $29, -4
sw $t9, -280($30)
addiu $29, $29, -4
sw $s0, -284($30)
addiu $29, $29, -4
sw $s1, -288($30)
addiu $29, $29, -4
sw $s2, -292($30)
addiu $29, $29, -4
sw $s3, -296($30)
addiu $29, $29, -4
sw $s4, -300($30)
sw $s5, -148($30)
addiu $29, $29, -4
sw $s6, -304($30)
addiu $29, $29, -4
sw $s7, -308($30)
li $t0, 0
addiu $29, $29, -4
sw $t0, 4($29)
addiu $t1, $29, 4
lw $t2, -308($30)
sw $t2, 0($t1)
lw $t4, -128($30)
lw $t5, 0($t4)
#INT g = a | b ; 

lw $t6, -148($30)
lw $t7, 0($t6)
or $t8, $t5, $t7
li $t9, 0
addiu $29, $29, -4
sw $t9, 4($29)
addiu $s0, $29, 4
sw $t8, 0($s0)
lw $s2, 0($t4)
#INT h = a ^ b ; 

lw $s3, 0($t6)
xor $s4, $s2, $s3
li $s5, 0
addiu $29, $29, -4
sw $s5, 4($29)
addiu $s6, $29, 4
sw $s4, 0($s6)
addiu $29, $29, -4
sw $t0, -324($30)
addiu $29, $29, -4
sw $t1, -328($30)
sw $t2, -308($30)
addiu $29, $29, -4
sw $t3, -332($30)
sw $t4, -128($30)
addiu $29, $29, -4
sw $t5, -336($30)
sw $t6, -148($30)
addiu $29, $29, -4
sw $t7, -340($30)
addiu $29, $29, -4
sw $t8, -344($30)
addiu $29, $29, -4
sw $t9, -348($30)
addiu $29, $29, -4
sw $s0, -352($30)
addiu $29, $29, -4
sw $s1, -356($30)
addiu $29, $29, -4
sw $s2, -360($30)
addiu $29, $29, -4
sw $s3, -364($30)
addiu $29, $29, -4
sw $s4, -368($30)
addiu $29, $29, -4
sw $s5, -372($30)
addiu $29, $29, -4
sw $s6, -376($30)
addiu $29, $29, -4
sw $s7, -380($30)
lw $t1, -128($30)
lw $t0, 0($t1)
#INT i = ~ a ; 

nor $t2, $t0, $0
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
sw $t2, 0($t4)
addiu $t5, $0, 0
move $v0, $t5
j function_main_load
# return 0 ; 

addiu $29, $29, -4
sw $t0, -388($30)
sw $t1, -128($30)
addiu $29, $29, -4
sw $t2, -392($30)
addiu $29, $29, -4
sw $t3, -396($30)
addiu $29, $29, -4
sw $t4, -400($30)
addiu $29, $29, -4
sw $t5, -404($30)

L161:
addiu $t0, $sp, 0
move $v0, $t0
addiu $29, $29, -4
sw $t0, -100($30)
li $t1, 0
addiu $29, $29, -4
sw $t1, 4($29)
addiu $t2, $29, 4
#   INT main ( ) { INT b ; 

addiu $t4, $0, 1
li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
sw $t4, 0($t6)
#INT a = 1 ; 

lw $t7, 0($t6)
#switch ( a ) { 

addiu $t8, $0, 1
xor $t9, $t7, $t8
sltiu $s0, $t9, 1
move $v0, $s0
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

L162:
addiu $t0, $sp, 0
#case 1 : b = 1 ; 

addiu $t1, $0, 1
lw $t2, -120($30)
sw $t1, 0($t2)
addiu $29, $29, -4
sw $t0, -156($30)
addiu $29, $29, -4
sw $t1, -160($30)
sw $t2, -120($30)

L163:
addiu $t0, $sp, 0
lw $t1, -136($30)
lw $t2, 0($t1)
addiu $t3, $0, 1
xor $t4, $t2, $t3
sltiu $t5, $t4, 1
sltiu $t6, $t5, 1
move $v0, $t6
addiu $29, $29, -4
sw $t0, -164($30)
sw $t1, -136($30)
addiu $29, $29, -4
sw $t2, -168($30)
addiu $29, $29, -4
sw $t3, -172($30)
addiu $29, $29, -4
sw $t4, -176($30)
addiu $29, $29, -4
sw $t5, -180($30)
addiu $29, $29, -4
sw $t6, -184($30)

L164:
addiu $t0, $sp, 0
#break ; default : b = 3 ; 

addiu $t1, $0, 3
lw $t2, -120($30)
sw $t1, 0($t2)
addiu $29, $29, -4
sw $t0, -188($30)
addiu $29, $29, -4
sw $t1, -192($30)
sw $t2, -120($30)

L165:
addiu $t0, $sp, 0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#break ;  } return 0 ; 

addiu $29, $29, -4
sw $t0, -196($30)
addiu $29, $29, -4
sw $t1, -200($30)

L166:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t0, $0, 0
move $v0, $t0
j function_main_load
# INT main ( ) {      return 0 ; 

#/*
#    *
#    * multiline comment
#    *
#    * / */

addiu $29, $29, -4
sw $t0, -104($30)

L167:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 5
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#   INT main ( ) { const INT n = 5 ; 

li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t3, 0($t7)
#INT * n_ptr = & n ; 

lw $t8, 0($t7)
#* n_ptr = 7 ; 

addiu $t9, $0, 7
sw $t9, 0($t8)
addiu $s0, $0, 0
move $v0, $s0
j function_main_load
#return 0 ; 

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

L168:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 5
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#   INT main ( ) { INT q = 5 ; 

li $t5, 0
addiu $29, $29, -12
sb $t5, 4($29)
sb $t5, 5($29)
sb $t5, 6($29)
sb $t5, 7($29)
sb $t5, 8($29)
sb $t5, 9($29)
sb $t5, 10($29)
sb $t5, 11($29)
sb $t5, 12($29)
sb $t5, 13($29)
addiu $t6, $29, 4
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
#CHAR y [ 10 ] ; 

addiu $t8, $0, 5
lw $t9, 0($t7)
li $s0, 1
mul $s1, $t8, $s0
addu $s2, $t9, $s1
#y [ 5 ] = 'a' ; 

addiu $s3, $0, 97
sb $s3, 0($s2)
li $s5, 0
addiu $29, $29, -12
sw $s5, 4($29)
sw $s5, 8($29)
sw $s5, 12($29)
addiu $s6, $29, 4
addiu $29, $29, -12
sw $s5, 4($29)
sw $s5, 8($29)
sw $s5, 12($29)
addiu $s7, $29, 4
addiu $29, $29, -24
sw $s7, 4($29)
sw $s6, 8($29)
addiu $29, $29, -4
sw $t0, -172($30)
addiu $29, $29, -4
sw $t1, -176($30)
addiu $29, $29, -4
sw $t2, -180($30)
addiu $29, $29, -4
sw $t3, -184($30)
addiu $29, $29, -4
sw $t4, -188($30)
addiu $29, $29, -4
sw $t5, -192($30)
addiu $29, $29, -4
sw $t6, -196($30)
addiu $29, $29, -4
sw $t7, -200($30)
addiu $29, $29, -4
sw $t8, -204($30)
addiu $29, $29, -4
sw $t9, -208($30)
addiu $29, $29, -4
sw $s0, -212($30)
addiu $29, $29, -4
sw $s1, -216($30)
addiu $29, $29, -4
sw $s2, -220($30)
addiu $29, $29, -4
sw $s3, -224($30)
addiu $29, $29, -4
sw $s4, -228($30)
addiu $29, $29, -4
sw $s5, -232($30)
addiu $29, $29, -4
sw $s6, -236($30)
addiu $29, $29, -4
sw $s7, -240($30)
addiu $t0, $29, 4
addiu $29, $29, -4
sw $t0, 4($29)
addiu $t1, $29, 4
#INT x [ 2 ] [ 3 ] ; 

addiu $t2, $0, 1
lw $t3, 0($t1)
li $t4, 4
mul $t5, $t2, $t4
addu $t6, $t3, $t5
# x [ 1 ] [ 2 ] = 1 ; 

addiu $t7, $0, 2
lw $t8, 0($t6)
li $t9, 4
mul $s0, $t7, $t9
addu $s1, $t8, $s0
addiu $s2, $0, 1
sw $s2, 0($s1)
addiu $s3, $0, 0
move $v0, $s3
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -248($30)
addiu $29, $29, -4
sw $t1, -252($30)
addiu $29, $29, -4
sw $t2, -256($30)
addiu $29, $29, -4
sw $t3, -260($30)
addiu $29, $29, -4
sw $t4, -264($30)
addiu $29, $29, -4
sw $t5, -268($30)
addiu $29, $29, -4
sw $t6, -272($30)
addiu $29, $29, -4
sw $t7, -276($30)
addiu $29, $29, -4
sw $t8, -280($30)
addiu $29, $29, -4
sw $t9, -284($30)
addiu $29, $29, -4
sw $s0, -288($30)
addiu $29, $29, -4
sw $s1, -292($30)
addiu $29, $29, -4
sw $s2, -296($30)
addiu $29, $29, -4
sw $s3, -300($30)

L169:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 1
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# typedef INT bool ; typedef CHAR appel ; typedef const CHAR peer ; typedef const bool Cbool ;  INT main ( ) { bool x = 1 ; 

addiu $t5, $0, 0
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#bool y = 0 ; 

addiu $t9, $0, 0
li $s0, 0
addiu $29, $29, -4
sw $s0, 4($29)
addiu $s1, $29, 4
sw $t9, 0($s1)
#INT z = x && y ; 

addiu $s3, $0, 5
li $s4, 0
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
sb $s3, 0($s5)
# appel a = 5 ; 

addiu $s7, $0, 4
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
addiu $29, $29, -4
sw $s6, -184($30)
addiu $29, $29, -4
sw $s7, -188($30)
li $t0, 0
addiu $29, $29, -4
sw $t0, 4($29)
addiu $t1, $29, 4
lw $t2, -188($30)
sb $t2, 0($t1)
#peer b = 4 ; 

addiu $t4, $0, 1
li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
sw $t4, 0($t6)
#Cbool c = 1 ; 

lw $t8, -148($30)
lw $t9, 0($t8)
# bool boo = y * z * 57809 ; 

addiu $s0, $0, 0
mul $s1, $t9, $s0
ori $s2, $0 57809
mul $s3, $s1, $s2
li $s4, 0
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
sw $s3, 0($s5)
addiu $s6, $0, 0
move $v0, $s6
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -204($30)
addiu $29, $29, -4
sw $t1, -208($30)
sw $t2, -188($30)
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
sw $t8, -148($30)
addiu $29, $29, -4
sw $t9, -232($30)
addiu $29, $29, -4
sw $s0, -236($30)
addiu $29, $29, -4
sw $s1, -240($30)
addiu $29, $29, -4
sw $s2, -244($30)
addiu $29, $29, -4
sw $s3, -248($30)
addiu $29, $29, -4
sw $s4, -252($30)
addiu $29, $29, -4
sw $s5, -256($30)
addiu $29, $29, -4
sw $s6, -260($30)

L170:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 3
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { const INT a = 3 ; 

addiu $t5, $0, 3
li $t6, 0
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t5, 0($t7)
#INT b = a ; 

addiu $t8, $0, 0
move $v0, $t8
j function_main_load
#return 0 ; 

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

L171:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
li $t1, 0
addiu $29, $29, -80
sw $t1, 4($29)
sw $t1, 8($29)
sw $t1, 12($29)
sw $t1, 16($29)
sw $t1, 20($29)
sw $t1, 24($29)
sw $t1, 28($29)
sw $t1, 32($29)
sw $t1, 36($29)
sw $t1, 40($29)
sw $t1, 44($29)
sw $t1, 48($29)
sw $t1, 52($29)
sw $t1, 56($29)
sw $t1, 60($29)
sw $t1, 64($29)
sw $t1, 68($29)
sw $t1, 72($29)
sw $t1, 76($29)
sw $t1, 80($29)
addiu $t2, $29, 4
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
#   INT main ( ) { INT result [ 20 ] = { 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 , 20 } ; 

addiu $t4, $0, 19
lw $t5, 0($t3)
li $t6, 4
mul $t7, $t4, $t6
addu $t8, $t5, $t7
addiu $t9, $0, 20
sw $t9, 0($t8)
addiu $s0, $0, 18
lw $s1, 0($t3)
li $s2, 4
mul $s3, $s0, $s2
addu $s4, $s1, $s3
addiu $s5, $0, 19
sw $s5, 0($s4)
addiu $s6, $0, 17
lw $s7, 0($t3)
addiu $29, $29, -4
sw $t0, -188($30)
addiu $29, $29, -4
sw $t1, -192($30)
addiu $29, $29, -4
sw $t2, -196($30)
addiu $29, $29, -4
sw $t3, -200($30)
addiu $29, $29, -4
sw $t4, -204($30)
addiu $29, $29, -4
sw $t5, -208($30)
addiu $29, $29, -4
sw $t6, -212($30)
addiu $29, $29, -4
sw $t7, -216($30)
addiu $29, $29, -4
sw $t8, -220($30)
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
li $t0, 4
lw $t2, -252($30)
mul $t1, $t2, $t0
lw $t4, -256($30)
addu $t3, $t4, $t1
addiu $t5, $0, 18
sw $t5, 0($t3)
addiu $t6, $0, 16
lw $t8, -200($30)
lw $t7, 0($t8)
li $t9, 4
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 17
sw $s2, 0($s1)
addiu $s3, $0, 15
lw $s4, 0($t8)
li $s5, 4
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -260($30)
addiu $29, $29, -4
sw $t1, -264($30)
sw $t2, -252($30)
addiu $29, $29, -4
sw $t3, -268($30)
sw $t4, -256($30)
addiu $29, $29, -4
sw $t5, -272($30)
addiu $29, $29, -4
sw $t6, -276($30)
addiu $29, $29, -4
sw $t7, -280($30)
sw $t8, -200($30)
addiu $29, $29, -4
sw $t9, -284($30)
addiu $29, $29, -4
sw $s0, -288($30)
addiu $29, $29, -4
sw $s1, -292($30)
addiu $29, $29, -4
sw $s2, -296($30)
addiu $29, $29, -4
sw $s3, -300($30)
addiu $29, $29, -4
sw $s4, -304($30)
addiu $29, $29, -4
sw $s5, -308($30)
addiu $29, $29, -4
sw $s6, -312($30)
addiu $29, $29, -4
sw $s7, -316($30)
addiu $t0, $0, 16
lw $t1, -316($30)
sw $t0, 0($t1)
addiu $t2, $0, 14
lw $t4, -200($30)
lw $t3, 0($t4)
li $t5, 4
mul $t6, $t2, $t5
addu $t7, $t3, $t6
addiu $t8, $0, 15
sw $t8, 0($t7)
addiu $t9, $0, 13
lw $s0, 0($t4)
li $s1, 4
mul $s2, $t9, $s1
addu $s3, $s0, $s2
addiu $s4, $0, 14
sw $s4, 0($s3)
addiu $s5, $0, 12
lw $s6, 0($t4)
li $s7, 4
addiu $29, $29, -4
sw $t0, -320($30)
sw $t1, -316($30)
addiu $29, $29, -4
sw $t2, -324($30)
addiu $29, $29, -4
sw $t3, -328($30)
sw $t4, -200($30)
addiu $29, $29, -4
sw $t5, -332($30)
addiu $29, $29, -4
sw $t6, -336($30)
addiu $29, $29, -4
sw $t7, -340($30)
addiu $29, $29, -4
sw $t8, -344($30)
addiu $29, $29, -4
sw $t9, -348($30)
addiu $29, $29, -4
sw $s0, -352($30)
addiu $29, $29, -4
sw $s1, -356($30)
addiu $29, $29, -4
sw $s2, -360($30)
addiu $29, $29, -4
sw $s3, -364($30)
addiu $29, $29, -4
sw $s4, -368($30)
addiu $29, $29, -4
sw $s5, -372($30)
addiu $29, $29, -4
sw $s6, -376($30)
addiu $29, $29, -4
sw $s7, -380($30)
lw $t1, -372($30)
lw $t2, -380($30)
mul $t0, $t1, $t2
lw $t4, -376($30)
addu $t3, $t4, $t0
addiu $t5, $0, 13
sw $t5, 0($t3)
addiu $t6, $0, 11
lw $t8, -200($30)
lw $t7, 0($t8)
li $t9, 4
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 12
sw $s2, 0($s1)
addiu $s3, $0, 10
lw $s4, 0($t8)
li $s5, 4
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -384($30)
sw $t1, -372($30)
sw $t2, -380($30)
addiu $29, $29, -4
sw $t3, -388($30)
sw $t4, -376($30)
addiu $29, $29, -4
sw $t5, -392($30)
addiu $29, $29, -4
sw $t6, -396($30)
addiu $29, $29, -4
sw $t7, -400($30)
sw $t8, -200($30)
addiu $29, $29, -4
sw $t9, -404($30)
addiu $29, $29, -4
sw $s0, -408($30)
addiu $29, $29, -4
sw $s1, -412($30)
addiu $29, $29, -4
sw $s2, -416($30)
addiu $29, $29, -4
sw $s3, -420($30)
addiu $29, $29, -4
sw $s4, -424($30)
addiu $29, $29, -4
sw $s5, -428($30)
addiu $29, $29, -4
sw $s6, -432($30)
addiu $29, $29, -4
sw $s7, -436($30)
addiu $t0, $0, 11
lw $t1, -436($30)
sw $t0, 0($t1)
addiu $t2, $0, 9
lw $t4, -200($30)
lw $t3, 0($t4)
li $t5, 4
mul $t6, $t2, $t5
addu $t7, $t3, $t6
addiu $t8, $0, 10
sw $t8, 0($t7)
addiu $t9, $0, 8
lw $s0, 0($t4)
li $s1, 4
mul $s2, $t9, $s1
addu $s3, $s0, $s2
addiu $s4, $0, 9
sw $s4, 0($s3)
addiu $s5, $0, 7
lw $s6, 0($t4)
li $s7, 4
addiu $29, $29, -4
sw $t0, -440($30)
sw $t1, -436($30)
addiu $29, $29, -4
sw $t2, -444($30)
addiu $29, $29, -4
sw $t3, -448($30)
sw $t4, -200($30)
addiu $29, $29, -4
sw $t5, -452($30)
addiu $29, $29, -4
sw $t6, -456($30)
addiu $29, $29, -4
sw $t7, -460($30)
addiu $29, $29, -4
sw $t8, -464($30)
addiu $29, $29, -4
sw $t9, -468($30)
addiu $29, $29, -4
sw $s0, -472($30)
addiu $29, $29, -4
sw $s1, -476($30)
addiu $29, $29, -4
sw $s2, -480($30)
addiu $29, $29, -4
sw $s3, -484($30)
addiu $29, $29, -4
sw $s4, -488($30)
addiu $29, $29, -4
sw $s5, -492($30)
addiu $29, $29, -4
sw $s6, -496($30)
addiu $29, $29, -4
sw $s7, -500($30)
lw $t1, -492($30)
lw $t2, -500($30)
mul $t0, $t1, $t2
lw $t4, -496($30)
addu $t3, $t4, $t0
addiu $t5, $0, 8
sw $t5, 0($t3)
addiu $t6, $0, 6
lw $t8, -200($30)
lw $t7, 0($t8)
li $t9, 4
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 7
sw $s2, 0($s1)
addiu $s3, $0, 5
lw $s4, 0($t8)
li $s5, 4
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -504($30)
sw $t1, -492($30)
sw $t2, -500($30)
addiu $29, $29, -4
sw $t3, -508($30)
sw $t4, -496($30)
addiu $29, $29, -4
sw $t5, -512($30)
addiu $29, $29, -4
sw $t6, -516($30)
addiu $29, $29, -4
sw $t7, -520($30)
sw $t8, -200($30)
addiu $29, $29, -4
sw $t9, -524($30)
addiu $29, $29, -4
sw $s0, -528($30)
addiu $29, $29, -4
sw $s1, -532($30)
addiu $29, $29, -4
sw $s2, -536($30)
addiu $29, $29, -4
sw $s3, -540($30)
addiu $29, $29, -4
sw $s4, -544($30)
addiu $29, $29, -4
sw $s5, -548($30)
addiu $29, $29, -4
sw $s6, -552($30)
addiu $29, $29, -4
sw $s7, -556($30)
addiu $t0, $0, 6
lw $t1, -556($30)
sw $t0, 0($t1)
addiu $t2, $0, 4
lw $t4, -200($30)
lw $t3, 0($t4)
li $t5, 4
mul $t6, $t2, $t5
addu $t7, $t3, $t6
addiu $t8, $0, 5
sw $t8, 0($t7)
addiu $t9, $0, 3
lw $s0, 0($t4)
li $s1, 4
mul $s2, $t9, $s1
addu $s3, $s0, $s2
addiu $s4, $0, 4
sw $s4, 0($s3)
addiu $s5, $0, 2
lw $s6, 0($t4)
li $s7, 4
addiu $29, $29, -4
sw $t0, -560($30)
sw $t1, -556($30)
addiu $29, $29, -4
sw $t2, -564($30)
addiu $29, $29, -4
sw $t3, -568($30)
sw $t4, -200($30)
addiu $29, $29, -4
sw $t5, -572($30)
addiu $29, $29, -4
sw $t6, -576($30)
addiu $29, $29, -4
sw $t7, -580($30)
addiu $29, $29, -4
sw $t8, -584($30)
addiu $29, $29, -4
sw $t9, -588($30)
addiu $29, $29, -4
sw $s0, -592($30)
addiu $29, $29, -4
sw $s1, -596($30)
addiu $29, $29, -4
sw $s2, -600($30)
addiu $29, $29, -4
sw $s3, -604($30)
addiu $29, $29, -4
sw $s4, -608($30)
addiu $29, $29, -4
sw $s5, -612($30)
addiu $29, $29, -4
sw $s6, -616($30)
addiu $29, $29, -4
sw $s7, -620($30)
lw $t1, -612($30)
lw $t2, -620($30)
mul $t0, $t1, $t2
lw $t4, -616($30)
addu $t3, $t4, $t0
addiu $t5, $0, 3
sw $t5, 0($t3)
addiu $t6, $0, 1
lw $t8, -200($30)
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
sw $t0, -624($30)
sw $t1, -612($30)
sw $t2, -620($30)
addiu $29, $29, -4
sw $t3, -628($30)
sw $t4, -616($30)
addiu $29, $29, -4
sw $t5, -632($30)
addiu $29, $29, -4
sw $t6, -636($30)
addiu $29, $29, -4
sw $t7, -640($30)
sw $t8, -200($30)
addiu $29, $29, -4
sw $t9, -644($30)
addiu $29, $29, -4
sw $s0, -648($30)
addiu $29, $29, -4
sw $s1, -652($30)
addiu $29, $29, -4
sw $s2, -656($30)
addiu $29, $29, -4
sw $s3, -660($30)
addiu $29, $29, -4
sw $s4, -664($30)
addiu $29, $29, -4
sw $s5, -668($30)
addiu $29, $29, -4
sw $s6, -672($30)
addiu $29, $29, -4
sw $s7, -676($30)
addiu $t0, $0, 1
lw $t1, -676($30)
sw $t0, 0($t1)
lw $t3, -200($30)
lw $t4, 0($t3)
#INT * passed = result ; 

li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
addiu $29, $29, -4
sw $t6, 4($29)
addiu $t7, $29, 4
sw $t4, 0($t7)
lw $t8, 0($t7)
#passed ++ ; 

addi $t9, $t8, 4
sw $t9, 0($t7)
la $s0, str9
lw $s1, 0($t7)
# printf ( "%d" , * passed ) ; 

lw $s2, 0($s1)
addiu $29, $29, -8
sw $s0, 4($29)
sw $s2, 8($29)
jal function_printf
lw $s0, 4($29)
lw $s2, 8($29)
addiu $29, $29, 8
addiu $29, $29, -4
sw $t0, -688($30)
sw $t1, -676($30)
addiu $29, $29, -4
sw $t2, -692($30)
sw $t3, -200($30)
addiu $29, $29, -4
sw $t4, -696($30)
addiu $29, $29, -4
sw $t5, -700($30)
addiu $29, $29, -4
sw $t6, -704($30)
addiu $29, $29, -4
sw $t7, -708($30)
addiu $29, $29, -4
sw $t8, -712($30)
addiu $29, $29, -4
sw $t9, -716($30)
addiu $29, $29, -4
sw $s0, -720($30)
addiu $29, $29, -4
sw $s1, -724($30)
addiu $29, $29, -4
sw $s2, -728($30)
addiu $29, $29, -4
sw $s3, -732($30)
addiu $29, $29, -4
sw $s4, -736($30)
addiu $29, $29, -4
sw $s5, -740($30)
addiu $29, $29, -4
sw $s6, -744($30)
addiu $29, $29, -4
sw $s7, -748($30)
move $t0, $v0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
# return 0 ; 

addiu $29, $29, -4
sw $t0, -752($30)
addiu $29, $29, -4
sw $t1, -756($30)

L218:
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
#                     INT main ( ) { printAppel ( ) ; 

addiu $29, $29, 0
jal function_printAppel
addiu $29, $29, 0
move $t0, $v0
addiu $t1, $0, 0
move $v0, $t1
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -176($30)
addiu $29, $29, -4
sw $t1, -180($30)

L219:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
addiu $t1, $0, 5
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
# INT main ( ) { INT q = 5 ; 

li $t5, 0
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $t6, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $t7, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $t8, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $t9, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $s0, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $s1, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $s2, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $s3, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $s4, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $s5, $29, 4
addiu $29, $29, -80
sw $t5, 4($29)
sw $t5, 8($29)
sw $t5, 12($29)
sw $t5, 16($29)
sw $t5, 20($29)
sw $t5, 24($29)
sw $t5, 28($29)
sw $t5, 32($29)
sw $t5, 36($29)
sw $t5, 40($29)
sw $t5, 44($29)
sw $t5, 48($29)
sw $t5, 52($29)
sw $t5, 56($29)
sw $t5, 60($29)
sw $t5, 64($29)
sw $t5, 68($29)
sw $t5, 72($29)
sw $t5, 76($29)
sw $t5, 80($29)
addiu $s6, $29, 4
addiu $29, $29, -880
sw $s6, 4($29)
sw $s5, 8($29)
sw $s4, 12($29)
sw $s3, 16($29)
sw $s2, 20($29)
sw $s1, 24($29)
sw $s0, 28($29)
sw $t9, 32($29)
sw $t8, 36($29)
sw $t7, 40($29)
sw $t6, 44($29)
addiu $s7, $29, 4
addiu $29, $29, -4
sw $s7, 4($29)
addiu $29, $29, -4
sw $t0, -1872($30)
addiu $29, $29, -4
sw $t1, -1876($30)
addiu $29, $29, -4
sw $t2, -1880($30)
addiu $29, $29, -4
sw $t3, -1884($30)
addiu $29, $29, -4
sw $t4, -1888($30)
addiu $29, $29, -4
sw $t5, -1892($30)
addiu $29, $29, -4
sw $t6, -1896($30)
addiu $29, $29, -4
sw $t7, -1900($30)
addiu $29, $29, -4
sw $t8, -1904($30)
addiu $29, $29, -4
sw $t9, -1908($30)
addiu $29, $29, -4
sw $s0, -1912($30)
addiu $29, $29, -4
sw $s1, -1916($30)
addiu $29, $29, -4
sw $s2, -1920($30)
addiu $29, $29, -4
sw $s3, -1924($30)
addiu $29, $29, -4
sw $s4, -1928($30)
addiu $29, $29, -4
sw $s5, -1932($30)
addiu $29, $29, -4
sw $s6, -1936($30)
addiu $29, $29, -4
sw $s7, -1940($30)
addiu $t0, $29, 4
#INT x [ 11 ] [ 20 ] ; 

addiu $t1, $0, 10
lw $t2, 0($t0)
li $t3, 4
mul $t4, $t1, $t3
addu $t5, $t2, $t4
# x [ 10 ] [ 19 ] = 1 + 5 ; 

addiu $t6, $0, 19
lw $t7, 0($t5)
li $t8, 4
mul $t9, $t6, $t8
addu $s0, $t7, $t9
addiu $s1, $0, 6
sw $s1, 0($s0)
addiu $s2, $0, 0
move $v0, $s2
j function_main_load
#return 0 ; 

addiu $29, $29, -4
sw $t0, -1944($30)
addiu $29, $29, -4
sw $t1, -1948($30)
addiu $29, $29, -4
sw $t2, -1952($30)
addiu $29, $29, -4
sw $t3, -1956($30)
addiu $29, $29, -4
sw $t4, -1960($30)
addiu $29, $29, -4
sw $t5, -1964($30)
addiu $29, $29, -4
sw $t6, -1968($30)
addiu $29, $29, -4
sw $t7, -1972($30)
addiu $29, $29, -4
sw $t8, -1976($30)
addiu $29, $29, -4
sw $t9, -1980($30)
addiu $29, $29, -4
sw $s0, -1984($30)
addiu $29, $29, -4
sw $s1, -1988($30)
addiu $29, $29, -4
sw $s2, -1992($30)

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
L122:

L123:
addiu $11, $30, 4
lw $8, 0($11)
addiu $11, $11, 4

L124:
li $25, 0
lb $9, 0($8)
beq $9, $0, L143
addiu $2, $0, 11
addiu $12, $0, 37
beq $9, $12, L128

L125:

L126:
li $24, 1
slt $15, $25, $24
beq $15, $24, L127
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L126

L127:
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $8, $8, 1
j L124

L128:
addiu $8, $8, 1
addiu $29, $29, -4
sw $11, -460($30)
addiu $29, $29, -4
sw $8, -464($30)
addiu $29, $29, -4
sw $11, -468($30)
addiu $29, $29, -4
sw $25, -472($30)
addiu $29, $29, -4
sw $9, -476($30)
addiu $29, $29, -4
sw $2, -480($30)
addiu $29, $29, -4
sw $12, -484($30)
addiu $29, $29, -4
sw $24, -488($30)
addiu $29, $29, -4
sw $15, -492($30)
addiu $29, $29, -4
sw $2, -496($30)
addiu $29, $29, -4
sw $4, -500($30)
addiu $29, $29, -4
sw $18, -504($30)
addiu $29, $29, -4
sw $25, -508($30)
addiu $29, $29, -4
sw $24, -512($30)
addiu $29, $29, -4
sw $4, -516($30)
addiu $29, $29, -4
sw $18, -520($30)
addiu $29, $29, -4
sw $8, -524($30)
addiu $29, $29, -4
sw $8, -528($30)
lb $10, 0($8)
addiu $12, $0, 100
beq $10, $12, L130
addiu $12, $0, 99
beq $10, $12, L133
addiu $12, $0, 115
beq $10, $12, L134
addiu $12, $0, 120
beq $10, $12, L137
addiu $12, $0, 102
beq $10, $12, L142
li $15, 47
li $24, 58
slt $15, $15, $10
sgt $24, $24, $10
and $15, $15, $24
move $9, $10
li $24, 1
bne $15, $24, L129
addiu $15, $10, -48
li $24, 10
mul $25, $25, $24
add $25, $25, $15
j L128

L129:
j L125

L130:
lw $9, 0($11)

L131:
li $15, 10
addiu $29, $29, -4
sw $10, -532($30)
addiu $29, $29, -4
sw $12, -536($30)
addiu $29, $29, -4
sw $12, -540($30)
addiu $29, $29, -4
sw $12, -544($30)
addiu $29, $29, -4
sw $12, -548($30)
addiu $29, $29, -4
sw $12, -552($30)
addiu $29, $29, -4
sw $15, -556($30)
addiu $29, $29, -4
sw $24, -560($30)
addiu $29, $29, -4
sw $15, -564($30)
addiu $29, $29, -4
sw $24, -568($30)
addiu $29, $29, -4
sw $15, -572($30)
addiu $29, $29, -4
sw $24, -576($30)
addiu $29, $29, -4
sw $15, -580($30)
addiu $29, $29, -4
sw $24, -584($30)
addiu $29, $29, -4
sw $25, -588($30)
addiu $29, $29, -4
sw $25, -592($30)
addiu $29, $29, -4
sw $9, -596($30)
addiu $29, $29, -4
sw $15, -600($30)
div $9 $9 $15
addiu $18, $18, 1
li $15, 1
sub $25, $25, $15
li $15, 0
bne $15, $9, L131

L132:
addiu $18, $18, -1
addiu $2, $0, 1
lw $9, 0($11)
addiu $11, $11, 4
j L129

L133:
addi $25, $25, -1
addiu $2, $0, 11
lb $9, 0($11)
addiu $11, $11, 4
j L129

L134:
addiu $29, $29, -4
sw $9, -604($30)
addiu $29, $29, -4
sw $18, -608($30)
addiu $29, $29, -4
sw $15, -612($30)
addiu $29, $29, -4
sw $25, -616($30)
addiu $29, $29, -4
sw $15, -620($30)
addiu $29, $29, -4
sw $18, -624($30)
addiu $29, $29, -4
sw $2, -628($30)
addiu $29, $29, -4
sw $9, -632($30)
addiu $29, $29, -4
sw $11, -636($30)
addiu $29, $29, -4
sw $25, -640($30)
addiu $29, $29, -4
sw $2, -644($30)
addiu $29, $29, -4
sw $9, -648($30)
addiu $29, $29, -4
sw $11, -652($30)
addiu $29, $29, -4
sw $25, -656($30)
addiu $29, $29, -4
sw $18, -660($30)
addiu $29, $29, -4
sw $2, -664($30)
addiu $29, $29, -4
sw $9, -668($30)
addiu $29, $29, -4
sw $11, -672($30)
lw $15, 0($11)

L135:
lb $9, 0($15)
li $24, 0
beq $9, $24, L136
addiu $18, $18, 1
addi $15, $15, 1
addi $25, $25, -1
j L135

L136:
addiu $2, $0, 4
addiu $18, $18, -1
lw $9, 0($11)
addiu $11, $11, 4
j L129

L137:
addiu $2, $0, 11
li $16, 0
addi $25, $25, -8
j L139

L138:
li $24, 1
slt $15, $25, $24
beq $15, $24, L140
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $29, $29, -4
sw $15, -676($30)
addiu $29, $29, -4
sw $9, -680($30)
addiu $29, $29, -4
sw $24, -684($30)
addiu $29, $29, -4
sw $18, -688($30)
addiu $29, $29, -4
sw $15, -692($30)
addiu $29, $29, -4
sw $25, -696($30)
addiu $29, $29, -4
sw $2, -700($30)
addiu $29, $29, -4
sw $18, -704($30)
addiu $29, $29, -4
sw $9, -708($30)
addiu $29, $29, -4
sw $11, -712($30)
addiu $29, $29, -4
sw $2, -716($30)
addiu $29, $29, -4
sw $16, -720($30)
addiu $29, $29, -4
sw $25, -724($30)
addiu $29, $29, -4
sw $24, -728($30)
addiu $29, $29, -4
sw $15, -732($30)
addiu $29, $29, -4
sw $2, -736($30)
addiu $29, $29, -4
sw $4, -740($30)
addiu $29, $29, -4
sw $18, -744($30)
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L138
j L140

L139:
lw $9, 0($11)
sllv $9, $9, $16
srl $9, $9, 28
li $14, 0
bne $9, $14, L138
li $14, 28
beq $14, $16, L138
addi $25, $25, 1
addiu $16, $16, 4
j L139

L140:
lw $9, 0($11)
li $17, 28
beq $16, $17, L141
sllv $9, $9, $16
srl $9, $9, 28
addiu $9, $9, 48
addiu $13, $0, 58
div $12 $9 $13
mflo $12
andi $13, $12, 1
addi $12, $12, 38
addiu $29, $29, -4
sw $25, -748($30)
addiu $29, $29, -4
sw $24, -752($30)
addiu $29, $29, -4
sw $9, -756($30)
addiu $29, $29, -4
sw $9, -760($30)
addiu $29, $29, -4
sw $9, -764($30)
addiu $29, $29, -4
sw $14, -768($30)
addiu $29, $29, -4
sw $14, -772($30)
addiu $29, $29, -4
sw $25, -776($30)
addiu $29, $29, -4
sw $16, -780($30)
addiu $29, $29, -4
sw $9, -784($30)
addiu $29, $29, -4
sw $17, -788($30)
addiu $29, $29, -4
sw $9, -792($30)
addiu $29, $29, -4
sw $9, -796($30)
addiu $29, $29, -4
sw $9, -800($30)
addiu $29, $29, -4
sw $13, -804($30)
addiu $29, $29, -4
sw $12, -808($30)
addiu $29, $29, -4
sw $13, -812($30)
addiu $29, $29, -4
sw $12, -816($30)
mul $13, $13, $12
add $9, $13, $9
addiu $2, $0, 11
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $16, $16, 4
li $17, 28
beq $16, $17, L141
j L140

L141:
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
j L129

L142:
addi $25, $25, -8
addiu $18, $18, 7
addiu $2, $0, 2
lw $9, 0($11)
mtc1 $9, $f12
addiu $11, $11, 4
j L129

L143:
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
L172:

L173:
addiu $11, $30, 4
lw $8, 0($11)
addiu $11, $11, 4

L174:
li $25, 0
lb $9, 0($8)
beq $9, $0, L193
addiu $2, $0, 11
addiu $12, $0, 37
beq $9, $12, L178

L175:

L176:
li $24, 1
slt $15, $25, $24
beq $15, $24, L177
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L176

L177:
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $8, $8, 1
j L174

L178:
addiu $8, $8, 1
addiu $29, $29, -4
sw $11, -820($30)
addiu $29, $29, -4
sw $8, -824($30)
addiu $29, $29, -4
sw $11, -828($30)
addiu $29, $29, -4
sw $25, -832($30)
addiu $29, $29, -4
sw $9, -836($30)
addiu $29, $29, -4
sw $2, -840($30)
addiu $29, $29, -4
sw $12, -844($30)
addiu $29, $29, -4
sw $24, -848($30)
addiu $29, $29, -4
sw $15, -852($30)
addiu $29, $29, -4
sw $2, -856($30)
addiu $29, $29, -4
sw $4, -860($30)
addiu $29, $29, -4
sw $18, -864($30)
addiu $29, $29, -4
sw $25, -868($30)
addiu $29, $29, -4
sw $24, -872($30)
addiu $29, $29, -4
sw $4, -876($30)
addiu $29, $29, -4
sw $18, -880($30)
addiu $29, $29, -4
sw $8, -884($30)
addiu $29, $29, -4
sw $8, -888($30)
lb $10, 0($8)
addiu $12, $0, 100
beq $10, $12, L180
addiu $12, $0, 99
beq $10, $12, L183
addiu $12, $0, 115
beq $10, $12, L184
addiu $12, $0, 120
beq $10, $12, L187
addiu $12, $0, 102
beq $10, $12, L192
li $15, 47
li $24, 58
slt $15, $15, $10
sgt $24, $24, $10
and $15, $15, $24
move $9, $10
li $24, 1
bne $15, $24, L179
addiu $15, $10, -48
li $24, 10
mul $25, $25, $24
add $25, $25, $15
j L178

L179:
j L175

L180:
lw $9, 0($11)

L181:
li $15, 10
addiu $29, $29, -4
sw $10, -892($30)
addiu $29, $29, -4
sw $12, -896($30)
addiu $29, $29, -4
sw $12, -900($30)
addiu $29, $29, -4
sw $12, -904($30)
addiu $29, $29, -4
sw $12, -908($30)
addiu $29, $29, -4
sw $12, -912($30)
addiu $29, $29, -4
sw $15, -916($30)
addiu $29, $29, -4
sw $24, -920($30)
addiu $29, $29, -4
sw $15, -924($30)
addiu $29, $29, -4
sw $24, -928($30)
addiu $29, $29, -4
sw $15, -932($30)
addiu $29, $29, -4
sw $24, -936($30)
addiu $29, $29, -4
sw $15, -940($30)
addiu $29, $29, -4
sw $24, -944($30)
addiu $29, $29, -4
sw $25, -948($30)
addiu $29, $29, -4
sw $25, -952($30)
addiu $29, $29, -4
sw $9, -956($30)
addiu $29, $29, -4
sw $15, -960($30)
div $9 $9 $15
addiu $18, $18, 1
li $15, 1
sub $25, $25, $15
li $15, 0
bne $15, $9, L181

L182:
addiu $18, $18, -1
addiu $2, $0, 1
lw $9, 0($11)
addiu $11, $11, 4
j L179

L183:
addi $25, $25, -1
addiu $2, $0, 11
lb $9, 0($11)
addiu $11, $11, 4
j L179

L184:
addiu $29, $29, -4
sw $9, -964($30)
addiu $29, $29, -4
sw $18, -968($30)
addiu $29, $29, -4
sw $15, -972($30)
addiu $29, $29, -4
sw $25, -976($30)
addiu $29, $29, -4
sw $15, -980($30)
addiu $29, $29, -4
sw $18, -984($30)
addiu $29, $29, -4
sw $2, -988($30)
addiu $29, $29, -4
sw $9, -992($30)
addiu $29, $29, -4
sw $11, -996($30)
addiu $29, $29, -4
sw $25, -1000($30)
addiu $29, $29, -4
sw $2, -1004($30)
addiu $29, $29, -4
sw $9, -1008($30)
addiu $29, $29, -4
sw $11, -1012($30)
addiu $29, $29, -4
sw $25, -1016($30)
addiu $29, $29, -4
sw $18, -1020($30)
addiu $29, $29, -4
sw $2, -1024($30)
addiu $29, $29, -4
sw $9, -1028($30)
addiu $29, $29, -4
sw $11, -1032($30)
lw $15, 0($11)

L185:
lb $9, 0($15)
li $24, 0
beq $9, $24, L186
addiu $18, $18, 1
addi $15, $15, 1
addi $25, $25, -1
j L185

L186:
addiu $2, $0, 4
addiu $18, $18, -1
lw $9, 0($11)
addiu $11, $11, 4
j L179

L187:
addiu $2, $0, 11
li $16, 0
addi $25, $25, -8
j L189

L188:
li $24, 1
slt $15, $25, $24
beq $15, $24, L190
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $29, $29, -4
sw $15, -1036($30)
addiu $29, $29, -4
sw $9, -1040($30)
addiu $29, $29, -4
sw $24, -1044($30)
addiu $29, $29, -4
sw $18, -1048($30)
addiu $29, $29, -4
sw $15, -1052($30)
addiu $29, $29, -4
sw $25, -1056($30)
addiu $29, $29, -4
sw $2, -1060($30)
addiu $29, $29, -4
sw $18, -1064($30)
addiu $29, $29, -4
sw $9, -1068($30)
addiu $29, $29, -4
sw $11, -1072($30)
addiu $29, $29, -4
sw $2, -1076($30)
addiu $29, $29, -4
sw $16, -1080($30)
addiu $29, $29, -4
sw $25, -1084($30)
addiu $29, $29, -4
sw $24, -1088($30)
addiu $29, $29, -4
sw $15, -1092($30)
addiu $29, $29, -4
sw $2, -1096($30)
addiu $29, $29, -4
sw $4, -1100($30)
addiu $29, $29, -4
sw $18, -1104($30)
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L188
j L190

L189:
lw $9, 0($11)
sllv $9, $9, $16
srl $9, $9, 28
li $14, 0
bne $9, $14, L188
li $14, 28
beq $14, $16, L188
addi $25, $25, 1
addiu $16, $16, 4
j L189

L190:
lw $9, 0($11)
li $17, 28
beq $16, $17, L191
sllv $9, $9, $16
srl $9, $9, 28
addiu $9, $9, 48
addiu $13, $0, 58
div $12 $9 $13
mflo $12
andi $13, $12, 1
addi $12, $12, 38
addiu $29, $29, -4
sw $25, -1108($30)
addiu $29, $29, -4
sw $24, -1112($30)
addiu $29, $29, -4
sw $9, -1116($30)
addiu $29, $29, -4
sw $9, -1120($30)
addiu $29, $29, -4
sw $9, -1124($30)
addiu $29, $29, -4
sw $14, -1128($30)
addiu $29, $29, -4
sw $14, -1132($30)
addiu $29, $29, -4
sw $25, -1136($30)
addiu $29, $29, -4
sw $16, -1140($30)
addiu $29, $29, -4
sw $9, -1144($30)
addiu $29, $29, -4
sw $17, -1148($30)
addiu $29, $29, -4
sw $9, -1152($30)
addiu $29, $29, -4
sw $9, -1156($30)
addiu $29, $29, -4
sw $9, -1160($30)
addiu $29, $29, -4
sw $13, -1164($30)
addiu $29, $29, -4
sw $12, -1168($30)
addiu $29, $29, -4
sw $13, -1172($30)
addiu $29, $29, -4
sw $12, -1176($30)
mul $13, $13, $12
add $9, $13, $9
addiu $2, $0, 11
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $16, $16, 4
li $17, 28
beq $16, $17, L191
j L190

L191:
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
j L179

L192:
addi $25, $25, -8
addiu $18, $18, 7
addiu $2, $0, 2
lw $9, 0($11)
mtc1 $9, $f12
addiu $11, $11, 4
j L179

L193:
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
function_printAppel:
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
L194:

L195:
addiu $t0, $sp, 0
addiu $29, $29, -4
sw $t0, -100($30)
la $t0, str10
la $t1, str11
addiu $29, $29, -8
sw $t0, 4($29)
sw $t1, 8($29)
jal function_printf
lw $t0, 4($29)
lw $t1, 8($29)
addiu $29, $29, 8
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
# VOID printAppel ( ) { printf ( "%s" , "Apple1" ) ; 

addiu $29, $29, -4
sw $t0, -176($30)

function_printAppel_load:
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
L196:

L197:
addiu $11, $30, 4
lw $8, 0($11)
addiu $11, $11, 4

L198:
li $25, 0
lb $9, 0($8)
beq $9, $0, L217
addiu $2, $0, 11
addiu $12, $0, 37
beq $9, $12, L202

L199:

L200:
li $24, 1
slt $15, $25, $24
beq $15, $24, L201
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L200

L201:
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $8, $8, 1
j L198

L202:
addiu $8, $8, 1
addiu $29, $29, -4
sw $11, -1180($30)
addiu $29, $29, -4
sw $8, -1184($30)
addiu $29, $29, -4
sw $11, -1188($30)
addiu $29, $29, -4
sw $25, -1192($30)
addiu $29, $29, -4
sw $9, -1196($30)
addiu $29, $29, -4
sw $2, -1200($30)
addiu $29, $29, -4
sw $12, -1204($30)
addiu $29, $29, -4
sw $24, -1208($30)
addiu $29, $29, -4
sw $15, -1212($30)
addiu $29, $29, -4
sw $2, -1216($30)
addiu $29, $29, -4
sw $4, -1220($30)
addiu $29, $29, -4
sw $18, -1224($30)
addiu $29, $29, -4
sw $25, -1228($30)
addiu $29, $29, -4
sw $24, -1232($30)
addiu $29, $29, -4
sw $4, -1236($30)
addiu $29, $29, -4
sw $18, -1240($30)
addiu $29, $29, -4
sw $8, -1244($30)
addiu $29, $29, -4
sw $8, -1248($30)
lb $10, 0($8)
addiu $12, $0, 100
beq $10, $12, L204
addiu $12, $0, 99
beq $10, $12, L207
addiu $12, $0, 115
beq $10, $12, L208
addiu $12, $0, 120
beq $10, $12, L211
addiu $12, $0, 102
beq $10, $12, L216
li $15, 47
li $24, 58
slt $15, $15, $10
sgt $24, $24, $10
and $15, $15, $24
move $9, $10
li $24, 1
bne $15, $24, L203
addiu $15, $10, -48
li $24, 10
mul $25, $25, $24
add $25, $25, $15
j L202

L203:
j L199

L204:
lw $9, 0($11)

L205:
li $15, 10
addiu $29, $29, -4
sw $10, -1252($30)
addiu $29, $29, -4
sw $12, -1256($30)
addiu $29, $29, -4
sw $12, -1260($30)
addiu $29, $29, -4
sw $12, -1264($30)
addiu $29, $29, -4
sw $12, -1268($30)
addiu $29, $29, -4
sw $12, -1272($30)
addiu $29, $29, -4
sw $15, -1276($30)
addiu $29, $29, -4
sw $24, -1280($30)
addiu $29, $29, -4
sw $15, -1284($30)
addiu $29, $29, -4
sw $24, -1288($30)
addiu $29, $29, -4
sw $15, -1292($30)
addiu $29, $29, -4
sw $24, -1296($30)
addiu $29, $29, -4
sw $15, -1300($30)
addiu $29, $29, -4
sw $24, -1304($30)
addiu $29, $29, -4
sw $25, -1308($30)
addiu $29, $29, -4
sw $25, -1312($30)
addiu $29, $29, -4
sw $9, -1316($30)
addiu $29, $29, -4
sw $15, -1320($30)
div $9 $9 $15
addiu $18, $18, 1
li $15, 1
sub $25, $25, $15
li $15, 0
bne $15, $9, L205

L206:
addiu $18, $18, -1
addiu $2, $0, 1
lw $9, 0($11)
addiu $11, $11, 4
j L203

L207:
addi $25, $25, -1
addiu $2, $0, 11
lb $9, 0($11)
addiu $11, $11, 4
j L203

L208:
addiu $29, $29, -4
sw $9, -1324($30)
addiu $29, $29, -4
sw $18, -1328($30)
addiu $29, $29, -4
sw $15, -1332($30)
addiu $29, $29, -4
sw $25, -1336($30)
addiu $29, $29, -4
sw $15, -1340($30)
addiu $29, $29, -4
sw $18, -1344($30)
addiu $29, $29, -4
sw $2, -1348($30)
addiu $29, $29, -4
sw $9, -1352($30)
addiu $29, $29, -4
sw $11, -1356($30)
addiu $29, $29, -4
sw $25, -1360($30)
addiu $29, $29, -4
sw $2, -1364($30)
addiu $29, $29, -4
sw $9, -1368($30)
addiu $29, $29, -4
sw $11, -1372($30)
addiu $29, $29, -4
sw $25, -1376($30)
addiu $29, $29, -4
sw $18, -1380($30)
addiu $29, $29, -4
sw $2, -1384($30)
addiu $29, $29, -4
sw $9, -1388($30)
addiu $29, $29, -4
sw $11, -1392($30)
lw $15, 0($11)

L209:
lb $9, 0($15)
li $24, 0
beq $9, $24, L210
addiu $18, $18, 1
addi $15, $15, 1
addi $25, $25, -1
j L209

L210:
addiu $2, $0, 4
addiu $18, $18, -1
lw $9, 0($11)
addiu $11, $11, 4
j L203

L211:
addiu $2, $0, 11
li $16, 0
addi $25, $25, -8
j L213

L212:
li $24, 1
slt $15, $25, $24
beq $15, $24, L214
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $29, $29, -4
sw $15, -1396($30)
addiu $29, $29, -4
sw $9, -1400($30)
addiu $29, $29, -4
sw $24, -1404($30)
addiu $29, $29, -4
sw $18, -1408($30)
addiu $29, $29, -4
sw $15, -1412($30)
addiu $29, $29, -4
sw $25, -1416($30)
addiu $29, $29, -4
sw $2, -1420($30)
addiu $29, $29, -4
sw $18, -1424($30)
addiu $29, $29, -4
sw $9, -1428($30)
addiu $29, $29, -4
sw $11, -1432($30)
addiu $29, $29, -4
sw $2, -1436($30)
addiu $29, $29, -4
sw $16, -1440($30)
addiu $29, $29, -4
sw $25, -1444($30)
addiu $29, $29, -4
sw $24, -1448($30)
addiu $29, $29, -4
sw $15, -1452($30)
addiu $29, $29, -4
sw $2, -1456($30)
addiu $29, $29, -4
sw $4, -1460($30)
addiu $29, $29, -4
sw $18, -1464($30)
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L212
j L214

L213:
lw $9, 0($11)
sllv $9, $9, $16
srl $9, $9, 28
li $14, 0
bne $9, $14, L212
li $14, 28
beq $14, $16, L212
addi $25, $25, 1
addiu $16, $16, 4
j L213

L214:
lw $9, 0($11)
li $17, 28
beq $16, $17, L215
sllv $9, $9, $16
srl $9, $9, 28
addiu $9, $9, 48
addiu $13, $0, 58
div $12 $9 $13
mflo $12
andi $13, $12, 1
addi $12, $12, 38
addiu $29, $29, -4
sw $25, -1468($30)
addiu $29, $29, -4
sw $24, -1472($30)
addiu $29, $29, -4
sw $9, -1476($30)
addiu $29, $29, -4
sw $9, -1480($30)
addiu $29, $29, -4
sw $9, -1484($30)
addiu $29, $29, -4
sw $14, -1488($30)
addiu $29, $29, -4
sw $14, -1492($30)
addiu $29, $29, -4
sw $25, -1496($30)
addiu $29, $29, -4
sw $16, -1500($30)
addiu $29, $29, -4
sw $9, -1504($30)
addiu $29, $29, -4
sw $17, -1508($30)
addiu $29, $29, -4
sw $9, -1512($30)
addiu $29, $29, -4
sw $9, -1516($30)
addiu $29, $29, -4
sw $9, -1520($30)
addiu $29, $29, -4
sw $13, -1524($30)
addiu $29, $29, -4
sw $12, -1528($30)
addiu $29, $29, -4
sw $13, -1532($30)
addiu $29, $29, -4
sw $12, -1536($30)
mul $13, $13, $12
add $9, $13, $9
addiu $2, $0, 11
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $16, $16, 4
li $17, 28
beq $16, $17, L215
j L214

L215:
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
j L203

L216:
addi $25, $25, -8
addiu $18, $18, 7
addiu $2, $0, 2
lw $9, 0($11)
mtc1 $9, $f12
addiu $11, $11, 4
j L203

L217:
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
