.section .text
.global _start
_start:
    mov $1, %rax

    mov $0x8000000000000000, %rax
    sbb $1, %rax
    # 如果产生了借位，那么（无符号整数）就会设置 of 标志位，jmp 指令就会跳转到 exit 处
    jo exit

    mov $2, %rax
    mov $0, %rdi
    mov $60, %rax
    syscall

exit:
    mov $3, %rax
	mov $0, %rdi
	mov $60, %rax
	syscall
