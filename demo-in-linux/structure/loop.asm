.section .text
.global _start
_start:
	mov $5, %cx
loop1:
	mov %cx, %dx
	# 如果 cx 大于 0，则跳转到 loop1 标记处，cx 自动减 1，然后，继续执行，
	loop loop1

	mov $0, %rdi
	mov $60,%rax
	syscall
