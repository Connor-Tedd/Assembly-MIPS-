#################################
# Connor Tedd
# CSC-211-302
# 25 March 2025
# Lab #8 - 10 integers per line.
#################################

### Data Section ###

.data

	space: 	.asciiz " "		#character to seperate integers.
	endl:	.asciiz "\n"	#newline character.

### Text Section ###

.text
.globl main

main:

	#initialize character counter.
	li $t1, 1		#set counter ($t1) to 1.
	li $t2, 0		#<10 per line.
	li $t3, 10
	li $t4, 50
	
PRINT:

	#move and output $t1.
	move $a0, $t1
	li $v0, 1
	syscall
	
	#increment <10 per line.
	addi $t2, $t2, 1
	
	#check $t2 < 10
	beq $t2, $t3, NEXTLINE
	
	#output space between.
	la $a0, space
	li $v0, 4
	syscall
	
	#increment number counter.
	addi $t1, $t1, 1
	ble $t1, $t4, PRINT
	
	#end program.
	li $v0, 10
	syscall
	
NEXTLINE:

	#print endl.
	la $a0, endl
	li, $v0, 4
	syscall
	
	#set $t2 to 0.
	li $t2, 0
	
	#increment $t1.
	addi $t1, $t1, 1
	ble $t1, $t4, PRINT
	
	#end program.
	li $v0, 10
	syscall
	