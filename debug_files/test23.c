#include <stdio.h>



int main(){

    char buffer[50];
    char* c = "some_filename.txt";
    fgets(buffer, 50, c);

    return 0;

}