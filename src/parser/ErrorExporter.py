
class ErrorExporter:
    @staticmethod
    def mainNotFound():
        print("[ Error ] main function not found")

    @staticmethod
    def invalidOperatorFloat(operator: str):
        print(f"[ Error ] invalid float operation {operator}")

    @staticmethod
    def invalidOperation(linenr: str, operator: str, type: str, type2: str):
        print(f"[ Error ] line {linenr}: invalid operation {operator} between type {type} and type {type2}")

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
    def constComplaint(linenr: str, identifier: str, type: str):
        print(f"[ Error ] line {linenr}: Manipulation of variable {identifier} which is of type {type}")

    @staticmethod
    def redefinition(linenr: str, type: str, variable: str):
        print(f"[ Error ] line {linenr}: redefinition or redeclaration of {type} {variable}")

