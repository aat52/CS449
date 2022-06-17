
.text
#General Info:
# calling conventions: jal __ to call a procedure, jr $ra to return to caller (jump and link, stores return address in ra)
# register usage: $a0-$a3 for arguments, $v0-$v1 for return values
# register sharing: caller assumes $t0-$t9 will be destroyed between calls, callee has to store and load $s0-$s7 through sp
# backup and restoring: adjust stack pointer sp, (sw $ra, 0($sp)), adjust stack pointer back up to original




main:
	#s0 = n, number of colors in sequence
	#s1 = 
	#s2 = 
	#s3 = 
	#s4 = 
	#s5 = n for the user
		
	move $s0, $zero
	move $s1, $zero	
	
	bne $t9, $zero, start
	beq $t9, $zero, none
	
	none:
		j main
	
	start:
		addi $t8, $zero, 16
		j _playSequence
				

_playSequence:
	#s0 = n, number of colors in sequence
	#s1 = stores sequence
	
	#s3 = 
	#s4 = 
	#s5 = n for the user
	
	#t7 = temporary storage for s1
	
	addi $a1, $zero, 64
	addi $v0, $zero, 42 	#syscall 42 calls a random int
	syscall
	
	move $s1, $a0
	addi $s0, $zero, 3
	move $t7, $s1
	
	move $t3, $zero
	j loopSequence
	
	new: 
		move $a0, $zero
		
		addi $a1, $zero, 4
		addi $v0, $zero, 42 	#syscall 42 calls a random int
		syscall
		
		move $s2, $a0
		addi $t5, $zero, 2
		mult $s0, $t5
		mflo $t5
		sllv $s2, $s2, $t5
		move $t3, $zero
		add $s1, $s1, $s2
		move $t7, $s1
		addi $s0, $s0, 1	#count++
		j loopSequence
		
	loopSequence:					
		
		andi $t6, $t7, 0x3		#interpret the next 2 bits													
		srl $t7, $t7, 2 		#delete read bits
		
		addi $t3, $t3, 1
		
		beq $t6, 0, bluet8
		beq $t6, 1, yellowt8
		beq $t6, 2, greent8
		beq $t6, 3, redt8
		
		bluet8:
			addi $t8, $zero, 1
		bluewait:
			bne $t8, $zero, bluewait	#continually check t8 to see if it equals zero
			beq $t3, $s0, _userPlay
			j loopSequence
		yellowt8:
			addi $t8, $zero, 2
		yellowwait:
			bne $t8, $zero, yellowwait 	#continually check t8 to see if it equals zero
			beq $t3, $s0, _userPlay
			j loopSequence
		greent8:
			addi $t8, $zero, 4
		greenwait:
			bne $t8, $zero, greenwait 	#continually check t8 to see if it equals zero
			beq $t3, $s0, _userPlay
			j loopSequence
		redt8:
			addi $t8, $zero, 8
		redwait:
			bne $t8, $zero, redwait 	#continually check t8 to see if it equals zero
			beq $t3, $s0, _userPlay
			j loopSequence
		
		#?????
		
	
    		
#once t8 equals zero check if we're done, then go to the top of this loop if we're not
#- ^to store past colors
#- append next color
#- temp register stores original number
#- s
#- store n (when it should stop reading)


_userPlay:
   	
   	move $t7, $s1
   	move $t3, $zero
   	move $s6, $zero

   	
   	playing:
		move $t9, $zero
	
	playwait:
		beq $t9, 1, chooseblue
		beq $t9, 2, chooseyellow
		beq $t9, 4, choosegreen
		beq $t9, 8, choosered
		j playwait
		
		chooseblue:
			addi $s2, $zero, 0
			j verify
			
		chooseyellow:
			addi $s2, $zero, 1
			j verify
			
		choosegreen:
			addi $s2, $zero, 2
			j verify

		choosered:
			addi $s2, $zero, 3
			j verify

	verify:
		andi $t6, $t7, 0x3		#interpret the next 2 bits													
		srl $t7, $t7, 2 		#delete read bits

		
		addi $t3, $t3, 1
		

		beq $t6, $s2, correct
		bne $t6, $s2, incorrect
	
	correct:
		beq $s0, 16, incorrect
		move $t8, $t9
	correctwait:
		bne $t8, $zero,correctwait
		beq $t3, $s0, new
		j playing
	
	incorrect:
		addi $t8, $zero, 15
	incorrectwait:
		bne $t8, $zero,correctwait
		move $t9, $zero
		j main

#user enters an input 
#read the input and convert it to a 2 bit value
#need 2 registers to track what the user is doing
#one to see what number we're on
#and the other corresponding to the current register of stored info that we're using
#mod division by 16, mod tells how many times to shift

	
	
	
	
	
	
