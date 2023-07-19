.section .text
.global _start
# adc，整数带进位的加法
_start:
    # 这里会产生进位 cf = 1，ebx = 0x00000000
    mov $0xffffffff, %ebx
    add $1, %ebx

    # ebx = 1 + ebx + cf = 2
    adc $1, %ebx

	mov $0, %rdi
	mov $60, %rax
	syscall
