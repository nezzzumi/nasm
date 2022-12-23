## Subroutines

In this lesson, we will use subroutines, that work like a function in Python, C/C++, Java, etc.

The function is created the same way as a label.

The difference between functions and labels is that we don't use `JMP` to execute his content. We use `CALL`.

```nasm
section .text
global _start

_start:
    mov eax, 1
    call inc

    ; If you set a breakpoint after `call inc`, you will be able to see that the EAX is 2.

    ; SYS_EXIT
    mov ebx, 0
    mov eax, 1
    int 80h


; This function increments the value in EAX.
inc:
    inc eax
    ret
```

## \_debugging

We can check it by debugging the ELF.

Let's compile our `increment.asm`.

```bash
nasm -f elf increment.asm
ld -m elf_i386 -o increment.out increment.o
```

To set the breakpoint, we need to know the operation's address.

We can use `objdump` for it.

```bash
objdump -d increment.out -M intel
```

> You can also use `disassemble _start` in GDB to check the disassembly.

The output:

```
increment.out:     file format elf32-i386


Disassembly of section .text:

08049000 <_start>:
 8049000:       b8 01 00 00 00          mov    eax,0x1
 8049005:       e8 0c 00 00 00          call   8049016 <inc>
 804900a:       bb 00 00 00 00          mov    ebx,0x0
 804900f:       b8 01 00 00 00          mov    eax,0x1
 8049014:       cd 80                   int    0x80

08049016 <inc>:
 8049016:       40                      inc    eax
 8049017:       c3                      ret
```

We will set the breakpoint at `0x804900a` (after calling `inc`).

Now that we already know the address, let's run the debugger.

To load the program with GDB:

```bash
gdb increment.out
```

To set a breakpoint we use:

```
(gdb) break *0x804900a
```

> You can also use just b \*0x804900a

When you load a program with GDB, it keeps paused until you type `run` (or just `r`).

So, let's run the program.

```
(gdb) r
Starting program: increment.out

Breakpoint 1, 0x0804900a in _start ()
(gdb)
```

To check the value of registers, we use `info registers`, or just `info registers eax` to check only this register.

> You can just type `i r eax`

```
(gdb) i r eax
eax            0x2                 2
(gdb)
```

## \_references

- https://syscalls.w3challs.com/?arch=x86
