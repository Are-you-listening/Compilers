#include <stdio.h>

int main() {
    int i;
    for (i = 0; i < 3; i++) {
        {{{{{{{{
            int loopVar = i * 10;
            printf("%d", loopVar);
        }}}}}}}}
    }

    return 0;
}
