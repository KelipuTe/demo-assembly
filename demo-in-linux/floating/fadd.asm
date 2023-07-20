.section .data
	int1: .int 1
	float1: .float 1.5
	float2: .float 2.5

.section .bss
    .lcomm float11, 4

.section .text
.global _start
# 浮点数加法
_start:
    # 无操作数
	flds float1
	flds float2
	faddp
	fstps float11

    # 单操作数，浮点数
    flds float1
    fadds float2
    fstps float11

    # 单操作数，整数
    flds float1
    fiaddl int1
    fstps float11

    # 双操作数
    flds float1
    flds float2
	fadd %st(0), %st(1)

    # 双操作数
    flds float1
    flds float2
	fadd %st(1), %st(0)

	mov $0, %rdi
	mov $60, %rax
	syscall
