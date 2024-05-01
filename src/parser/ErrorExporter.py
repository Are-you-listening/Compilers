from antlr4.error.ErrorListener import ErrorListener
import sys
from src.parser.Tables.SymbolType import SymbolType
from src.parser.AST import Position


class EListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        if offendingSymbol is not None:
            text = offendingSymbol.text
            file = offendingSymbol.source[1].fileName
        else:
            if "token recognition error at:" in msg:
                text = msg[29:len(msg) - 1]
                file = ""
            else:
                text = 'None'
                file = ""

        print(f"[ Syntax Error ] {file} line {line}:{column} invalid symbol: '{text}'", file=sys.stderr)
        exit()


class ErrorExporter:
    def __init__(self):
        self.listener = EListener()

    @staticmethod
    def undeclaredTypedef(position: Position, type: str):
        print(f"[ Error ] {position.file} line {position.linenr}: unknown type name '( {type} )'", file=sys.stderr)
        exit()

    @staticmethod
    def cyclicInclude(file: str, file2: str, err_file: str):
        print(f"[ Error ] {err_file} Cyclic Include detected from {file} to {file2}", file=sys.stderr)
        exit()

    @staticmethod
    def mainNotFound(position: Position):
        print(f"[ Error ] {position.file} main function not found", file=sys.stderr)
        exit()

    @staticmethod
    def invalidOperatorFloat(operator: str, position: Position):
        print(f"[ Error ] {position.file} line {position.linenr}: invalid float operation {operator}",
              file=sys.stderr)
        exit()

    @staticmethod
    def invalidOperation(position: Position, operator: str, type1: SymbolType, type2: SymbolType):
        if type1 is not None:
            type1 = ErrorExporter.__to_output_type(type1.getPtrTuple())
        else:
            type1 = ""
        if type2 is not None:
            type2 = " " + ErrorExporter.__to_output_type(type2.getPtrTuple())
        else:
            type2 = ""

        if type1 == "" and type2 == "":
            typings = ""
        else:
            typings = "on type(s):"

        print(
            f"[ Error ] {position.file} line {position.linenr}: invalid operation {operator} {typings} {type1}{type2}",
            file=sys.stderr)
        exit()

    @staticmethod
    def invalidOperatorPtr(operator: str, position: Position):
        print(f"[ Error ] {position.file} line {position.linenr}: invalid ptr operation {operator}", file=sys.stderr)
        exit()

    @staticmethod
    def LValueReference(position: Position):
        print(f"[ Error ] {position.file} line {position.linenr}: you can't have a reference to an LValue",
              file=sys.stderr)
        exit()

    @staticmethod
    def invalidRvalue(identifier: str, position: Position):
        print(f"[ Error ] {position.file} line {position.linenr}: invalid assignment to {identifier}",
              file=sys.stderr)
        exit()

    @staticmethod
    def uninitializedVariable(identifier: str, position: Position):
        print(f"[ Warning] {position.file} line {position.linenr}: use of uninitialized variable {identifier}")

    @staticmethod
    def undeclaredVariable(identifier: str, position: Position, type="variable"):
        print(f"[ Error ] {position.file} line {position.linenr}: use of undeclared {type} {identifier}",
              file=sys.stderr)
        exit()

    @staticmethod
    def constComplaint(position: Position, real_expression: str, identifier: str, type1: str):

        print(
            f"[ Error ] {position.file} line {position.linenr}: Manipulation of variable '{real_expression}' is not allowed, because '{identifier}' has type '{type1}'",
            file=sys.stderr)
        exit()

    @staticmethod
    def redefinition(position: Position, type: str, variable: str):
        print(f"[ Error ] {position.file} line {position.linenr}: redefinition or redeclaration of {type} {variable}",
              file=sys.stderr)
        exit()

    @staticmethod
    def wrongRefCombination(type1: str, type2: str, position: Position):
        print(f"[ Error ] {position.file} line {position.linenr}: reference types do not match: {type1} and {type2}",
              file=sys.stderr)
        exit()

    @staticmethod
    def IncompatiblePtrTypesWarning(position: Position, type1: SymbolType, type2: SymbolType):
        """
        print a warning for an incompatible conversion of ptr types int** to float** for example
        :param position:
        :param type1:
        :param type2:
        :return:
        """

        type1 = ErrorExporter.__to_output_type(type1.getPtrTuple())
        type2 = ErrorExporter.__to_output_type(type2.getPtrTuple())

        print(
            f"[ Warning ] {position.file} line {position.linenr}: incompatible pointer types initializing '{type1}' with an expression of type '{type2}' ")

    @staticmethod
    def divideByZero(position: Position, numerator):
        print(f"[ Error ] {position.file} line {position.linenr}: can't divide {numerator} by zero", file=sys.stderr)
        exit()

    @staticmethod
    def narrowingTypesWarning(position: Position, to_type: SymbolType, from_type: SymbolType):
        """
        print a warning for an incompatible conversion of ptr types int** to float** for example
        :param position:
        :param to_type:
        :param from_type:
        :return:
        """
        to_type = ErrorExporter.__to_output_type(to_type.getPtrTuple())
        from_type = ErrorExporter.__to_output_type(from_type.getPtrTuple())

        print(f"[ Warning ] {position.file} line {position.linenr}: Narrowing type from '{from_type}' to '{to_type}' ")

    @staticmethod
    def IncompatibleComparison(position: Position, type1: SymbolType, type2: SymbolType):
        """
        print a warning for an incompatible conversion of ptr types int** to float** for example
        :param position:
        :param type1:
        :param type2:
        :return:
        """
        type1 = ErrorExporter.__to_output_type(type1.getPtrTuple())
        type2 = ErrorExporter.__to_output_type(type2.getPtrTuple())

        print( f"[ Warning ] {position.file} line {position.linenr}: comparison of different types ('{type1}' and '{type2}') ")

    @staticmethod
    def invalidAssignment(position: Position, type1: SymbolType, type2: SymbolType):
        """
        an assignment between invalid types
        :param position:
        :param type1:
        :param type2:
        :return:
        """
        type1 = ErrorExporter.__to_output_type(type1.getPtrTuple())
        type2 = ErrorExporter.__to_output_type(type2.getPtrTuple())

        print(
            f"[ Error ] {position.file} line {position.linenr}: assignment of incompatible types ('{type1}' and '{type2}') ",
            file=sys.stderr)
        exit()

    @staticmethod
    def invalidDereferenceNotPtr(position: Position, type1: SymbolType, is_array: bool = False):
        """
        an assignment between invalid types
        :param position:
        :param is_array: optional boolean indicating whether the value is an array or not
        :param type1:
        :return:
        """
        type1 = type1.getPtrTuple()
        type1 = (type1[0], type1[1][:-1])
        type1 = ErrorExporter.__to_output_type(type1)

        required = "pointer"
        if is_array:
            required = "array"

        print(
            f"[ Error ] {position.file} line {position.linenr}:  indirection requires {required} operand ('{type1}' invalid)",
            file=sys.stderr)
        exit()

    @staticmethod
    def invalidDereference(position: Position, type: str):
        """
        attempting to dereference something that cannot be dereferenced
        :param position:
        :param type:
        :return:
        """
        print(f"[ Error ] {position.file} line {position.linenr}:  attempted dereference of invalid type: {type}",
              file=sys.stderr)
        exit()

    @staticmethod
    def TypeDefDoubleDeclare(position: Position, from_type1: str, from_type2: str):
        """
        an error in case we have a typedef that is not allowed because it already exists (within scope)
        :return:
        """
        print(
            f"[ Error ] {position.file} line {position.linenr}: typedef redefinition with different types ('{from_type1}' vs '{from_type2}')",
            file=sys.stderr)
        exit()

    @staticmethod
    def TypeDefKeyword(position: Position, key: str):
        """
        an error in case we have a typedef that is not allowed because it uses a keyword
        :return:
        """
        print(f"[ Error ] {position.file} line {position.linenr}: typedef cannot be assigned to keyword ('{key}')",
              file=sys.stderr)
        exit()

    @staticmethod
    def TypeDefUndefined(position: Position, to_type: str):
        """
        an error in case we have a typedef that is not allowed because it already exists (within scope)
        :return:
        """
        print(
            f"[ Error ] {position.file} line {position.linenr}: typedef cannot be done for a type that does not exist ('{to_type}')",
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
    def GlobalsNonImplicitDeclaration(position: Position, ):
        print(f"[ Error ] {position.file} line {position.linenr}: Only implicit declarations are allowed for globals",
              file=sys.stderr)
        exit()

    @staticmethod
    def GlobalsInvalidDeclaration(position: Position):
        print(
            f"[ Error ] {position.file} line {position.linenr}: You can't initialise a global variable with a global variable",
            file=sys.stderr)
        exit()

    @staticmethod
    def InvalidGlobalExpression(position: Position):
        print(f"[ Error ] {position.file} line {position.linenr}: invalid statement in the global scope",
              file=sys.stderr)
        exit()

    @staticmethod
    def tooFewFunctionArguments(position: Position, expected: int, got: int, function: str):
        print(
            f"[ Error ] {position.file} line {position.linenr}: too few arguments to function '{function}': expected {expected}, got {got}",
            file=sys.stderr)
        exit()

    @staticmethod
    def tooManyFunctionArguments(position: Position, expected: int, got: int, function: str):
        print(
            f"[ Error ] {position.file} line {position.linenr}: too many arguments to function '{function}': expected {expected}, got {got}",
            file=sys.stderr)
        exit()

    @staticmethod
    def functionRedefinition(position: Position, func_name: str):
        print(f"[ Error ] {position.file} line {position.linenr}: redefinition of {func_name}", file=sys.stderr)
        exit()

    @staticmethod
    def unMatchedEndIf(line_nr: str, file: str):
        print(f"[ Syntax Error ] {file} line {line_nr}: Unmatched conditional directive: '#endif' ", file=sys.stderr)
        exit()

    @staticmethod
    def unMatchedStartIf(file: str, line: str):
        print(f"[ Syntax Error ] {file} line {line}: unterminated #ifndef ", file=sys.stderr)
        exit()

    @staticmethod
    def fileNotFound(line_nr, file, file2):
        print(f"[ Error ] {file2} line {line_nr}: '{file}' File not found!", file=sys.stderr)
        exit()

    @staticmethod
    def nonIdentifierDefine(line_nr: str, file: str):
        print(f"[ Error ] {file} line {line_nr}: Macro names must be identifiers", file=sys.stderr)
        exit()

    @staticmethod
    def switchDeclaration(position: Position, variable_name: str):
        print(
            f"[ Error ] {position.file} line {position.linenr}: variable '{variable_name}' is not allowed to be declared inside a switch statement without an additional scope",
            file=sys.stderr)
        exit()

    @staticmethod
    def conflictingFunctionParameterTypes(position: Position, func_name: str):
        print(f"[ Error ] {position.file} line {position.linenr}: conflicting parameter types for function {func_name}", file=sys.stderr)
        exit()

    @staticmethod
    def conflictingFunctionReturnType(position: Position, func_name: str):
        print(f"[ Error ] {position.file} line {position.linenr}: conflicting return type for function {func_name}",
              file=sys.stderr)
        exit()

    @staticmethod
    def undefinedFunctionReference(position: Position, func_name: str):
        print(f"[ Error ] {position.file} line {position.linenr}: undefined reference to function {func_name}",
              file=sys.stderr)
        exit()

    @staticmethod
    def __to_output_type(in_type: tuple):
        """
        Convert the data to an output type
        """

        out_type = in_type[0][0]

        for v in reversed(in_type[1]):
            if v[0] == "*":
                out_type += "*"
            else:
                out_type += f"[{v[0]}]"

        return out_type

    @staticmethod
    def wrongInitializationListSize(position: Position, variable: str):
        print(
            f"[ Error ] {position.file} line {position.linenr}: the initializer list its size for array {variable} is not the right size",
            file=sys.stderr)
        exit()

    @staticmethod
    def wrongInitializationListFormat(position: Position, variable: str):
        print(
            f"[ Error ] {position.file} line {position.linenr}: the initializer list its size for array {variable} is not the right format",
            file=sys.stderr)
        exit()

    @staticmethod
    def invalidArraySize(position: Position, variable: str, index_type: tuple):
        index_type = ErrorExporter.__to_output_type(index_type)
        print(
            f"[ Error ] {position.file} line {position.linenr}: the array size definition of {variable} should be an integer instead of "
            f"'{index_type}'",
            file=sys.stderr)
        exit()

    @staticmethod
    def invalidArrayIndex(position: Position, index_type: SymbolType):
        index_type = ErrorExporter.__to_output_type(index_type.getPtrTuple())
        print(
            f"[ Error ] {position.file} line {position.linenr}: the array index is of type {index_type} which is not allowed",
            file=sys.stderr)
        exit()

    @staticmethod
    def missingReturn(position: Position, return_type: SymbolType):
        return_type = ErrorExporter.__to_output_type(return_type.getPtrTuple())

        print(
            f"[ Error ] {position.file} line {position.linenr}: function with return type {return_type} is missing a valid return statement",
            file=sys.stderr)
        exit()

    @staticmethod
    def lostInitializerList(position: Position, ):
        print(
            f"[ Error ] {position.file} line {position.linenr}: an initializer list is provided while not being assigned to an array",
            file=sys.stderr)
        exit()

    @staticmethod
    def functionCallNotFunction(position: Position, called: str, call_type: SymbolType):
        call_type = ErrorExporter.__to_output_type(call_type.getPtrTuple())
        print(
            f"[ Error ] {position.file} line {position.linenr}: you cannot do a function call for the non-function '{called}' which is of type {call_type}",
            file=sys.stderr)
        exit()

    @staticmethod
    def variableDeclaredVoid(position: Position, var: str):
        print(f"[ Error ] {position.file} line {position.linenr}: variable {var} declared void ", file=sys.stderr)
        exit()

    @staticmethod
    def voidWithNonEmptyReturn(position: Position):
        print(f"[ Warning ] {position.file} line {position.linenr}: 'return' with a value, in function returning void")

    @staticmethod
    def incorrectVoidFuncUse(position: Position):
        print(f"[ Error ] {position.file} line {position.linenr}: incorrect use of a function returning void", file=sys.stderr)
        exit()

    @staticmethod
    def invalidBreak(position: Position):
        print(f"[ Error ] {position.file} line {position.linenr}: 'break' statement not in loop or switch statement",
              file=sys.stderr)
        exit()

    @staticmethod
    def invalidContinue(position: Position):
        print(f"[ Error ] {position.file} line {position.linenr}: 'continue' statement not in loop",
              file=sys.stderr)
        exit()
