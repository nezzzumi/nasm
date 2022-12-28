%include 'functions.asm'

section .data
msg db "Now we're working with includes!", 0x0
msg2 db "This is a test.", 0x0

section .text
global _start

_start:
    mov eax, msg
    call sprintln

    mov eax, msg2
    call sprintln

    mov eax, 0      ; exit code
    push eax
    call exit