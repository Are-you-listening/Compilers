#include <stdio.h>


int main(){
    char s[10] = "string he";

    s[0] = 'a';
    s[1] = 101;

    char* v;
    *v = 'y';

    printf("%s", s);
	return 0;
}
