; sections are empty buffers for data that will be read/wrote
section .data           ; holds named data items/variables
section .text           ; holds program code
        global _start

_start:
        nop
; put your experiments between two nops
        nop
section .bss            ; holds uninitialized data (optional section)
