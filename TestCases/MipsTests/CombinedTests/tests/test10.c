#include <stdio.h>

#define VLEES 180.01
#define KAAS 180.1

float smallest(float a, float b)
{
    if (a < b)
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
    float biggest = smallest(KAAS, VLEES);
    printf( "%d", (int) biggest);
    return 0;
}