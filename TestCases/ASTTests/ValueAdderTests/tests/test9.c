typedef int bool;
typedef int ieuw;

int main(){
    const char a = 'a';
    const int b = a;
    const float c = b;
    const ieuw d = c+b+a;
    const char e = d+c+b+a;
    const float f = e+d+c+b+a;
    const int g = e+d+c+b+a+f;
    const int h = g%12;
    const ieuw i = h-g*b/e;
    const float z = 0.895623;
    const char y = 'a';

    int* p = &a;
    *p = b;

    return 0;

}