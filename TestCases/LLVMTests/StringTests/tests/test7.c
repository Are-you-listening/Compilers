#include <stdio.h>

int printthings(char* z){
    printf("%s", z);
    return 5;
};

int main(){
    char y[6] = "jajaj";
    printthings(y);
    return 0;
}