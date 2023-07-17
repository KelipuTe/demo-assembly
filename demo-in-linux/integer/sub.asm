.section .data
    int1: .int 10
    int2: .int 1

.section .text
.global _start
_start:
    mov $10, %rax

    # 寄存器减立即数
    sub $1, %rax
    # 内存减立即数
    subl $1, int1

    mov $1, %rbx

    # 寄存器减寄存器
    sub %rbx, %rax
    # 内存减寄存器
    sub %rbx, int1

    # 寄存器减内存
    sub int2, %rax

    mov $1, %rdi
    mov $60, %rax
    syscall
