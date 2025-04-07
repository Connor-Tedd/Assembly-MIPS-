############################
# Connor Tedd
# CSC-211-302
# 25 March 2025
# String length in-class.
############################

### Data Section ###

.data

	prompt: .asciiz "Enter some text:\n"	#Prompt user for string data.
	str:	.space	82						#Variable to store user's string.
	ans:	.asciiz "Your text length is: "	#label for output.
	endl:	.asciiz "\n"					#newline character.
	#$t0	address of $t2 character.
	#$t1	counter variable.
	#$t2	starting address of str.

### Text Section ###

.text
.globl main

main:

	#prompt user.
	la $a0,prompt
	li $v0, 4
	syscall
	
	#read in user's string.
	li $a1, 81
	la $a0, str
	li $v0, 8
	syscall
	
	#output blank line.
	la $a0, endl
	li $v0, 4
	syscall
	
	#initialize string pointer.
	la $t2, str		#load starting address of str.
	
	#initialize character counter
	li $t1, -1		#Set counter ($t1) to -1 to account for the newline character.
	
	#count characters.
WHILE:
	
	lb $t0, ($t2)			#get current byte from the string.
	
	#if zero byte is found, jump to ENDWHILE.
	beqz $t0, ENDWHILE		#exit loop when zero byte us found.
	
	#if a character is found.
	addi $t1, $t1, 1		#increment character counter by one
	addi $t2, $t2, 1		#increment address of $t2 by one.
	
	#end of loop, jump to WHILE.
	j WHILE
	
ENDWHILE:
	
	#output ans.
	la $a0, ans
	li $v0, 4
	syscall
	
	#display length.
	move $a0, $t1
	li $v0, 1
	syscall
	
	#output blank line.
	la $a0, endl
	li $v0, 4
	syscall
	
	#end program.
	li $v0, 10
	syscall
	