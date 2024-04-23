#include <stdio.h>

int a = 3;
int True = 1;

int main()
{
    int True = True - 20; // True is here not undeclared; it can come from a higher scope but in our checks it will find the LHS True
    int success = True;

    printf("%d", success);

    printf("%d", True);

    return 0;
}