############################
# Connor Tedd
# CSC-211-302
# 3 April 2025
# min max in-class.
############################

### Data Section ###

.data
	
	count: 	.word	6							#number of elements in the array.
	.align	2									#align memory allocation to next available word (2^2 = 4 bytes).
	array:	.space	24							#array of 6 integers (6 * 4 bytes = 24).
	prompt:	.asciiz "Enter an integer: "		#user prompt.
	minLbl:	.asciiz "Your minimum value: "
	maxLbl:	.asciiz "Your maximum value: "
	endl:	.asciiz "\n"						#new line.

### Text Section ###

.text
.globl main

main:

	#prepare for array access.
	la $t0, array				#set $t0 as pointer to array.
	lw $t1, count				#storing size of array (count) in $t1.
	li $t2, 0					#set loop control ($t2) to zero.
	
INPUT:	### start of loop to populate the array. ###

	#display prompt.
	la $a0, prompt
	li $v0, 4
	syscall
	
	#read in integer.
	li $v0, 5
	syscall
	
	#store integer in array.
	sw $v0, ($t0)				#store integer in $v0 into current address of array ($t0).
	
	#increment pointer and counter.
	addi $t0, $t0, 4			#move array pointer to the next word (4 bytes).
	addi $t2, $t2, 1			#increment loop control by +1.
	
	#check to see if array is at end.
	blt $t2, $t1, INPUT
	
### end loop. ###

	#prepare for array access.
	la $t0, array				#set $t0 as pointer to array.
	li $t2, 0					#set loop control ($t2) to zero.
	
	#set min ($t3) and max ($t4) to first element.
	lw $t3, ($t0)
	lw $t4, ($t0)
	
	#increment array pointer and counter.
	addi $t0, $t0, 4
	addi $t2, $t2, 1

COMPARE:	### start of loop to find min/max. ###

	#load next array value into $t5.
	lw $t5, ($t0)
	
	#check if $t5 !< $t3.
	bge $t5, $t3, NOTMIN
	
	#assign $t5 as new min ($t3).
	move $t3, $t5

	NOTMIN:

		#check if $t5 !> $t4.
		ble $t5, $t4, NOTMAX
	
		#assign $t5 as new max ($t4).
		move $t4, $t5
		
		#jump to NOTMAX bc int isn't min.
		j NOTMAX

	NOTMAX:

		#increment array pointer and counter.
		addi $t0, $t0, 4
		addi $t2, $t2, 1	
	
		#check to see if array is at end.
		blt $t2, $t1, COMPARE
	
### end of COMPARE loop. ###

	#output minLbl.
	la $a0, minLbl
	li $v0, 4
	syscall
	
	#output min integer.
	move $a0, $t3
	li $v0, 1
	syscall
	
	#output blank line.
	la $a0, endl
	li $v0, 4
	syscall
	
	#output maxLbl.
	la $a0, maxLbl
	li $v0, 4
	syscall
	
	#output max integer.
	move $a0, $t4
	li $v0, 1
	syscall
	
	#output blank line.
	la $a0, endl
	li $v0, 4
	syscall
	
	#end program.
	li $v0, 10
	syscall 