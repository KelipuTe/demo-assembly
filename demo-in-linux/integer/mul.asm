.section .data
    int1: .int 2

.section .text
.global _start
_start:
    mov $2, %rax
    mov $2, %rbx
    # rax=rax*rbx
    mul %rbx

    mov $2, %rax
    # rax=rax*int1
    mull int1

    mov $0xffffffffffffffff, %rax
    mov $2, %rbx
    # $0xffffffffffffffff * 2 = 0x1,ffff,ffff,ffff,fffe
    # rdx=0x1 rax=0xffff,ffff,ffff,fffe
    mul %rbx

    mov $1, %rdi
    mov $60, %rax
    syscall
