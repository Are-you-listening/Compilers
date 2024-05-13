#include <stdio.h>

int main() {
    struct Point {
        int x;
        int y;
    };

    struct Point pt1;
     struct Point pt2;

    pt1.x = 1;
    pt1.y = 2;
    pt2.x = 3;
    pt2.y = 4;

    int* px1 = &pt1.x;
    int* py1 = &pt1.y;
    int* px2 = &pt2.x;

    printf("px1 < py1: %d\n", px1 < py1);
    printf("px1 == px2: %d\n", px1 == px2);

    return 0;
}
