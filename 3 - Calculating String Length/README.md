## Calculating string length

This lesson gets the length of `msg` dynamically to pass to the `SYS_WRITE`.

## \_explanation

To dynamically get the length of `msg`, we need to have two registers pointing to his address.

```nasm
section .data
msg db 'Hello, wonderful world!', 0Ah

SECTION .text
GLOBAL _start

_start:
    mov eax, msg
    mov ebx, msg
```

Now, we will create a label "nextchar", that is responsible for "iterating" the string to know the length of the string.

```nasm
nextchar:
    cmp byte [eax], 0   ; compare the first byte of EAX with 0 (null terminator)
    jz finished         ; if the comparison is true, the ZERO FLAG is set as 1 (true), so jump to `finished`
    inc eax             ; else, increment the address of EAX by one byte (one char)
    jmp nextchar        ; jump to the initial point of `nextchar`
```

This "loop" will only stop when the byte is zero (string null terminator).

When it stop, `eax` will be the address of `msg` + the length of `msg`.

Now we only need to subtract EAX by EBX.

```nasm
sub eax, ebx
```

If the address of `msg` is 0x1000, and the length of his content is 0x18 (24), so, the value of EAX will be 0x1000 + 0x18.

EAX = 0x1018

Subtracting EBX (0x1000) by EAX, we got 0x18, that's the length of `msg`.

## \_references

- [Lesson 3](https://asmtutor.com/#lesson3)
- [write - Linux Syscalls Table](https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#i686_4)
- [exit - Linux Syscalls Table](https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#i686_1)
- [Advertising
  CPU Register - General Purpose Register](https://web.archive.org/web/20191114093028/https://gerardnico.com/computer/cpu/register/general)
