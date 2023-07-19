# 常量
.equ CONST_INT1, 100
.equ CONST_INT2, 200

.section .data
    # 初始化的 int
    int1: .int 0x7fffffff
    # 数组
    array1: .int 1, 2, 3, 4, 5

.section .bss
    # 未初始化的 int
    .lcomm int2, 4

.section .text
.global _start
# 使用 mov 传输数据
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

    # 传输内存的地址到寄存器
    movq $int1, %rax

    # 传输寄存器的数据到内存
    movl %eax, int2

    # 间接寻址
    movl $0, %r8d
    movl array1(,%r8,4), %r9d
    # c language：r9d = *(array1+0)
    movl $2, %r8d
    movl array1(,%r8,4), %r10d
    # c language：r10d = *(array1+2)
    movl $4, %r8d
    movl array1(,%r8,4), %r11d
    # c language：r11d = *(array1+4)

    # 间接寻址
    movq $array1, %r8
    movl (%r8), %r9d
    # c language：r9d = *((int*)(((char*)r8)+0))
    movl 4(%r8), %r10d
    # c language：r10d = *((int*)(((char*)r8)+4))
    movl 12(%r8), %r11d
    # c language：r11d = *((int*)(((char*)r8)+12))

    # 常量
    mov $CONST_INT1, %rax
    mov $CONST_INT2, %rax

    mov $0, %rdi
    mov $60, %rax
    syscall
