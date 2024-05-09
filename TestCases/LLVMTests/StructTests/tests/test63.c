#include <stdio.h>

struct MyStruct {
    int a;
    float b;
};

int main() {
    struct MyStruct aStruct;
    (char*) aStruct;
    return 0;
}
