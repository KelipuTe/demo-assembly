.section .data
    # 总共 6 个字节，包括结尾的 \0
    string1: .string "hello"
    string2: .string "heiio"

.section .text
.global _start
# 字符串比较
_start:
    # 字符串比较
    # 这里用 cmpsb 指令，表示一次比较一个字节
    # h != h，所以，结果是 zf = 1
	lea string1, %rsi
	lea string2, %rdi
	cld
	cmpsb

    # 比较整个字符串
    lea string1, %rsi
    lea string2, %rdi
    cld
    mov $6, %rcx
    repe cmpsb

    # 如果完全相等，则应该一直 zf = 1
    # rcx 计数器到 0，repe 出来，然后，这里就会跳转到 equal
	je equal
	mov $1, %rax

	mov $0, %rdi
	mov $60, %rax
	syscall

equal:
    mov $2, %rax

	mov $0, %rdi
	mov $60, %rax
	syscall
