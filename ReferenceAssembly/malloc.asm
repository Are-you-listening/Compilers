	.data
str0: .asciiz  "%3x"
str1: .asciiz  "hello world"
	.text

main:


	subu	$sp, $sp, 8	# allocate 12 bytes on the stack downwards

	li $t0, 5
	sw	$t0, 4($sp)	# push old frame pointer (dynamic link)


	jal malloc

	sw $t0, 0($v0)

	subu	$sp, $sp, 8	# allocate 12 bytes on the stack downwards

	li $t0, 6
	sw	$t0, 4($sp)	# push old frame pointer (dynamic link)


	jal malloc

	sw $t0, 0($v0)

	li 	$v0, 10
	syscall

malloc:

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

	lw $t0, 4($fp) # load malloc size

	li $t1, 4 #allocate with words
	div $t0, $t0, 4
	addiu $t0, $t0, 4 #extra redudant word if needed

	li $t1, 0x10040000 #store current check ptr in $t1 (heap ptr)

malloc_search:
	lw $t2, 0($t1) #load status word indicating whether space in use or not 0 -> not in use
	lw $t3, 4($t1) #load the reserved bytes

	bne $t2, $zero, malloc_search_next # when not free go to next
	sgt $t4, $t0, $t3 # check if needed space is more than available space if so go to next (when length != zero)
	mul $t4, $t4, $t3 # when length zero, will needed make zero (when suff space, $t4 will already be 0)
	bne $t4, $zero, malloc_search_next #in case not enoguh space

	j malloc_assign # when  mem not in use, overwrite

malloc_search_next:
	mul $t3, $t3, 4 #from word addressing to byte addressing
	addiu $t3, $t3, 8 #skip 2 words
	addu $t1, $t1, $t3 #go to next entry, till writable
	j malloc_search

malloc_assign:
	li $t2, 1
	sw $t2, 0($t1) #claim memory space
	sw $t0, 4($t1) #set length

	addiu $t1, $t1, 8 # set ptr to writable mem location as return type
	move $v0, $t1

malloc_end:

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


