%include 'functions.asm'

section .data

section .text
global _start

_start:
    pop ecx;

nextArg:
    cmp ecx, 0x0
    jz noMoreArgs
    pop eax
    call sprintln
    dec ecx
    jmp nextArg

noMoreArgs:
    mov eax, 0      ; exit code
    push eax
    call exit