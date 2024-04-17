#include <stdio.h>

// Defining parameterized macros with expression
#define CIRCLE_AREA 3.14
#define bool const int
#define True 1
#define False 0
#define appel int**

int main()
{

    int radius = 21;
    int side = 5;
    int area;
    bool success = True;

    // Using macros to calculate areas by
    // passing argument
    area = CIRCLE_AREA;
    printf("Area of Circle of radius %d: %d \n", radius,
           area);

    return 0;
}