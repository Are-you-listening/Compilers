from src.parser.ASTVisitor import *


class BlacklistVisitor(ASTVisitor):
    """
    This visitor removes blacklist nodes

    """
    def __init__(self):
        self.blacklist = ['(', ')', ';', '{', '}', ',', ':', '[', ']']
        self.to_remove = set()
        self.add = set()

    def visit(self, ast: AST):
        self.to_remove = set()
        self.add = set()
        self.preorder(ast.root)

        for before, node in self.add:
            b_index = before.parent.findChild(before)
            before.parent.insertChild(b_index, node)

        for node in self.to_remove:
            node.parent.removeChild(node)

    def visitNode(self, node: ASTNode):
        """
        In case of a for loop, the ';' decide which part of the code the statement needs to be,
        So when we remove a ';' dividing an empty string from other statements we will add an empty placeholder
        """

        if node.text != "FOR":
            return

        """
        Make sure to scan the children, if we come across a ';' or ')' we now that the child before needs to be some
        code, if this is not what we expect, we will add a default 'None' node
        """
        last_useful = None
        for child in node.children:
            if child.text in (";", ")") and last_useful.text in self.blacklist and \
                    isinstance(last_useful, ASTNodeTerminal):
                self.add.add((child, ASTNode(None, None, None, child.position, child.structTable)))

            last_useful = child

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.text in self.blacklist:
            self.to_remove.add(node)
