.section .data
    # 总共 14 个字节，包括结尾的 \0
    string1: .string "hello, world\n"

.section .bss
	.lcomm string2, 14

.section .text
.global _start
# 读取和保存字符串
_start:
	lea string1, %rsi
	lea string2, %rdi
	cld
	mov $14, %rcx
copy:
	lodsb
	stosb
	loop copy

	mov $0, %rdi
	mov $60, %rax
	syscall
