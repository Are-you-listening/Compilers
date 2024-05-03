#include <stdio.h>

int main() {
    int i;
    for (i = 0; i < 5; i++) {
        {
            int loopVar = i * 10;
            printf("Loop variable: %d\n", loopVar);
        }
    }
    return 0;
}
