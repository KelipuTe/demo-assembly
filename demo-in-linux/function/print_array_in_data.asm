.section .data
    array1: .int 1, 2, 3, 4, 5
    printf1: .string "array1 item=%d\n"

.section .text
.global _start
_start:
    mov $array1, %rdi

    call f8printArray

    mov $1, %rdi
    mov $60, %rax
    syscall

.type f8printArray, @function
f8printArray:
    push %rbp
    mov %rsp, %rbp

    sub $32, %rsp

    # 把数组的起始地址存下来
    movq %rdi, -16(%rbp)
    # 循环遍历的 i
    movl $0, -8(%rbp)

    jmp 1f
0:
    mov $printf1, %rdi
    # rax = 数组的起始地址
    movq -16(%rbp), %rax
    # 本次循环的 i
    movl -4(%rbp), %ebx
    # 地址偏移量
    leaq 0(,%ebx,4), %rcx
    # 本次需要访问的地址
    add %rcx, %rax
    # 把地址上的值取出来放到 rsi 上
    mov (%rax), %rsi

    call printf
    # 把 printf 的返回值擦掉
    mov $0, %rax

    # i++
    addl $1, -4(%rbp)
1:
    cmpl $4,-4(%rbp)
    jle 0b

    leave
    ret
