#include <stdio.h>

int main() {
    const int x = 4;
    int y;
    int z;
    {
        y = x;
        z = x;
    }
    int a = y + z;

    return 0;
}
