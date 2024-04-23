#include <stdio.h>

#define CIRCLE_AREA 3.14
#define bool const int
#define True 1
#define False 0
#define appel int**

int main()
{

    printf("%d", True);

    #define True -20

    int radius = 21;
    int side = 5;
    int area;
    bool success = True;

    area = CIRCLE_AREA;

    printf("%d", success);

    side = 7;

    printf("%d", True);
    return 0;
}