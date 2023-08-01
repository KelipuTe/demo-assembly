.section .data
    # 12 个字节，不包括结尾的 \0
    string1: .string "hello, world"
    string2: .string "HELLO, WORLD"

    strPrintf1: .string "before %s\n"
    strPrintf2: .string "after %s\n"

.section .text
.global _start
_start:
	mov $strPrintf1, %rdi
    lea string1, %rsi
    mov $0, %rax
    call printf
    mov $0, %rax

    lea string1, %rdi
    call f8toUpper

    mov $strPrintf2, %rdi
    lea string1, %rsi
    mov $0, %rax
    call printf
    mov $0, %rax

    mov $strPrintf1, %rdi
    lea string2, %rsi
    mov $0, %rax
    call printf
    mov $0, %rax

    lea string2, %rdi
    call f8toLower

    mov $strPrintf2, %rdi
    lea string2, %rsi
    mov $0, %rax
    call printf
    mov $0, %rax

    mov $60, %rax
    mov $0, %rdi
    syscall

# 字符串转大写
.type f8toUpper, @function
f8toUpper:
    push %rbp
    mov %rsp, %rbp

    sub $16, %rsp
    movq %rdi, -8(%rbp)

    movq -8(%rbp), %rsi
0:
    lodsb
    # 字符的 ascii 小于 a，不要转换
    cmp $'a', %al
    jb notLower
    # 字符的 ascii 大于 z，不要转换
    cmp $'z', %al
    ja notLower
    # 大写字母 ascii = 小写字母 ascii - 32（0x20）
    sub $0x20, %al

notLower:
    stosb
    # 判断字符串是否结束
    cmp $0, %al
    jne 0b

    leave
    ret

# 字符串转小写
.type f8toLower, @function
f8toLower:
    push %rbp
    mov %rsp, %rbp

    sub $8, %rsp
    movq %rdi, -8(%rbp)

    movq -8(%rbp), %rsi
0:
    lodsb
    # 字符的 ascii 小于 A，不要转换
    cmp $'A', %al
    jb notUpper
    # 字符的 ascii 大于 Z，不要转换
    cmp $'Z', %al
    ja notUpper
    # 小写字母 ascii = 大写字母 ascii + 32（0x20）
    add $0x20, %al

notUpper:
    stosb
    # 判断字符串是否结束
    cmp $0, %al
    jne 0b

    leave
    ret
