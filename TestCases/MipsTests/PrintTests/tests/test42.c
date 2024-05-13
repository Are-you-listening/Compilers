#include <stdio.h>


int main(){
    char s[10] = "string he";

    s[0] = 'a';
    s[1] = 101;

    char a = 'a';
    char* v = &a;
    *v = 'y';
    printf("%c", *v);

    printf("%s", s);
	return 0;
}
