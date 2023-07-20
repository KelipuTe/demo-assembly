.section .text
.globl _start
# 带符号的数据扩展
_start:
    # 把 2 从 32 位扩展到 64 位
    mov $2, %eax
    movsx %eax, %rax

    # 把 -2 从 32 位扩展到 64 位
    mov $-2, %ebx
    movsx %ebx, %rbx

	mov $0, %rdi
	mov $60, %rax
	syscall
