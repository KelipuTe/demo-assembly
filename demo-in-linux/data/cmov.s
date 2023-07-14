.section .text
.global _start
_start:
    mov $1, %rax
    mov $1, %rbx
    cmp %rax, %rbx
    # rbx==rax r8=rax 条件成立
    cmove %rax, %r8

    mov $1, %rax
    mov $2, %rbx
    cmp %rax, %rbx
    # rbx<rax r9=rax 条件不成立
    cmovl %rax, %r9

    mov $1, %rax
    mov $2, %rbx
    cmp %rax, %rbx
    # rbx>rax r10=rax 条件成立
    cmovg %rax, %r10

    mov $1, %rdi
    mov $60, %rax
    syscall
