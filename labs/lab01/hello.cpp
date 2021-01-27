#include <iostream>

// disable C++ function name mangling,
// so that after compiling and disassembling, 
// the function name remains intact.
extern "C" void print_user_info()
{
    std::cout << "User: bitate" << std::endl;
}

int main()
{
    print_user_info();
}