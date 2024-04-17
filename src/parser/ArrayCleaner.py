from src.parser.CTypes.COperationHandler import COperationHandler
from src.parser.Tables.SymbolTable import *


class ArrayCleaner(ASTVisitor):
    """
    This class will check if their exists an array node for a declaration ex: int a[5], and translate it
    to a type in ex: -> int* a, we will still need to take into account, how much memory we need to allocate
    We do this by making the type look like the following
    Type -> subtrees: 'int', ('*', with type: ARRAY_5 (size), to encode our array size)
    """

    def __init__(self):
        self.to_remove = set()

    def visit(self, ast: AST):
        self.preorder(ast.root)
        for n in self.to_remove:
            n.parent.removeChild(n)

    def visitNode(self, node: ASTNode):
        """
        When we come across a declaration, we want to change the [5] to a * on the type
        If an array part exist, it will be found on child index 2
        """

        """
        Check if node is a declaration
        """
        if node.text != "Declaration":
            return

        """
        Check if the declaration has enough children
        """
        if node.getChildAmount() < 3:
            return

        """
        check if the child index 2 is a terminal with type array
        """
        if not isinstance(node.getChild(2), ASTNodeTerminal) or node.getChild(2).type != "ARRAY":
            return

        type_node = node.getChild(0)
        array_sizes = node.getChild(2).text.split("][")

        """
        remove first '['
        """
        array_sizes[0] = array_sizes[0][1:]
        """
        remove last ']'
        """
        array_sizes[-1] = array_sizes[-1][:-1]

        for new_ptr_val in array_sizes:
            new_ptr = ASTNodeTerminal("*", type_node.parent, type_node.getSymbolTable(), f"ARRAY_{new_ptr_val}",
                                      type_node.linenr, type_node.virtuallinenr)
            type_node.addChildren(new_ptr)

        self.to_remove.add(node.getChild(2))

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
