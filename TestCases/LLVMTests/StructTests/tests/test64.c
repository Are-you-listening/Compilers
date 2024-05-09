#include <stdio.h>

struct MyStruct {
    int a;
    float b;
};

int main() {
    float floatValue = 12345.6789;
    (struct MyStruct) floatValue;
    return 0;
}
