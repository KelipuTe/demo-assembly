.section .text
.global _start
_start:
    mov $0x1122334455667788, %rax
    # 把寄存器上的数据的高位和低位交换
    bswap %rax

    mov $1, %rdi
    mov $60, %rax
    syscall
