.data
heap: .space 4
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
sw $t0, -256($30)
addiu $29, $29, -4
sw $t1, -260($30)
addiu $29, $29, -4
sw $t2, -264($30)
addiu $29, $29, -4
sw $t3, -268($30)
addiu $29, $29, -4
sw $t4, -272($30)
addiu $29, $29, -4
sw $t5, -276($30)
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
li $t0, 0
lw $t2, -324($30)
addu $t1, $t2, $t0
#boo . perier = perier ; 

lw $t3, -140($30)
lw $t4, 0($t3)
sw $t4, 0($t1)
addiu $t5, $0, 1
lw $t7, -316($30)
lw $t6, 0($t7)
li $t8, 4
addu $t9, $t6, $t8
#boo . spa = spa ; 

lw $s0, -176($30)
lw $s1, 0($s0)
sw $s1, 0($t9)
addiu $s2, $0, 2
lw $s3, 0($t7)
li $s4, 8
addu $s5, $s3, $s4
#boo . sea = sea ; 

lw $s6, -268($30)
lw $s7, 0($s6)
sw $s7, 0($s5)
addiu $29, $29, -4
sw $t0, -328($30)
addiu $29, $29, -4
sw $t1, -332($30)
sw $t2, -324($30)
sw $t3, -140($30)
addiu $29, $29, -4
sw $t4, -336($30)
addiu $29, $29, -4
sw $t5, -340($30)
addiu $29, $29, -4
sw $t6, -344($30)
sw $t7, -316($30)
addiu $29, $29, -4
sw $t8, -348($30)
addiu $29, $29, -4
sw $t9, -352($30)
sw $s0, -176($30)
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
sw $s6, -268($30)
addiu $29, $29, -4
sw $s7, -376($30)
addiu $t0, $0, 0
move $v0, $t0
j function_main_load
# return 0 ; 

addiu $29, $29, -4
sw $t0, -380($30)

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
