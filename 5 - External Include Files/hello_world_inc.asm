%include 'functions.asm'

section .data
msg db "Now we're working with includes!", 0Ah
msg2 db "This is a test.", 0Ah

section .text
global _start

_start:
    mov eax, msg
    call sprint

    mov eax, msg2
    call sprint

    mov eax, 0      ; exit code
    push eax
    call exit