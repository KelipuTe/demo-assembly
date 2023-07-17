.section .data
    s6user:
        id: .int 1
        name: .string "aaa"
        age: .int 18

    printf1: .string "id=%d, name=%s, age=%d\n"

.section .text
.global _start
_start:
    mov $s6user, %rdi

    call f8printStruct

    mov $1, %rdi
    mov $60, %rax
    syscall

.type f8printStruct,@function
f8printStruct:
    push %rbp
    mov %rsp, %rbp

    sub $32, %rsp

    # 把结构体的起始地址存下来
    mov %rdi, -16(%rbp)

    mov $printf1, %rdi

    # rax = 结构体的起始地址
    movq -16(%rbp), %rax
    # id
    movl (%rax), %esi
    # name，打印字符串的时候，给的是字符串起始地址
    movq -16(%rbp), %rbx
    add $4, %rbx
    movq %rbx, %rdx
    # age
    movl 8(%rax), %ecx

    call printf

    leave
    ret

