############################
# Connor Tedd
# CSC-211-302
# 27 March 2025
# Zero Offset in-class.
############################

### Data Section ###

.data
	
	prompt:	.asciiz "Enter an integer: "		#user prompt.
	endl:	.asciiz "\n"						#new line.
	output:	.asciiz "Contents of the array:\n"	#label for output.
	.align 2
	array:	.space	20							#array of 5 integers (4 bytes each).


### Text Section ###

.text
.globl main

main:

	#set pointers and counters.
	la $t0, array		#load base address of array into $t0.
	li $t1, 5			#load size of array (5) into $t1.
	li $t2, 0			#initalize loop control variable ($t2) to zero.
	
INPUT:					#populate the array.
	
	#display prompt.
	la $a0, prompt
	li $v0, 4
	syscall
	
	#read in integer.
	li $v0, 5
	syscall
	
	#store integer in array.
	sw $v0, ($t0)		#store integer in $v0 into current address of array ($t0).
	
	#increment pointer and counter.
	addi $t0, $t0, 4	#move array pointer to the next element (4 bytes).
	addi $t2, $t2, 1	#increment loop control by +1.
	
	#branch back while counter < size of array.
	blt $t2, $t1, INPUT
	
#end loop.
	
	#newline
	la $a0, endl
	li $v0, 4
	syscall
	
	#display output.
	la $a0, output
	li $v0, 4
	syscall
	
	#reset pointers and counters.
	la $t0, array
	li $t2, 0
	
OUTPUT:					#display array.
	
	#print individual integer element.
	lw $t3, ($t0)		#load word from array[i] into $t3.
	move $a0, $t3		#move array[i] into $a0 for printing.
	li $v0, 1
	syscall

	#newline
	la $a0, endl
	li $v0, 4
	syscall

	#increment pointer and counter.
	addi $t0, $t0, 4	#move array pointer to the next element (4 bytes).
	addi $t2, $t2, 1	#increment loop control by +1.
	
	#branch back while counter < size of array.
	blt $t2, $t1, OUTPUT
	
#end loop.

	#newline
	la $a0, endl
	li $v0, 4
	syscall
	
	#end program.
	li $v0, 10
	syscall 