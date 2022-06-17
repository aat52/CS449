.data
	enterMsg: .asciiz "Please enter a positive integer: "
	negMsg: .asciiz "A negative integer is not allowed.\n"
	posMsg: .asciiz "\nPlease enter another positive integer: "
	multi: .asciiz " * "
	equal: .asciiz " = "
	exp: .asciiz "^"
	newline: .asciiz "\n"

.text
	addi $v0, $zero, 4	# Syscall 4: Print string
	la $a0, enterMsg	# $a0 = address of the character in enterMsg
	syscall

	j num1

num1:
	addi $v0, $zero, 5	# Syscall 5: Read integer
	syscall
	move $s0, $v0		# Put read integer into $s0

	slt $s7, $s0, $zero	# s7 for determining branc
	beq $s7, 1, negcheck1

	move $s4, $s0		# Create a copy

	j num2

num2:
	addi $v0, $zero, 4	# Syscall 4: Print string
	la $a0, posMsg		# $a0 = address of the character in enterMsg
	syscall

	addi $v0, $zero, 5	# Syscall 5: Read integer
	syscall
	move $s1, $v0		# Put read integer into $s1

	slt $s7, $s1, $zero
	beq $s7, 1, negcheck2

	move $s5, $s1

	j multiply

negcheck1:
	addi $v0, $zero, 4
	la $a0, negMsg
	syscall

	addi $v0, $zero, 4
	la $a0, posMsg
	syscall

	j num1

negcheck2:
	addi $v0, $zero, 4
	la $a0, negMsg
	syscall

	j num2


#multiplication
multiply:
	addi $t0, $zero, 1
	move $s3, $zero 	# clearing
	move $t1, $zero		# clearing

loop:
	beq $s1, $zero, exponents	# if there's nothing left in s1, then move on to exponential calc

	and $t1, $t0, $s1
	beq $t1, 1, addition
	beq $t1, 0, next

addition:
	addu $s3, $s3, $s0

next:
	sll $s0, $s0, 1    #shift multiplicand left
      	srl $s1, $s1, 1    #shift multiplier right

      	j loop


#exponents
exponents:
	move $t1, $zero		# clearing
	move $s0, $zero
	move $s0, $s4		# b
	move $s1, $zero
	move $s7, $zero
	addi $s7, $s7, 1
	move $s6, $s4		# a
	addi $s2, $zero, 1	# counter

	j loope

loope:
	beq $s2, $s5, printing 	# if counter = y, jump to print
	beq $s0, $zero, reset	# if theres nothing left in b, reset it

multloop:
	and $t1, $t0, $s0	# check for a 1 or 0
	beq $t1, 1, additione
	beq $t1, 0, nexte

additione:
	addu $s1, $s1, $s6

nexte:
	sll $s6, $s6, 1    # shift multiplicand left
      	srl $s0, $s0, 1    # shift multiplier right

      	j loope

reset:
	addi $s2, $s2, 1	# incrememnt
	move $s7, $s1
	move $s1, $zero
	move $s0, $s7		# reset b
	move $s6, $s4
	j multloop


#printing
printing:
	addi $v0, $zero, 1
	move $a0, $s4		# set a0 to firstnum
	syscall

	addi $v0, $zero, 4	# Syscall 4: Print string
	la $a0, multi 		# print firstnum *
	syscall

	addi $v0, $zero, 1	# print second num
	move $a0, $s5
	syscall

	addi $v0, $zero, 4	# Syscall 4: Print string
	la $a0, equal		# secondnum =
	syscall

	addi $v0, $zero, 1
	move $a0, $s3		# set a0 to secondnum
	syscall

	addi $v0, $zero, 4 	# print_string syscall
    	la $a0, newline		# load address of the string
   	syscall

	addi $v0, $zero, 1	#Print x
	move $a0, $s4
	syscall

	addi $v0, $zero, 4	#Print power
	la   $a0, exp
	syscall

	addi $v0, $zero, 1	#Print y
	move $a0, $s5
	syscall

	addi $v0, $zero, 4	#Print equals
	la   $a0, equal
	syscall

	addi $v0, $zero, 1	#Print total
	move $a0, $s7
	syscall


exit:
	addi $v0, $zero, 10	# Terminate the program
	syscall			# Exit
