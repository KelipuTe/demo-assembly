.section .text
.global _start
_start:
    mov $1, %rax
    # 跳转到 exit
    jmp exit

    mov $2, %rax
    mov $1, %rdi
    mov $60, %rax
    syscall

exit:
    mov $3, %rax
	mov $1, %rdi
	mov $60, %rax
	syscall
