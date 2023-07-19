.section .data
    # 初始化的 int
    int1: .int 0x7fffffff

.section .bss
    # 未初始化的 int
    .lcomm int2, 4

.section .text
.global _start
# 使用 lea 传输内存地址
_start:
    # 传输内存的地址到寄存器
    lea int1, %rax
    # 传输内存地址的值（间接寻址）到寄存器
    mov (%rax), %rbx

    # 传输内存的地址到寄存器
    lea int2, %rcx
    # 传输寄存器的值到内存地址（间接寻址）
    mov %rbx, (%rcx)

    mov $0, %rdi
    mov $60, %rax
    syscall
