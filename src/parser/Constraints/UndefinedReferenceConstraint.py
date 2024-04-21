from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class UndefinedReferenceConstraint(Constraint):
    """
    Checks for function calls to undefined functions
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkNode(self, node: ASTNode):
        if node.text == "FunctionCall":
            function_node = node.children[0]
            while function_node.text == "Dereference":
                function_node = function_node.children[0]
            print(function_node.text)
            if node.symbol_table.exists(function_node.text):
                if not node.symbol_table.getEntry(function_node.text).is_function_defined():
                    self.rejected = True
                    self.errorNode = function_node
                    self.throwException()

    def checkTerminalNode(self, node: ASTNodeTerminal):
        pass

    def throwException(self):
        if self.errorNode is None:
            # this should never happen but who knows
            return
        node = self.errorNode
        ErrorExporter.undefinedFunctionReference(node.linenr, node.text)
