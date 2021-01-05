;Multiplies two 32-bit signed integerts     MULT.ASM
;
;        Objective: To use the multiply instruction.
;            Input: Requests two integers N and M.
;           Output: Outputs N*M if no overflow.
%include "io.mac"

.DATA
prompt_msg  db   "Enter two integers: ",0
output_msg  db   "The product = ",0
oflow_msg   db   "Sorry! Result out of range.",0
query_msg   db   "Do you want to quit (Y/N): ",0

.CODE
      .STARTUP
read_input:
      PutStr  prompt_msg
      GetLInt EAX
      GetLInt EBX
      imul    EBX            ; signed multiply
      jc      overflow          
      PutStr  output_msg     ; no overflow
      PutLInt EAX            ; display result
      nwln
      jmp     short user_query
overflow:
      PutStr  oflow_msg
      nwln
user_query:
      ; query user whether to terminate
      PutStr  query_msg    
      GetCh   AL           
      cmp     AL,'Y'         ; if response is not 'Y'
      jne     read_input     ; repeat the loop
done:
      .EXIT
