#include <stdio.h>

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

    area = CIRCLE_AREA;
    printf("%d%d%d", radius,
           area, success);

    return 0;
}