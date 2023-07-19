.section .data
    int1: .int 1
    int2: .int 1

.section .text
.global _start
# add，整数加法
_start:
    # 把立即数加到寄存器
	mov $1, %rbx
	add $1, %rbx

    # 把立即数加到内存
    addl $1, int1

    # 把寄存器加到寄存器
    mov $1, %rbx
    mov $1, %rcx
    add %rbx, %rcx

    # 把寄存器加到内存
    mov $1, %rbx
    add %rbx, int2

    # 这里会产生进位 cf = 1
    mov $0xffffffff, %ebx
    add $1, %ebx
    # 如果产生了进位，那么 cf = 1，jc 就会跳转到 hasCarry 处
    jc hasCarry

    mov $1, %rax

hasCarry:
    mov $2, %rax

	mov $0, %rdi
	mov $60, %rax
	syscall
