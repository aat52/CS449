# Angela Tseng
#
# Part I: works perfectly
# Part II: works perfectly
# Part III: works perfectly
# Part IV: works perfectly
# Part V: 

.data
	buffer: 	.space 8
	newline: 	.asciiz " \t\n\n"
	prompt:		.asciiz	"\n\nEnter an instruction in 8-digit hexadecimal: "
	binary:		.asciiz	"\n32-bit Binary: "
	operationtext:	.asciiz	"\n\t Operation: "
	format:		.asciiz	"\n\t    Format: "
	op:		.asciiz	"\n\t\top: "
	rs:		.asciiz	"\n\t\trs: "
	rt:		.asciiz	"\n\t\trt: "
	rd:		.asciiz	"\n\t\trd: "
	shamt:		.asciiz	"\n\t     shamt: "
	funct:		.asciiz	"\n\t     funct: "
	imm:		.asciiz	"\n\t       imm: "
	address:	.asciiz "\n\t      addr: "
	instruction:	.asciiz	"\n       Instruction: "
	
	Rformattext:	.asciiz	"R "
	Iformattext:	.asciiz	"I "
	Jformattext:	.asciiz	"J "
	
	addop:		.asciiz	"add  "
	addiop:		.asciiz	"addi  "
	andop:		.asciiz	"and  "
	andiop:		.asciiz	"andi  "
	subop:		.asciiz	"sub  "
	orop:		.asciiz	"or  " 
	oriop:		.asciiz	"ori  "
	norop:		.asciiz	"nor  "
	sltop:		.asciiz	"slt  "
	sltiop:		.asciiz	"slti  "
	sllop:		.asciiz	"sll  "
	srlop:		.asciiz	"srl  "
	beqop:		.asciiz	"beq  "
	bneop:		.asciiz	"bne  "
	jop:		.asciiz	"j  "
	jalop:		.asciiz	"jal  "
	jrop:		.asciiz	"jr  "
	lwop:		.asciiz	"lw  "
	swop:		.asciiz	"sw  "
	lhop:		.asciiz	"lh  "
	shop:		.asciiz	"sh  "
	lbop:		.asciiz	"lb  "
	sbop:		.asciiz	"sb  "
	one:		.asciiz	"1"
	two:		.asciiz	"2"
	three:		.asciiz	"3"
	four:		.asciiz	"4"
	five:		.asciiz	"5"	
	six:		.asciiz	"6"	
	seven:		.asciiz	"7"
	eight:		.asciiz	"8"
	nine:		.asciiz	"9"
	zero:		.asciiz	"0"
	A:		.asciiz	"A"
	B:		.asciiz	"B"
	C:		.asciiz	"C"
	D:		.asciiz	"D"
	E:		.asciiz	"E"
	F:		.asciiz	"F"
	a:		.asciiz	"a"
	b:		.asciiz	"b"
	c:		.asciiz	"c"
	d:		.asciiz	"d"
	e:		.asciiz	"e"
	f:		.asciiz	"f"
	
	zeero:		.asciiz	"$zero"
	v0:		.asciiz	"$v0"
	v1:		.asciiz	"$v1"
	a0:		.asciiz	"$a0"
	a1:		.asciiz	"$a1"
	a2:		.asciiz	"$a2"
	a3:		.asciiz	"$a3"
	t0:		.asciiz	"$t0"
	t1:		.asciiz	"$t1"
	t2:		.asciiz	"$t2"
	t3:		.asciiz	"$t3"
	t4:		.asciiz	"$t4"
	t5:		.asciiz	"$t5"
	t6:		.asciiz	"$t6"
	t7:		.asciiz	"$t7"
	s0:		.asciiz	"$s0"
	s1:		.asciiz	"$s1"
	s2:		.asciiz	"$s2"
	s3:		.asciiz	"$s3"
	s4:		.asciiz	"$s4"
	s5:		.asciiz	"$s5"
	s6:		.asciiz	"$s6"
	s7:		.asciiz	"$s7"
	t8:		.asciiz	"$t8"
	t9:		.asciiz	"$t9"
	sp:		.asciiz	"$sp"
	ra:		.asciiz	"$ra"
	
	label:		.asciiz "label"
	
	paren1:		.asciiz "("
	paren2:		.asciiz ") "
	minus:		.asciiz "-"
	
	comma:		.asciiz ", "
	
	bye:		.asciiz "Bye!"
							
.text
start:
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, prompt	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
         li $v0,8 #take in input
         la $a0, buffer #load byte space into address
         li $a1, 9 # allot the byte space for string
         move $t0,$a0 #save string to t0
         syscall
         
         

begin:
	la $s0, ($t0)     #s0 will hold message that will be iterated through
	li $t0, 0       #t0 will be iterator, starting at 0
	move $s5, $zero
	move $s6, $zero

loop:
	add $s1, $s0, $t0    
	lb $s2, 0($s1)      #Loading char to shift into $s2
	beq $s2, $zero, tobin    #Breaking the loop if we've reached the end
	sll $s5, $s5, 4
	la $s4, one
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, oneset
	la $s4, two
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, twoset
	la $s4, three
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, threeset
	la $s4, four
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, fourset
	la $s4, five
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, fiveset
	la $s4, six
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, sixset
	la $s4, seven
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, sevenset
	la $s4, eight
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, eightset
	la $s4, nine
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, nineset
	la $s4, zero
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, zeroset
	la $s4, a
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, aset
	la $s4, A
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, aset
	la $s4, b
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, bset
	la $s4, B
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, bset
	la $s4, c
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, cset
	la $s4, C
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, cset
	la $s4, d
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, dset
	la $s4, D
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, dset
	la $s4, e
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, eset
	la $s4, E
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, eset
	la $s4, f
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, fset
	la $s4, F
	add $s3, $s4, $zero    
	lb $s3, 0($s3)
	beq $s2, $s3, fset
	
	la $a0, bye
	addi $v0, $zero, 4
	syscall 
	
	addi $v0, $zero, 10
    	syscall

finishloop:
	addi $t0, $t0, 1    #i++
	j loop    #Go back to the beginning of the loop
	
oneset:
	addu $s6, $zero, 1
	addu $s5, $s5, $s6
	j finishloop
twoset:
	addu $s6, $zero, 2
	addu $s5, $s5, $s6
	j finishloop
threeset:
	addu $s6, $zero, 3
	addu $s5, $s5, $s6
	j finishloop
fourset:
	addu $s6, $zero, 4
	addu $s5, $s5, $s6
	j finishloop
fiveset:
	addu $s6, $zero, 5
	addu $s5, $s5, $s6
	j finishloop
sixset:
	addu $s6, $zero, 6
	addu $s5, $s5, $s6
	j finishloop
sevenset:
	addu $s6, $zero, 7
	addu $s5, $s5, $s6
	j finishloop
eightset:
	addu $s6, $zero, 8
	addu $s5, $s5, $s6
	j finishloop
nineset:
	addu $s6, $zero, 9
	addu $s5, $s5, $s6
	j finishloop
zeroset:
	addu $s6, $zero, 0
	addu $s5, $s5, $s6
	j finishloop
aset:
	addu $s6, $zero, 10
	addu $s5, $s5, $s6
	j finishloop
bset:
	addu $s6, $zero, 11
	addu $s5, $s5, $s6
	j finishloop
cset:
	addu $s6, $zero, 12
	addu $s5, $s5, $s6
	j finishloop
dset:
	addu $s6, $zero, 13
	addu $s5, $s5, $s6
	j finishloop
eset:
	addu $s6, $zero, 14
	addu $s5, $s5, $s6
	j finishloop
fset:
	addu $s6, $zero, 15
	addu $s5, $s5, $s6
	j finishloop
	
tobin:
#convert decimal to binary
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, binary	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	move $s0, $s5

#part1 to 32-bit		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
 
binloop: 
	beq $t0,-1,read_op_funct   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,after_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

after_shift: 
 	move $a0,$t3              #prepare bit for print 
  	syscall                   #print bit 
 
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j binloop 

#read opcode
read_op_funct:
	move $t7, $s0
	srl $s1, $s0, 26
	sll $s2, $s0, 26
	srl $s2, $s2, 26
	j operation

#part 2 operation
operation:
#check op, and if necessary, funct
	beq $s1, 0, checkfunct
	beq $s1, 8, printaddi
	beq $s1, 12, printandi
	beq $s1, 13, printori
	beq $s1, 10, printslti
	beq $s1, 4, printbeq
	beq $s1, 5, printbne
	beq $s1, 2, printj
	beq $s1, 3, printjal
	beq $s1, 35, printlw
	beq $s1, 43, printsw
	beq $s1, 33, printlh
	beq $s1, 41, printsh
	beq $s1, 32, printlb
	beq $s1, 40, printsb
		
checkfunct:
	beq $s2, 32, printadd
	beq $s2, 36, printand
	beq $s2, 34, printsub
	beq $s2, 37, printor
	beq $s2, 39, printnor
	beq $s2, 42, printslt
	beq $s2, 0, printsll
	beq $s2, 2, printsrl
	beq $s2, 8, printjr

printadd:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, addop
	addi $v0, $zero, 4
	syscall 
	
	j Rformat

printaddi:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, addiop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat
	
printand:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, andop
	addi $v0, $zero, 4
	syscall 
	
	j Rformat
	
printandi:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, andiop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat

printsub:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, subop
	addi $v0, $zero, 4
	syscall 
	
	j Rformat

printor:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, orop
	addi $v0, $zero, 4
	syscall 
	
	j Rformat

printori:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, oriop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat
	
printnor:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, norop
	addi $v0, $zero, 4
	syscall 
	
	j Rformat
	
printslt:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, sltop
	addi $v0, $zero, 4
	syscall 
	
	j Rformat
	
printslti:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 
	
	la $a0, sltiop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat

printsll:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, sllop
	addi $v0, $zero, 4
	syscall 
	
	j Rformat

printsrl:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, srlop
	addi $v0, $zero, 4
	syscall 
	
	j Rformat

printbeq:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, beqop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat

printbne:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, bneop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat

printj:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, jop
	addi $v0, $zero, 4
	syscall 
	
	j Jformat

printjal:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, jalop
	addi $v0, $zero, 4
	syscall 
	
	j Jformat
	
printjr:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, jrop
	addi $v0, $zero, 4
	syscall 
	
	j Rformat

printlw:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, lwop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat

printsw:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, swop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat

printlh:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 

	la $a0, lhop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat

printsh:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 
	
	la $a0, shop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat
	
printlb:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 
	
	la $a0, lbop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat
	
printsb:
	la $a0, operationtext
	addi $v0, $zero, 4
	syscall 
	
	la $a0, sbop
	addi $v0, $zero, 4
	syscall 
	
	j Iformat

#part 3 format
Rformat:
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, format	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	la $a0, Rformattext
	addi $v0, $zero, 4
	syscall
	
	j _Rdissection
	
Iformat:
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, format	# Set $a0 to the address referred by prompt
	syscall			# Print prompt

	la $a0, Iformattext
	addi $v0, $zero, 4
	syscall 
	
	j _Idissection
	
Jformat:
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, format	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
		
	la $a0, Jformattext
	addi $v0, $zero, 4
	syscall 
	
	j _Jdissection

#send to dissecting parts of binary
_Rdissection:
	#print op
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, op	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	move $s0, $s1
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
	addi $t8, $zero, 6		#t8 is the length of the section
	
 
opbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,opincrement
	beq $t0,-1,rsbin   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,opafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

opafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
opincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j opbinloop 

rsbin: 
#print rs
	
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, rs	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	move $s0, $t7
	#RS IS IN T5
	move $t5, $s0
	sll $t5, $t5, 6
	srl $t5, $t5, 27
	
	
	move $s0, $t5 
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
 	addi $t8, $zero, 5		#t8 is the length of the section
 	
rsbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,rsincrement
	beq $t0,-1,rtbin   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,rsafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

rsafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
rsincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j rsbinloop 

rtbin: 
#print rt
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, rt	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	move $s0, $t7
	#RT IS IN T4
	move $t4, $s0
	sll $t4, $t4, 11
	srl $t4, $t4, 27
	move $s0, $t4
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
  	addi $t8, $zero, 5		#t8 is the length of the section
 	
rtbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,rtincrement
	beq $t0,-1,rdbin   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,rtafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

rtafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
rtincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j rtbinloop 
 
rdbin: 
#print shamt
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, rd	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	move $s0, $t7
	#put rd in s5
	move $s5, $s0
	sll $s5, $s5, 16
	srl $s5, $s5, 27
	move $s0, $s5
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
  	addi $t8, $zero, 5		#t8 is the length of the section
 	
rdbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,rdincrement
	beq $t0,-1, shamtbin   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,rdafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

rdafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
rdincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j rdbinloop 				
 	
shamtbin: 
#print shamt
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, shamt	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	move $s0, $t7
	#put shamt in s6
	move $s6, $s0
	sll $s6, $s6, 21
	srl $s6, $s6, 27
	move $s0, $s6
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
  	addi $t8, $zero, 5		#t8 is the length of the section
 	
shamtbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,shamtincrement
	beq $t0,-1, functbin   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,shamtafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

shamtafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
shamtincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j shamtbinloop 	
 	
functbin: 
#print funct
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, funct	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	move $s0, $t7
	#put shamt in s6
	move $t6, $s0
	sll $t6, $t6, 27
	srl $t6, $t6, 27
	move $s0, $t6
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
  	addi $t8, $zero, 6		#t8 is the length of the section
 	
functbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,functincrement
	beq $t0,-1, _instructioncheck   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,functafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

functafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
functincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j functbinloop 	 	
	
#dissect I format
_Idissection:
#print op
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, op	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	move $s0, $s1
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
	addi $t8, $zero, 6		#t8 is the length of the section
	
 
Iopbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,Iopincrement
	beq $t0,-1,Irsbin   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,Iopafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

Iopafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
Iopincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j Iopbinloop 

Irsbin: 
#print rs
	
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, rs	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	move $s0, $t7
	#RS IS IN T5
	move $t5, $s0
	sll $t5, $t5, 6
	srl $t5, $t5, 27
	
	
	move $s0, $t5 
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
 	addi $t8, $zero, 5		#t8 is the length of the section
 	
Irsbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,Irsincrement
	beq $t0,-1,Irtbin   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,Irsafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

Irsafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
Irsincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j Irsbinloop 

Irtbin: 
#print rt
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, rt	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	move $s0, $t7
	#RT IS IN T4
	move $t4, $s0
	sll $t4, $t4, 11
	srl $t4, $t4, 27
	move $s0, $t4
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
  	addi $t8, $zero, 5		#t8 is the length of the section
 	
Irtbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,Irtincrement
	beq $t0,-1,Iimmbin   #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,Irtafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

Irtafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
Irtincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j Irtbinloop 
 
Iimmbin: 
#print imm
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, imm	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	move $s0, $t7
	#INSERT SRL AND SLL ISOLATION ALGORISTHM HERE
	#HELLO READ ME
	#IMM IS IN S7
	move $s7, $s0
	sll $s7, $s7, 16
	srl $s7, $s7, 16

	move $s0, $s7
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
 	addi $t8, $zero, 15		#t8 is the length of the section
 	
Iimmbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,Iimmincrement
	beq $t0,-1, _instructioncheck  #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0,Iimmafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

Iimmafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
Iimmincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j Iimmbinloop 
 
 #dissect J format binary
_Jdissection:
#print op
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, op	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	move $s0, $s1
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
	addi $t8, $zero, 6		#t8 is the length of the section
	
 
Jopbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,Jopincrement
	beq $t0,-1,Jaddbin  #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0, Jopafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

Jopafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
Jopincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j Jopbinloop 

Jaddbin:
#print address
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, address	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	move $s7, $t7
	sll $s7, $s7, 6
	srl $s7, $s7, 6

	move $s0, $s7
		
	addiu $t0,$zero,31          #(t0) i == 31 (the counter) 
	li $t1,1                    #(t1) mask 
	sll $t1,$t1,31            
	li $v0,1                    #prepare system call for printing values 
	addi $t8, $zero, 26		#t8 is the length of the section
	
 
Jaddbinloop:
	slt $t9, $t0, $t8
	beq $t9, $zero,Jaddincrement
	beq $t0,-1,_instructioncheck  #if t0 == -1 exit loop 
 	and $t3,$s0,$t1           #isolate the bit 
  	beq $t0,$0, Jaddafter_shift    #shift is needed only if t0 > 0 
  	srlv $t3,$t3,$t0          #right shift before display 

Jaddafter_shift: 
 	move $a0,$t3              #prepare bit for print 
 	addi $v0, $zero, 1
  	syscall                   #print bit 
Jaddincrement:
  	subi $t0, $t0, 1          #decrease the counter 
  	srl $t1,$t1, 1            #right shift the mask 
 	j Jaddbinloop 


_instructioncheck:
	
	#if op == add,and,or,nor, slt,sub
	#if op == jr
	#if op == j, jal 
	#if op == addi,andi,ori,slti, sll, srl
	#if op = beq, bne 
	#if op == lh, lw, lb, sb, sh, sw
	
_bittoregister:
#print instruction
	move $ra, $zero
	la $a0, instruction
	addi $v0, $zero, 4
	syscall 
	
_opbittoregister:
#match op bit to print, if necessary check funct
	beq $s1, 0, opcheckfunct
	beq $s1, 8, opprintaddi
	beq $s1, 12, opprintandi
	beq $s1, 13, opprintori
	beq $s1, 10, opprintslti
	beq $s1, 4, opprintbeq
	beq $s1, 5, opprintbne
	beq $s1, 2, opprintj
	beq $s1, 3, opprintjal
	beq $s1, 35, opprintlw
	beq $s1, 43, opprintsw
	beq $s1, 33, opprintlh
	beq $s1, 41, opprintsh
	beq $s1, 32, opprintlb
	beq $s1, 40, opprintsb
		
opcheckfunct:
	beq $s2, 32, opprintadd
	beq $s2, 36, opprintand
	beq $s2, 34, opprintsub
	beq $s2, 37, opprintor
	beq $s2, 39, opprintnor
	beq $s2, 42, opprintslt
	beq $s2, 0, opprintsll
	beq $s2, 2, opprintsrl
	beq $s2, 8, opprintjr

opprintadd:

	la $a0, addop
	addi $v0, $zero, 4
	syscall 
	
	jal _rdbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintaddi:

	la $a0, addiop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister

	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start
	
opprintand:
	la $a0, andop
	addi $v0, $zero, 4
	syscall 
	
	jal _rdbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start
	
opprintandi:

	la $a0, andiop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister

	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
		
	j start

opprintsub:
	la $a0, subop
	addi $v0, $zero, 4
	syscall 
	
	jal _rdbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintor:

	la $a0, orop
	addi $v0, $zero, 4
	syscall 
	
	jal _rdbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintori:

	la $a0, oriop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister

	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
		
	j start
	
opprintnor:
	la $a0, norop
	addi $v0, $zero, 4
	syscall 
	
	jal _rdbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start
	
opprintslt:

	la $a0, sltop
	addi $v0, $zero, 4
	syscall 
	
	jal _rdbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start
	
opprintslti:
	
	la $a0, sltiop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister

	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
		
	j start

opprintsll:

	la $a0, sllop
	addi $v0, $zero, 4
	syscall 
	
	jal _rdbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _shamtbitprint
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintsrl:

	la $a0, srlop
	addi $v0, $zero, 4
	syscall 
	
	jal _rdbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _shamtbitprint
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintbeq:

	la $a0, beqop
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal labelprint
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintbne:

	la $a0, bneop
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal labelprint
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintj:

	la $a0, jop
	addi $v0, $zero, 4
	syscall 
	
	jal labelprint
	
	j start


opprintjal:
	la $a0, jalop
	addi $v0, $zero, 4
	syscall 
	
	jal labelprint
	
	j start

	
opprintjr:

	la $a0, jrop
	addi $v0, $zero, 4
	syscall 
	
	jal printra
	
	j start


opprintlw:
	la $a0, lwop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, paren1
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, paren2
	addi $v0, $zero, 4
	syscall 
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintsw:

	la $a0, swop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, paren1
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, paren2
	addi $v0, $zero, 4
	syscall 
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintlh:

	la $a0, lhop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, paren1
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, paren2
	addi $v0, $zero, 4
	syscall 
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start

opprintsh:
	
	la $a0, shop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, paren1
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, paren2
	addi $v0, $zero, 4
	syscall 
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start
	
opprintlb:
	
	la $a0, lbop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, paren1
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, paren2
	addi $v0, $zero, 4
	syscall 
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start
	
opprintsb:
	la $a0, sbop
	addi $v0, $zero, 4
	syscall 
	
	jal _rtbittoregister
	
	la $a0, comma
	addi $v0, $zero, 4
	syscall 
	
	jal _immbitprint
	
	la $a0, paren1
	addi $v0, $zero, 4
	syscall 
	
	jal _rsbittoregister
	
	la $a0, paren2
	addi $v0, $zero, 4
	syscall 
	
	la $a0, newline
	addi $v0, $zero, 4
	syscall 
	
	j start


_rsbittoregister:
#match rs to register
	beq $t5, 0, rszero
	beq $t5, 2, rsv0
	beq $t5, 3, rsv1
	beq $t5, 4, rsa0
	beq $t5, 5, rsa1
	beq $t5, 6, rsa2
	beq $t5, 7, rsa3
	beq $t5, 8, rst0
	beq $t5, 9, rst1
	beq $t5, 10, rst2
	beq $t5, 11, rst3
	beq $t5, 12, rst4
	beq $t5, 13, rst5
	beq $t5, 14, rst6
	beq $t5, 15, rst7
	beq $t5, 16, rss0
	beq $t5, 17, rss1
	beq $t5, 18, rss2
	beq $t5, 19, rss3
	beq $t5, 20, rss4
	beq $t5, 21, rss5
	beq $t5, 22, rss6
	beq $t5, 23, rss7
	beq $t5, 24, rst8
	beq $t5, 25, rst9
	beq $t5, 29, rssp
	beq $t5, 31, rsra
	
rszero:
	la $a0, zeero
	addi $v0, $zero, 4
	syscall 
	
	
	jr $ra

rsv0:
	la $a0, v0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rsv1:
	la $a0, v1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rsa0:
	la $a0, a0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rsa1:
	la $a0, a1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rsa2:
	la $a0, a2
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rsa3:
	la $a0, a3
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rst0:
	la $a0, t0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rst1:
	la $a0, t1
	addi $v0, $zero, 4
	syscall 
	
	
	jr $ra

rst2:
	la $a0, t2
	addi $v0, $zero, 4
	syscall 
	
	
	jr $ra

rst3:
	la $a0, t3
	addi $v0, $zero, 4
	syscall 
	
	
	jr $ra

rst4:
	la $a0, t4
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rst5:
	la $a0, t5
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rst6:
	la $a0, t6
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rst7:
	la $a0, t7
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rss0:
	la $a0, s0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rss1:
	la $a0, s1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rss2:
	la $a0, s2
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rss3:
	la $a0, s3
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rss4:
	la $a0, s4
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rss5:
	la $a0, s5
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rss6:
	la $a0, s6
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rss7:
	la $a0, s7
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rst8:
	la $a0, t8
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rst9:
	la $a0, t9
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rssp:
	la $a0, sp
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rsra:
	la $a0, ra
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

_rtbittoregister:
#match rt to register
	beq $t4, 0, rtzero
	beq $t4, 2, rtv0
	beq $t4, 3, rtv1
	beq $t4, 4, rta0
	beq $t4, 5, rta1
	beq $t4, 6, rta2
	beq $t4, 7, rta3
	beq $t4, 8, rtt0
	beq $t4, 9, rtt1
	beq $t4, 10, rtt2
	beq $t4, 11, rtt3
	beq $t4, 12, rtt4
	beq $t4, 13, rtt5
	beq $t4, 14, rtt6
	beq $t4, 15, rtt7
	beq $t4, 16, rts0
	beq $t4, 17, rts1
	beq $t4, 18, rts2
	beq $t4, 19, rts3
	beq $t4, 20, rts4
	beq $t4, 21, rts5
	beq $t4, 22, rts6
	beq $t4, 23, rts7
	beq $t4, 24, rtt8
	beq $t4, 25, rtt9
	beq $t4, 29, rtsp
	beq $t4, 31, rtra
	
rtzero:
	la $a0, zeero
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
rtv0:
	la $a0, v0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rtv1:
	la $a0, v1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rta0:
	la $a0, a0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rta1:
	la $a0, a1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rta2:
	la $a0, a2
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rta3:
	la $a0, a3
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rtt0:
	la $a0, t0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rtt1:
	la $a0, t1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rtt2:
	la $a0, t2
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rtt3:
	la $a0, t3
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rtt4:
	la $a0, t4
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rtt5:
	la $a0, t5
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rtt6:
	la $a0, t6
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rtt7:
	la $a0, t7
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rts0:
	la $a0, s0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rts1:
	la $a0, s1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rts2:
	la $a0, s2
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rts3:
	la $a0, s3
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rts4:
	la $a0, s4
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rts5:
	la $a0, s5
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rts6:
	la $a0, s6
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rts7:
	la $a0, s7
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rtt8:
	la $a0, t8
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
rtt9:
	la $a0, t9
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rtsp:
	la $a0, sp
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rtra:
	la $a0, ra
	addi $v0, $zero, 4
	syscall 
	
	jr $ra


_rdbittoregister:
#match rd to register
	beq $s5, 0, rdzero
	beq $s5, 2, rdv0
	beq $s5, 3, rdv1
	beq $s5, 4, rda0
	beq $s5, 5, rda1
	beq $s5, 6, rda2
	beq $s5, 7, rda3
	beq $s5, 8, rdt0
	beq $s5, 9, rdt1
	beq $s5, 10, rdt2
	beq $s5, 11, rdt3
	beq $s5, 12, rdt4
	beq $s5, 13, rdt5
	beq $s5, 14, rdt6
	beq $s5, 15, rdt7
	beq $s5, 16, rds0
	beq $s5, 17, rds1
	beq $s5, 18, rds2
	beq $s5, 19, rds3
	beq $s5, 20, rds4
	beq $s5, 21, rds5
	beq $s5, 22, rds6
	beq $s5, 23, rds7
	beq $s5, 24, rdt8
	beq $s5, 25, rdt9
	beq $s5, 29, rdsp
	beq $s5, 31, rdra
	
rdzero:
	la $a0, zeero
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
rdv0:
	la $a0, v0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rdv1:
	la $a0, v1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rda0:
	la $a0, a0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rda1:
	la $a0, a1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rda2:
	la $a0, a2
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rda3:
	la $a0, a3
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rdt0:
	la $a0, t0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rdt1:
	la $a0, t1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rdt2:
	la $a0, t2
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rdt3:
	la $a0, t3
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rdt4:
	la $a0, t4
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rdt5:
	la $a0, t5
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rdt6:
	la $a0, t6
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rdt7:
	la $a0, t7
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rds0:
	la $a0, s0
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rds1:
	la $a0, s1
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rds2:
	la $a0, s2
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rds3:
	la $a0, s3
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rds4:
	la $a0, s4
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rds5:
	la $a0, s5
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rds6:
	la $a0, s6
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rds7:
	la $a0, s7
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rdt8:
	la $a0, t8
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
rdt9:
	la $a0, t9
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
rdsp:
	la $a0, sp
	addi $v0, $zero, 4
	syscall 
	
	jr $ra

rdra:
	la $a0, ra
	addi $v0, $zero, 4
	syscall 
	
	jr $ra
	
_immbitprint:
	
	move $t9, $s7
	srl $t9, $t9, 15
	bne $t9, 1, addimmprint
	
subimmprint:
	subi $t9, $s7, 65536
	j _immbitprintinging
	
addimmprint:
	move $t9, $s7

_immbitprintinging:
	move $a0, $t9
	addi $v0, $zero, 1
	syscall 
	
	jr $ra

_shamtbitprint:
#print shamt
	move $a0, $s6
	addi $v0, $zero, 1
	syscall 
	
	jr $ra

labelprint:
#print label
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, label	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	jr $ra
	
printra:
#print ra
	addi $v0, $zero, 4	# Syscall 4: Print string
	la   $a0, ra	# Set $a0 to the address referred by prompt
	syscall			# Print prompt
	
	jr $ra

exit:
	addi $v0, $zero, 10	# Syscall 10: Terminate program
	syscall			# Terminate Program
