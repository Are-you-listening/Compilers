#include <stdio.h>

typedef int kappa;

// Defining parameterized macros with expression
#define CIRCLE_AREA 3.14
#define bool const int
#define True 1
#define False 0
#define appel int**

int x = 1;
int y = 2 + 5;
int z;
float h = CIRCLE_AREA;
//int z = x + y;

//int main = 5;

int main()
{
    int main = 3;
    int radius = 21;
    int side = 5;
    int area;
    bool success = True;

    // Using macros to calculate areas by
    // passing argument
    area = CIRCLE_AREA;
    printf("Area of Circle of radius %d: %d \n", radius,
           area);

    printf("%f", CIRCLE_AREA);
    printf("%f", h);

    return 0;
}
