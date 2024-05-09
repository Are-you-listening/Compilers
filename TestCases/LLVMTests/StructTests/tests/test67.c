#include <stdio.h>

struct MyStruct {
    int a;
    float b;
};

int main() {
    int intValue = 12345;
    (struct MyStruct) intValue;
    return 0;
}