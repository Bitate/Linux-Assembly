;String length procedure                       MODULE2.ASM
;
;         Function: To write a procedure to compute string
;                   length of a NULL-terminated string.
;         Receives: String pointer in the EBX register.
;          Returns: Returns string length in AX.
%include "io.mac"
	
.CODE
global string_length
string_length:
      ; all registers except AX are preserved
      push    ESI            ; save ESI
      mov     ESI,EBX        ; ESI = string pointer
repeat:
      cmp     byte [ESI],0   ; is it NULL?
      je      done           ; if so, done
      inc     ESI            ; else, move to next character
      jmp     repeat         ;       and repeat
done:
      sub     ESI,EBX        ; compute string length
      mov     AX,SI          ; return string length in AX
      pop     ESI            ; restore ESI
      ret
