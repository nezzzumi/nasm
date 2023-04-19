## Hello, World!

A simple "Hello, World!".

## \_useful

### \_syscalls

The file `unistd_32.h` contains the opcode of all syscalls. We can find this file on our Linux with `locate unistd_32.h`.

### \_registers

Inside the syscall's manpage, we have a table that shows how we should work with the syscalls based on our architecture.

|  Arch  | Instruction | System call | Ret val |
| :----: | :---------: | :---------: | :-----: |
|  i386  |  int 0x80   |     eax     |   eax   |
| x86-64 |   syscall   |     rax     |   rax   |

> System Call is the register that stores the opcode of our syscall.

We also got an order to pass the arguments to the syscalls.
| arch | arg1 | arg2 | arg3 | arg4 | arg5 | arg6 | arg7 |
| :----: | :----: | :----:|:----:|:----:|:----:|:----: | :----: |
| x86 | ebx | ecx | edx | esi | edi | ebp | - |
| x86_64 | rdi | rsi | rdx | r10 | r8 | r9 | - |

## \_references

- [Lesson 1](https://asmtutor.com/#lesson1)
- [Linux Syscalls Table](https://chromium.googlesource.com/chromiumos/docs/+/HEAD/constants/syscalls.md#x86-32_bit)
- [Advertising
  CPU Register - General Purpose Register](https://web.archive.org/web/20191114093028/https://gerardnico.com/computer/cpu/register/general)
