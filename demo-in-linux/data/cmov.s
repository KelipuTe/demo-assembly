.section .text
.global _start
_start:
    mov $1, %rax
    mov $1, %rbx
    cmp %rax, %rbx
    # 如果 rbx==rax 就 r8=rax 成立
    cmove %rax, %r8

    mov $1, %rax
    mov $2, %rbx
    cmp %rax, %rbx
    # 如果 rbx<rax 就 r9=rax 不成立
    cmovl %rax, %r9

    mov $1, %rax
    mov $2, %rbx
    cmp %rax, %rbx
    # 如果 rbx>rax 就 r10=rax 成立
    cmovg %rax, %r10

    mov $1, %rdi
    mov $60, %rax
    syscall
