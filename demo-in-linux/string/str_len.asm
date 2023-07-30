.section .data
    # 总共 5 个字节，不包括结尾的 \0
    string1: .string "hello"
    # 总共 12 个字节，不包括结尾的 \0
    string2: .string "hello, world"

    stringPrintf: .string "length of %s is %d\n"

.section .text
.global _start
_start:
    mov $string1, %rdi
    call strLen

    mov $stringPrintf, %rdi
    mov $string1, %rsi
    mov %rax, %rdx
    mov $0, %rax
    call printf
    mov $0, %rax

    mov $string2, %rdi
    call strLen

    mov $stringPrintf, %rdi
    mov $string2, %rsi
    mov %rax, %rdx
    mov $0, %rax
    call printf
    mov $0, %rax
    
    mov $0, %rdi
    mov $60, %rax
    syscall

# 计算字符串长度
.type strLen, @function
strLen:
    push %rbp
    mov %rsp, %rbp

    sub $8, %rsp
    movq %rdi, -8(%rbp)

    # 遍历字符串找 \0
    movq -8(%rbp), %rdi
   	mov $0, %al
	cld
	# rdi == \0，zf = 1，jnz 跳出循环
0:
    scasb
    jnz 0b

    # 用地址偏移量计算字符串长度
    movq -8(%rbp), %rbx
    sub %rbx, %rdi
    # 减去 \0 的 1 个字节
    dec %rdi

    # 设置返回值
    mov %rdi, %rax

    leave
    ret
