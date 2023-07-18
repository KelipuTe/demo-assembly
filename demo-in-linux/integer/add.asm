.section .data
    int1: .int 1

.section .text
.global _start
_start:
	mov $1, %rax
	# 把立即数加到寄存器
	add $1, %rax

	mov $1, %rbx
	# 把寄存器加到寄存器
    add %rax, %rbx

    # 把立即数加到内存
    addl $1, int1

	mov $0, %rdi
	mov $60, %rax
	syscall
