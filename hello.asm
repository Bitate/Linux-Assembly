section .text
global  _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len

    int 0x80

exit:
    mov eax, 1
    int 0x80

section .data

msg db 'Hello world! :D', 0xa
len equ $-msg