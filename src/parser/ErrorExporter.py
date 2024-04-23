from antlr4.error.ErrorListener import ErrorListener
import sys


class EListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        if offendingSymbol is not None:
            text = offendingSymbol.text
        else:
            if "token recognition error at:" in msg:
                text = msg[29:len(msg)-1]
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
    def invalidOperation(linenr: str, operator: str, type1: tuple, type2: tuple):

        type1 = ErrorExporter.__to_output_type(type1)
        type2 = ErrorExporter.__to_output_type(type2)

        print(f"[ Error ] line {linenr}: invalid operation {operator} on type(s): {type1}  {type2}", file=sys.stderr)
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
        print(f"[ Warning] line {linenr}: use of uninitialized variable {identifier}")

    @staticmethod
    def undeclaredVariable(identifier: str, linenr: str, type="variable"):
        print(f"[ Error ] line {linenr}: use of undeclared {type} {identifier}", file=sys.stderr)
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

        type1 = ErrorExporter.__to_output_type(type1)
        type2 = ErrorExporter.__to_output_type(type2)

        print(f"[ Warning ] line {line_nr}: incompatible pointer types initializing '{type1}' with an expression of type '{type2}' ")

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

        to_type = ErrorExporter.__to_output_type(to_type)
        from_type = ErrorExporter.__to_output_type(from_type)

        print(f"[ Warning ] line {line_nr}: Narrowing type from '{from_type}' to '{to_type}' ")

    @staticmethod
    def IncompatibleComparison(line_nr: int, type1: tuple, type2: tuple):
        """
        print a warning for an incompatible conversion of ptr types int** to float** for example
        :param line_nr:
        :param type1:
        :param type2:
        :return:
        """

        type1 = ErrorExporter.__to_output_type(type1)
        type2 = ErrorExporter.__to_output_type(type2)

        print(f"[ Warning ] line {line_nr}: comparison of different types ('{type1}' and '{type2}') ")

    @staticmethod
    def invalidAssignment(line_nr: int, type1: tuple, type2: tuple):
        """
        an assignment between invalid types
        :param line_nr:
        :param type1:
        :param type2:
        :return:
        """
        type1 = ErrorExporter.__to_output_type(type1)
        type2 = ErrorExporter.__to_output_type(type2)

        print(f"[ Error ] line {line_nr}: assignment of incompatible types ('{type1}' and '{type2}') ", file=sys.stderr)
        exit()

    @staticmethod
    def invalidDereferenceNotPtr(line_nr: int, type1: tuple, is_array: bool = False):
        """
        an assignment between invalid types
        :param is_array: optional boolean indicating whether the value is an array or not
        :param line_nr:
        :param type1:
        :return:
        """

        type1 = ErrorExporter.__to_output_type(type1)

        required = "pointer"
        if is_array:
            required = "array"

        print(
            f"[ Error ] line {line_nr}:  indirection requires {required} operand ('{type1}' invalid)",
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

    @staticmethod
    def InvalidGlobalExpression(line_nr: str):
        print(f"[ Error ] line {line_nr} invalid statement in the global scope", file=sys.stderr)
        exit()

    @staticmethod
    def tooFewFunctionArguments(line_nr: str, expected: int, got: int, function: str):
        print(f"[ Error ] line {line_nr}: too few arguments to function '{function}': expected {expected}, got {got}", file=sys.stderr)
        exit()

    @staticmethod
    def tooManyFunctionArguments(line_nr: str, expected: int, got: int, function: str):
        print(f"[ Error ] line {line_nr}: too many arguments to function '{function}': expected {expected}, got {got}", file=sys.stderr)
        exit()

    @staticmethod
    def functionRedefenition(line_nr: str, func_name: str):
        print(f"[ Error ] line {line_nr}: redefinition of {func_name}", file=sys.stderr)
        exit()

    @staticmethod
    def unMatchedEndIf(line_nr):
        print(f"[ Syntax Error ] line: {line_nr} Unmatched conditional directive: '#endif' ", file=sys.stderr)
        exit()

    @staticmethod
    def fileNotFound(line_nr, file):
        print(f"[ Error ] line: {line_nr} '{file}' File not found!", file=sys.stderr)
        exit()

    @staticmethod
    def nonIdentifierDefine(line_nr):
        print(f"[ Error ] line: {line_nr} Macro names must be identifiers", file=sys.stderr)
        exit()

    @staticmethod
    def switchDeclaration(line_nr: int, variable_name: str):
        print(f"[ Error ] line: {line_nr} variable '{variable_name}' is not allowed to be declared inside a switch statement without an additional scope", file=sys.stderr)
        exit()

    @staticmethod
    def conflictingFunctionTypes(line_nr: str, func_name: str):
        print(f"[ Error ] line {line_nr}: conflicting types for {func_name}", file=sys.stderr)
        exit()

    @staticmethod
    def undefinedFunctionReference(line_nr: str, func_name: str):
        print(f"[ Error ] line {line_nr}: undefined reference to {func_name}", file=sys.stderr)
        exit()

    @staticmethod
    def __to_output_type(in_type: tuple):
        """
        Convert the data to an output type
        """
        out_type = in_type[0]
        for v in reversed(in_type[1]):
            if v == "*":
                out_type += "*"
            else:
                out_type += f"[{v}]"

        return out_type

    @staticmethod
    def wrongInitializationListSize(line_nr: int, variable: str):
        print(f"[ Error ] line {line_nr}: the initializer list its size for array {variable} is not the right size",
              file=sys.stderr)
        exit()

    @staticmethod
    def wrongInitializationListFormat(line_nr: int, variable: str):
        print(f"[ Error ] line {line_nr}: the initializer list its size for array {variable} is not the right format",
              file=sys.stderr)
        exit()

    @staticmethod
    def invalidArraySize(line_nr: int, variable: str, index_type: tuple):
        index_type = ErrorExporter.__to_output_type(index_type)
        print(f"[ Error ] line {line_nr}: the array size definition of {variable} should be an integer instead of "
              f"'{index_type}'",
              file=sys.stderr)
        exit()

    @staticmethod
    def invalidArrayIndex(line_nr: int, index_type: tuple):
        index_type = ErrorExporter.__to_output_type(index_type)
        print(f"[ Error ] line {line_nr}: the array index is of type {index_type} which is not allowed",
              file=sys.stderr)
        exit()

    @staticmethod
    def missingReturn(line_nr: int, return_type: str):
        print(f"[ Warning ] line {line_nr}: function with return type {return_type} is missing a valid return statement")

    @staticmethod
    def lostInitializerList(line_nr: int):
        print(f"[ Error ] line {line_nr}: an initializer list is provided while not being assigned to an array",
              file=sys.stderr)
        exit()
