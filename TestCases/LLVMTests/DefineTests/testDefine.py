from TestCases.ABCTests.abcTest import *


class DefineTests(LLVMTest, unittest.TestCase):
    """
    Test case to run llvm output, using preprocessor directives
    """

    def runC(self, file_name, inp):
        """
        Run and compile a c file
        :param file_name: Name of the file
        :param inp: Any optional input
        :return:
        """
        json_file = file_name[:-2] + ".json"
        index = file_name[10:-2]

        if os.path.isfile(json_file):  # If a .json file exists, we need to load the value from this file as c_out instead of the gcc compiler
            with open(json_file, "rt") as f:
                output_dict = json.loads(f.read())
                c_out = subprocess.run(f"""ls""", shell=True, capture_output=True) # Create a useless c_out
                c_out.stdout = output_dict[index]  # Modify output
                c_out.stderr = ""  # No errors expected
        else:
            # Run c file using gcc
            c_out = subprocess.run(f"""gcc -ansi -pedantic {file_name} -o temp/temp""",
                                   shell=True, capture_output=True)
            if c_out.returncode != 0:  # Compilation failed, warn client!
                raise Exception("Compilation Failed")

            # Run the compiled code
            c_out = subprocess.run(f" temp/./temp ; rm temp/temp", shell=True, capture_output=True, text=True, input=inp)
        return c_out

    def test(self):
        LLVMTest.LLVM_test(self, os.path.abspath(__file__), False)  # Call the base class test function
