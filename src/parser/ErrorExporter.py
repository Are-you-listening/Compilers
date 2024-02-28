
class ErrorExporter:
    @staticmethod
    def mainNotFound():
        print("main function not found")

    @staticmethod
    def invalidOperatorFloat(operator: str):
        print(f"invalid float operation {operator}")

    @staticmethod
    def invalidOperatorPtr(operator: str):
        print(f"invalid ptr operation {operator}")

    @staticmethod
    def invalidRvalue(identifier: str):
        print(f"invalid assignment to {identifier}")

    @staticmethod
    def uninitializedVariable(identifier: str):
        print(f"use of uninitialized variable {identifier}")

    @staticmethod
    def undeclaredVariable(identifier: str):
        print(f"use of undeclared variable {identifier}")

    @staticmethod
    def constComplaint(identifier: str, type: str):
        print(f"Assignment to variable {identifier} which is of type {type}")

    @staticmethod
    def redefinition(linenr: str, pos: str, variable: str, type: str):
        print(f"[ Error ] line {linenr}, position {pos}: redefinition or redeclaration of {type} {variable}")

