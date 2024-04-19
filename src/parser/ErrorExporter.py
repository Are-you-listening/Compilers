from antlr4.error.ErrorListener import ErrorListener
import sys


class EListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        if offendingSymbol is not None:
            text = offendingSymbol.text
        else:
            text = 'None'

        print(f"[ Syntax Error ] line {line}:{column} invalid symbol: '{text}'", file=sys.stderr)
        exit()


class ErrorExporter:
    def __init__(self):
        self.listener = EListener()

    @staticmethod
    def undeclaredTypedef(linenr: str, type: str):
        print(f"[ Error ] line {linenr}: unknown type name '( {type} )'", file=sys.stderr)
        exit()

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
    def constComplaint(linenr: str, real_expression: str, identifier: str, type: str):
        print(f"[ Error ] line {linenr}: Manipulation of variable '{real_expression}' is not allowed, because '{identifier}' has type '{type}'",
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
    def divideByZero(line_nr: int, numerator):
        print(f"[ Error ] line {line_nr}: can't divide {numerator} by zero", file=sys.stderr)
        exit()

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
    def IncompatibleComparison(line_nr: int, type1: tuple, type2: tuple):
        """
        print a warning for an incompatible conversion of ptr types int** to float** for example
        :param line_nr:
        :param type1:
        :param type2:
        :return:
        """
        print(f"[ Warning ] line {line_nr}: comparison of different types ('{''.join(type1)}' and '{''.join(type2)}') ")

    @staticmethod
    def invalidAssignment(line_nr: int, type1: tuple, type2: tuple):
        """
        an assignment between invalid types
        :param line_nr:
        :param type1:
        :param type2:
        :return:
        """
        print(f"[ Error ] line {line_nr}: assignment of incompatible types ('{''.join(type1)}' and '{''.join(type2)}') ", file=sys.stderr)
        exit()

    @staticmethod
    def invalidDereferenceNotPtr(line_nr: int, type1: tuple):
        """
        an assignment between invalid types
        :param line_nr:
        :param type1:
        :return:
        """
        print(
            f"[ Error ] line {line_nr}:  indirection requires pointer operand ('{''.join(type1)}' invalid)",
            file=sys.stderr)
        exit()

    @staticmethod
    def invalidDereference(line_nr: int, type: str):
        """
        attempting to dereference something that cannot be dereferenced
        :param line_nr:
        :param type:
        :return:
        """
        print(f"[ Error ] line {line_nr}:  attempted dereference of invalid type: {type}", file=sys.stderr)
        exit()

    @staticmethod
    def TypeDefDoubleDeclare(line_nr: int, from_type1: str, from_type2: str):
        """
        an error in case we have a typedef that is not allowed because it already exists (within scope)
        :return:
        """
        print(f"[ Error ] line {line_nr}: typedef redefinition with different types ('{from_type1}' vs '{from_type2}')", file=sys.stderr)
        exit()

    @staticmethod
    def TypeDefKeyword(line_nr: int, key: str):
        """
        an error in case we have a typedef that is not allowed because it uses a keyword
        :return:
        """
        print(f"[ Error ] line {line_nr}: typedef cannot be assigned to keyword ('{key}')",
              file=sys.stderr)
        exit()

    @staticmethod
    def TypeDefUndefined(line_nr: int, to_type: str):
        """
        an error in case we have a typedef that is not allowed because it already exists (within scope)
        :return:
        """
        print(f"[ Error ] line {line_nr}: typedef cannot be done for a type that does not exist ('{to_type}')",
              file=sys.stderr)
        exit()

    @staticmethod
    def StupidUser():
        """
        The user has not specified an input file
        :return:
        """
        print(f"[ Error ] No input file specified",
              file=sys.stderr)
        exit()

    @staticmethod
    def GlobalsNonImplicitDeclaration(line_nr: str):
        print(f"[ Error ] line {line_nr} Only implicit declarations are allowed for globals", file=sys.stderr)
        exit()

    @staticmethod
    def GlobalsInvalidDeclaration(line_nr: str):
        print(f"[ Error ] line {line_nr} You can't initialise a global variable with a global variable", file=sys.stderr)
        exit()

    def tooFewFunctionArguments(line_nr: str, expected: int, got: int, function: str):
        print(f"[ Error ] line {line_nr}: too few arguments to function '{function}': expected {expected}, got {got}")
        exit()

    def tooManyFunctionArguments(line_nr: str, expected: int, got: int, function: str):
        print(f"[ Error ] line {line_nr}: too many arguments to function '{function}': expected {expected}, got {got}")
        exit()

