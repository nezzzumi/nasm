SECTION .data

msg db 'Hello, wonderful world!', 0Ah

SECTION .text
GLOBAL _start

_start:
    mov ebx, msg    ; move the address of msg to EBX
    mov eax, ebx    ; move the address of EBX to EAX (both now pointing to the same address)

nextchar:
    cmp byte [eax], 0   ; compare the first byte of EAX with 0 (null terminator)
    jz finished         ; if the comparison is true, the ZERO FLAG is set as 1 (true), so jump to `finished`
    inc eax             ; else, increment the address of EAX by one byte (one char)
    jmp nextchar        ; jump to the initial point of `nextchar`

finished:
    sub eax, ebx    ; subtract the address of EBX from the address in EAX
                    ; EAX and EBX were pointing to the same address.
                    ; We have incremented the address of EAX by 1 for each character in `msg`
                    ; so, if the address of `msg` is 0x1000, and his content is "Hello", we got:
                    ; EBX = 0x1000
                    ; EAX = 0x1005      # 0x1000 + len(msg)
                    ; EAX - EBX = 0x5   # The length of `msg`

    ; SYS_WRITE
    mov edx, eax    ; move the length to EDX
    mov ecx, msg    ; move the `msg` address to ECX
    mov ebx, 1      ; move the value 1 (STDOUT) to EBX
    mov eax, 4      ; move the value 4 (SYS_WRITE OPCODE) to EAX
    int 80h         ; request an interrupted system call

    ; SYS_EXIT
    mov ebx, 0
    mov eax, 1
    int 80h