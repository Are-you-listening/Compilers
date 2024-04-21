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
        self.__check_declaration(node)
        self.__check_assignment(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def __check_declaration(self, node: ASTNode):
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

        array_sizes = self.array_size(node.getChild(2).text)

        for new_ptr_val in array_sizes:
            new_ptr = ASTNodeTerminal("*", type_node.parent, type_node.getSymbolTable(), f"ARRAY_{new_ptr_val}",
                                      type_node.linenr, type_node.virtuallinenr)
            type_node.addChildren(new_ptr)

        self.to_remove.add(node.getChild(2))

    def __check_assignment(self, node: ASTNode):
        if node.text != "Assignment":
            return

        if node.getChildAmount() < 3:
            return

        if not isinstance(node.getChild(1), ASTNodeTerminal) or node.getChild(1).type != "ARRAY":
            return

        array_sizes = self.array_size(node.getChild(1).text)

        """
        In case the assignment is an array access, we need to do the following
        
        assume we have x[1] = 5;
        
        we will translate the left hand side so the resulting expression is *(x+1) = 5
        """

        left_child = node.getChild(0)
        left_child.parent.removeChild(left_child)
        left_child.parent = None

        for new_ptr_val in array_sizes:
            """
            Create a new parent: 'Expr', with children left hand side the identifier and right hand side the + index
            """
            access_expr_node = ASTNode("Expr", None, node.getSymbolTable(), node.linenr, node.virtuallinenr)

            access_expr_node.addChildren(left_child)
            left_child.parent = access_expr_node

            access_expr_node.addChildren(ASTNodeTerminal("[]", access_expr_node, node.getSymbolTable(), "",
                                                      node.linenr, node.virtuallinenr))

            access_expr_node.addChildren(ASTNodeTerminal(new_ptr_val, access_expr_node, node.getSymbolTable(), "INT",
                                                         node.linenr, node.virtuallinenr))

            left_child = access_expr_node

        node.insertChild(0, left_child)

        self.to_remove.add(node.getChild(1))

    @staticmethod
    def array_size(array_text):
        array_sizes = array_text.split("][")

        """
        remove first '['
        """
        array_sizes[0] = array_sizes[0][1:]
        """
        remove last ']'
        """
        array_sizes[-1] = array_sizes[-1][:-1]

        return array_sizes
