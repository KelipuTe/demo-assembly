.section .text
.type f8part2, @function
.global f8part2
f8part2:
    push %rbp
    mov %rsp, %rbp

    sub $16, %rsp
    movq %rdi, -8(%rbp)

    movq -8(%rbp), %rdi
    mov $0, %rax
    call printf
    mov $0, %rax

    leave
    ret
