.section .data
    byte1: .byte 0b00010001
    byte2: .byte 0b00010001
    byte3: .byte 0b00110011

.section .text
.globl _start
# or，或运算
_start:
    # 立即数 and 寄存器
    mov $0b00010001, %al
    or $0b00110011, %al

    # 立即数 and 内存
    orb $0b00110011, byte1

    # 寄存器 and 寄存器
    mov $0b00110011, %al
    mov $0b00010001, %bl
    or %al, %bl

    # 寄存器 and 内存
    mov $0b00110011, %al
    or %al, byte2

    # 内存 and 寄存器
    mov $0b00010001, %al
    or byte3, %al

	mov $0, %rdi
	mov $60, %rax
	syscall
