.data
	enterMsg: .asciiz "\nEnter a number between 0 and 9: "
	lowMsg: .asciiz "Your guess is too low."
	highMsg: .asciiz "Your guess is too high."
	loseMsg: .asciiz "\nYou lose. The number was "
	period: .asciiz "."
	winMsg: .asciiz "Congratulations! You win!"

.text
	addi $v0, $zero, 42	# Syscall 42: Random int range
	add $a0, $zero, $zero	
	addi $a1, $zero, 10	# Set upper bound to 9
	syscall
	
	add $s1, $zero, $a0	
	
	addi $s0, $zero, 3	# Make the counter
	
	j loop 			# Send to loop
	
loop:
	beq $s0, $zero, ifIncorrect	# Check counts
	addi $v0, $zero, 4	# Syscall 4: Print string
	la $a0, enterMsg	# set a0 to be the address of the character in enterMsg
	syscall
	
	addi $v0, $zero, 5	# Syscall 5: Read integer
	syscall
	
	add $s2, $zero, $v0	
	
	beq $s1, $s2, ifCorrect	# If same, go to isCorrect

	slt $s7, $s2, $s1	# Compare input with random number
	beq $s7, 1, tooLow	# Branch to ifLower if necessary

tooHigh:
	addi $v0, $zero, 4	# Syscall 4: Print string
	la $a0, highMsg		# Prints too high 
	syscall
	
	addi $s0, $s0, -1	# Decreases count by 1
	j loop 			# Go back to top of the loop
	
tooLow:
	addi $v0, $zero, 4	# Syscall 4: Print string
	la $a0, lowMsg		# Prints too low
	syscall
	
	addi $s0, $s0, -1 	# Decreases count by 1
	j loop			# Go back to top of the loop

ifCorrect:
	addi $v0, $zero, 4	# Prints correct
	la $a0, winMsg
	syscall
	
	j done			# Send to done and end
	
ifIncorrect:
	addi $v0, $zero, 4	# Prints incorrect
	la $a0, loseMsg
	syscall
	
	addi $v0, $zero, 1	# Syscall 1: Prints integer
	add $a0, $zero, $s1
	syscall
	
	addi $v0, $zero, 4	# Print period
	la $a0, period
	syscall
	
	j done 			# Send to done and end
	
done:
	addi $v0, $zero, 10	# Terminate the program
	syscall			