#include <stdio.h>

// for loop is not allowed in global scope
for (int i = 0; i < 5; i++) {
    printf("%d", i);
}

int main() {
    return 0;
}