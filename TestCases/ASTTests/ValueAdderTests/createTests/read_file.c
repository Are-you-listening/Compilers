#include <stdio.h>

int main() {
    const int loopConst = 5;
    int result = 0;
    int i = 0;
    for (; i < loopConst; ++i) {
        result = result + loopConst;
    }
    printf("Result: %d\n", result);
    return 0;
}
