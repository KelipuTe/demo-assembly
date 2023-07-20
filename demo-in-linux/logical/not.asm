.section .data
    byte1: .byte 0b00110011

.section .text
.globl _start
# not，非运算
_start:
    # not 寄存器
    mov $0b11001100, %al
    not %al

    # not 内存
    notb byte1

	mov $0, %rdi
	mov $60, %rax
	syscall
