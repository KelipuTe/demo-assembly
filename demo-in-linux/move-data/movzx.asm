.section .text
.globl _start
# 填入 0 的数据扩展
_start:
    # 把 2 从 32 位扩展到 64 位
    mov $2, %ax
    movzx %ax, %rax

    # 把 -2 从 32 位扩展到 64 位
    mov $-2, %bx
    movzx %bx, %rbx

	mov $0, %rdi
	mov $60, %rax
	syscall
