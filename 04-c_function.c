#include <stdio.h>

// Build dylib using the command
// cc -dynamiclib c_function.c -o c_function.dylib

unsigned int C_function(unsigned int x, unsigned int y)
{
    unsigned int r;

    printf("[C] Congratulations, you just called a C-function.\n");

    while (y > 0)
    {
        r = x % y;
        x = y;
        y = r;
    }

    return x;
}

void C_print()
{
    printf("[C] Goodbye from C!\n");
}
