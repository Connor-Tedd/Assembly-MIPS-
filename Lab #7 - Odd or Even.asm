############################
# Connor Tedd
# CSC-211-302
# 13 March 2025
# Lab #7 - Odd or Even.
############################

### Data Section ###

.data

	prompt: 	.asciiz "Enter first integer: "
	even:		.asciiz "Your integer is even."
	odd:		.asciiz "Your integer is odd."
	endl:		.asciiz "\n"
	#$t0 = remainder of $t1/$t2.
	#$t1 = user's integer.
	#$t2 = 2

### Text Section ###

.text
.globl main

main:
	
	#prompt user for integer.
	la $a0, prompt
	li $v0, 4
	syscall
	
	#read in first integer.
	li $v0, 5
	syscall
	
	#move first integer into $t1.
	move $t1, $v0
	
	#load register #t2 with 2.
	li $t2, 2
	
	#divide inputed integer by 2.
	div $t1, $t2
	
	#move remainder into $t0.
	mfhi $t0
	
	#if $t0 = 0 -> integer is even.
	beqz $t0, IFEVEN
	la $a0, odd
	li $v0, 4
	syscall
	j ENDIF

IFEVEN:
	#print even message.
	la $a0, even
	li $v0,4
	syscall 
	
ENDIF:

	#output blank line
	la $a0, endl
	li $v0, 4
	syscall
	
	#end program
	li $v0, 10
	syscall
	