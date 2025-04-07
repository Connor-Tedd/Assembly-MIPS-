############################
# Connor Tedd
# CSC-211-302
# 11 March 2025
# Largest Integer In-Class.
############################

### Data Section ###

.data

	prompt1: 	.asciiz "Enter first integer: "
	prompt2: 	.asciiz "Enter second integer: "
	output:		.asciiz "The larger integer is: "
	equals:		.asciiz "The two integers are equal."
	endl:		.asciiz "\n"
	#$t1 = first integer.
	#$t2 = second integer.


### Text Section ###

.text
.globl main

main:

	#get the first integer from user.
	la $a0, prompt1
	li $v0, 4
	syscall
	
	#read in first integer.
	li $v0, 5
	syscall
	
	#move first integer into $t1.
	move $t1, $v0
	
	#get the second integer from user.
	la $a0, prompt2
	li $v0, 4
	syscall
	
	#read in first integer.
	li $v0, 5
	syscall
	
	#move second integer into $t2.
	move $t2, $v0
	
	#$t1 == $t2.
	beq $t1, $t2, EQUAL
	
	#print output.
	la $a0, output
	li $v0, 4
	syscall	
	
	#branch to ELSE if $t1 < $t2.
	blt $t1, $t2, ELSE
	
	#$t1 >= $t2.
	move $a0, $t1
	
	#print $t1.
	li $v0,1
	syscall
	
	#jump call
	j ENDIF
	
#$t1 < $t2.
ELSE:	
	move $a0, $t2
	li $v0,1
	syscall
	j ENDIF

#$t1 == $t2.	
EQUAL:
	la $a0, equals
	li $v0, 4
	syscall

#$t1 > $t2.
ENDIF:
	
	#output blank line
	la $a0, endl
	li $v0, 4
	syscall
	
	#end program
	li $v0, 10
	syscall 