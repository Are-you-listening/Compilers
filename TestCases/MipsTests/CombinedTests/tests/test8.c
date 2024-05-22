#include <stdio.h>

float whatIsBigger(float a, float b)
{
    if (a > b)
    {
        return a;
    }
    else
    {
        return b;
    }

}
int main()
{
    float biggest = whatIsBigger(154.55, 854.154);
    printf( "%d", (int) biggest);
    return 0;
}