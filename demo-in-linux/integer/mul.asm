.section .data
    int1: .int 2

.section .text
.global _start
# mul，无符号整数乘法
_start:
    # 寄存器乘寄存器
    # rax = rax * rbx
    mov $2, %rax
    mov $2, %rbx
    mul %rbx

    # 寄存器乘内存（带后缀）
    # rax = rax * int1
    mov $2, %rax
    mull int1

    # 计算结果超过一个寄存器的容量
    # 0xffff,ffff * 2 = 0x1,ffff,fffe
    # rdx=0x1，rax=0xffff,fffe
    mov $0xffffffff, %eax
    mov $2, %ebx
    mul %ebx

    mov $0, %rdi
    mov $60, %rax
    syscall
