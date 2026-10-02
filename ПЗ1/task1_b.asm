.data
	y: .word 118
	h: .word 11
	input_str: .string "Enter x... "
.text

.macro print_integer(%x)
	mv a0, %x
	li a7, 1
	ecall
	
	# ?????? \n
	li a0, 10
	li a7, 11
	ecall
.end_macro

.globl main
main:
	li a7, 4
	la a0, input_str
	ecall
	
	li a7, 5
	ecall
	mv t1, a0
	
	lw t2, y
	lw t3, h
	
	# ????????? x ? y
	blt t1, t2 end_comparison
	mv t6, t1
	mv t1, t2
	mv t2, t6
end_comparison:
# t1 ??????? ?? ????
	
loop:
	print_integer(t1)
	
	add t1, t1, t3
	ble t1, t2 loop

	li a7, 10
	ecall