#include <stdio.h>

struct MyStruct {
    int a;
    float b;
};

int main() {
    struct MyStruct myStruct;
    int intValue = *((int*)&myStruct);

    return 0;
}
