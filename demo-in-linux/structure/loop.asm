.section .text
.global _start
_start:
	mov $10, %cx
loop1:
	mov %cx, %dx
	# 循环，cx 自动减 1，直到 cx 为 0
	loop loop1

	mov $0, %rdi
	mov $60,%rax
	syscall
