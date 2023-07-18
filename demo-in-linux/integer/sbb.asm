.section .text
.global _start
# 带借位的整数减法示例
_start:
    # 这里会产生借位 cf = 1，ebx = 0xffffffff
    mov $0x00000000, %ebx
    sub $1, %ebx

    # ebx = ebx- (1 + cf) = 0xfffffffd
    sbb $1, %ebx

	mov $0, %rdi
	mov $60, %rax
	syscall
