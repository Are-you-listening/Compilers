
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

