#include <stdio.h>

// Defining parameterized macros with expression
#define CIRCLE_AREA 3.14
#define bool const int
#define True 1
#define False 0
#define appel int**

int** x;
int y = 1;

enum week{Mon, Tue, Wed, Thur, Fri, Sat, Sun};

typedef int enumweek;

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

        enum week day;
    day = Wed;
    printf("%d",day);

    return 0;
}
