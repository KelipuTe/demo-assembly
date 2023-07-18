.section .text
.global _start
# 有符号整数乘法示例
_start:
    # 计算结果超过一个寄存器的容量
    # -2147483648 => 0x8000,0000
    # 0x8000,0000 * 2 的结果是 0x1,0000,0000。
    # 溢出了，需要截断最高位，然后，把剩下的部分扩展到 64 位
    # 32 位有符号的整数扩展到 64 位的时候，需要在前面填充 1。
    # 所以，结果是 0xffff,ffff,0000,0000 => -4294967296
    # 然后，拆到两个寄存器里去，edx = 0xffff,ffff，eax = 0x0000,0000
    mov $-2147483648, %eax
    mov $2, %ebx
    imul %ebx

    # 两个操作数
    # 2147483647 => 0x7fff,ffff
    # 0x7fff,ffff * 4 的结果是 1,ffff,fffc。
    # 溢出了，直接截断，所以，ebx = 0xffff,fffc
    # eax = eax * ebx
    mov $2147483647, %eax
    mov $4, %ebx
    imul %ebx, %eax

    # 三个操作数
    # eax = 4 * ebx
    mov $4, %ebx
    imul $4, %ebx, %eax

    mov $0, %rdi
    mov $60, %rax
    syscall
