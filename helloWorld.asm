########## helloWorld.asm #######
#          Connor Tedd	        #
#################################

.text

.globl main
	
	main:			#label
		la $a0,str	#Load Access of str into register a0. 
		li $v0,4	#Load machine instruction 4 (print string) into register $v0.
		syscall		#Execute instruction v0 using data a0.
		
		li $v0, 10	#Load machine instruction 10 (exit) into register $v0.
		syscall		#Execute instruction $v0.

.data
	str: .asciiz "Hello World!\n	This is a working program.\n	Made by Connor Tedd.\n" #label: datatype.