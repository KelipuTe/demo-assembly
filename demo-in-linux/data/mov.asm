.equ CONST_INT1,100
.equ CONST_INT2,200

.section .data
    int1: .int 0x7fffffff
    array1: .int 1,2,3,4,5

.section .bss
    .lcomm int2, 4

.section .text
.global _start
_start:
    # 传输立即数到寄存器
    movb $0x7f, %al
    movw $0x7fff, %ax
    movl $0x7fffffff, %eax
    movq $0x7fffffffffffffff, %rax

    # 传输寄存器的数据到寄存器
    movq %rax, %rbx

    # 传输内存的数据到寄存器
    movl int1, %eax

    # 传输寄存器的数据到内存
    movl %eax, int2

    # 传输数组的数据到寄存器需要使用偏移量
    movl $0, %r8d
    movl array1(,%r8,4), %r9d
    movl $2, %r8d
    movl array1(,%r8,4), %r10d
    movl $4, %r8d
    movl array1(,%r8,4), %r11d

    # 使用寄存器间接寻址
    movq $array1, %r8
    movl (%r8), %r9d
    movl 4(%r8), %r10d
    movl 12(%r8), %r11d

    # 常量
    mov $CONST_INT1, %rax
    mov $CONST_INT2, %rax

    mov $1, %rdi
    mov $60, %rax
    syscall
