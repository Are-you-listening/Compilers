#include <stdio.h>

int a(){
    return 97;
}

int main(){

    char f = (char) a();
    printf("%c", f);

    return 0;

}