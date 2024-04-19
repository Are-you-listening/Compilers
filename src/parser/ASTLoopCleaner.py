from src.parser.ASTVisitor import *
from src.parser.ASTConversion import *


class ASTLoopCleaner(ASTVisitor):
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
        if node.text not in ("WHILE", "FOR"):
            return

        """
        Return the first terminal containing the word 'while' or 'for'
        Because we don't need this anymore
        """
        self.to_remove.add(node.getChild(0))

        if node.text == "WHILE":
            ASTConversion.addConversion(node.getChild(1), ("BOOL", ""))
            return

        """
        Transform a for loop into a while loop
        """

        """
        change the node from 'FOR' to 'WHILE'
        """

        """
        In Case we have the following situation: for (int i), out i needs to be inside the for loop scope but 
        not outside. We enforce this by adding a 'Code' node, which will cause a new scope
        """

        node.addNodeParent(ASTNode("Scope", node.parent, None, node.linenr, node.virtuallinenr))

        node.text = "WHILE"

        """
        A FOR LOOP HAS 3 PARTS
        
        - prefix part (executed before start of loop) -> We will move this line to before the loop
        - loop condition -> keep this as while loop condition
        - suffix ran at the end of each loop -> put it inside the loop
        """
        prefix_node = node.getChild(1)

        loop_code_block = node.getChild(4)
        suffix_child = node.getChild(3)

        """
        Prefix part
        """
        code_node = node.parent
        for_index = code_node.findChild(node)

        node.removeChild(prefix_node)
        code_node.children.insert(for_index, prefix_node)
        prefix_node.parent = code_node

        """
        Suffix part
        """

        node.removeChild(suffix_child)
        loop_code_block.addChildren(suffix_child)
        suffix_child.parent = loop_code_block

        ASTConversion.addConversion(node.getChild(1), ("BOOL", ""))

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
