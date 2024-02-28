
class ErrorExporter:
    @staticmethod
    def mainNotFound():
        print("[ Error ] main function not found")

    @staticmethod
    def invalidOperatorFloat(operator: str):
        print(f"[ Error ] invalid float operation {operator}")

    @staticmethod
    def invalidOperatorPtr(operator: str):
        print(f"[ Error ] invalid ptr operation {operator}")

    @staticmethod
    def invalidRvalue(identifier: str):
        print(f"[ Error ] invalid assignment to {identifier}")

    @staticmethod
    def uninitializedVariable(identifier: str):
        print(f"[ Error ] use of uninitialized variable {identifier}")

    @staticmethod
    def undeclaredVariable(identifier: str):
        print(f"[ Error ] use of undeclared variable {identifier}")

    @staticmethod
    def constComplaint(identifier: str, type: str):
        print(f"[ Error ] Assignment to variable {identifier} which is of type {type}")

    @staticmethod
    def redefinition(linenr: str, pos: str, variable: str, type: str):
        print(f"[ Error ] line {linenr}, position {pos}: redefinition or redeclaration of {type} {variable}")

