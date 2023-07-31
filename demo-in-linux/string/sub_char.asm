.section .data
    # 总共 12 个字节，不包括结尾的 \0
    string1: .string "hello, world"

    stringPrintf: .string "char %c at index %d of %s\n"

.section .text
.global _start
_start:
    mov $string1, %rdi
    mov $13, %rsi
    # 立即数也可以是字符，但是，不能是字符串
    mov $'w', %rdx
    call subChar

    mov $stringPrintf, %rdi
    mov $'w', %rsi
    mov %rax, %rdx
    mov $string1, %rcx
    mov $0, %rax
    call printf
    mov $0, %rax

    mov $string1, %rdi
    mov $13, %rsi
    mov $'a', %rdx
    call subChar

    mov $stringPrintf, %rdi
    mov $'a', %rsi
    mov %rax, %rdx
    mov $string1, %rcx
    mov $0, %rax
    call printf
    mov $0, %rax

    mov $60, %rax
    mov $0, %rdi
    syscall

# 在字符串中寻找指定字符，并返回找到的第一个指定字符的下标
.type subChar, @function
subChar:
    push %rbp
    mov %rsp, %rbp

    sub $32, %rsp
    movq %rdi, -8(%rbp)
    movl %esi, -12(%rbp)
    movb %dl, -16(%rbp)

    cld
    movq -8(%rbp), %rdi
    movl -12(%rbp), %ecx
    # 设置 al 寄存器表示一次比较 1 个字节
    movb -16(%rbp), %al
    # 指令用的也是带后缀的 scasb
    repne scasb

    # 如果找到了，则 zf 会从 0 变成 1
    # repne 出来，然后，这里不会跳转到 subCharNotFound
    jne subCharNotFound

    # 字符串长度 - 剩余循环次数 = 遍历过的字符数
    movl -12(%rbp), %ebx
    sub %ecx, %ebx
    # 下标从 0 开始的，需要再 -1
    dec %ebx
    mov %ebx, %eax
    jmp subCharEnd

subCharNotFound:
    mov $-1, %rax

subCharEnd:
    leave
    ret
