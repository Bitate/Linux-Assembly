;Linear search of integer array                 LIN_SRCH.ASM
;
;        Objective: To implement linear search on an integer
;                   array.
;            Input: Requests numbers to fill array and a 
;                   number to be searched for from user.
;           Output: Displays the position of the number in
;                   the array if found; otherwise, not found
;                   message.
%include "io.mac"

MAX_SIZE       EQU   20

.DATA
input_prompt   db    "Please enter input values "
               db    "(a negative value terminates input):",0
query_number   db    "Enter the number to be searched: ",0
out_msg        db    "The number is at position ",0
not_found_msg  db    "Number not in the array!",0
query_msg      db    "Do you want to quit (Y/N): ",0

.UDATA
array          resw  MAX_SIZE

.CODE
        .STARTUP
        PutStr  input_prompt 
        xor     ESI,ESI      ; index = 0
        mov     ECX,MAX_SIZE
array_loop:
        GetInt  AX         
        cmp     AX,0         ; negative number?
        jl      read_input   ; if so, stop reading numbers
        mov     [array+ESI*2],AX    
        inc     ESI          ; increment array index
        loop    array_loop   ; iterates a maximum of MAX_SIZE
read_input:
        PutStr  query_number ; request a number to be searched
        GetInt  AX           
        push    AX           ; push number, size & array pointer
        push    ESI
        push    array
        call    linear_search
        ; linear_search returns in AX the position of the number 
        ; in the array; if not found, it returns 0.
        cmp     AX,0         ; number found?
        je      not_found    ; if not, display number not found
        PutStr  out_msg      ; else, display number position
        PutInt  AX
        jmp     SHORT user_query
not_found:
        PutStr  not_found_msg
user_query:
        nwln
        PutStr  query_msg    ; query user whether to terminate
        GetCh   AL          
        cmp     AL,'Y'       ; if response is not 'Y'
        jne     read_input   ; repeat the loop
done:                        
        .EXIT

;-----------------------------------------------------------
; This procedure receives a pointer to an array of integers,
; the array size, and a number to be searched via the stack.
; If found, it returns in AX the position of the number in
; the array; otherwise, returns 0.
; All registers, except EAX, are preserved.
;-----------------------------------------------------------
linear_search:
       enter   0,0
       push    EBX           ; save registers
       push    ECX
       mov     EBX,[EBP+8]   ; copy array pointer
       mov     ECX,[EBP+12]  ; copy array size
       mov     AX,[EBP+16]   ; copy number to be searched
       sub     EBX,2         ; adjust pointer to enter loop
search_loop:
       add     EBX,2         ; update array pointer
       cmp     AX,[EBX]      ; compare the numbers
       loopne  search_loop
       mov     AX,0          ; set return value to zero
       jne     number_not_found
       mov     EAX,[EBP+12]  ; copy array size
       sub     EAX,ECX       ; compute array index of number
number_not_found:
       pop     ECX           ; restore registers
       pop     EBX
       leave
       ret     10