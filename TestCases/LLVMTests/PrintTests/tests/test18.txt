#include <stdio.h>

int main()
{

    printf("%s", "This is a beautifull string");

    char hello[6] = {'H', 'e', 'l', 'l', 'o', '\00'};

    printf("%% %s", &hello); // TODO

    return 0;
}
