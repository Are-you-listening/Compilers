from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *
from src.parser.DefineConverter import definelist


class GlobalsConstrained(Constraint):
    """
    Checks for specific incompatible syntax for Global Variables
    """

    def __init__(self):
        super().__init__()
        self.status = True
        self.rejected = False

    def checkNode(self, node: ASTNode):
        if node.text == "Assignment" and node.getChild(
                0).symbol_table.isRoot():  # Only implicit declarations are allowed for globals, e.g. int x = 5; is allowed but int x; x = 5; ISN'T
            ErrorExporter.GlobalsNonImplicitDeclaration(node.getChild(0).linenr)

        if node.text == "Declaration":  # Global declarations neither allow assigment of other globals
            if node.getChildAmount() > 1:
                table = node.getChild(1).symbol_table
                if table.isRoot() and table.entryExists(node.getChild(1).text):
                    ErrorExporter.GlobalsInvalidDeclaration(node.getChild(0).linenr)
                if table.isRoot() and GlobalsConstrained.containsIdentifier(node.getChild(1)) and not GlobalsConstrained.containsDefine(node.getChild(1)):
                    print(node)
                    if node.getChild(1).text in definelist:
                        return
                    print(node.getChild(1).children[0].text)
                    ErrorExporter.GlobalsInvalidDeclaration(node.getChild(1).linenr)


    @staticmethod
    def containsIdentifier(root: ASTNode):
        """
        Go 'recursively' through the children and check if there is an identifier used

        """

        stack = [root]
        visited = set()

        while len(stack) > 0:

            current_index = len(stack) - 1
            currentNode = stack[current_index]  # get top of stack without popping it

            do_visit = True
            for child in reversed(currentNode.getChildren()):

                if child not in visited and child not in stack:
                    stack.append(child)
                    do_visit = False

            if do_visit:
                if currentNode.text == "Dereference":
                    return True
                stack.pop(current_index)

            visited.add(currentNode)

        return False

    @staticmethod
    def containsDefine(root: ASTNode):
        """
        Go 'recursively' through the children and check if we didn't came from a define

        Globals may be initialised with #define variables, we convert them so we can't insubstantially check them anymore

        """

        stack = [root]
        visited = set()

        while len(stack) > 0:

            current_index = len(stack) - 1
            currentNode = stack[current_index]  # get top of stack without popping it

            do_visit = True
            for child in reversed(currentNode.getChildren()):

                if child not in visited and child not in stack:
                    stack.append(child)
                    do_visit = False

            if do_visit:
                if currentNode.text in definelist:
                    return True
                stack.pop(current_index)

            visited.add(currentNode)

        return False
