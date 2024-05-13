#include <stdio.h>

struct MyStruct {
    int a;
    float b;
};

int main() {
    int intValue = 12345;
    struct MyStruct myStruct = *((struct MyStruct*)&intValue);

    printf("Integer value: %d\n", intValue);

    return 0;
}
