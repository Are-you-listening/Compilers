from antlr4.error.ErrorListener import ErrorListener
import sys


class EListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        #        print("[ Syntax Error ] line " + str(line) + ":" + str(column) + " " + msg, file=sys.stderr)
        print(f"[ Syntax Error ] line {line}:{column} invalid symbol: '{offendingSymbol.text}'", file=sys.stderr)
        exit()
        # print(f"[ Syntax Error ] line {line}:{column} invalid symbol: '{offendingSymbol.text}'", file=sys.stderr)


class ErrorExporter:
    def __init__(self):
        self.listener = EListener()

    @staticmethod
    def mainNotFound():
        print("[ Error ] main function not found", file=sys.stderr)
        exit()

    @staticmethod
    def invalidOperatorFloat(operator: str, linenr: str):
        print(f"[ Error ] line {linenr}: invalid float operation {operator}", file=sys.stderr)
        exit()

    @staticmethod
    def invalidOperation(linenr: str, operator: str, type: str, type2: str):
        print(f"[ Error ] line {linenr}: invalid operation {operator} on type(s): {type}  {type2}", file=sys.stderr)
        exit()

    @staticmethod
    def invalidOperatorPtr(operator: str, linenr: str):
        print(f"[ Error ] line {linenr}: invalid ptr operation {operator}", file=sys.stderr)
        exit()

    @staticmethod
    def invalidRvalue(identifier: str, linenr: str):
        print(f"[ Error ] line {linenr}: invalid assignment to {identifier}", file=sys.stderr)
        exit()

    @staticmethod
    def uninitializedVariable(identifier: str, linenr: str):
        print(f"[ Error ] line {linenr}: use of uninitialized variable {identifier}", file=sys.stderr)
        exit()

    @staticmethod
    def undeclaredVariable(identifier: str, linenr: str):
        print(f"[ Error ] line {linenr}: use of undeclared variable {identifier}", file=sys.stderr)
        exit()

    @staticmethod
    def constComplaint(linenr: str, identifier: str, type: str):
        print(f"[ Error ] line {linenr}: Manipulation of variable {identifier} which is of type {type}",
              file=sys.stderr)
        exit()

    @staticmethod
    def redefinition(linenr: str, type: str, variable: str):
        print(f"[ Error ] line {linenr}: redefinition or redeclaration of {type} {variable}", file=sys.stderr)
        exit()

    @staticmethod
    def wrongRefCombination(type1: str, type2: str, linenr: str):
        print(f"[ Error ] line {linenr}: reference types do not match: {type1} and {type2}", file=sys.stderr)
        exit()

    @staticmethod
    def IncompatiblePtrTypesWarning(line_nr: int, type1: tuple, type2: tuple):
        """
        print a warning for an incompatible conversion of ptr types int** to float** for example
        :param line_nr:
        :param type1:
        :param type2:
        :return:
        """
        print(f"[ Warning ] line {line_nr}: incompatible pointer types initializing '{''.join(type1)}' with an expression of type '{''.join(type2)}' ")

    @staticmethod
    def narrowingTypesWarning(line_nr: int, to_type: tuple, from_type: tuple):
        """
        print a warning for an incompatible conversion of ptr types int** to float** for example
        :param line_nr:
        :param to_type:
        :param from_type:
        :return:
        """
        print(f"[ Warning ] line {line_nr}: Narrowing type from '{''.join(from_type)}' to '{''.join(to_type)}' ")

    @staticmethod
    def IncompatiblePtrComparison(line_nr: int, type1: tuple, type2: tuple):
        """
        print a warning for an incompatible conversion of ptr types int** to float** for example
        :param line_nr:
        :param type1:
        :param type2:
        :return:
        """
        print(f"comparison of distinct pointer types ('{''.join(type1)}' and '{''.join(type2)}') ")
