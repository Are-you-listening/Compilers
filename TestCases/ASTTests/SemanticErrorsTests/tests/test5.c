int main() {
    int x = 4;
    int* ptr = &x;
    float* ptr2 = 0;

    // wrong types
    float* ptr3 = ptr2 + ptr;
    return 0;

}
