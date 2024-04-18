from src.parser.Preproccesing.InputStreamProcessor import *

class PreProccessor():
    def __init__(self, input_file):
        self.manipulator = InputStreamProcessor(input_file)  # InputStream Object
        self.stdio = False  # Determines if #include <stdio.h> is placed
        self.defined = []  # Keep track of already made defines

    def process(self):
        directive = self.manipulator.retrieve("#")
        while directive is not None:
            print(directive)

            if "include" in directive:

                if "<stdio.h>" in directive:
                    self.stdio = True
                    self.manipulator.replace_until(directive, "", "\n")  # Remove this directive
                else:
                    # Add manual include
                    pass
            elif "define" in directive:
                directive = directive[1:]  # Remove the '#' character
                split = directive.split()

                if split[1] in self.defined:
                    # TODO Call ErrorExporter
                    pass

                self.manipulator.replace_until(directive, "", "\n")  # Remove this directive
                self.defined.append(split[1])  # Add this definition to the defined list

                self.manipulator.replace_until("#"+split[1], split[2], "# define "+split[1])  # Replace until new directive
                # TODO stop_string should be a list of string options: here #ifndef can cause issues

            # elif "ifndef" in directive:
            #     pass
            # elif "endif" in directive:
            #     pass


            directive = self.manipulator.retrieve("#")


        return self.manipulator
