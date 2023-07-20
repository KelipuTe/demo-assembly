.section .data
	float1: .float 1.5
	float2: .float 2.5

.section .bss
    .lcomm float11, 4

.section .text
.global _start
# 浮点数比较
_start:
	flds float1
	flds float2
    fcom
    fstsw
    sahf

    jg s1gs0
    jl s1ls0

    mov $1, %rax

	mov $0, %rdi
	mov $60, %rax
	syscall

s1gs0:
    mov $2, %rax

	mov $0, %rdi
	mov $60, %rax
	syscall

s1ls0:
    mov $3, %rax

	mov $0, %rdi
	mov $60, %rax
	syscall
