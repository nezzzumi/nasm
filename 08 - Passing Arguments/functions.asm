; int slen(char *string)
; String length calculation function
slen:
    push ebx
    mov ebx, eax

nextchar:
    cmp byte [eax], 0
    jz finished
    inc eax
    jmp nextchar

finished:
    sub eax, ebx
    pop ebx
    ret


; sprint(char *string)
sprint:
    ; push registers to preserve the values
    push edx
    push ecx
    push ebx
    
    push eax    ; pass EAX (msg) as parameter
    call slen
                ; now EAX is the length of string
    mov edx, eax; move the length to EDX 
    pop eax     ; now EAX is msg again

    mov ecx, eax
    mov ebx, 1

    mov eax, 4
    int 0x80

    pop ebx
    pop ecx
    pop edx
    
    ret

; sprint(char *string)
sprintln:
    call sprint

    push eax

    ; We can't use EAX directly, because we need the address of the string.
    ; That's why we have to push it into the stack and pass the ESP (stack address pointer) as argumento to sprint
    mov eax, 0xa
    push eax
    
    mov eax, esp
    call sprint

    pop eax
    pop eax

    ret

; void exit(int exit_code)
exit:
    mov ebx, eax    ; receives exit_code in eax
    mov eax, 1      ; SYS_WRITE
    int 0x80

    ret