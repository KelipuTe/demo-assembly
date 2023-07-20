.section .data
    int1: .int 1

.section .text
.globl _start
# inc，自增 1
_start:
    # 寄存器
    mov $1, %rax
    inc %rax
    inc %rax

    # 内存
    incl int1
    incl int1

    # 内存地址
    mov $int1, %rax
    inc %rax
    inc %rax

	mov $0, %rdi
	mov $60, %rax
	syscall
