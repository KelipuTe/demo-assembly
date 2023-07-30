.section .data
    # 总共 13 个字节，不包括结尾的
    string1: .string "hello, world"

.section .text
.global _start
# 字符串转大写
_start:
	lea string1, %rsi
	mov %rsi, %rdi
	cld
	mov $14, %rcx

toUpper:
	lodsb
	cmp $'a', %al
	# 字符的 ascii 小于 a，不要转换
	jb notLower
	# 字符的 ascii 大于 z，不要转换
	cmp $'z', %al
	ja notLower
	# 大写字母 ascii + 32（0x20） = 小写字母
	sub $0x20, %al

notLower:
	stosb
	loop toUpper

	mov $0, %rdi
	mov $60, %rax
	syscall
