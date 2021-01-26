

segment .text
segment .data
log_message db "Kick off Initializing Operating System", 0

extern print_me

_start:
    push log_message
    call print_me