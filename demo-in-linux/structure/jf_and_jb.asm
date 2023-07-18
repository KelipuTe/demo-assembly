.section .text
.global _start
_start:
    mov $1, %rax

    jmp 1
0:
    mov $2, %rax

    mov $0, %rdi
    mov $60, %rax
    syscall
1:
    mov $3, %rax
    jmp 0

	mov $0, %rdi
	mov $60, %rax
	syscall
