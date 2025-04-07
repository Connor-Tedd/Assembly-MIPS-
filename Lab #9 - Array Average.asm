#################################
# Connor Tedd
# CSC-211-302
# 1 April 2025
# Lab #9 - Array Average.
#################################

### Data Section ###

.data

	prompt:	.asciiz "Enter an integer: "		#user prompt.
	endl:	.asciiz "\n"						#new line.
	high:	.asciiz "Remainder: "
	low:	.asciiz "Quotient: "
	.align 2
	array:	.space	40							#array of 10 integers (4 bytes each).
	
### Text Section ###

.text
.globl main

main:
	
	#set pointers and counters.
	la $t0, array		#load base address of array into $t0.
	li $t1, 10			#load size of array (5) into $t1.
	li $t2, 0			#initalize loop control variable ($t2) to zero.
	li $t3, 0			#initalize $t3 to zero for storing sum of integers.
	
### start of loop to populate array. ##
INPUT:
	
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
	
### end loop ###.

	#newline
	la $a0, endl
	li $v0, 4
	syscall
	
	#reset pointers and counters.
	la $t0, array
	li $t2, 0
	
### start of loop to add all numbers in array. ###
ADD:
	
	#load array[i].
	lw $t4, ($t0)		#load word from array[i] into $t3.
	
	#add array[i]
	add $t3, $t3, $t4
	
	#increment pointer and counter.
	addi $t0, $t0, 4	#move array pointer to the next element (4 bytes).
	addi $t2, $t2, 1	#increment loop control by +1.
	
	#branch back to add.
	blt $t2, $t1, ADD

### end loop. ###

	#get average.
	li $t4, 10			#store 10 into $t4.
	div $t3, $t4
	mfhi $t6
	mflo $t5
	
	#LO message.
	la $a0, low
	li $v0, 4
	syscall
	
	#display low average.
	move $a0, $t5
	li $v0, 1
	syscall
	
	#newline
	la $a0, endl
	li $v0, 4
	syscall
	
	#HI message.
	la $a0, high
	li $v0, 4
	syscall
	
	#display high average.
	move $a0, $t6
	li $v0, 1
	syscall
	
	#end program.
	li $v0, 10
	syscall 