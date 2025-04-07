############################
# Connor Tedd
# CSC-211-302
# 4 March 2025
# Integer Subtraction
############################
### Text Section ###
.text
.globl main

main:

#get and store user's integers
	
	#get the first integer from user.
	la $a0, prompt1
	li $v0, 4
	syscall
	
	#read in first integer.
	li $v0, 5
	syscall
	
	#move first integer.
	move $t0, $v0
	
	#get the second integer from user.
	la $a0, prompt2
	li $v0, 4
	syscall
	
	#read in first integer.
	li $v0, 5
	syscall
	
	#move second integer.
	move $t1, $v0
	
#compute and display first subtraction statement.
	
	#first subtractrion
	sub $t2, $t0, $t1	#$t2 = $t0 - $t1
	
	#output blank line
	la $a0, endl
	li $v0, 4
	syscall
	
	#display first integer.
	move $a0, $t0
	li $v0, 1
	syscall
	
	#display subtraction sign.
	la $a0, subt
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
	
	#display total.
	move $a0, $t2
	li $v0, 1
	syscall
	
	#output blank line
	la $a0, endl
	li $v0, 4
	syscall
	
#compute and display second subtraction statement.

	#second subtration
	sub $t3, $t1 $t0	#$t3 = $t1- $t0
	
	#display first integer.
	move $a0, $t1
	li $v0, 1
	syscall
	
	#display subtraction sign.
	la $a0, subt
	li $v0, 4
	syscall
	
	#display second integer.
	move $a0, $t0
	li $v0, 1
	syscall
	
	#display equal sign.
	la $a0, equal
	li $v0, 4
	syscall
	
	#display total.
	move $a0, $t3
	li $v0, 1
	syscall
	
	#output blank line
	la $a0, endl
	li $v0, 4
	syscall

#end program.		
	#exiting program.
	li $v0,10
	syscall
	
### Data Section ###
.data

	prompt1: 	.asciiz "Enter integer 1 ---> "
	prompt2: 	.asciiz "Enter integer 2 ---> "
	endl:		.asciiz "\n"
	subt:		.asciiz " - "
	equal:		.asciiz " = "
	#$t0 = first integer.
	#$t1 = second integer.
	#$t2 = $t0 - $t1.
	#$t3 = $t1 - $t0.