.section .text
.globl _start
_start:
    mov $1, %rax
    jmp jmpPoint
    mov $2, %rax
jmpPoint:
    mov $3, %rax

    mov $60, %rax
    mov $0, %rdi
    syscall
