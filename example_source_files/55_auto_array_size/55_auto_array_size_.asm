.data
heap: .space 4
str0: .asciiz  "Something went wrong" 
str1: .asciiz  "Hello world!\n" 
str2: .asciiz  "Something went wrong here" 
str3: .asciiz  "%d" 
float...index_0: .float 10.0
float...index_1: .float 5.0
str4: .asciiz  "%s" 
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
beq $v0, $zero, L26
j L3

L3:
la $t0, str0
addiu $29, $29, -4
sw $t0, 4($29)
jal function_printf
lw $t0, 4($29)
addiu $29, $29, 4
addiu $29, $29, -4
sw $t0, -132($30)
addiu $29, $29, -4
sw $t1, -136($30)
addiu $29, $29, -4
sw $t2, -140($30)
addiu $29, $29, -4
sw $t3, -144($30)
addiu $29, $29, -4
sw $t4, -148($30)
addiu $29, $29, -4
sw $t5, -152($30)
addiu $29, $29, -4
sw $t6, -156($30)
addiu $29, $29, -4
sw $t7, -160($30)
addiu $29, $29, -4
sw $t8, -164($30)
addiu $29, $29, -4
sw $t9, -168($30)
addiu $29, $29, -4
sw $s0, -172($30)
addiu $29, $29, -4
sw $s1, -176($30)
addiu $29, $29, -4
sw $s2, -180($30)
addiu $29, $29, -4
sw $s3, -184($30)
addiu $29, $29, -4
sw $s4, -188($30)
addiu $29, $29, -4
sw $s5, -192($30)
addiu $29, $29, -4
sw $s6, -196($30)
addiu $29, $29, -4
sw $s7, -200($30)
move $t0, $v0
#printf ( "Something went wrong" ) ; 

addiu $29, $29, -4
sw $t0, -204($30)
j L29

L26:
lw $t0, -116($30)
lw $t1, 0($t0)
#} else if ( x == 5 ) { 

addiu $t2, $0, 5
xor $t3, $t1, $t2
sltiu $t4, $t3, 1
move $v0, $t4
sw $t0, -116($30)
addiu $29, $29, -4
sw $t1, -208($30)
addiu $29, $29, -4
sw $t2, -212($30)
addiu $29, $29, -4
sw $t3, -216($30)
addiu $29, $29, -4
sw $t4, -220($30)
beq $v0, $zero, L28
j L27

L27:
la $t0, str1
addiu $29, $29, -4
sw $t0, 4($29)
jal function_printf
lw $t0, 4($29)
addiu $29, $29, 4
move $t1, $v0
#printf ( "Hello world!\n" ) ; 

addiu $29, $29, -4
sw $t0, -224($30)
addiu $29, $29, -4
sw $t1, -228($30)
j L29

L28:
la $t0, str2
addiu $29, $29, -4
sw $t0, 4($29)
jal function_printf
lw $t0, 4($29)
addiu $29, $29, 4
move $t1, $v0
#} else { printf ( "Something went wrong here" ) ; 

addiu $29, $29, -4
sw $t0, -232($30)
addiu $29, $29, -4
sw $t1, -236($30)
j L29

L29:
addiu $t0, $0, 0
move $v0, $t0
j function_main_load
#} return 0 ; 


L30:
addiu $29, $29, -4
sw $t0, -240($30)
addiu $29, $29, -4
sw $t1, -244($30)
addiu $29, $29, -4
sw $t2, -248($30)
addiu $29, $29, -4
sw $t3, -252($30)
addiu $29, $29, -4
sw $t4, -256($30)
addiu $29, $29, -4
sw $t5, -260($30)
addiu $29, $29, -4
sw $t6, -264($30)
addiu $29, $29, -4
sw $t7, -268($30)
addiu $29, $29, -4
sw $t8, -272($30)
addiu $29, $29, -4
sw $t9, -276($30)
addiu $29, $29, -4
sw $s0, -280($30)
addiu $29, $29, -4
sw $s1, -284($30)
addiu $29, $29, -4
sw $s2, -288($30)
addiu $29, $29, -4
sw $s3, -292($30)
addiu $29, $29, -4
sw $s4, -296($30)
addiu $29, $29, -4
sw $s5, -300($30)
addiu $29, $29, -4
sw $s6, -304($30)
addiu $29, $29, -4
sw $s7, -308($30)
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
sw $t0, -320($30)
addiu $29, $29, -4
sw $t1, -324($30)
addiu $29, $29, -4
sw $t2, -328($30)
addiu $29, $29, -4
sw $t3, -332($30)
addiu $29, $29, -4
sw $t4, -336($30)
addiu $29, $29, -4
sw $t5, -340($30)
addiu $29, $29, -4
sw $t6, -344($30)
addiu $29, $29, -4
sw $t7, -348($30)
addiu $29, $29, -4
sw $t8, -352($30)
addiu $29, $29, -4
sw $t9, -356($30)
addiu $29, $29, -4
sw $s0, -360($30)
addiu $29, $29, -4
sw $s1, -364($30)
addiu $29, $29, -4
sw $s2, -368($30)
addiu $29, $29, -4
sw $s3, -372($30)
addiu $29, $29, -4
sw $s4, -376($30)
addiu $29, $29, -4
sw $s5, -380($30)
addiu $29, $29, -4
sw $s6, -384($30)
addiu $29, $29, -4
sw $s7, -388($30)
lw $t1, -348($30)
lw $t0, 0($t1)
lw $t3, -388($30)
mul $t2, $t3, $t0
lw $t4, -332($30)
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


L31:
#/*
#* use param --unused_var True
#* To get the expected results
#*/

addiu $s3, $0, 5
li $s4, 0
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
sw $s3, 0($s5)
#        INT main ( ) { INT a = 3 ; INT b = a ;  INT c = 5 ; 

addiu $s6, $0, 5
sw $s6, 0($s5)
#c = 5 ; 

la $s7, str3
addiu $29, $29, -4
sw $t0, -396($30)
sw $t1, -348($30)
addiu $29, $29, -4
sw $t2, -400($30)
sw $t3, -388($30)
sw $t4, -332($30)
addiu $29, $29, -4
sw $t5, -404($30)
addiu $29, $29, -4
sw $t6, -408($30)
addiu $29, $29, -4
sw $t7, -412($30)
addiu $29, $29, -4
sw $t8, -416($30)
addiu $29, $29, -4
sw $t9, -420($30)
addiu $29, $29, -4
sw $s0, -424($30)
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
addiu $29, $29, -4
sw $s6, -448($30)
addiu $29, $29, -4
sw $s7, -452($30)
lw $t1, -444($30)
lw $t0, 0($t1)
#printf ( "%d" , c ) ; 

sw $t1, -444($30)
addiu $29, $29, -4
sw $t2, -456($30)
addiu $29, $29, -4
sw $t3, -460($30)
addiu $29, $29, -4
sw $t4, -464($30)
addiu $29, $29, -4
sw $t5, -468($30)
addiu $29, $29, -4
sw $t6, -472($30)
addiu $29, $29, -4
sw $t7, -476($30)
addiu $29, $29, -4
sw $t8, -480($30)
addiu $29, $29, -4
sw $t9, -484($30)
addiu $29, $29, -4
sw $s0, -488($30)
addiu $29, $29, -4
sw $s1, -492($30)
addiu $29, $29, -4
sw $s2, -496($30)
addiu $29, $29, -4
sw $s3, -500($30)
addiu $29, $29, -4
sw $s4, -504($30)
addiu $29, $29, -4
sw $s5, -508($30)
addiu $29, $29, -4
sw $s6, -512($30)
addiu $29, $29, -4
sw $s7, -516($30)
lw $t1, -452($30)
addiu $29, $29, -8
sw $t1, 4($29)
sw $t0, 8($29)
jal function_printf
lw $t1, 4($29)
lw $t0, 8($29)
addiu $29, $29, 8
move $t2, $v0
addiu $t3, $0, 0
move $v0, $t3
j function_main_load
#return 0 ; 


L54:
addiu $29, $29, -4
sw $t0, -520($30)
sw $t1, -452($30)
addiu $29, $29, -4
sw $t2, -524($30)
addiu $29, $29, -4
sw $t3, -528($30)

L55:
# INT main ( ) {  while ( 1 ) { 

addiu $t0, $0, 1
addiu $29, $29, -4
sw $t0, -532($30)

L56:
addiu $t1, $0, 0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#INT a = 0 ; 

lw $t4, 0($t3)
#if ( a % 2 == 1 ) { 

addiu $t5, $0, 2
div $t6 $t4 $t5
mfhi $t6
addiu $t7, $0, 1
xor $t8, $t6, $t7
sltiu $t9, $t8, 1
move $v0, $t9
addiu $29, $29, -4
sw $t0, -540($30)
addiu $29, $29, -4
sw $t1, -544($30)
addiu $29, $29, -4
sw $t2, -548($30)
addiu $29, $29, -4
sw $t3, -552($30)
addiu $29, $29, -4
sw $t4, -556($30)
addiu $29, $29, -4
sw $t5, -560($30)
addiu $29, $29, -4
sw $t6, -564($30)
addiu $29, $29, -4
sw $t7, -568($30)
addiu $29, $29, -4
sw $t8, -572($30)
addiu $29, $29, -4
sw $t9, -576($30)

L57:
#continue ; 


L58:
lw $t0, -552($30)
lw $t1, 0($t0)
#INT c = 0 ; } if ( a > 10 ) { 

addiu $t2, $0, 10
sgt $t3, $t1, $t2
move $v0, $t3
sw $t0, -552($30)
addiu $29, $29, -4
sw $t1, -580($30)
addiu $29, $29, -4
sw $t2, -584($30)
addiu $29, $29, -4
sw $t3, -588($30)

L59:
#break ; 


L60:
lw $t0, -552($30)
lw $t1, 0($t0)
#INT g = 0 ; }  a ++ ; 

addi $t2, $t1, 1
sw $t2, 0($t0)
sw $t0, -552($30)
addiu $29, $29, -4
sw $t1, -592($30)
addiu $29, $29, -4
sw $t2, -596($30)

L61:
addiu $t0, $0, 0
move $v0, $t0
j function_main_load
# } return 0 ; 


L62:
addiu $t2, $0, 5
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
sw $t2, 0($t4)
#  INT main ( ) {  INT a = 5 ; 

addiu $t5, $0, 5
sw $t5, 0($t4)
#a = 5 ; 

addiu $t7, $0, 6
li $t8, 0
addiu $29, $29, -4
sw $t8, 4($29)
addiu $t9, $29, 4
sw $t7, 0($t9)
# INT b = 6 ; 

addiu $s0, $0, 6
sw $s0, 0($t9)
#b = 6 ; 

addiu $s2, $0, 3
li $s3, 0
addiu $29, $29, -4
sw $s3, 4($29)
addiu $s4, $29, 4
sw $s2, 0($s4)
# INT c = 3 ; 

addiu $s5, $0, 3
sw $s5, 0($s4)
#c = 3 ; 

lw $s7, 0($t4)
# INT d = ( a + b ) * c ; 

addiu $29, $29, -4
sw $t0, -612($30)
addiu $29, $29, -4
sw $t1, -616($30)
addiu $29, $29, -4
sw $t2, -620($30)
addiu $29, $29, -4
sw $t3, -624($30)
addiu $29, $29, -4
sw $t4, -628($30)
addiu $29, $29, -4
sw $t5, -632($30)
addiu $29, $29, -4
sw $t6, -636($30)
addiu $29, $29, -4
sw $t7, -640($30)
addiu $29, $29, -4
sw $t8, -644($30)
addiu $29, $29, -4
sw $t9, -648($30)
addiu $29, $29, -4
sw $s0, -652($30)
addiu $29, $29, -4
sw $s1, -656($30)
addiu $29, $29, -4
sw $s2, -660($30)
addiu $29, $29, -4
sw $s3, -664($30)
addiu $29, $29, -4
sw $s4, -668($30)
addiu $29, $29, -4
sw $s5, -672($30)
addiu $29, $29, -4
sw $s6, -676($30)
addiu $29, $29, -4
sw $s7, -680($30)
lw $t1, -648($30)
lw $t0, 0($t1)
lw $t3, -680($30)
add $t2, $t3, $t0
lw $t4, -668($30)
lw $t5, 0($t4)
mul $t6, $t2, $t5
li $t7, 0
addiu $29, $29, -4
sw $t7, 4($29)
addiu $t8, $29, 4
sw $t6, 0($t8)
addiu $t9, $0, 0
move $v0, $t9
j function_main_load
# return 0 ; 


L63:
addiu $s1, $0, 10
li $s2, 0
addiu $29, $29, -4
sw $s2, 4($29)
addiu $s3, $29, 4
sw $s1, 0($s3)
# INT main ( ) { INT a = 10.2 ; 

addiu $s5, $0, 5
li $s6, 0
addiu $29, $29, -4
sw $s6, 4($29)
addiu $s7, $29, 4
sb $s5, 0($s7)
#CHAR c = 5 ; 

addiu $29, $29, -4
sw $t0, -696($30)
sw $t1, -648($30)
addiu $29, $29, -4
sw $t2, -700($30)
sw $t3, -680($30)
sw $t4, -668($30)
addiu $29, $29, -4
sw $t5, -704($30)
addiu $29, $29, -4
sw $t6, -708($30)
addiu $29, $29, -4
sw $t7, -712($30)
addiu $29, $29, -4
sw $t8, -716($30)
addiu $29, $29, -4
sw $t9, -720($30)
addiu $29, $29, -4
sw $s0, -724($30)
addiu $29, $29, -4
sw $s1, -728($30)
addiu $29, $29, -4
sw $s2, -732($30)
addiu $29, $29, -4
sw $s3, -736($30)
addiu $29, $29, -4
sw $s4, -740($30)
addiu $29, $29, -4
sw $s5, -744($30)
addiu $29, $29, -4
sw $s6, -748($30)
addiu $29, $29, -4
sw $s7, -752($30)
l.s $f0, float...index_0
mfc1 $t1, $f0
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#FLOAT b = 10 ; 

addiu $t4, $0, 0
move $v0, $t4
j function_main_load
#return 0 ; 


L64:
addiu $t6, $0, 6
li $t7, 0
addiu $29, $29, -4
sw $t7, 4($29)
addiu $t8, $29, 4
sw $t6, 0($t8)
#  INT main ( ) {  INT a = 6 ; 

addiu $t9, $0, 6
sw $t9, 0($t8)
#a = 6 ; 

lw $s1, 0($t8)
# INT b = + a ; 

li $s2, 0
addiu $29, $29, -4
sw $s2, 4($29)
addiu $s3, $29, 4
sw $s1, 0($s3)
lw $s4, 0($t8)
#b = - a ; 

neg $s5, $s4
sw $s5, 0($s3)
addiu $s6, $0, 0
move $v0, $s6
j function_main_load
# return 0 ; 


L65:
l.s $f0, float...index_1
addiu $29, $29, -4
sw $t0, -768($30)
addiu $29, $29, -4
sw $t1, -772($30)
addiu $29, $29, -4
sw $t2, -776($30)
addiu $29, $29, -4
sw $t3, -780($30)
addiu $29, $29, -4
sw $t4, -784($30)
addiu $29, $29, -4
sw $t5, -788($30)
addiu $29, $29, -4
sw $t6, -792($30)
addiu $29, $29, -4
sw $t7, -796($30)
addiu $29, $29, -4
sw $t8, -800($30)
addiu $29, $29, -4
sw $t9, -804($30)
addiu $29, $29, -4
sw $s0, -808($30)
addiu $29, $29, -4
sw $s1, -812($30)
addiu $29, $29, -4
sw $s2, -816($30)
addiu $29, $29, -4
sw $s3, -820($30)
addiu $29, $29, -4
sw $s4, -824($30)
addiu $29, $29, -4
sw $s5, -828($30)
addiu $29, $29, -4
sw $s6, -832($30)
addiu $29, $29, -4
sw $s7, -836($30)
mfc1 $t0, $f0
li $t1, 0
addiu $29, $29, -4
sw $t1, 4($29)
addiu $t2, $29, 4
sw $t0, 0($t2)
# INT main ( ) { FLOAT a = 5.0 ; 

addiu $t4, $0, 5
li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
sw $t4, 0($t6)
#INT b = 5 ; 

addiu $t8, $0, 101
li $t9, 0
addiu $29, $29, -4
sw $t9, 4($29)
addiu $s0, $29, 4
sb $t8, 0($s0)
#CHAR c = 'e' ; 

li $s2, 0
addiu $29, $29, -4
sw $s2, 4($29)
addiu $s3, $29, 4
addiu $29, $29, -4
sw $s3, 4($29)
addiu $s4, $29, 4
sw $t2, 0($s4)
#FLOAT * d = & a ; 

li $s6, 0
addiu $29, $29, -4
sw $s6, 4($29)
addiu $s7, $29, 4
addiu $29, $29, -4
sw $s7, 4($29)
addiu $29, $29, -4
sw $t0, -868($30)
addiu $29, $29, -4
sw $t1, -872($30)
addiu $29, $29, -4
sw $t2, -876($30)
addiu $29, $29, -4
sw $t3, -880($30)
addiu $29, $29, -4
sw $t4, -884($30)
addiu $29, $29, -4
sw $t5, -888($30)
addiu $29, $29, -4
sw $t6, -892($30)
addiu $29, $29, -4
sw $t7, -896($30)
addiu $29, $29, -4
sw $t8, -900($30)
addiu $29, $29, -4
sw $t9, -904($30)
addiu $29, $29, -4
sw $s0, -908($30)
addiu $29, $29, -4
sw $s1, -912($30)
addiu $29, $29, -4
sw $s2, -916($30)
addiu $29, $29, -4
sw $s3, -920($30)
addiu $29, $29, -4
sw $s4, -924($30)
addiu $29, $29, -4
sw $s5, -928($30)
addiu $29, $29, -4
sw $s6, -932($30)
addiu $29, $29, -4
sw $s7, -936($30)
addiu $t0, $29, 4
lw $t1, -892($30)
sw $t1, 0($t0)
#INT * e = & b ; 

li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
addiu $29, $29, -4
sw $t4, 4($29)
addiu $t5, $29, 4
lw $t6, -908($30)
sw $t6, 0($t5)
#CHAR * f = & c ; 

addiu $t7, $0, 0
move $v0, $t7
j function_main_load
#return 0 ; 


L66:
#// global comment

addiu $t8, $0, 0
move $v0, $t8
j function_main_load
#  INT main ( ) {  return 0 ; 

#// inside main

#// another global comment


L67:
li $s0, 0
addiu $29, $29, -20
sw $s0, 4($29)
sw $s0, 8($29)
sw $s0, 12($29)
sw $s0, 16($29)
sw $s0, 20($29)
addiu $s1, $29, 4
addiu $29, $29, -4
sw $s1, 4($29)
addiu $s2, $29, 4
#   INT main ( ) { INT c [ 5 ] = { 1 , 2 , 3 , 4 , 5 } ; 

addiu $s3, $0, 4
lw $s4, 0($s2)
li $s5, 4
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -972($30)
sw $t1, -892($30)
addiu $29, $29, -4
sw $t2, -976($30)
addiu $29, $29, -4
sw $t3, -980($30)
addiu $29, $29, -4
sw $t4, -984($30)
addiu $29, $29, -4
sw $t5, -988($30)
sw $t6, -908($30)
addiu $29, $29, -4
sw $t7, -992($30)
addiu $29, $29, -4
sw $t8, -996($30)
addiu $29, $29, -4
sw $t9, -1000($30)
addiu $29, $29, -4
sw $s0, -1004($30)
addiu $29, $29, -4
sw $s1, -1008($30)
addiu $29, $29, -4
sw $s2, -1012($30)
addiu $29, $29, -4
sw $s3, -1016($30)
addiu $29, $29, -4
sw $s4, -1020($30)
addiu $29, $29, -4
sw $s5, -1024($30)
addiu $29, $29, -4
sw $s6, -1028($30)
addiu $29, $29, -4
sw $s7, -1032($30)
addiu $t0, $0, 5
lw $t1, -1032($30)
sw $t0, 0($t1)
addiu $t2, $0, 3
lw $t4, -1012($30)
lw $t3, 0($t4)
li $t5, 4
mul $t6, $t2, $t5
addu $t7, $t3, $t6
addiu $t8, $0, 4
sw $t8, 0($t7)
addiu $t9, $0, 2
lw $s0, 0($t4)
li $s1, 4
mul $s2, $t9, $s1
addu $s3, $s0, $s2
addiu $s4, $0, 3
sw $s4, 0($s3)
addiu $s5, $0, 1
lw $s6, 0($t4)
li $s7, 4
addiu $29, $29, -4
sw $t0, -1036($30)
sw $t1, -1032($30)
addiu $29, $29, -4
sw $t2, -1040($30)
addiu $29, $29, -4
sw $t3, -1044($30)
sw $t4, -1012($30)
addiu $29, $29, -4
sw $t5, -1048($30)
addiu $29, $29, -4
sw $t6, -1052($30)
addiu $29, $29, -4
sw $t7, -1056($30)
addiu $29, $29, -4
sw $t8, -1060($30)
addiu $29, $29, -4
sw $t9, -1064($30)
addiu $29, $29, -4
sw $s0, -1068($30)
addiu $29, $29, -4
sw $s1, -1072($30)
addiu $29, $29, -4
sw $s2, -1076($30)
addiu $29, $29, -4
sw $s3, -1080($30)
addiu $29, $29, -4
sw $s4, -1084($30)
addiu $29, $29, -4
sw $s5, -1088($30)
addiu $29, $29, -4
sw $s6, -1092($30)
addiu $29, $29, -4
sw $s7, -1096($30)
lw $t1, -1088($30)
lw $t2, -1096($30)
mul $t0, $t1, $t2
lw $t4, -1092($30)
addu $t3, $t4, $t0
addiu $t5, $0, 2
sw $t5, 0($t3)
addiu $t6, $0, 0
lw $t8, -1012($30)
lw $t7, 0($t8)
li $t9, 4
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 1
sw $s2, 0($s1)
addiu $s3, $0, 1
lw $s4, 0($t8)
li $s5, 4
mul $s6, $s3, $s5
addu $s7, $s4, $s6
#c [ 1 ] = 0 ; 

addiu $29, $29, -4
sw $t0, -1100($30)
sw $t1, -1088($30)
sw $t2, -1096($30)
addiu $29, $29, -4
sw $t3, -1104($30)
sw $t4, -1092($30)
addiu $29, $29, -4
sw $t5, -1108($30)
addiu $29, $29, -4
sw $t6, -1112($30)
addiu $29, $29, -4
sw $t7, -1116($30)
sw $t8, -1012($30)
addiu $29, $29, -4
sw $t9, -1120($30)
addiu $29, $29, -4
sw $s0, -1124($30)
addiu $29, $29, -4
sw $s1, -1128($30)
addiu $29, $29, -4
sw $s2, -1132($30)
addiu $29, $29, -4
sw $s3, -1136($30)
addiu $29, $29, -4
sw $s4, -1140($30)
addiu $29, $29, -4
sw $s5, -1144($30)
addiu $29, $29, -4
sw $s6, -1148($30)
addiu $29, $29, -4
sw $s7, -1152($30)
addiu $t0, $0, 0
lw $t1, -1152($30)
sw $t0, 0($t1)
addiu $t2, $0, 0
move $v0, $t2
j function_main_load
#return 0 ; 


L68:
li $t4, 0
addiu $29, $29, -12
sb $t4, 4($29)
sb $t4, 5($29)
sb $t4, 6($29)
sb $t4, 7($29)
sb $t4, 8($29)
sb $t4, 9($29)
sb $t4, 10($29)
sb $t4, 11($29)
sb $t4, 12($29)
sb $t4, 13($29)
sb $t4, 14($29)
sb $t4, 15($29)
addiu $t5, $29, 4
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
#     INT main ( ) { CHAR c [ ] = "hello world" ; 

addiu $t7, $0, 11
lw $t8, 0($t6)
li $t9, 1
mul $s0, $t7, $t9
addu $s1, $t8, $s0
addiu $s2, $0, 0
sb $s2, 0($s1)
addiu $s3, $0, 10
lw $s4, 0($t6)
li $s5, 1
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -1172($30)
sw $t1, -1152($30)
addiu $29, $29, -4
sw $t2, -1176($30)
addiu $29, $29, -4
sw $t3, -1180($30)
addiu $29, $29, -4
sw $t4, -1184($30)
addiu $29, $29, -4
sw $t5, -1188($30)
addiu $29, $29, -4
sw $t6, -1192($30)
addiu $29, $29, -4
sw $t7, -1196($30)
addiu $29, $29, -4
sw $t8, -1200($30)
addiu $29, $29, -4
sw $t9, -1204($30)
addiu $29, $29, -4
sw $s0, -1208($30)
addiu $29, $29, -4
sw $s1, -1212($30)
addiu $29, $29, -4
sw $s2, -1216($30)
addiu $29, $29, -4
sw $s3, -1220($30)
addiu $29, $29, -4
sw $s4, -1224($30)
addiu $29, $29, -4
sw $s5, -1228($30)
addiu $29, $29, -4
sw $s6, -1232($30)
addiu $29, $29, -4
sw $s7, -1236($30)
addiu $t0, $0, 100
lw $t1, -1236($30)
sb $t0, 0($t1)
addiu $t2, $0, 9
lw $t4, -1192($30)
lw $t3, 0($t4)
li $t5, 1
mul $t6, $t2, $t5
addu $t7, $t3, $t6
addiu $t8, $0, 108
sb $t8, 0($t7)
addiu $t9, $0, 8
lw $s0, 0($t4)
li $s1, 1
mul $s2, $t9, $s1
addu $s3, $s0, $s2
addiu $s4, $0, 114
sb $s4, 0($s3)
addiu $s5, $0, 7
lw $s6, 0($t4)
li $s7, 1
addiu $29, $29, -4
sw $t0, -1240($30)
sw $t1, -1236($30)
addiu $29, $29, -4
sw $t2, -1244($30)
addiu $29, $29, -4
sw $t3, -1248($30)
sw $t4, -1192($30)
addiu $29, $29, -4
sw $t5, -1252($30)
addiu $29, $29, -4
sw $t6, -1256($30)
addiu $29, $29, -4
sw $t7, -1260($30)
addiu $29, $29, -4
sw $t8, -1264($30)
addiu $29, $29, -4
sw $t9, -1268($30)
addiu $29, $29, -4
sw $s0, -1272($30)
addiu $29, $29, -4
sw $s1, -1276($30)
addiu $29, $29, -4
sw $s2, -1280($30)
addiu $29, $29, -4
sw $s3, -1284($30)
addiu $29, $29, -4
sw $s4, -1288($30)
addiu $29, $29, -4
sw $s5, -1292($30)
addiu $29, $29, -4
sw $s6, -1296($30)
addiu $29, $29, -4
sw $s7, -1300($30)
lw $t1, -1292($30)
lw $t2, -1300($30)
mul $t0, $t1, $t2
lw $t4, -1296($30)
addu $t3, $t4, $t0
addiu $t5, $0, 111
sb $t5, 0($t3)
addiu $t6, $0, 6
lw $t8, -1192($30)
lw $t7, 0($t8)
li $t9, 1
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 119
sb $s2, 0($s1)
addiu $s3, $0, 5
lw $s4, 0($t8)
li $s5, 1
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -1304($30)
sw $t1, -1292($30)
sw $t2, -1300($30)
addiu $29, $29, -4
sw $t3, -1308($30)
sw $t4, -1296($30)
addiu $29, $29, -4
sw $t5, -1312($30)
addiu $29, $29, -4
sw $t6, -1316($30)
addiu $29, $29, -4
sw $t7, -1320($30)
sw $t8, -1192($30)
addiu $29, $29, -4
sw $t9, -1324($30)
addiu $29, $29, -4
sw $s0, -1328($30)
addiu $29, $29, -4
sw $s1, -1332($30)
addiu $29, $29, -4
sw $s2, -1336($30)
addiu $29, $29, -4
sw $s3, -1340($30)
addiu $29, $29, -4
sw $s4, -1344($30)
addiu $29, $29, -4
sw $s5, -1348($30)
addiu $29, $29, -4
sw $s6, -1352($30)
addiu $29, $29, -4
sw $s7, -1356($30)
addiu $t0, $0, 32
lw $t1, -1356($30)
sb $t0, 0($t1)
addiu $t2, $0, 4
lw $t4, -1192($30)
lw $t3, 0($t4)
li $t5, 1
mul $t6, $t2, $t5
addu $t7, $t3, $t6
addiu $t8, $0, 111
sb $t8, 0($t7)
addiu $t9, $0, 3
lw $s0, 0($t4)
li $s1, 1
mul $s2, $t9, $s1
addu $s3, $s0, $s2
addiu $s4, $0, 108
sb $s4, 0($s3)
addiu $s5, $0, 2
lw $s6, 0($t4)
li $s7, 1
addiu $29, $29, -4
sw $t0, -1360($30)
sw $t1, -1356($30)
addiu $29, $29, -4
sw $t2, -1364($30)
addiu $29, $29, -4
sw $t3, -1368($30)
sw $t4, -1192($30)
addiu $29, $29, -4
sw $t5, -1372($30)
addiu $29, $29, -4
sw $t6, -1376($30)
addiu $29, $29, -4
sw $t7, -1380($30)
addiu $29, $29, -4
sw $t8, -1384($30)
addiu $29, $29, -4
sw $t9, -1388($30)
addiu $29, $29, -4
sw $s0, -1392($30)
addiu $29, $29, -4
sw $s1, -1396($30)
addiu $29, $29, -4
sw $s2, -1400($30)
addiu $29, $29, -4
sw $s3, -1404($30)
addiu $29, $29, -4
sw $s4, -1408($30)
addiu $29, $29, -4
sw $s5, -1412($30)
addiu $29, $29, -4
sw $s6, -1416($30)
addiu $29, $29, -4
sw $s7, -1420($30)
lw $t1, -1412($30)
lw $t2, -1420($30)
mul $t0, $t1, $t2
lw $t4, -1416($30)
addu $t3, $t4, $t0
addiu $t5, $0, 108
sb $t5, 0($t3)
addiu $t6, $0, 1
lw $t8, -1192($30)
lw $t7, 0($t8)
li $t9, 1
mul $s0, $t6, $t9
addu $s1, $t7, $s0
addiu $s2, $0, 101
sb $s2, 0($s1)
addiu $s3, $0, 0
lw $s4, 0($t8)
li $s5, 1
mul $s6, $s3, $s5
addu $s7, $s4, $s6
addiu $29, $29, -4
sw $t0, -1424($30)
sw $t1, -1412($30)
sw $t2, -1420($30)
addiu $29, $29, -4
sw $t3, -1428($30)
sw $t4, -1416($30)
addiu $29, $29, -4
sw $t5, -1432($30)
addiu $29, $29, -4
sw $t6, -1436($30)
addiu $29, $29, -4
sw $t7, -1440($30)
sw $t8, -1192($30)
addiu $29, $29, -4
sw $t9, -1444($30)
addiu $29, $29, -4
sw $s0, -1448($30)
addiu $29, $29, -4
sw $s1, -1452($30)
addiu $29, $29, -4
sw $s2, -1456($30)
addiu $29, $29, -4
sw $s3, -1460($30)
addiu $29, $29, -4
sw $s4, -1464($30)
addiu $29, $29, -4
sw $s5, -1468($30)
addiu $29, $29, -4
sw $s6, -1472($30)
addiu $29, $29, -4
sw $s7, -1476($30)
addiu $t0, $0, 104
lw $t1, -1476($30)
sb $t0, 0($t1)
la $t2, str4
lw $t3, -1192($30)
lw $t4, 0($t3)
# printf ( "%s" , c ) ; 

addiu $29, $29, -8
sw $t2, 4($29)
sw $t4, 8($29)
jal function_printf
lw $t2, 4($29)
lw $t4, 8($29)
addiu $29, $29, 8
addiu $29, $29, -4
sw $t0, -1480($30)
sw $t1, -1476($30)
addiu $29, $29, -4
sw $t2, -1484($30)
sw $t3, -1192($30)
addiu $29, $29, -4
sw $t4, -1488($30)
addiu $29, $29, -4
sw $t5, -1492($30)
addiu $29, $29, -4
sw $t6, -1496($30)
addiu $29, $29, -4
sw $t7, -1500($30)
addiu $29, $29, -4
sw $t8, -1504($30)
addiu $29, $29, -4
sw $t9, -1508($30)
addiu $29, $29, -4
sw $s0, -1512($30)
addiu $29, $29, -4
sw $s1, -1516($30)
addiu $29, $29, -4
sw $s2, -1520($30)
addiu $29, $29, -4
sw $s3, -1524($30)
addiu $29, $29, -4
sw $s4, -1528($30)
addiu $29, $29, -4
sw $s5, -1532($30)
addiu $29, $29, -4
sw $s6, -1536($30)
addiu $29, $29, -4
sw $s7, -1540($30)
move $t0, $v0
li $t2, 0
addiu $29, $29, -4
sb $t2, 4($29)
sb $t2, 5($29)
sb $t2, 6($29)
addiu $t3, $29, 4
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
# CHAR d [ ] = { 'a' , 'b' , '\0' } ; 

addiu $t5, $0, 2
lw $t6, 0($t4)
li $t7, 1
mul $t8, $t5, $t7
addu $t9, $t6, $t8
addiu $s0, $0, 0
sb $s0, 0($t9)
addiu $s1, $0, 1
lw $s2, 0($t4)
li $s3, 1
mul $s4, $s1, $s3
addu $s5, $s2, $s4
addiu $s6, $0, 98
sb $s6, 0($s5)
addiu $s7, $0, 0
addiu $29, $29, -4
sw $t0, -1552($30)
addiu $29, $29, -4
sw $t1, -1556($30)
addiu $29, $29, -4
sw $t2, -1560($30)
addiu $29, $29, -4
sw $t3, -1564($30)
addiu $29, $29, -4
sw $t4, -1568($30)
addiu $29, $29, -4
sw $t5, -1572($30)
addiu $29, $29, -4
sw $t6, -1576($30)
addiu $29, $29, -4
sw $t7, -1580($30)
addiu $29, $29, -4
sw $t8, -1584($30)
addiu $29, $29, -4
sw $t9, -1588($30)
addiu $29, $29, -4
sw $s0, -1592($30)
addiu $29, $29, -4
sw $s1, -1596($30)
addiu $29, $29, -4
sw $s2, -1600($30)
addiu $29, $29, -4
sw $s3, -1604($30)
addiu $29, $29, -4
sw $s4, -1608($30)
addiu $29, $29, -4
sw $s5, -1612($30)
addiu $29, $29, -4
sw $s6, -1616($30)
addiu $29, $29, -4
sw $s7, -1620($30)
lw $t1, -1568($30)
lw $t0, 0($t1)
li $t2, 1
lw $t4, -1620($30)
mul $t3, $t4, $t2
addu $t5, $t0, $t3
addiu $t6, $0, 97
sb $t6, 0($t5)
la $t7, str4
lw $t8, 0($t1)
# printf ( "%s" , d ) ; 

addiu $29, $29, -8
sw $t7, 4($29)
sw $t8, 8($29)
jal function_printf
lw $t7, 4($29)
lw $t8, 8($29)
addiu $29, $29, 8
move $t9, $v0
addiu $s0, $0, 0
move $v0, $s0
j function_main_load
# return 0 ; 


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
L32:

L33:
addiu $11, $30, 4
lw $8, 0($11)
addiu $11, $11, 4

L34:
li $25, 0
lb $9, 0($8)
beq $9, $0, L53
addiu $2, $0, 11
addiu $12, $0, 37
beq $9, $12, L38

L35:

L36:
li $24, 1
slt $15, $25, $24
beq $15, $24, L37
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L36

L37:
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $8, $8, 1
j L34

L38:
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
beq $10, $12, L40
addiu $12, $0, 99
beq $10, $12, L43
addiu $12, $0, 115
beq $10, $12, L44
addiu $12, $0, 120
beq $10, $12, L47
addiu $12, $0, 102
beq $10, $12, L52
li $15, 47
li $24, 58
slt $15, $15, $10
sgt $24, $24, $10
and $15, $15, $24
move $9, $10
li $24, 1
bne $15, $24, L39
addiu $15, $10, -48
li $24, 10
mul $25, $25, $24
add $25, $25, $15
j L38

L39:
j L35

L40:
lw $9, 0($11)

L41:
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
bne $15, $9, L41

L42:
addiu $18, $18, -1
addiu $2, $0, 1
lw $9, 0($11)
addiu $11, $11, 4
j L39

L43:
addi $25, $25, -1
addiu $2, $0, 11
lb $9, 0($11)
addiu $11, $11, 4
j L39

L44:
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

L45:
lb $9, 0($15)
li $24, 0
beq $9, $24, L46
addiu $18, $18, 1
addi $15, $15, 1
addi $25, $25, -1
j L45

L46:
addiu $2, $0, 4
addiu $18, $18, -1
lw $9, 0($11)
addiu $11, $11, 4
j L39

L47:
addiu $2, $0, 11
li $16, 0
addi $25, $25, -8
j L49

L48:
li $24, 1
slt $15, $25, $24
beq $15, $24, L50
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
bne $25, $24, L48
j L50

L49:
lw $9, 0($11)
sllv $9, $9, $16
srl $9, $9, 28
li $14, 0
bne $9, $14, L48
li $14, 28
beq $14, $16, L48
addi $25, $25, 1
addiu $16, $16, 4
j L49

L50:
lw $9, 0($11)
li $17, 28
beq $16, $17, L51
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
beq $16, $17, L51
j L50

L51:
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
j L39

L52:
addi $25, $25, -8
addiu $18, $18, 7
addiu $2, $0, 2
lw $9, 0($11)
mtc1 $9, $f12
addiu $11, $11, 4
j L39

L53:
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
L69:

L70:
addiu $11, $30, 4
lw $8, 0($11)
addiu $11, $11, 4

L71:
li $25, 0
lb $9, 0($8)
beq $9, $0, L90
addiu $2, $0, 11
addiu $12, $0, 37
beq $9, $12, L75

L72:

L73:
li $24, 1
slt $15, $25, $24
beq $15, $24, L74
move $15, $2
li $2, 11
li $4, 32
addiu $18, $18, 1
syscall
addiu $25, $25, -1
move $2, $15
li $24, 0
bne $25, $24, L73

L74:
add $4, $0, $9
addiu $18, $18, 1
syscall
addiu $8, $8, 1
j L71

L75:
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
beq $10, $12, L77
addiu $12, $0, 99
beq $10, $12, L80
addiu $12, $0, 115
beq $10, $12, L81
addiu $12, $0, 120
beq $10, $12, L84
addiu $12, $0, 102
beq $10, $12, L89
li $15, 47
li $24, 58
slt $15, $15, $10
sgt $24, $24, $10
and $15, $15, $24
move $9, $10
li $24, 1
bne $15, $24, L76
addiu $15, $10, -48
li $24, 10
mul $25, $25, $24
add $25, $25, $15
j L75

L76:
j L72

L77:
lw $9, 0($11)

L78:
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
bne $15, $9, L78

L79:
addiu $18, $18, -1
addiu $2, $0, 1
lw $9, 0($11)
addiu $11, $11, 4
j L76

L80:
addi $25, $25, -1
addiu $2, $0, 11
lb $9, 0($11)
addiu $11, $11, 4
j L76

L81:
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

L82:
lb $9, 0($15)
li $24, 0
beq $9, $24, L83
addiu $18, $18, 1
addi $15, $15, 1
addi $25, $25, -1
j L82

L83:
addiu $2, $0, 4
addiu $18, $18, -1
lw $9, 0($11)
addiu $11, $11, 4
j L76

L84:
addiu $2, $0, 11
li $16, 0
addi $25, $25, -8
j L86

L85:
li $24, 1
slt $15, $25, $24
beq $15, $24, L87
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
bne $25, $24, L85
j L87

L86:
lw $9, 0($11)
sllv $9, $9, $16
srl $9, $9, 28
li $14, 0
bne $9, $14, L85
li $14, 28
beq $14, $16, L85
addi $25, $25, 1
addiu $16, $16, 4
j L86

L87:
lw $9, 0($11)
li $17, 28
beq $16, $17, L88
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
beq $16, $17, L88
j L87

L88:
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
j L76

L89:
addi $25, $25, -8
addiu $18, $18, 7
addiu $2, $0, 2
lw $9, 0($11)
mtc1 $9, $f12
addiu $11, $11, 4
j L76

L90:
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