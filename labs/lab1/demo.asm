; This file demonstrates the use of [ ] in NASM assembly language.
section .bss
    buffer: resb 8

section .text
    global _start
        _start:
            mov rax, 8
            mov [buffer], rax   ; the label buffer is an address, 
                                ; whereas [buffer] is the content/value at that address
            mov rbx, [buffer]   ; copy the content to rbx
            mov rcx, buffer     ; copy the address to rcx
            jmp $               ; infinite loop