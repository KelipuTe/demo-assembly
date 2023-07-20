.section .data
	float1: .float 1.5
	int1: .int 1

.section .bss
    .lcomm float11, 4
    .lcomm int1, 4

.section .text
.global _start
# 把 st(0) 中的数据取出，然后，放到目标操作数上去
_start:
    # 浮点数
	flds float1

	fsts float11
	fstps float11

	# 整数
	flds int1

	fistl int1
	fistpl int1

	mov $0, %rdi
	mov $60, %rax
	syscall
