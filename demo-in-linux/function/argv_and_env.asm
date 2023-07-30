.data
    argvPrintNum: .string "argv num=%d\n"
    argvPrintItem: .string "argv item=%s\n"
    envPrintNum: .string "env num=%d\n"
    envPrintItem: .string "env item=%s\n"

.text
.global _start
_start:
    # rsp = 命令行参数起始地址
    mov %rsp, %rdi
    call showArgv
    # rax = 命令行参数个数

    # 环境变量起始地址 = 命令行参数起始地址 + 8（命令行参数个数） + 命令行参数个数 * 8 + 8（分隔，8 个字节都是 0）
    imul $8, %rax
    add $16, %rax
    mov %rsp, %rdi
    add %rax, %rdi
    call showEnv

    mov $0, %rdi
    mov $60, %rax
    syscall

# 打印命令行参数
.type showArgv, @function
showArgv:
    push %rbp
    mov %rsp, %rbp
    sub $32, %rsp

    # 起始地址
    movq %rdi, -8(%rbp)

    # 命令行参数个数
    movq -8(%rbp), %rax
    movq (%rax), %rbx
    movq %rbx, -16(%rbp)

    # 打印命令行参数个数
    mov $argvPrintNum, %rdi
    movq -16(%rbp), %rsi
    mov $0, %rax
    call printf
    mov $0, %rax

    # 循环计数
    movq $0, -24(%rbp)
    # 每次循环访问的地址
    movq -8(%rbp), %rax
    add $8, %rax
    movq %rax, -32(%rbp)

0:
    # 本次循环的地址偏移量
    movq -24(%rbp), %rax
    leaq 0(,%rax,8), %rbx
    # 本次循环访问的地址
    movq -32(%rbp), %r11
    add %rbx, %r11

    # 本次循环打印命令行参数
    mov $argvPrintItem, %rdi
    movq (%r11), %rsi
    mov $0, %rax
    call printf
    mov $0, %rax

    # 循环计数 + 1
    addq $1, -24(%rbp)

    # 循环计数 < 命令行参数个数，则继续循环
    movq -24(%rbp), %rax
    movq -16(%rbp), %rbx
    cmp %rax, %rbx
    jg 0b

    # 返回命令行参数个数
    movq -16(%rbp), %rax

    leave
    ret

# 打印环境变量
.type showEnv, @function
showEnv:
    push %rbp
    mov %rsp, %rbp
    sub $16, %rsp

    # 起始地址
    movq %rdi, -8(%rbp)

    # 循环计数
    movq $0, -16(%rbp)

0:
    # 本次循环的地址偏移量
    movq -16(%rbp), %rax
    leaq 0(,%rax,8), %rbx
    # 本次循环访问的地址
    movq -8(%rbp), %rax
    addq %rbx, %rax

    # 检查一下是否到了环境变量的结束标志（分隔，8 个字节都是 0）
    movq (%rax), %rbx
    cmp $0, %rbx
    je 1f

    # 本次循环打印命令行参数
    movq $envPrintItem, %rdi
    movq %rbx, %rsi
    movq $0, %rax
    call printf
    movq $0, %rax

    # 循环计数 + 1，无条件继续循环
    addq $1, -16(%rbp)
    jmp 0b

1:
    # 环境变量个数
    movq $envPrintNum, %rdi
    movq -16(%rbp), %rsi
    movq $0, %rax
    call printf
    movq $0, %rax

    leave
    ret
