# https://csiflabs.cs.ucdavis.edu/~ssdavis/50/att-syntax.htm
# https://thestarman.pcministry.com/asm/debug/Segments.html
# https://sourceware.org/binutils/docs/as/

# directives

# labels

# instructions

# symbols

# a maximum of 3 operands


# All register names of the IA-32 architecture 
# must be prefixed by a '%'. For example:
%al
%bx
%dx
%cr0
%cr3
mov %ax, %bx


# Literal Values
# All literal value must be prefixed by a '$'
mov $100, %bx   # move 100 into AX register
mov $A,   %al   # move the numerical value of ASCII 'A' into AL register


# Memory Addressing
# segment-override: signed-offset(base, index, scale)
# Part of above can be omitted depending on the address you choose
%es: 100(%eax, %ebx, 2)
# Note: the offset and scale should not be prefixed by '$'.
mov %ax,  100   # move the value of register AX into offset 100 of data segment register(by default)
mov %eax, -100(%eax) # move the value in eax register to [eax-100]


# Control Transfer Instructions