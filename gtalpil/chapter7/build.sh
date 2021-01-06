#!/bin/bash

# Build object file
nasm -f elf32 -o sample.o sample.asm

# Link object files
ld -m elf_i386 -o sample.exe sample.o io.o

# Disassemble executable file
objdump -D -M intel sample.exe | cat > sample_disassemble.asm