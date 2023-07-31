.section .data
    s6user:
        id: .int 1
        name: .string "aaa"
        age: .int 18

    stringPrintf1: .string "id=%d, name=%s, age=%d\n"

.section .text
.global _start
# 打印全局变量的结构体
_start:
    mov $s6user, %rdi

    call f8printStruct

    mov $60, %rax
    mov $0, %rdi
    syscall

.type f8printStruct,@function
f8printStruct:
    push %rbp
    mov %rsp, %rbp

    sub $16, %rsp
    movq %rdi, -8(%rbp)

    mov $stringPrintf1, %rdi

    # rax = 结构体的起始地址
    movq -8(%rbp), %rax
    # id
    movl (%rax), %esi
    # name，打印字符串的时候，给的是字符串起始地址
    movq %rax, %rbx
    add $4, %rbx
    movq %rbx, %rdx
    # age
    movl 8(%rax), %ecx
    movq $0, %rax
    call printf

    leave
    ret
