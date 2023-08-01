.section .data
    # 6 个字节 不包括结尾的 \0
    strpart1: .string "part1\n"
.section .data
    # 6 个字节 不包括结尾的 \0
    strpart2: .string "part2\n"

.section .text
.global _start
_start:
    mov $strpart1, %rdi
    call f8part1

    mov $strpart2, %rdi
    call f8part2

    mov $60, %rax
    mov $0, %rdi
    syscall
