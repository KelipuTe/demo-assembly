.section .data
    int1: .int 10

.section .text
.globl _start
# dec，自减 1
_start:
    # 寄存器
    mov $10, %rax
    dec %rax
    dec %rax

    # 内存
    decl int1
    decl int1

    # 内存地址
    mov $int1, %rax
    dec %rax
    dec %rax

	mov $0, %rdi
	mov $60, %rax
	syscall
