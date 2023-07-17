.section .data
    printf1: .string "f8func add result=%d\n"

.section .text
.global _start
_start:
    mov $1, %rdi
    mov $2, %rsi

    call f8callPrintf

    # 按照函数的约定传参数就好了
    # printf 的第一个参数
    mov $printf1, %rdi
    # printf 的第二个参数
    mov %eax, %esi
    # 调用 printf
    call printf

    mov $1, %rdi
    mov $60, %rax
    syscall

.type f8callPrintf, @function
f8callPrintf:
    push %rbp
    mov %rsp, %rbp

    sub $16, %rsp

    mov %rdi, -8(%rbp)
    mov %rsi, -16(%rbp)

    mov -8(%rbp), %rax
    add %rax, -16(%rbp)

    mov -16(%rbp), %rax

    mov %rbp, %rsp
    pop %rbp

    ret
