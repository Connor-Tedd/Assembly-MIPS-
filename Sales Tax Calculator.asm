############################
# Connor Tedd
# CSC-211-302
# 6 March 2025
# Sales Tax Calculator
############################

### Text Section ###

.text
.globl main

main:

	#prompt for item price input
	la $a0, prompt
	li $v0, 4
	syscall
	
	#get item price from user input.
	li $v0, 7		#double
	syscall			#load user input into $f0
	
	#load registers with fixed values for computation.
	li.d $f6, 1.08

	#compute total with sales tax.
	mul.d $f2, $f0, $f6		# $f2 = item price * 1.08.
	
	#compute just tax amount.
	sub.d $f4, $f2, $f0		# $f4 = total price - item price.
	
	#display endl.
	la $a0, endl
	li $v0, 4
	syscall	
	
	#display taxAmount label.
	la $a0, taxAmount
	li $v0, 4
	syscall
	
	#display taxAmount.
	mov.d $f12, $f4
	li $v0, 3
	syscall
	
	#display endl.
	la $a0, endl
	li $v0, 4
	syscall	
	
	#display totalAmount label.
	la $a0, totalAmount
	li $v0, 4
	syscall
	
	#display totalAmount.
	mov.d $f12, $f2
	li $v0, 3
	syscall
	
	#display endl.
	la $a0, endl
	li $v0, 4
	syscall
	
	#end program
	li $v0, 10
	syscall


### Data Section ###

.data 

	prompt:			.asciiz "Enter the item price: "
	endl:			.asciiz	"\n"
	taxAmount:		.asciiz "Tax paid: "
	totalAmount:	.asciiz "Total amount paid: "
	# $f0	=	user inputted value.
	# $f2	=	total price.
	# $f4	=	tax paid.
	# $f6	=	fixed tax value (1.08).
