.section .text
.global _start
_start:
    mov $1, %rdi
    mov $2, %rsi

    call f8func

    mov $1, %rdi
    mov $60, %rax
    syscall

.type f8func, @function
f8func:
    # 保存 rbp
    push %rbp
    # 让 rbp 指向栈顶
    mov %rsp, %rbp

    # 给当前函数分配栈空间
    sub $16, %rsp

    # 把函数的参数保存到栈中
    mov %rdi, -8(%rbp)
    mov %rsi, -16(%rbp)

    # 执行函数的逻辑，这里是加法
    mov -8(%rbp), %rax
    add %rax, -16(%rbp)

    # 把函数的返回值保存到 rax
    mov -16(%rbp), %rax

    # 恢复栈指针
    mov %rbp, %rsp
    pop %rbp

    ret
