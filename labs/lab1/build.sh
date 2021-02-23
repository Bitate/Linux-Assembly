# https://stackoverflow.com/a/39671078/11850070
nasm -g -F dwarf -f elf64 -o demo.o demo.asm

ld --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o demo.exe demo.o

echo "Done! Please debug it in GDB to check the values of registers during the execution."