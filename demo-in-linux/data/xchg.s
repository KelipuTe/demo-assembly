.section .data
    int1: .int 0x7fffffff

.section .text
.global _start
_start:
    mov $1, %rax
    mov $2, %rbx
    # 交换两个寄存器的值
    xchg %rax, %rbx

    mov $3, %rcx
    # 交换寄存器和内存的值
    xchg int1, %rcx

    mov $1, %rdi
    mov $60, %rax
    syscall
