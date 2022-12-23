section .text
global _start

_start:
    mov eax, 1
    call inc

    mov ebx, 0
    mov eax, 1
    int 80h

inc:
    inc eax
    ret