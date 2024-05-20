	.data
scan_format:		.asciiz "%x"
var_int: .word 0
	.text

main:


	la $fp, scan_format
	la $t0, var_int
	sw $t0, 16($fp)	# push old frame pointer (dynamic link)

	jal scanf

	li $v0, 10
	syscall

scanf:
	# First var is at fp + 4
	add $t3, $fp, 4 # store param counter
	move $t0, $fp
	addi $t3, $t3, 4

scanf_char_loop:
	lb $t1, ($t0) # Load the next char
	beq $t1, 0, scanf_char_loop_end # Upon readin \00 , the  function stops
	beq $t1, 37, scanf_char_special_token # % read

	li  $v0, 11 # Normal action is to print a char
	move $a0, $t1 # Execute syscall
	syscall
	addi $t0, $t0, 1 # Move to next char
	j scanf_char_loop # Back to loop

scanf_char_special_token:
	addi 	$t0, $t0, 1 # Go a char further
	lb 	$t2, ($t0)
	beq $t2, 100, scanf_char_special_token_d
	beq $t2, 99, scanf_char_special_token_c
	beq $t2, 120, scanf_char_special_token_x
	beq $t2, 115, scanf_char_special_token_s
	beq $t2, 102, scanf_char_special_token_f
	move $t1, $t2

scanf_char_special_token_d:
	li $v0, 5
	syscall
	addi $t3, $t3, 4  # Go to next param
	sw $v0, ($t3)
	addi $t0, $t0, 1 # Move to next char
	j scanf_char_loop

scanf_char_special_token_c:
	li $v0, 12
	syscall
	addi $t3, $t3, 4  # Go to next param
	sb $v0, ($t3)
	addi $t0, $t0, 1 # Move to next char
	j scanf_char_loop

scanf_char_special_token_x:
	# Uses extra register v0 - a3 and $t4

	# Allocate a buffer for 8 characters to read and later on translate to hex value
	move $a0, $sp
	li $a1, 9
	li $v0, 8
	syscall

	#Hex result is in v0 thus make 0 first
	li $v0, 0

	#First character (bit 32-40)
	lb $a0 , 7($sp)
	li $a1, 0  # Exponent
	la $v1, scanf_char_special_token_x_return_7 # Return address
	bne $a0, $zero, scanf_translate_hexCharToInt  # If no \00 char is here, we have an input!
	addi $a1, $a1 -1 # Did not found input, back to original exponent
	scanf_char_special_token_x_return_7:

	# 2nd char, bit 40-48
	lb $a0 , 6($sp)
	addi $a1, $a1 1  # Exponent
	la $v1, scanf_char_special_token_x_return_6 # Return address
	bne $a0, $zero, scanf_translate_hexCharToInt  # If no \00 char is here, we have an input!
	addi $a1, $a1 -1 # Did not found input, back to original exponent
	scanf_char_special_token_x_return_6:

	# 3th char, bit 48-56
	lb $a0 , 5($sp)
	addi $a1, $a1 1  # Exponent
	la $v1, scanf_char_special_token_x_return_5 # Return address
	bne $a0, $zero, scanf_translate_hexCharToInt  # If no \00 char is here, we have an input!
	addi $a1, $a1 -1 # Did not found input, back to original exponent
	scanf_char_special_token_x_return_5:

	# 4th char bit 56-64
	lb $a0 , 4($sp)
	addi $a1, $a1 1  # Exponent
	la $v1, scanf_char_special_token_x_return_4 # Return address
	bne $a0, $zero, scanf_translate_hexCharToInt  # If no \00 char is here, we have an input!
	addi $a1, $a1 -1 # Did not found input, back to original exponent
	scanf_char_special_token_x_return_4:

	# 5th char bit 0-8
	lb $a0 , 3($sp)
	addi $a1, $a1 1  # Exponent
	la $v1, scanf_char_special_token_x_return_3 # Return address
	bne $a0, $zero, scanf_translate_hexCharToInt  # If no \00 char is here, we have an input!
	addi $a1, $a1 -1 # Did not found input, back to original exponent
	scanf_char_special_token_x_return_3:

	# 6th char bit 8-16
	lb $a0 , 2($sp)
	addi $a1, $a1 1  # Exponent
	la $v1, scanf_char_special_token_x_return_2 # Return address
	bne $a0, $zero, scanf_translate_hexCharToInt  # If no \00 char is here, we have an input!
	addi $a1, $a1 -1 # Did not found input, back to original exponent
	scanf_char_special_token_x_return_2:

	# 7th char bit 16-24
	lb $a0 , 1($sp)
	addi $a1, $a1 1  # Exponent
	la $v1, scanf_char_special_token_x_return_1 # Return address
	bne $a0, $zero, scanf_translate_hexCharToInt  # If no \00 char is here, we have an input!
	addi $a1, $a1 -1 # Did not found input, back to original exponent
	scanf_char_special_token_x_return_1:

	# 8th char bit 24 - 32
	lb $a0 , 0($sp)
	addi $a1, $a1 1  # Exponent
	la $v1, scanf_char_special_token_x_return_0 # Return address
	bne $a0, $zero, scanf_translate_hexCharToInt  # If no \00 char is here, we have an input!
	addi $a1, $a1 -1 # Did not found input, back to original exponent
	scanf_char_special_token_x_return_0:

	addi $t3, $t3, 4  # Go to next param of scanf
	sw $v0, ($t3) # Save value in memory
	addi $t0, $t0, 1 # Move to next char if there is any
	j scanf_char_loop

scanf_char_special_token_s:
	li $v0, 8
	li $a1, 512
	addi $t3, $t3, 4
	j scanf_char_loop

scanf_char_special_token_f:
	li $v0, 6
	syscall
	addi $t3, $t3, 4  # Go to next param
	mfc1 $v0, $f0
	sw $v0, ($t3)
	addi $t0, $t0, 1 # Move to next char
	j scanf_char_loop

scanf_char_loop_end:
jr $ra

scanf_translate_hexCharToInt:
 	#Assuming return label is in $v1, return value in $v0
 	#$a0 contains char

 	li $a2, 48 # $a2 may be used as a temporary
	beq $a0, $a2, scanf_translate_hexCharToInt_0
	li $a2, 49
	beq $a0, $a2, scanf_translate_hexCharToInt_1
	li $a2, 50
	beq $a0, $a2, scanf_translate_hexCharToInt_2
	li $a2, 51
	beq $a0, $a2, scanf_translate_hexCharToInt_3
	li $a2, 52
	beq $a0, $a2, scanf_translate_hexCharToInt_4
	li $a2, 53
	beq $a0, $a2, scanf_translate_hexCharToInt_5
	li $a2, 54
	beq $a0, $a2, scanf_translate_hexCharToInt_6
	li $a2, 55
	beq $a0, $a2, scanf_translate_hexCharToInt_7
	li $a2, 56
	beq $a0, $a2,, scanf_translate_hexCharToInt_8
	li $a2, 57
	beq $a0, $a2, scanf_translate_hexCharToInt_9
	li $a2, 97
	beq $a0, $a2, scanf_translate_hexCharToInt_a
	li $a2, 98
	beq $a0, $a2, scanf_translate_hexCharToInt_b
	li $a2, 99
	beq $a0, $a2, scanf_translate_hexCharToInt_c
	li $a2, 100
	beq $a0, $a2,scanf_translate_hexCharToInt_d
	li $a2, 101
	beq $a0, $a2, scanf_translate_hexCharToInt_e
	li $a2, 102
	beq $a0, $a2, scanf_translate_hexCharToInt_f
	#Else: Undefined character
scanf_translate_hexCharToInt_0:
	li $a0, 0 #$a0 now the contains translation
	j scanf_power_16
scanf_translate_hexCharToInt_1:
	li $a0, 1
	j scanf_power_16
scanf_translate_hexCharToInt_2:
	li $a0, 2
	j scanf_power_16
scanf_translate_hexCharToInt_3:
	li $a0, 3
	j scanf_power_16
scanf_translate_hexCharToInt_4:
	li $a0, 4
	j scanf_power_16
scanf_translate_hexCharToInt_5:
	li $a0, 5
	j scanf_power_16
scanf_translate_hexCharToInt_6:
	li $a0, 6
	j scanf_power_16
scanf_translate_hexCharToInt_7:
	li $a0, 7
	j scanf_power_16
scanf_translate_hexCharToInt_8:
	li $a0, 8
	j scanf_power_16
scanf_translate_hexCharToInt_9:
	li $a0, 9
	j scanf_power_16
scanf_translate_hexCharToInt_a:
	li $a0, 10
	j scanf_power_16
scanf_translate_hexCharToInt_b:
	li $a0, 11
	j scanf_power_16
scanf_translate_hexCharToInt_c:
	li $a0, 12
	j scanf_power_16
scanf_translate_hexCharToInt_d:
	li $a0, 13
	j scanf_power_16
scanf_translate_hexCharToInt_e:
	li $a0, 14
	j scanf_power_16
scanf_translate_hexCharToInt_f:
	li $a0, 15
scanf_power_16:
	#$a1 contains the number of the bit = exponent = n, we may not modify this so make a copy!
	move $a2, $a1

    	li $a3, 1                         # result is always at least 1
    	beq $a2, $zero, scanf_power_16_exit_pow          # if (n==0)

	scanf_power_16_while:
    		mul $a3, $a3, 16                 # x = x*16
    		addi $a2, $a2, -1                 # n--
    		bne $a2, $zero, scanf_power_16_while             # while (n>0)

	scanf_power_16_exit_pow:
		mul $a3, $a3, $a0 # e.g. for bit 8, 8 * (16^exp = $a3)
		add $v0, $v0, $a3 # Add result to hex value
		jr $v1 # Go back




