###################################
# Input an integer and display it #
###################################

.text
.globl main

main:
	la $a0,prompt		# load address of prompt into $a0.
	li $v0,4			# load call code for displaying a string(4) into $v0.
	syscall				# system call to print the string prompt.
	
	li $v0,5			# load call code for reading an integer(5) into $v0.
	syscall				# system call to read the integer and store in $v0.
	
	move $t0,$v0		# move the integer in $v0 into $t0.
	
	la $a0,output		# load address of output into $a0.
	li $v0,4			# load call code for displaying a string(4) into $v0.
	syscall				# system call to print the output string.
	
	move $a0,$t0		# move the integer in $t0 into $a0.
	li $v0,1			# load call code for displaying an integer(1) into $v0.
	syscall				# system call to execute printing the integer.
	
	la $a0,endl			# load address of new line character into $a0.
	li $v0,4			# load call code for displaying a string(4) into $v0.
	syscall				# system call to execute printing of the new line character.
	
	li $v0,10			# load call code for exiting the program(10) into $v0.
	syscall				# system call to exit the program.

### Data Section ###

.data

	prompt:	.asciiz	"Enter an integer ---> "	# prompt for user input of integer.
	output: .asciiz "Your number was: "			# label for the output.
	endl:	.asciiz "\n"						# new line character.
