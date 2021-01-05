;Fibonacci number - Recursive version           FIB.ASM
;
;        Objective: To compute the Fibonacci number.
;            Input: Requests an integer N from the user.
;           Output: Outputs fib(N).                  

%include "io.mac"

.DATA
prompt_msg  db  "Please enter a number > 0: ",0
output_msg  db  "fib(N) is: ",0
error_msg   db  "Not a valid number. Try again.",0

.CODE
      .STARTUP
      PutStr  prompt_msg     ; request the number

try_again:
      GetInt  BX             ; read number into BX
      cmp     BX,0           ; test if N>0
      jg      num_ok
      PutStr  error_msg
      nwln
      jmp     try_again

num_ok:
      call    fib

      PutStr  output_msg     ; output result
      PutLInt EAX
      nwln

done:
      .EXIT

;---------------------------------------------------
;Procedure fib receives a positive integer N in BX.
;It returns fib(N) in the EAX register.
;---------------------------------------------------

fib:
      cmp     BX,2           ; if N > 2, recurse
      jg      one_up
      mov     EAX,1          ; return 1 if N = 1 or 2
      ret                    ; terminate recursion
                      
one_up:
      push    EDX
      dec     BX             ; recurse with (N-1)
      call    fib
      mov     EDX,EAX        ; save fib(N-1) in EDX
      dec     BX             ; recurse with (N-2)
      call    fib
      add     EAX,EDX        ; EAX = fib(N-2) + fib(N-1)

      add     BX,2           ; restore BX and EDX
      pop     EDX

      ret  
