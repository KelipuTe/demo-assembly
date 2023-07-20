.section .text
.globl _start
# sal，算术左移
# shl，逻辑左移
_start:
    # 算术左移 2
    mov $0b11001100, %al
    sal $2, %al

    # 算术左移 2
    mov $0b11001100, %al
    mov $2, %cl
    shl %cl, %al

	mov $0, %rdi
	mov $60, %rax
	syscall
