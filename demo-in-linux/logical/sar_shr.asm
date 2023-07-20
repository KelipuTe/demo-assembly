.section .text
.globl _start
# sar，算术右移
# shr，逻辑右移
_start:
    # 算术右移 2
    mov $0b00110011, %al
    sar $2, %al

    # 算术右移 2
    mov $0b00110011, %al
    mov $2, %cl
    shr %cl, %al

	mov $0, %rdi
	mov $60, %rax
	syscall
