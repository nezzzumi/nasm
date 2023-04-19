%include 'functions.asm'

section .data
    inputmsg db "Enter your name: ", 0x0
    greetingsmsg db "What's up, "

section .bss
    userinput resb 255

section .text
    global _start

    _start:
        mov eax, inputmsg
        call sprint

        mov edx, 255            ; number of bytes to read
        mov ecx, userinput      ; buffer to save the content
        mov ebx, 0              ; FD (STDIN)
        mov eax, 3              ; SYS_READ
        
        int 0x80

        mov eax, greetingsmsg
        call sprint

        mov eax, userinput
        call sprintln

        call exit

