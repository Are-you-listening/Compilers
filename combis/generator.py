import os


variables = ["i_array", "i_ptr", "i", "c_array", "c_ptr", "c", "f_array", "f_ptr", "f"]
binary_ops = ["+","-","*","/","%","<<",">>", '<' , '>', '>=' , '<=', '==' , '!=', '&','^','&&','||','|']
unary_ops = ["--","++","-","+","!", "~"]

header = """#include <stdio.h>

int main(){
    int i_array[4];
    int* i_ptr;
    int i;

    char c;
    char c_array[4];
    char* c_ptr;

    float f;
    float f_array[4];
    float* f_ptr;"""

end = """    return 0;
}"""

def createTestFile(var, operator, var2):
    with open(f"tests/test{index}.c", "wt") as f:
        content = header + '\n\n\t' + var2 + operator + var + ";" + '\n\n' + end;
        f.write(content)


index = 0;
abspath = os.path.abspath(__file__)
directory = os.path.dirname(abspath)  # Get directory file is in
os.chdir(directory)  # Change the dir to only focus on this test

for var in variables:
    for op in unary_ops:
        index += 1
        createTestFile(var, op, "")
        createTestFile("", op, var)

    for var2 in variables:
        for op in binary_ops:
            createTestFile(var, op, var2)
            index += 1
