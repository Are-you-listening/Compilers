#include <stdio.h>

int forLoopCheck(int toCheck, int range)
{
    for (int i = 0; i <= range; i ++)
    {
        if ( i == toCheck)
        {
            return 1;
        }
    }
    return 0;
}
int main()
{
    int boolean = forLoopCheck( 5, 10);
    printf( "%d", boolean);
    return 0;
}