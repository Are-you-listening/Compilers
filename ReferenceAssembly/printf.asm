	.data
str0: .asciiz  "%3d"
str1: .asciiz  "hello world"
	.text

main:



	subu	$sp, $sp, 12	# allocate 12 bytes on the stack downwards

	la $t0, str0
	sw	$t0, 4($sp)	# push old frame pointer (dynamic link)

	li $t0, 5
	sw	$t0, 8($sp)	# push old frame pointer (dynamic link)


	li $t9, 2

	jal printf

	li 	$v0, 10
	syscall

printf:

	sw	$fp, 0($sp)	# push old frame pointer (dynamic link)
	move	$fp, $sp	# frame	pointer now points to the top of the stack
	subu	$sp, $sp, 32	# allocate 32 bytes on the stack downwards
	sw	$ra, -4($fp)	# store the value of the return address
	sw	$a0, -8($fp)	# store argument 0
	sw	$a1, -12($fp)	# store argument 1
	sw	$t0, -16($fp)	# store temp 0
	sw	$t1, -20($fp)	# store temp 1
	sw	$t2, -24($fp)	# store temp 2
	sw	$t3, -28($fp)	# store temp 3

	add $t3, $fp, 4 # store param counter
	lw $t0, ($t3)


	addi $t3, $t3, 4
	li $v1, 0
printf_char_loop:
	li $t9, 0

	lb 	$t1, ($t0)


	beq $t1, 0, printf_char_loop_end

	li 	$v0, 11

	beq $t1, 37, printf_char_special_token
printf_char_special_token_after:

width_space_loop:
	li $t8, 1
	slt $t7, $t9, $t8
	beq $t7, $t8, width_space_loop_after
	move $t7, $v0
	li $v0, 11
	li	$a0, 32
	addiu $v1, $v1, 1
	syscall

	addiu $t9, $t9, -1
	move $v0, $t7
	li $t8, 0
	bne $t9, $t8, width_space_loop

width_space_loop_after:

	move	$a0, $t1
	addiu $v1, $v1, 1
	syscall

	addi 	$t0, $t0, 1

	j printf_char_loop

printf_char_special_token:
	addi 	$t0, $t0, 1
	lb 	$t2, ($t0)

	beq $t2, 100, printf_char_special_token_d_width
	beq $t2, 99, printf_char_special_token_c
	beq $t2, 120, printf_char_special_token_x
	beq $t2, 115, printf_char_special_token_s
	beq $t2, 102, printf_char_special_token_f

	li $t7, 47
	li $t8, 58
	slt $t7, $t7, $t2 #width condition
	sgt $t8, $t8, $t2
	and $t7, $t7, $t8

	move $t1, $t2

	li $t8, 1
	bne $t7, $t8, printf_char_special_token_end_if #check for width

	addiu $t7, $t2, -48
	sll $t9, $t9, 4
	or $t9, $t9, $t7
	j printf_char_special_token



printf_char_special_token_end_if:
	j printf_char_special_token_after


printf_char_special_token_d_width:
	lw $t1, ($t3)
printf_char_special_token_d_width_loop:
	li $t7, 10
	div $t1, $t1, 10
	subi $t9, $t9, 1
	addiu $v1, $v1, 1

	li $t7, 0
	bne $t7, $t1, printf_char_special_token_d_width_loop

printf_char_special_token_d:
	addiu $v1, $v1, -1
	li 	$v0, 1
	lw $t1, ($t3)
	addi $t3, $t3, 4
	j printf_char_special_token_end_if
printf_char_special_token_c:
	subi $t9, $t9, 1
	li 	$v0, 11
	lb $t1, ($t3)
	addi $t3, $t3, 4
	j printf_char_special_token_end_if
printf_char_special_token_f:
	subi $t9, $t9, 8
	li 	$v0, 2
	lb $t1, ($t3)

	mtc1 $t1, $f12

	addi $t3, $t3, 4
	j printf_char_special_token_end_if

printf_char_special_token_x:
	li 	$v0, 11

	li $s0, 0 # 4bit counter
	addi $t9, $t9, -8
	j print_x_first_skipper

xwidth_space_loop:
	li $t8, 1
	slt $t7, $t9, $t8
	beq $t7, $t8, print_x_half_byte_loop
	move $t7, $v0
	li $v0, 11
	li	$a0, 32
	addiu $v1, $v1, 1
	syscall

	addiu $t9, $t9, -1
	move $v0, $t7
	li $t8, 0
	bne $t9, $t8, xwidth_space_loop

	j print_x_half_byte_loop

print_x_first_skipper:

	lw $t1, ($t3)
	sllv $t1, $t1, $s0
	srl $t1, $t1, 28
	bne $t1, 0, xwidth_space_loop
	addi $t9, $t9, 1
	addiu $s0, $s0, 4 #already increase counter

	j print_x_first_skipper

print_x_half_byte_loop:
	li $s1, 28
	beq $s1, $s0, print_x_half_byte_loop_after
	lw $t1, ($t3) #transate both halfs of the byte into hex
	#first one
	sllv $t1, $t1, $s0
	srl $t1, $t1, 28


	addiu $t1, $t1, 48
	div $t4, $t1, 58
	mflo $t4
	and $t5, $t4, 1

	add $t4, $t4, 38
	mul $t5, $t5, $t4
	add $t1, $t5, $t1


	move $a0, $t1
	addiu $v1, $v1, 1
	syscall

	addiu $s0, $s0, 4 #already increase counter
	li $s1, 28
	beq $s1, $s0, print_x_half_byte_loop_after
	j print_x_half_byte_loop
print_x_half_byte_loop_after:

	lb $t1, ($t3) #transate both halfs of the byte into hex

	#last
	sll $t1, $t1, 28
	srl $t1, $t1, 28
	addiu $t1, $t1, 48

	#Sequence of calcualtions to translate values to 'a',...'f' if needed
	div $t4, $t1, 58
	mflo $t4
	and $t5, $t4, 1

	add $t4, $t4, 38
	mul $t5, $t5, $t4

	add $t1, $t5, $t1


	addi $t3, $t3, 4
	li $t9, 0
	j printf_char_special_token_end_if
printf_char_special_token_s:
	lw $t7, ($t3)

printf_char_special_token_s_width_loop:
	lb $t1, ($t7)
	li $t8, 0
	beq $t1, $t8, printf_char_special_token_s_after
	addiu $v1, $v1, 1
	addi $t7, $t7, 1
	subi $t9, $t9, 1
	j printf_char_special_token_s_width_loop


printf_char_special_token_s_after:
	addiu $v1, $v1, -1
	li 	$v0, 4
	lw $t1, ($t3)
	addi $t3, $t3, 4
	j printf_char_special_token_end_if



printf_char_loop_end:

	li	$v0, 0

	#frame un-setup
	lw	$t3, -28($fp)   # get save 1 from frame
	lw	$t2, -24($fp)   # get save 1 from frame
    	lw	$t1, -20($fp)   # get save 1 from frame
	lw	$t0, -16($fp)   # get save 0 from frame
    	lw	$a1, -12($fp)   # get argument 1 from frame
    	lw	$a0, -8($fp)    # get argument 0 from frame
	lw	$ra, -4($fp)    # get return address from frame
	move	$sp, $fp        # get old frame pointer from current frame
	lw	$fp, 0($sp)	# restore old frame pointer

	jr      $ra


