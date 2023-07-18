.section .text
.global _start
_start:
    mov $0x1122334455667788, %rax
    bswap %rax
    # 翻转之后，rax 上面就是 0x8877665544332211

    mov $0, %rdi
    mov $60, %rax
    syscall
