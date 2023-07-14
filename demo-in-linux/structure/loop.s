.section .text
.global _start
_start:
	mov $10, %cx
loop1:
	mov %cx, %dx
	loop loop1

	mov $0,%rdi
	mov $60,%rax
	syscall
