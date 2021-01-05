;Sorting an array by selection sort           SEL_SORT.ASM
;
;        Objective: To sort an integer array using 
;                   selection sort.
;            Input: Requests numbers to fill array.
;           Output: Displays sorted array.
%include "io.mac"

MAX_SIZE       EQU   100

.DATA
input_prompt     db    "Please enter input array (a negative "
                 db    "number terminates the input):",0
out_msg          db    "The sorted array is:",0
empty_array_msg  db    "Empty array!",0

.UDATA
array          resw  MAX_SIZE

.CODE
        .STARTUP
        PutStr  input_prompt ; request input array
        xor     ESI,ESI      ; array index = 0
        mov     ECX,MAX_SIZE
array_loop:
        GetInt  AX           
        cmp     AX,0         ; negative number?
        jl      exit_loop    ; if so, stop reading numbers
        mov     [array+ESI*2],AX 
        inc     ESI          ; increment array index
        loop    array_loop   ; iterates a maximum of MAX_SIZE
exit_loop:
        push    ESI          ; push array size & array pointer
        push    array
        call    selection_sort
        mov     ECX,ESI      ; ECX = array size
        jecxz   empty_array  ; check for empty array
        PutStr  out_msg      ; display sorted array
        nwln
        mov     EBX,array
        xor     ESI,ESI
display_loop:
        PutInt  [array+ESI*2]
        nwln
        inc     ESI
        loop    display_loop
        jmp     short done
empty_array:
        PutStr  empty_array_msg
        nwln
done:                        
        .EXIT

;-----------------------------------------------------------
; This procedure receives a pointer to an array of integers
; and the array size via the stack. The array is sorted by
; using the selection sort. All registers are preserved.
;-----------------------------------------------------------
%define SORT_ARRAY  EBX
selection_sort:
       pushad                ; save registers
       mov     EBP,ESP
       mov     EBX,[EBP+36]  ; copy array pointer
       mov     ECX,[EBP+40]  ; copy array size
       cmp     ECX,1
       jle     sel_sort_done
       sub     ESI,ESI       ; array left of ESI is sorted
sort_outer_loop:
       mov     EDI,ESI
       ; DX is used to maintain the minimum value and AX
       ; stores the pointer to the minimum value
       mov     DX,[SORT_ARRAY+ESI*2]  ; min. value is in DX
       mov     EAX,ESI       ; EAX = pointer to min. value
       push    ECX
       dec     ECX           ; size of array left of ESI
sort_inner_loop:
       inc     EDI           ; move to next element
       cmp     DX,[SORT_ARRAY+EDI*2] ; less than min. value?
       jle     skip1         ; if not, no change to min. value
       mov     DX,[SORT_ARRAY+EDI*2]; else, update min. value (DX)
       mov     EAX,EDI              ; & its pointer (EAX)
skip1:
       loop    sort_inner_loop
       pop     ECX
       cmp     EAX,ESI    ; EAX = ESI?
       je      skip2      ; if so, element at ESI is in its place
       mov     EDI,EAX    ; otherwise, exchange
       mov     AX,[SORT_ARRAY+ESI*2]  ; exchange min. value 
       xchg    AX,[SORT_ARRAY+EDI*2]  ; & element at ESI
       mov     [SORT_ARRAY+ESI*2],AX
skip2:
       inc     ESI           ; move ESI to next element
       dec     ECX
       cmp     ECX,1         ; if ECX = 1, we are done
       jne     sort_outer_loop
sel_sort_done:
       popad                 ; restore registers
       ret     8
