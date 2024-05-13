#include <stdio.h>

#define VLEES 180

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
    float biggest = whatIsBigger(154.55, VLEES);
    printf( "%f", biggest);
    return 0;
}