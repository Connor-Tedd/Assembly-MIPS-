###############################################################
# Program:        Lab #3 - Input/Output
# Author:         Connor Tedd
# Date:           03/02/2025
# Course/Section: CSC-211-302
# Description:
#   Output messages asking user questions then outputting their answers.
###############################################################

.text
.globl main

main:

	# Name Prompt.
	la $a0,namePrompt 		# load address of namePrompt into $a0.
	li $v0,4        		# load instruction number to display a string(4) into $v0.
	syscall         		# system call to print the prompt string.
	
	# Take in user inputted string.
	la $a0,nameString   	# get address of nameString variable.
	li $a1,81       		# set string length.
	li $v0,8        		# service call number for reading string from keyboard.
	syscall         		# read String.
	
	# Age Prompt.
	la $a0,agePrompt		# load address of agePrompt into $a0.
	li $v0,4				# load call code for displaying a string(4) into $v0.
	syscall					# system call to print the string prompt.
	
	# Take in user inputted integer.
	li $v0,5				# load call code for reading an integer(5) into $v0.
	syscall					# system call to read the integer and store in $v0.
	move $t0, $v0			# move integer in $v0 into $t0.
	
	# Display message1.
	la $a0, message1		# load address of message1 into register a0.
	li $v0, 4				# load machine instruction 4 (print string) into register $v0.
    syscall					# execute instruction v0 using data a0.
	
	# Display user's name.
	la $a0,nameString		# load Access of nameString into register a0. 
	li $v0,4				# load machine instruction 4 (print string) into register $v0.
	syscall					# execute instruction v0 using data a0.
	
	# Display !
	la $a0, ex				# load address of endLine into register a0.
	li $v0, 4				# load machine instruction 4 (print string) into register $v0.
    syscall					# execute instruction v0 using data a0.
	
	# Display onto newline.
	la $a0, endLine			# load address of endLine into register a0.
	li $v0, 4				# load machine instruction 4 (print string) into register $v0.
    syscall					# execute instruction v0 using data a0.
	
	# Display message2
	la $a0, message2		# load address of message2 into register a0.
	li $v0, 4				# load machine instruction 4 (print string) into register $v0.
    syscall					# execute instruction v0 using data a0.
	
	# Display user's age.
	move $a0, $t0			# move integer from $t0 into $a0.
	li $v0,1				# load call code for displaying an integer(1) into $v0.
	syscall					# system call to execute printing the integer.
	
	# Display message3.
	la $a0, message3		# load address of message3 into register a0.
	li $v0, 4				# load machine instruction 4 (print string) into register $v0.
    syscall					# execute instruction v0 using data a0.
	
	li $v0, 10				# load machine instruction 10 (exit) into register $v0.
	syscall					# execute instruction $v0.

### Data Section ###

.data

	namePrompt:	.asciiz	"What is your name?: "	# prompt user for name.
	nameString: .space  82                      # initialize number of characters in nameString
	agePrompt:	.asciiz "How old are you?: "	# prompt user for age.
	message1:	.asciiz "Hello, "				# start of outputting user info.
	message2:	.asciiz "You are "				# countinued.
	message3:	.asciiz " years old."			# countinued.
	ex:			.asciiz "!"					# !!!!!!!!!!
	endLine:	.asciiz	"\n"					# endline.