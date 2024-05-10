#include <stdio.h>

int main(){
    char s[10] = "string\nhe";

    s[0] = 'a';



    s[1] = 101;

    printf("%s", s);

    char* str = "string he";
    printf("%s", str);
	return 0;
}
