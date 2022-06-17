.text

beegloop:
	#beq/bne for mode check
	bne $t9, $zero, set

branch:
	beq $t6, 1, clock
	beq $t6, 0, clock
	j stopwatch

set:
	move $t6, $t9
	move $t9, $zero
	j branch

clock:
	add $t7, $zero, 8
	sll $t7, $t7, 27
	
	add $v0, $zero, 30 	
	syscall			#calls number of milliseconds since Jan 1,1970
	
				#begin division algorithm. t4 is our high quotient holder, t3 is our low quotient holder, t2 is our remainder holder
				#s7 is our divisor
toseconds:
	add $s7, $zero, 1000
	div $a1, $s7
	mflo $t4
	mfhi $t3
				#2^32 div 1000 = 4294967 remainder 296
	add $s7, $zero, 296
	mult $t3, $s7
	mflo $t2
	
	add $s7, $zero, 4294967
	mult $t3, $s7
	mflo $t3

	add $s7, $zero, 1000
	div $t2, $s7
	mflo $s7
	mfhi $t2
	add $t3, $t3, $s7
	
	add $s7, $zero, 1000
	div $a0, $s7
	mflo $s7
	mfhi $s6
	add $t3, $t3, $s7
	add $t2, $t2, $s6
	
	add $s7, $zero, 1000
	div $t2, $s7
	mflo $s7
	mfhi $t2
	addu $t3, $t3, $s7
	
	slt $t1, $t3, $s7
	bne $t1, 1, secondcalc
	
	add $t4, $t4, 1
	

secondcalc:
	move $t0, $t3
	move $t1, $t4
				#by the time we're here, we now have seconds stored in $t4 and $t3, and milliseconds stored in $t2.
	add $s7, $zero, 60
	div $t1, $s7
	mflo $t4
	mfhi $t3
				#2^32 div 60 = 71582788 remainder 16
	add $s7, $zero, 16
	mult $t3, $s7
	mflo $t2
	
	add $s7, $zero, 71582788
	mult $t3, $s7
	mflo $t3

	add $s7, $zero, 60
	div $t2, $s7
	mflo $s7
	mfhi $t2
	add $t3, $t3, $s7
	
	add $s7, $zero, 60
	div $t0, $s7
	mflo $s7
	mfhi $s6
	add $t3, $t3, $s7
	add $t2, $t2, $s6
	
	add $s7, $zero, 60
	div $t2, $s7
	mflo $s7
	mfhi $t2
	addu $t3, $t3, $s7
	
	slt $t1, $t3, $s7
	bne $t1, 1, addseconds
	
	add $t4, $t4, 1

addseconds:
	add $s4, $zero, $t2

minutecalc:
	move $t0, $t3
	move $t1, $t4
				#by the time we're here, we now have seconds stored in $t4 and $t3, and milliseconds stored in $t2.
	add $s7, $zero, 60
	div $t1, $s7
	mflo $t4
	mfhi $t3
				#2^32 div 60 = 71582788 remainder 16
	add $s7, $zero, 16
	mult $t3, $s7
	mflo $t2
	
	add $s7, $zero, 71582788
	mult $t3, $s7
	mflo $t3

	add $s7, $zero, 60
	div $t2, $s7
	mflo $s7
	mfhi $t2
	add $t3, $t3, $s7
	
	add $s7, $zero, 60
	div $t0, $s7
	mflo $s7
	mfhi $s6
	add $t3, $t3, $s7
	add $t2, $t2, $s6
	
	add $s7, $zero, 60
	div $t2, $s7
	mflo $s7
	mfhi $t2
	addu $t3, $t3, $s7
	
	slt $t1, $t3, $s7
	bne $t1, 1, addminutes
	
	add $t4, $t4, 1

addminutes:
	sll $t2, $t2, 6
	add $s4, $s4, $t2
	

hourcalc:
	move $t0, $t3
	move $t1, $t4
				#by the time we're here, we now have seconds stored in $t4 and $t3, and milliseconds stored in $t2.
	add $s7, $zero, 24
	div $t1, $s7
	mflo $t4
	mfhi $t3
				#2^32 div 24 = 71582788 remainder 16
	add $s7, $zero, 16
	mult $t3, $s7
	mflo $t2
	
	add $s7, $zero, 178956970
	mult $t3, $s7
	mflo $t3

	add $s7, $zero, 24
	div $t2, $s7
	mflo $s7
	mfhi $t2
	add $t3, $t3, $s7
	
	add $s7, $zero, 24
	div $t0, $s7
	mflo $s7
	mfhi $s6
	add $t3, $t3, $s7
	add $t2, $t2, $s6
	add $s7, $zero, 20
	add $t2, $t2, $s7
	
	add $s7, $zero, 24
	div $t2, $s7
	mflo $s7
	mfhi $t2
	addu $t3, $t3, $s7
	
	slt $t1, $t3, $s7
	bne $t1, 1, addhours
	
	add $t4, $t4, 1

addhours:
	sll $t2, $t2, 12
	add $s4, $s4, $t2


dotime:

	add $t8, $t7, $s4	#add s4 to t8
	
	j beegloop

stopwatch:
	move $s4, $t5
	add $t7, $zero, 21
	sll $t7, $t7, 27
	add $t8, $t7, $s4
	
	add $v0, $zero, 30 	
	syscall			#calls number of milliseconds since Jan 1,1970
	
	move $s1, $a0		#get time
	sub $s1, $s1, $s5
	
	#move $s4, $s5

	bne $t9, $zero, setc

branchc:
	beq $t6, 3, start
	beq $t6, 5, reset
	j beegloop

setc:
	move $t6, $t9
	move $t9, $zero
	j branchc
	
start:
	add $v0, $zero, 30 	
	syscall			#calls number of milliseconds since Jan 1,1970
	
	move $s2, $a0 		#get time
	sub $s2, $s2, $s1
	
	add $t7, $zero, 2
	sll $t7, $t7, 27
	add $t8, $t7, $s4
	
localloop:
	move $s3, $s2
	add $s7, $zero, 1000
	div $s3, $s7
	mflo $s3
	
	add $s7, $zero, 60
	div $s3, $s7
	mflo $s3
	mfhi $s7
	add $s4, $zero, $s7

	add $s7, $zero, 60
	div $s3, $s7
	mflo $s3
	mfhi $s7
	sll $s7, $s7, 6
	add $s4, $s4, $s7

	add $s7, $zero, 24
	div $s3, $s7
	mflo $s3
	mfhi $s7
	sll $s7, $s7, 12
	add $s4, $s4, $s7
	move $t5, $s4

dotimesw:

	add $t8, $t7, $s4	#add s4 to t8
	

buttonpress:
	bne $t9, $zero, setb

branchb:
	beq $t6, 3, start	#if on start, go to localloop
	beq $t6, 4, save 	#if on stop save v4 as v5'
	j beegloop

setb:
	move $t6, $t9
	move $t9, $zero
	j branchb

save: 
	#add $t7, $zero, 21
	#sll $t7, $t7, 27
	#add $t8, $t7, $s4
	add $t6, $zero, 2
	move $s5, $s2
	move $t5, $s4
	j beegloop

reset:
	add $t7, $zero, 21
	sll $t7, $t7, 27
	move $t8, $t7
	add $s6, $zero, 2
	move $s5, $zero		#v5 = 0
	move $s4, $zero
	move $t5, $zero
	j beegloop

exit:	
	addi $v0, $zero, 10	# Terminate the program
	syscall			# Exit
	
