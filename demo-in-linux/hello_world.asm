# 数据段
.section .data
    # 13 个字节，不包括结尾的 \0
    helloworld: .string "hello, world\n"

# 代码段
.section .text
# _start 是程序入口，相当于 c 的 main 函数
.globl _start
_start:
    # rax=1（系统调用号） => sys_write(fd, buf, count)
    # rdi=1 => fd=1（1=stdout）；rsi=buf；count=13
    # 相当于 c 的 printf("hello, world\n");
    mov $1, %rax
    mov $1, %rdi
    mov $helloworld, %rsi
    mov $13, %rdx
    syscall

    # rax=60（系统调用号） => sys_exit(error_code)
    # 相当于 c 的 return 0;
	mov $60, %rax
	mov $0, %rdi
	syscall
