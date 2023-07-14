.section .text
.global _start
_start:
    mov $0x1122334455667788, %rax
    bswap %rax

    mov $1, %rdi
    mov $60, %rax
    syscall
