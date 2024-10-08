from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import ErrorExporter


def findFunction(node: ASTNode):
    """
    given a return node, find the enclosing Function node
    note that we don't need to support nested functions, so the first Function node we find is also the only one there is
    :param node: the return node
    :return: the corresponding function node
    """
    current_node = node.parent
    while current_node.text != "Start":
        if current_node.text == "Function":
            return current_node
        else:
            current_node = current_node.parent
    return None


class FunctionReturnConstraint(Constraint):
    """
    Check that every (non-void) function has a return statement
    """

    def __init__(self):
        super().__init__()
        # to keep track of all the functions and returns we will use a dict to create pairs of a function and (multiple) returns
        self.map = {}
        self.errorNodes = []

    def checkNode(self, node: ASTNode):
        if node.text == "Function":
            # create a new dict entry for a function and all the returns in the function body
            self.map[node] = []
        if node.text == "Return":
            function_node = findFunction(node)
            if function_node is not None:
                self.map[function_node].append(node)

    def checkTerminalNode(self, node: ASTNodeTerminal):
        pass

    def throwException(self):
        for error_node in self.errorNodes:
            entry = error_node.getSymbolTable().getEntry(error_node.getChild(0).text)
            return_type = entry.getTypeObject().return_type
            ErrorExporter.missingReturn(error_node.position, return_type)

    def isRejected(self):
        self.errorNodes.clear()
        for func, returns in self.map.items():
            # check if the function whether it is a void function
            entry = func.getSymbolTable().getEntry(func.getChild(0).text)
            if entry.getType() == 'VOID':
                continue
            # check if the entry is a declaration, if so, skip the function (function declarations have no code node)
            if func.getChildAmount() == 2:
                continue
            if len(returns) == 0:
                self.errorNodes.append(func)
            for ret in returns:
                if ret.getChildAmount() == 0:
                    self.errorNodes.append(func)
        if len(self.errorNodes) > 0:
            return True
        return False
