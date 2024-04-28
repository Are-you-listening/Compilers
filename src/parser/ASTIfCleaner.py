from src.parser.ASTConversion import *


class ASTIfCleaner(ASTVisitor):
    """
    This visitor makes sure that the if statements will get a good format
    The final format after this visitor will be an IF node with the following children in order:

    child 0: condition:
    child 1: block of code when condition True
    child 2: block of code when condition False () If applicable
    """
    def __init__(self):
        self.to_remove = set()

    def visit(self, ast: AST):
        self.to_remove = set()
        """
        override the visit so we can remove after the traverse the nodes we don't need anymore
        
        :param ast: 
        :return: 
        """
        self.preorder(ast.root)

        for node in self.to_remove:
            node.parent.removeChild(node)

    def visitNode(self, node: ASTNode):
        """
        detect nodes with type IF

        :param node: node we want to check
        :return: None
        """
        if node.text != "IF":
            return

        """
        removes terminal containing 'if'
        """
        self.to_remove.add(node.getChild(0))

        """
        Let the condition have a conversion to BOOl
        """
        ASTConversion.addConversion(node.getChild(1), (("BOOL", False), []))

        """
        in case we have an 'Else' statement the 'else' terminal can be removed
        """
        if node.getChildAmount() >= 4:
            self.to_remove.add(node.getChild(3))

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
