.data
heap: .space 4
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
addiu $t1, $0, 6
li $t2, 0
addiu $29, $29, -4
sw $t2, 4($29)
addiu $t3, $29, 4
sw $t1, 0($t3)
#  INT main ( ) {  INT a = 6 ; 

addiu $t4, $0, 6
sw $t4, 0($t3)
#a = 6 ; 

addiu $t6, $0, 2
li $t7, 0
addiu $29, $29, -4
sw $t7, 4($29)
addiu $t8, $29, 4
sw $t6, 0($t8)
#INT b = 2 ; 

addiu $t9, $0, 2
sw $t9, 0($t8)
#b = 2 ; 

lw $s1, 0($t3)
# INT c = a + b ; 

lw $s2, 0($t8)
add $s3, $s1, $s2
li $s4, 0
addiu $29, $29, -4
sw $s4, 4($29)
addiu $s5, $29, 4
sw $s3, 0($s5)
lw $s7, 0($t3)
#INT d = a - b ; 

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
lw $t1, -148($30)
lw $t0, 0($t1)
lw $t3, -184($30)
sub $t2, $t3, $t0
li $t4, 0
addiu $29, $29, -4
sw $t4, 4($29)
addiu $t5, $29, 4
sw $t2, 0($t5)
lw $t7, -128($30)
lw $t8, 0($t7)
#INT e = a * b ; 

lw $t9, 0($t1)
mul $s0, $t8, $t9
li $s1, 0
addiu $29, $29, -4
sw $s1, 4($29)
addiu $s2, $29, 4
sw $s0, 0($s2)
lw $s4, 0($t7)
#INT f = a / b ; 

lw $s5, 0($t1)
div $s6 $s4 $s5
li $s7, 0
addiu $29, $29, -4
sw $s7, 4($29)
addiu $29, $29, -4
sw $t0, -200($30)
sw $t1, -148($30)
addiu $29, $29, -4
sw $t2, -204($30)
sw $t3, -184($30)
addiu $29, $29, -4
sw $t4, -208($30)
addiu $29, $29, -4
sw $t5, -212($30)
addiu $29, $29, -4
sw $t6, -216($30)
sw $t7, -128($30)
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
addiu $t0, $29, 4
lw $t1, -252($30)
sw $t1, 0($t0)
# INT g = a == b ; 

lw $t3, -128($30)
lw $t4, 0($t3)
lw $t5, -148($30)
lw $t6, 0($t5)
xor $t7, $t4, $t6
sltiu $t8, $t7, 1
li $t9, 0
addiu $29, $29, -4
sw $t9, 4($29)
addiu $s0, $29, 4
sw $t8, 0($s0)
#INT h = a < b ; 

lw $s2, 0($t3)
lw $s3, 0($t5)
slt $s4, $s2, $s3
li $s5, 0
addiu $29, $29, -4
sw $s5, 4($29)
addiu $s6, $29, 4
sw $s4, 0($s6)
#INT i = a > b ; 

addiu $29, $29, -4
sw $t0, -268($30)
sw $t1, -252($30)
addiu $29, $29, -4
sw $t2, -272($30)
sw $t3, -128($30)
addiu $29, $29, -4
sw $t4, -276($30)
sw $t5, -148($30)
addiu $29, $29, -4
sw $t6, -280($30)
addiu $29, $29, -4
sw $t7, -284($30)
addiu $29, $29, -4
sw $t8, -288($30)
addiu $29, $29, -4
sw $t9, -292($30)
addiu $29, $29, -4
sw $s0, -296($30)
addiu $29, $29, -4
sw $s1, -300($30)
addiu $29, $29, -4
sw $s2, -304($30)
addiu $29, $29, -4
sw $s3, -308($30)
addiu $29, $29, -4
sw $s4, -312($30)
addiu $29, $29, -4
sw $s5, -316($30)
addiu $29, $29, -4
sw $s6, -320($30)
addiu $29, $29, -4
sw $s7, -324($30)
lw $t1, -128($30)
lw $t0, 0($t1)
lw $t2, -148($30)
lw $t3, 0($t2)
sgt $t4, $t0, $t3
li $t5, 0
addiu $29, $29, -4
sw $t5, 4($29)
addiu $t6, $29, 4
sw $t4, 0($t6)
# INT j = a != b ; 

lw $t8, 0($t1)
lw $t9, 0($t2)
xor $s0, $t8, $t9
sltiu $s1, $s0, 1
sltiu $s2, $s1, 1
li $s3, 0
addiu $29, $29, -4
sw $s3, 4($29)
addiu $s4, $29, 4
sw $s2, 0($s4)
#INT k = a <= b ; 

lw $s6, 0($t1)
lw $s7, 0($t2)
addiu $29, $29, -4
sw $t0, -336($30)
sw $t1, -128($30)
sw $t2, -148($30)
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
lw $t1, -392($30)
lw $t2, -396($30)
sgt $t0, $t1, $t2
sltiu $t3, $t0, 1
li $t4, 0
addiu $29, $29, -4
sw $t4, 4($29)
addiu $t5, $29, 4
sw $t3, 0($t5)
#INT l = a >= b ; 

lw $t7, -128($30)
lw $t8, 0($t7)
lw $t9, -148($30)
lw $s0, 0($t9)
slt $s1, $t8, $s0
sltiu $s2, $s1, 1
li $s3, 0
addiu $29, $29, -4
sw $s3, 4($29)
addiu $s4, $29, 4
sw $s2, 0($s4)
lw $s6, 0($t7)
# INT m = a % b ; 

lw $s7, 0($t9)
addiu $29, $29, -4
sw $t0, -408($30)
sw $t1, -392($30)
sw $t2, -396($30)
addiu $29, $29, -4
sw $t3, -412($30)
addiu $29, $29, -4
sw $t4, -416($30)
addiu $29, $29, -4
sw $t5, -420($30)
addiu $29, $29, -4
sw $t6, -424($30)
sw $t7, -128($30)
addiu $29, $29, -4
sw $t8, -428($30)
sw $t9, -148($30)
addiu $29, $29, -4
sw $s0, -432($30)
addiu $29, $29, -4
sw $s1, -436($30)
addiu $29, $29, -4
sw $s2, -440($30)
addiu $29, $29, -4
sw $s3, -444($30)
addiu $29, $29, -4
sw $s4, -448($30)
addiu $29, $29, -4
sw $s5, -452($30)
addiu $29, $29, -4
sw $s6, -456($30)
addiu $29, $29, -4
sw $s7, -460($30)
lw $t1, -456($30)
lw $t2, -460($30)
div $t0 $t1 $t2
mfhi $t0
li $t3, 0
addiu $29, $29, -4
sw $t3, 4($29)
addiu $t4, $29, 4
sw $t0, 0($t4)
lw $t6, -128($30)
lw $t7, 0($t6)
# INT n = a << b ; 

lw $t8, -148($30)
lw $t9, 0($t8)
sllv $s0, $t7, $t9
li $s1, 0
addiu $29, $29, -4
sw $s1, 4($29)
addiu $s2, $29, 4
sw $s0, 0($s2)
lw $s4, 0($t6)
# INT o = a >> b ; 

lw $s5, 0($t8)
srlv $s6, $s4, $s5
li $s7, 0
addiu $29, $29, -4
sw $s7, 4($29)
addiu $29, $29, -4
sw $t0, -476($30)
sw $t1, -456($30)
sw $t2, -460($30)
addiu $29, $29, -4
sw $t3, -480($30)
addiu $29, $29, -4
sw $t4, -484($30)
addiu $29, $29, -4
sw $t5, -488($30)
sw $t6, -128($30)
addiu $29, $29, -4
sw $t7, -492($30)
sw $t8, -148($30)
addiu $29, $29, -4
sw $t9, -496($30)
addiu $29, $29, -4
sw $s0, -500($30)
addiu $29, $29, -4
sw $s1, -504($30)
addiu $29, $29, -4
sw $s2, -508($30)
addiu $29, $29, -4
sw $s3, -512($30)
addiu $29, $29, -4
sw $s4, -516($30)
addiu $29, $29, -4
sw $s5, -520($30)
addiu $29, $29, -4
sw $s6, -524($30)
addiu $29, $29, -4
sw $s7, -528($30)
addiu $t0, $29, 4
lw $t1, -524($30)
sw $t1, 0($t0)
addiu $t2, $0, 0
move $v0, $t2
j function_main_load
# return 0 ; 

addiu $29, $29, -4
sw $t0, -532($30)
sw $t1, -524($30)
addiu $29, $29, -4
sw $t2, -536($30)

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
