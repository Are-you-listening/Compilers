int main() {
    int x = 4;
    int y = 5;

    int* ptr = &x;
    ptr++; // now points to y
    ptr--; // now points to x

    int is_x = (ptr == &x);
    int is_y = (ptr == &y);
    is_y = (&x != ptr);

    float* ptr2 = 0;

    ptr2 >= ptr;
    ptr2 <= ptr;
    ptr > &x;
    ptr < 32;

    int num_skip_elements = 4;

    ptr = ptr + 4*num_skip_elements;

    return 0;
}
