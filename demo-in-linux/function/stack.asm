.section .text
.global _start
_start:
    push $1
    push $2
    # 栈结构，1 在 2 的下面

    call f8func

    mov $1, %rdi
    mov $60, %rax
    syscall

.type f8func, @function
f8func:
    # 拿到 2
    mov 8(%rsp), %rbx
    # 拿到 1
    mov 16(%rsp), %rax

    # 执行函数逻辑
    add %rax, %rbx

    # 返回
    ret
