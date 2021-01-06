nasm -f elf32 -o print_string.o print_string.asm
ld -m elf_i386 print_string.o -o print_string.exe