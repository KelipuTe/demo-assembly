.section .data
	float1: .float 1.5
	float2: .float -2.5

.section .bss
    .lcomm float11, 4

.section .text
.global _start
# 把 st(0) 的数据绝对值
_start:
	flds float1
    fabs
    fstps float11

    flds float2
    fabs
    fstps float11

	mov $0, %rdi
	mov $60, %rax
	syscall
