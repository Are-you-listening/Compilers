	.data
print_format:		.asciiz "hello%dworld%cWW%x"
	.text

main:

	la $t0, print_format

	subu	$sp, $sp, 20	# allocate 12 bytes on the stack downwards

	sw	$t0, 4($sp)	# push old frame pointer (dynamic link)

	li $t0, 5
	sw	$t0, 8($sp)	# push old frame pointer (dynamic link)

	li $t0, 69
	sw	$t0, 12($sp)	# push old frame pointer (dynamic link)

	li $t0, 64
	sw	$t0, 16($sp)	# push old frame pointer (dynamic link)


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
printf_char_loop:

	lb 	$t1, ($t0)


	beq $t1, 0, printf_char_loop_end

	li 	$v0, 11

	beq $t1, 37, printf_char_special_token
printf_char_special_token_after:

	move	$a0, $t1
	syscall

	addi 	$t0, $t0, 1

	j printf_char_loop

printf_char_special_token:
	addi 	$t0, $t0, 1
	lb 	$t2, ($t0)
	beq $t2, 100, printf_char_special_token_d
	beq $t2, 99, printf_char_special_token_c
	beq $t2, 120, printf_char_special_token_x
	beq $t2, 115, printf_char_special_token_s
	move $t1, $t2

printf_char_special_token_end_if:
	j printf_char_special_token_after

printf_char_special_token_d:
	li 	$v0, 1
	lw $t1, ($t3)
	addi $t3, $t3, 4
	j printf_char_special_token_end_if
printf_char_special_token_c:
	li 	$v0, 11
	lb $t1, ($t3)
	addi $t3, $t3, 4
	j printf_char_special_token_end_if
printf_char_special_token_x:
	li 	$v0, 11
	lb $t1, ($t3) #transate both halfs of the byte into hex

	#first one
	srl $t1, $t1, 4
	addiu $t1, $t1, 48
	div $t4, $t1, 58
	mflo $t4
	and $t5, $t4, 1
	mflo $t4
	mul $t5, $t5, $t4

	add $t4, $t4, 38
	mul $t5, $t5, $t4

	add $t1, $t5, $t1
	move $a0, $t1
	syscall

	lb $t1, ($t3) #transate both halfs of the byte into hex

	#second one
	sll $t1, $t1, 28
	srl $t1, $t1, 28
	addiu $t1, $t1, 48

	#Sequence of calcualtions to translate values to 'a',...'f' if needed
	div $t4, $t1, 58
	mflo $t4
	and $t5, $t4, 1
	mflo $t4
	mul $t5, $t5, $t4

	add $t4, $t4, 38
	mul $t5, $t5, $t4

	add $t1, $t5, $t1


	addi $t3, $t3, 4
	j printf_char_special_token_end_if
printf_char_special_token_s:
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


