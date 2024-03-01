from antlr4.tree.Tree import ParseTreeListener
from antlr4.error.ErrorListener import ErrorListener
import sys

class EListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        #        print("[ Syntax Error ] line " + str(line) + ":" + str(column) + " " + msg, file=sys.stderr)
        print("[ Syntax Error ] line " + str(line) + ":" + str(column), file=sys.stderr)


class ErrorExporter:
    def __init__(self):
        self.listener = EListener()

    @staticmethod
    def mainNotFound():
        print("[ Error ] main function not found", file=sys.stderr)

    @staticmethod
    def invalidOperatorFloat(operator: str):
        print(f"[ Error ] invalid float operation {operator}",file=sys.stderr)

    @staticmethod
    def invalidOperation(linenr: str, operator: str, type: str, type2: str):
        print(f"[ Error ] line {linenr}: invalid operation {operator} between type {type} and type {type2}",file=sys.stderr)

    @staticmethod
    def invalidOperatorPtr(operator: str):
        print(f"[ Error ] invalid ptr operation {operator}",file=sys.stderr)

    @staticmethod
    def invalidRvalue(identifier: str):
        print(f"[ Error ] invalid assignment to {identifier}",file=sys.stderr)

    @staticmethod
    def uninitializedVariable(identifier: str):
        print(f"[ Error ] use of uninitialized variable {identifier}",file=sys.stderr)

    @staticmethod
    def undeclaredVariable(identifier: str):
        print(f"[ Error ] use of undeclared variable {identifier}",file=sys.stderr)

    @staticmethod
    def constComplaint(linenr: str, identifier: str, type: str):
        print(f"[ Error ] line {linenr}: Manipulation of variable {identifier} which is of type {type}",file=sys.stderr)

    @staticmethod
    def redefinition(linenr: str, type: str, variable: str):
        print(f"[ Error ] line {linenr}: redefinition or redeclaration of {type} {variable}",file=sys.stderr)

