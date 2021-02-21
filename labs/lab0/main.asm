extern say_hello_world

section .text
    global _start

    _start:
        call say_hello_world
        jmp $