.section .text
.global _start
_start:
    mov $1, %rax

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
