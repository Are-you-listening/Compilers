.data
heap: .space 4
str0: .asciiz  "%d" 
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
la $s0, str0
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
