#include <stdio.h>

extern "C" void print_me(char* log_message)
{
    printf("Print: %s", log_message);
}

int main()
{
    return 0;
}