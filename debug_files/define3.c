#include <stdio.h>



#define appel peer
#define BUFFER_SIZE 1024
//#define BUFFER_SIZE 2048 // Error: Redefinition of 'BUFFER_SIZE'
//#define for 5; // Error: reserved keyword
//#define while 5; // Error: reserved keyword
//#define if 5; // Error: reserved keyword
//#define else 5; // Error: reserved keyword
//#define else if 5; // Error: reserved keyword
//#define switch 5; // Error: reserved keyword
//#define break 5; // Error: reserved keyword
//#define continue 5; // Error: reserved keyword
//#define return 5; // Error: reserved keyword

/*
#define
*/

//#include "enum1.c"

// keywords = ["for", "while", "if", "else", "else if", "switch", "break", "continue", "return", "default"]

int x = 1;

#include "define2.c"

int main()
{
    printf("%d",BUFFER_SIZE);
    return 0;
}
