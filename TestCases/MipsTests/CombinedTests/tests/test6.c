// C program to sort the array in an
// ascending order using selection sort
#include <stdio.h>

void swap(int* xp, int* yp)
{
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}


// Function to perform Selection Sort
void selectionSort(int* arr, int n)
{
    int i;
    int j;
    int min_idx;

    // One by one move boundary of
    // unsorted subarray
    for (i = 0; i < n - 1; i++) {
        // Find the minimum element in
        // unsorted array
        min_idx = i;
        for (j = i + 1; j < n; j++)
        {
          if (arr[j] < arr[min_idx])
            {
                min_idx = j;
            }
        }


        // Swap the found minimum element
        // with the first element
        swap(&arr[min_idx], &arr[i]);
    }
}


// Function to print an array
void printArray(int* arr, int size)
{
    int i;
    for (i = 0; i < size; i++)
    {
       printf("%d ", arr[i]);
    }

    printf("\n");
}

// Driver code
int main()
{
    int arr[5] = { 0, 23, 14, 12, 9 };
    int n = 5;
    printArray(arr, n);

    selectionSort(arr, n);
    printArray(arr, n);

    return 0;
}