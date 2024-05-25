.data
heap: .space 4
Sun: .word 6
Sat: .word 5
Fri: .word 4
Thur: .word 3
Wed: .word 2
Tue: .word 1
Mon: .word 0
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
