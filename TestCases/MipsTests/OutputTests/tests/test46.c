#include <stdio.h>

int main() {
    int arr[3] = {10, 20, 30};
    int* start = arr;
    int* end = arr + 2;
    int* beyond = arr + 3;

    printf("start < end: %d\n", start < end);
    printf("end < beyond: %d\n", end < beyond);
    printf("beyond == arr + 3: %d\n", beyond == arr + 3);
    printf("beyond > end: %d\n", beyond > end);
    return 0;
}
