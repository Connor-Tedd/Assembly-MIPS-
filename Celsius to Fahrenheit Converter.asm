############################
# Connor Tedd
# CSC-211-302
# 6 March 2025
# Temperature Converter
############################

### Text Section ###

.text
.globl main

main:

	#prompt for celsius input
	la $a0, prompt			#load address of prompt into $a0.
	li $v0, 4				#load instruction for a string into $v0.
	syscall					#system call to print prompt.
	
	#get the celsius temperature from the user.
	li $v0, 6				#load system call code for inputting a single floating point into $a0.
	syscall					#system call to read input into $f0.
	
	#load registers with fixed values for computation.
	li.s $f6, 9.0			#register $f6 -> 9.0
	li.s $f8, 5.0			#register $f8 -> 5.0
	li.s $f10, 32.0			#register $f10 -> 32.0
	
	#convert Celsius to Fahrenheit.
	mul.s $f2, $f0, $f6		#temp * 9.0 .
	div.s $f2, $f2, $f8		#(temp * 9.0) / 5.0 .
	add.s $f2, $f2, $f10	#[(temp * 9.0) / 5.0] + 32.0 .
	
	#display output label.
	la $a0, output			#load address of output into $a0
	li $v0, 4				#load system call for printing a string into $v0.
	syscall
	
	#display converted temperature.
	mov.s $f12, $f2			#move fhrenheit temperature from $f2 to $f12.
	li $v0,2				#load system call code for printing a single floating-point into $v0.
	syscall
	
	#display endl.
	la $a0, endl
	li $v0, 4
	syscall

	#end program.
	li $v0, 10
	syscall

### Data Section ###

.data 
	prompt:		.asciiz "Enter a celsius temperature:	"
	output:		.asciiz "The temperature in Fahrenheit is: "
	endl:		.asciiz	"\n"
	# $f0	=	user inputted celsius temperature.
	# $f2	=	converted value (changing).
	# $f6	=	9.0
	# $f8	=	5.0
	# $f10	=	32.0
