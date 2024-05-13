#include <stdio.h>

int a(const int b){
    printf("%d", b);
    return 0;
}

int main(){
    int c = 2;
    a(c);

    return 0;

}