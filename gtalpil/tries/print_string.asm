; Print user input string on screen.
section .data
    input_string db "How are you going? I'm born in the NASM assembler :D", 0x0a, 0 

section .text
    global _start

    _start:
        mov  eax, 0x04           ; 0x04 is the write() system call number
        mov  ebx, 0x01           ; 0x01 is the stdout file descriptor number
        mov  ecx, input_string   ; input_string is given input string
        call get_string_length   ; string_length will put the string size in %edx
        int  0x80
        
        mov eax, 1
        mov ebx, 0
        int 0x80

    get_string_length:
        push    esi              ; save esi
        mov     esi, ecx         ; esi = string pointer, ecx contains address to input_string
    repeat:
        cmp     byte[esi], 0     ; is the char NULL? esi contains the memory address of first char of input_string
                                 ; byte[esi] is the first char
        je      done             ; if so, done calculating string length
        inc     esi              ; else, move to next character
        jmp     repeat           ; and repeat
    done:
        sub     esi, ecx         ; compute string length, esi contains the length of input string
                                 ; at this point, ecx is the address of the tailing NULL, esi is 
                                 ; the address of the first char. Thus, esi -= ecx is the length.
        mov     edx, esi         ; return string length in edx
        pop     esi              ; restore esi
        ret