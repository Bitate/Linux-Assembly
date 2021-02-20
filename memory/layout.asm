;BITS 64

;interrupt_descriptor_table_address: RESB 0;
;global_descriptor_table_address: RESB 0;

;sidt [interrupt_descriptor_table_address]
;sgdt [global_descriptor_table_address]

; ax register content

.DATA
ax_register: dq 0

.CODE
    .STARTUP
        mov ax, WORD 0x1234
        mov [ax_register], ax
        jmp $