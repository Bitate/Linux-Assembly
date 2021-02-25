nasm -f elf64 -F dwarf -g -o demo.o demo.asm

ld --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o demo.exe demo.o