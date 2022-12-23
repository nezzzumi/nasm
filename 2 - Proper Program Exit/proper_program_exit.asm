SECTION .data
msg db 'Hello, World!', 0Ah     ; assign the string to the variable

SECTION .text
global _start

_start:
    mov edx, 14     ; move the number of bytes of `msg` to EDX
    mov ecx, msg    ; move the address of `msg` to ECX
    mov ebx, 1      ; move the value 1 (STDOUT) to EBX
    mov eax, 4      ; move the value 4 (SYS_WRITE) to EAX
    int 80h         ; request an interrupted system call

    mov eax, 1      ; move the value 1 (SYS_EXIT) to EAX
    mov ebx, 0      ; move the value 0 to EBX (argument)
    int 80h         ; request an interrupted system call
