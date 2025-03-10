########################
# Integer Addition Lab #
########################

### Text Section ###
.text
.globl main

main:

	#get the first integer from user.
	la $a0, prompt1		#load address of prompt1 into $a0.
	li $v0, 4			#load system call code for printing a string into $v0.
	syscall
	
	#read in first integer.
	li $v0, 5			#load system call code for inputting an integer into $v0.
	syscall
	
	#move first integer.
	move $t0, $v0		#move first integer into temporary register 0.
	
	#get the second integer from user.
	la $a0, prompt2		#load address of prompt2 into $a0.
	li $v0, 4			#load system call code for printing a string into $v0.
	syscall
	
	#read in first integer.
	li $v0, 5			#load system call code for inputting an integer into $v0.
	syscall
	
	#move second integer.
	move $t1, $v0		#move first integer into temporary register 1.
	
	#add two integers
	add $t2, $t0, $t1	#$t2 = $t0 + $t1
	
	#output blank line
	la $a0, endl
	li $v0, 4
	syscall
	
	#display first integer.
	move $a0, $t0
	li $v0, 1			#load system call code for printing integer.
	syscall
	
	#display plus sign.
	la $a0, plus
	li $v0, 4
	syscall
	
	#display second integer.
	move $a0, $t1
	li $v0, 1
	syscall
	
	#display equal sign.
	la $a0, equal
	li $v0, 4
	syscall
	
	#display sum.
	move $a0, $t2
	li $v0, 1
	syscall
	
	#display blank line
	la $a0, endl
	li $v0, 4
	syscall
	
	#exiting program.
	li $v0,10			# load call code for exiting the program(10) into $v0.
	syscall
	
### Data Section ###
.data

	prompt1: 	.asciiz "Enter integer 1 ---> "
	prompt2: 	.asciiz "Enter integer 2 ---> "
	endl:		.asciiz "\n"
	plus:		.asciiz " + "
	equal:		.asciiz " = "
	#$t0 = first integer.
	#$t1 = second integer.
	#$t2 = $t0 + $t1
