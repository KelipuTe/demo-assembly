.section .text
.global _start
_start:
    mov $1, %rax
    mov $1, %rbx
    cmp %rax, %rbx
    # 如果 rbx == rax 则执行 r8 = rax，这里是成立的
    cmove %rax, %r8

    mov $1, %rax
    mov $2, %rbx
    cmp %rax, %rbx
    # 如果 rbx < rax 则执行 r9 = rax，这里是不成立的
    cmovl %rax, %r9

    mov $1, %rax
    mov $2, %rbx
    cmp %rax, %rbx
    # 如果 rbx > rax 则执行 r10 = rax，这里是成立的
    cmovg %rax, %r10

    mov $0, %rdi
    mov $60, %rax
    syscall
