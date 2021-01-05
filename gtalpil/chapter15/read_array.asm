;Reading long integers into an array           READ_ARRAY.ASM
;
;        Objective: To read long integers into an array;
;                   demonstrates the use of loopne.
;            Input: Requests nonzero values to fill the array; 
;                   a zero input terminated input.
;           Output: Displays the array contents.

%include "io.mac"

MAX_SIZE       EQU   20

.DATA
input_prompt   db    "Enter at most 20 nonzero values "
               db    "(entering zero terminates input):",0
out_msg        db    "The array contents are: ",0
empty_msg      db    "The array is empty. ",0
query_msg      db    "Do you want to quit (Y/N): ",0

.UDATA
array          resd  MAX_SIZE

.CODE
        .STARTUP
read_input:
        PutStr  input_prompt ; request input array
        xor     ESI,ESI      ; ESI = 0 (ESI is used as an index)
        mov     ECX,MAX_SIZE
read_loop:
        GetLInt EAX          
        mov     [array+ESI*4],EAX
        inc     ESI          ; increment array index
        cmp     EAX,0        ; number = zero?
        loopne  read_loop    ; iterates a maximum of MAX_SIZE
exit_loop:
        ; if the input is terminated by a zero, 
        ; decrement ESI to keep the array size
        jnz     skip         
        dec     ESI
skip:
        mov     ECX,ESI      ; ESI has the actual array size
        jecxz   empty_array  ; if ecx = 0, empty array
        xor     ESI,ESI      ; initalize index to zero  
        PutStr  out_msg     
write_loop:
        PutLInt [array+ESI*4]
        nwln
        inc     ESI
        loop    write_loop
        jmp     short user_query
empty_array:
        PutStr  empty_msg    ; output empty array message
        nwln
user_query:
        PutStr  query_msg    ; query user whether to terminate
        GetCh   AL           
        cmp     AL,'Y'       ; if response is not 'Y'
        jne     read_input   ; repeat the loop
done:                        
        .EXIT