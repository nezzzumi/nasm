SECTION .data
msg db 'Hello, World!', 0Ah     ; assign the string to the variable

SECTION .text
global _start

_start:
    mov edx, 14     ; move the number of bytes of `msg` to EDX
    mov ecx, msg    ; move the address of `msg` to ECX
    mov ebx, 1      ; move the value 1 (STDOUT) to EBX
    mov eax, 4      ; move the value 4 (syscall write) to EAX
    int 80h         ; request an interrupted system call
