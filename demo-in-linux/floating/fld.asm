.section .data
	float1: .float 1.5
	float2: .float 2.5
	int1: .int 1
    int2: .int 2

.section .text
.global _start
# 把数据压入 fpu 栈
_start:
    # 浮点数
	flds float1
	flds float2

	# 整数
	fildl int1
    fildl int2

	mov $0, %rdi
	mov $60, %rax
	syscall
