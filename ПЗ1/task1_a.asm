.data
	student_number: .word 11
	dialog_str: .string "Enter the number... "
.text

.globl main
	main:
		la a0, dialog_str
		li a7, 4
		ecall
		
		li a7, 5
		ecall
		mv t1, a0
		
		lw t2, student_number
		
		bne t1, t2, not_equal
		equal:
			li a0, 1
			j end_if
		not_equal:
			li a0, 0
		end_if:
			
		li a7, 1
		ecall	
	
		li a7, 10
		ecall