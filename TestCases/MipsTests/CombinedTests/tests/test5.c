#include<stdio.h>
void pattern(int n)
{
    int i;
    int j;
    char space = ' ';
    char star = '*';
    // This is upper half of pattern
    for (i=1; i<=n; i++)
    {
        for (j=1; j<=(2*n); j++)
        {
            // Left part of pattern
            if (i>(n-j+1))
            {
               printf("%c", space);
            }
            else
            {
               printf("%c", star);
            }
            // Right part of pattern
            if ((i+n)>j)
            {
               printf("%c", space);
            }
            else
            {
               printf("%c", star);
            }

        }
        printf("%c\n", space);
    }
    // This is lower half of pattern
    for (i=1; i<=n; i++)
    {
        for (j=1; j<=(2*n); j++)
        {
            // Right Part of pattern
            if (i<j)
            {
               printf("%c", space);

            }
            else
            {
               printf("%c", star);
            }
            // Left Part of pattern
            if (i<=((2*n)-j))
            {
               printf("%c", space);
            }
            else
            {
              printf("%c", star);
            }
        }
        printf("%c\n", space);
    }
}

// Driver Code
int main()
{
    pattern(7);
    return 0;
}