.section .data
    byte1: .byte 0b00110011
    byte2: .byte 0b00110011
    byte3: .byte 0b00010001
    byte4: .byte 0b00110011

.section .text
.globl _start
# and，与运算
_start:
    # 立即数 and 寄存器
    mov $0b00110011, %al
    and $0b00010001, %al

    # 立即数 and 内存
    andb $0b00010001, byte1

    # 寄存器 and 寄存器
    mov $0b00010001, %al
    mov $0b00110011, %bl
    and %al, %bl

    # 寄存器 and 内存
    mov $0b00010001, %al
    and %al, byte2

    # 内存 and 寄存器
    mov $0b00110011, %al
    and byte3, %al

	mov $0, %rdi
	mov $60, %rax
	syscall
