.section .data
    # 总共 14 个字节，包括结尾的 \0
    string1: .string "hello, world\n"

.section .text
.global _start
# 字符串比较
_start:
    # 字符串比较
    # ascii 111 = o
    # 设置 al 寄存器表示一次比较 1 个字节
    # 所以，指令用的也是带后缀的 scasb
    # 这里 h != o，所以，结果是 zf = 0
	lea string1, %rdi
	mov $111, %al
	cld
	scasb

    # 在字符串中寻找指定的字符
    # 立即数也可以是字符，但是，不能是字符串
	lea string1, %rdi
	mov $'o', %al
	cld
	mov $14, %rcx
	repne scasb

    # 如果找到了，则 zf 会从 0 变成 1
    # repne 出来，然后，这里不会跳转到 notFound
    jne notFound
    mov $1, %rax

    # 这里的例子应该是第 5 次比较后，repne 跳出来，所以，rcx 应该是 9
    # 5 = 14 - 9，下标从 0 开始的，需要再 -1，所以，rbx 应该是 4
    mov $14, %rbx
	sub %rcx, %rbx
	dec %rbx

	mov $0, %rdi
	mov $60, %rax
	syscall

notFound:
    mov $2, %rax

	mov $0,%rdi
	mov $60,%rax
	syscall
