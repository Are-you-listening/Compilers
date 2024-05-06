#include <stdio.h>

void printArr(int * arr, int length)
{
    for (int i=0; i < length; i++)
    {
        printf("%d", *(arr++));
    }



}
int main()
{
    int array[12] = {1,2,3,4,5,6,7,8,9,10,11,12};
    printArr(array, 12);
    return 0;
}