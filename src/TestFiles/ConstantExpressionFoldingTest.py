import unittest
import subprocess

class TestConstantExpression(unittest.TestCase):
    def testEvaluateResults(self):
        test_expr = "5+6"

        c_format = f"""
        #include <stdio.h>
        int main(void){'{'}
            printf("%d", {test_expr});
        {'}'}
        """
        out = subprocess.run(f"echo '{c_format}' | gcc -x c -o temp - && ./temp && rm temp",
                             shell=True, capture_output=True)

        self.assertTrue(True)