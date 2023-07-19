.section .data
    # 总共 14 个字节，包括结尾的 \0
    string1: .string "hello, world\n"

.section .bss
    .lcomm string2, 14
    .lcomm string3, 14
    .lcomm string4, 14
    .lcomm string5, 14

.section .text
.globl _start
# movs，传输字符串
_start:
    # 正序传输了一次，传输了 2 个字节
    # 传输完成之后，rsi 和 rdi 都会自动增加 2
    lea string1, %rsi
    lea string2, %rdi
    cld
    movsw

    # 倒序传输了一次，传输了 2 个字节
    # 传输完成之后，rsi 和 rdi 都会自动减少 2
    lea string1+13, %rsi
    lea string3+13, %rdi
    std
    movsw

    # 用 loop 循环传输全部字符串
    lea string1, %rsi
    lea string4, %rdi
    cld
    mov $14, %rcx
loop1:
    movsb
    loop loop1

    # 用 rep 循环传输全部字符串
    lea string1, %rsi
    lea string5, %rdi
    cld
    mov $14, %rcx
    rep movsb

	mov $0, %rdi
	mov $60, %rax
	syscall
