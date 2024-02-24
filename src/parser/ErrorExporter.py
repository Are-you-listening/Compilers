
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

