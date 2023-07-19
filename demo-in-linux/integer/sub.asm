.section .data
    int1: .int 10
    int2: .int 10
    int3: .int 1

.section .text
.global _start
# sub，整数减法
_start:
    # 寄存器减立即数
    mov $10, %rbx
    sub $1, %rbx

    # 内存减立即数
    subl $1, int1

    # 寄存器减寄存器
    mov $10, %rbx
    mov $1, %rcx
    sub %rcx, %rbx

    # 内存减寄存器
    mov $1, %rbx
    sub %rbx, int2

    # 寄存器减内存
    mov $10, %rbx
    sub int3, %rbx

    # 这里会产生借位 cf = 1
    mov $0x00000000, %ebx
    sub $1, %ebx
    # 如果产生了借位，那么 cf = 1，jc 就会跳转到 hasCarry 处
    jc hasCarry

    mov $1, %rax

hasCarry:
    mov $2, %rax

    mov $0, %rdi
    mov $60, %rax
    syscall
