.section .text
.global _start
_start:
    mov $1, %rax

    movq $0x7fffffffffffffff, %rax
    add $1, %rax
    # 如果产生了溢出，那么就会设置 cf 标志位，jc 指令就会跳转到 exit 处
    jc exit

    mov $2, %rax
    mov $1, %rdi
    mov $60, %rax
    syscall

exit:
    mov $3, %rax
	mov $1, %rdi
	mov $60, %rax
	syscall
