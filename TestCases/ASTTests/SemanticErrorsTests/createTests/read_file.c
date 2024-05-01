#include <stdio.h>

int a = 3;
int True = 1;

int main()
{
    int True = True - 20; // True is here not undeclared; it can come from a higher scope!

    return 0;
}

