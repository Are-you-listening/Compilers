int main() {
    float f = 3.14;
    const float* pf = &f;
    const float** ppf = &pf;
    int* pi = (int*)ppf;
    int result = *pi + 1;
}