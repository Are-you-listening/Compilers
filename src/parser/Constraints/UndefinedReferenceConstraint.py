from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *
from src.parser.Tables.FunctionSymbolType import FunctionSymbolType


class UndefinedReferenceConstraint(Constraint):
    """
    Checks for function calls to undefined functions
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkNode(self, node: ASTNode):
        if node.text == "Expr" and node.getChildAmount() == 3 and node.getChild(1).text == "()":
            function_node = node.children[0]

            entry = node.symbol_table.getEntry(function_node.text)
            if entry is None and isinstance(function_node, ASTNodeTerminal):
                ErrorExporter.undefinedFunctionReference(function_node.position, function_node.text)
            if not isinstance(function_node, ASTNodeTerminal) or not isinstance(entry.getTypeObject(),
                                                                                FunctionSymbolType):
                return

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
        ErrorExporter.undefinedFunctionReference(node.position, node.text)
