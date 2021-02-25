; In cryptography, a Caesar cipher is one of the simplest known encryption techniques. 
; In this method, each letter in the data to be encrypted is replaced by a letter some 
; fixed number of positions down the alphabet. In this demo, let us encrypt a data by 
; simply replacing each alphabet in it with a shift of two alphabets, so 'a' will be 
; substituted by 'c', 'b' with 'd' and so on. We use LODS and STOS to read, manipulate 
; and store the original string 'password' into the destination memory.

section .data
source_string: db "password", 0 ; source string
len equ $-source_string         ; calculate string length

section .bss
destination_string resb 10      ; destination string

section .text
    global _start

_start:
    mov rcx, len
    mov rsi, source_string
    mov rdi, destination_string

loop_here:
    lodsb       ; load a byte from source_string into rax register
    add al, 2   ; manipulate the byte read from source_string
    stosb       ; store that byte into memory location specified in rdi register

    loop loop_here 

    ; Call Linux kernel API to print string.
    mov edx, 20
    mov ecx, destination_string
    mov ebx, 1
    mov eax, 4
    int 0x80

    ; Call Linux kernel API to exit the program.
    mov eax, 1
    int 0x80
