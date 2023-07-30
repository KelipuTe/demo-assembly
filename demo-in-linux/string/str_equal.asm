.section .data
    # 总共 5 个字节，不包括结尾的 \0
    string1: .string "hello"
    # 总共 5 个字节，不包括结尾的 \0
    string2: .string "heiio"
    # 总共 11 个字节，不包括结尾的 \0
    string3: .string "hello world"

    stringPrintf: .string "%s and %s, ret=%d\n"

.section .text
.global _start
_start:
    lea string1, %rsi
	lea string1, %rdi
	call strEqual

    mov $stringPrintf, %rdi
    mov $string1, %rsi
    mov $string1, %rdx
    mov %rax, %rcx
    mov $0, %rax
    call printf
    mov $0, %rax

	lea string1, %rsi
	lea string2, %rdi
	call strEqual

    mov $stringPrintf, %rdi
    mov $string1, %rsi
    mov $string2, %rdx
    mov %rax, %rcx
    mov $0, %rax
    call printf
    mov $0, %rax

    lea string1, %rsi
    lea string3, %rdi
    call strEqual

    mov $stringPrintf, %rdi
    mov $string1, %rsi
    mov $string3, %rdx
    mov %rax, %rcx
    mov $0, %rax
    call printf
    mov $0, %rax

	mov $0, %rdi
	mov $60, %rax
	syscall

# 判断两个字符串是否相等
.type strEqual, @function
strEqual:
    push %rbp
    mov %rsp, %rbp

    sub $16, %rsp
    movq %rdi, -8(%rbp)
    movq %rsi, -16(%rbp)

    cld
    movq -8(%rbp), %rsi
    movq -16(%rbp), %rdi

0:
    # 如果第一个字符串已经结束了，则判断第二个字符串是否结束
    movb (%rsi), %bl
    cmp $0, %bl
    je 1f

    # 如果第一个字符串没结束，第二个字符串结束了，则不相等
    movb (%rdi), %bl
    cmp $0, %bl
    je strEqualNotEqual

    cmpsb
    # 如果相等，则继续比较下一个字符，否则不相等
    je 0b
    jne strEqualNotEqual

1:
    # 如果第一个字符串已经结束了，第二个字符串也结束了，则相等
    movb (%rdi), %bl
    cmp $0, %bl
    je strEqualEqual

strEqualEqual:
    mov $-1, %rax
    jmp strEqualEnd

strEqualNotEqual:
    # 用地址偏移量计算不一样的字符的位置
    movq -8(%rbp), %rbx
    sub %rbx, %rsi
    # 下标从 0 开始的，需要再 -1
    dec %ebx
    mov %rsi, %rax
    jmp strEqualEnd

strEqualEnd:
    leave
    ret
