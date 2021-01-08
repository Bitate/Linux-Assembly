; @brief: Demonstrate calls made into glibc to send 
;         a short text string to stdout with puts().
; @Builf: Only support for x86 32-bit architecture.
;         nasm -f elf32 -o print_string.o print_string.asm
;         gcc -m32 -o print_string.elf print_string.o
; @Run: ./print_string

section .data       ; Section containing initialized data
    EatMsg: db "Hello! I'm printed with the help of C library's puts() function", 0

section .bss        ; Section containing uninitialized data

section .text       ; Section containing code

extern puts         ; Simple “put string” routine from glibc
global main         ; Required so linker can find entry point

main:
    ;;; Before calling glibc functions, we must preserve the following 32-bit registers in stack.
    push ebp        ; Set up stack frame for debugger
    mov  ebp, esp
    push ebx        ; Must preserve ebp, ebx, esi, & edi
    push esi
    push edi
    
    ;;; Everything before this is boilerplate; use it for all ordinary apps!
    push EatMsg     ; Push address of message on the stack
    call puts       ; Call glibc function for displaying strings
    add  esp, 4     ; Clean stack by adjusting ESP back 4 bytes
    
    ;;; Everything after this is boilerplate; use it for all ordinary apps!
    pop  edi        ; Restore saved registers
    pop  esi
    pop  ebx
    mov  esp, ebp   ; Destroy stack frame before returning
    pop  ebp
    ret             ; Return control to Linux
