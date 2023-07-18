.section .text
.global _start
_start:
    mov $1, %rax

    mov $1, %rbx
    mov $2, %rcx
    cmp %rbx, %rcx
    # 如果 rcx > rbx 就跳转到 exit
    jg exit

    mov $2, %rax
	mov $0, %rdi
    mov $60, %rax
    syscall

exit:
    mov $3, %rax
	mov $0, %rdi
	mov $60, %rax
	syscall
