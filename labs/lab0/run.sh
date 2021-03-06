#!/bin/bash

nasm -f elf64 -o main.o main.asm

# -c: only compile not link
g++ -c -o printer.o printer.cpp

# --dynamic-linker /lib64/ld-linux-x86-64.so.2 is used in Linux 64 bit
# -lc is to link C runtime library
ld -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o main.exe main.o printer.o

./main.exe