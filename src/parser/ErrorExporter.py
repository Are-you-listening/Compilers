from antlr4.tree.Tree import ParseTreeListener
from antlr4.error.ErrorListener import ErrorListener
import sys

class EListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        #        print("[ Syntax Error ] line " + str(line) + ":" + str(column) + " " + msg, file=sys.stderr)
        print(f"[ Syntax Error ] line {line}:{column} invalid symbol: '{offendingSymbol.text}'")
        #print(f"[ Syntax Error ] line {line}:{column} invalid symbol: '{offendingSymbol.text}'", file=sys.stderr)


class ErrorExporter:
    def __init__(self):
        self.listener = EListener()

    @staticmethod
    def mainNotFound():
        print(f"[ Error ] main function not found")
        #print("[ Error ] main function not found", file=sys.stderr)
        exit()

    @staticmethod
    def invalidOperatorFloat(operator: str, linenr: str):
        print(f"[ Error ] line {linenr}: invalid float operation {operator}")
        #print(f"[ Error ] invalid float operation {operator}",file=sys.stderr)
        exit()


    @staticmethod
    def invalidOperation(linenr: str, operator: str, type: str, type2: str):
        print(f"[ Error ] line {linenr}: invalid operation {operator} on type(s): {type}  {type2}")
        #print(f"[ Error ] line {linenr}: invalid operation {operator} on type(s): {type}  {type2}",file=sys.stderr)
        exit()


    @staticmethod
    def invalidOperatorPtr(operator: str, linenr: str):
        print(f"[ Error ] line {linenr}: invalid ptr operation {operator}")
        #print(f"[ Error ] line {linenr}: invalid ptr operation {operator}",file=sys.stderr)
        exit()


    @staticmethod
    def invalidRvalue(identifier: str,linenr: str):
        print(f"[ Error ] line {linenr}: invalid assignment to {identifier}")
        #print(f"[ Error ] invalid assignment to {identifier}",file=sys.stderr)
        exit()


    @staticmethod
    def uninitializedVariable(identifier: str,linenr: str):
        print(f"[ Error ] line {linenr}: use of uninitialized variable {identifier}")
        #print(f"[ Error ] use of uninitialized variable {identifier}",file=sys.stderr)
        exit()


    @staticmethod
    def undeclaredVariable(identifier: str, linenr: str):
        print(f"[ Error ] line {linenr}: use of undeclared variable {identifier}")
        #print(f"[ Error ] use of undeclared variable {identifier}",file=sys.stderr)
        exit()


    @staticmethod
    def constComplaint(linenr: str, identifier: str, type: str):
        print(f"[ Error ] line {linenr}: Manipulation of variable {identifier} which is of type {type}")
        #print(f"[ Error ] line {linenr}: Manipulation of variable {identifier} which is of type {type}",file=sys.stderr)
        exit()


    @staticmethod
    def redefinition(linenr: str, type: str, variable: str):
        print(f"[ Error ] line {linenr}: redefinition or redeclaration of {type} {variable}")
        #print(f"[ Error ] line {linenr}: redefinition or redeclaration of {type} {variable}",file=sys.stderr)
        exit()


    @staticmethod
    def wrongRefCombination(type1: str, type2: str, linenr: str):
        print(f"[ Error ] line {linenr}: reference types do not match: {type1} and {type2}")
        #print(f"[ Error ] reference types do not match: {type1} and {type2}", file=sys.stderr)
        exit()


    @staticmethod
    def conversionWarning(linenr: str, type1: str, type2: str):
        print(f"[ Warning ] line {linenr}: Types do not match properly, a conversion was made")
