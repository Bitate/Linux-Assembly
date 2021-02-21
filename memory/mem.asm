;interrupt_descriptor_table_address: RESB 0;
;global_descriptor_table_address: RESB 0;

;sidt [interrupt_descriptor_table_address]
;sgdt [global_descriptor_table_address]

section .data
    ax_register: dq 0

section .text
    global _start

    _start:
        mov ax, WORD 0x1234
        mov [ax_register], ax
        jmp $