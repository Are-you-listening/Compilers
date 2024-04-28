from src.parser.ASTVisitor import *


class FunctionPtrCleaner(ASTVisitor):
    """
    This class will clean function ptr declarations so the end up with a similar format as normal declarations
    """

    def __init__(self):
        self.to_remove = set()
        self.last_func_ptr_declare = None

    def visit(self, ast: AST):
        self.to_remove = set()
        self.preorder(ast.root)

        for t in self.to_remove:
            t_children = t.children

            index = t.parent.findChild(t)
            t.parent.removeChild(t)
            for i, child in enumerate(t_children):
                t.parent.insertChild(index + i, child)

    def visitNode(self, node: ASTNode):
        self.__check_func_ptr_declaration(node)
        self.__check_func_ptr(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def __check_func_ptr_declaration(self, node: ASTNode):
        if node.text != "FunctionPtrDeclaration":
            return

        self.to_remove.add(node)
        self.last_func_ptr_declare = node

        return_type_child = node.getChild(0)
        function_ptr_child = node.getChild(1)

        """
        Remove the return child from the function ptr child and, add it to the function ptr child, right 
        after the identifier
        """
        node.removeChild(return_type_child)
        function_ptr_child.insertChild(2, return_type_child)
        return_type_child.parent = function_ptr_child

    def __check_func_ptr(self, node: ASTNode):
        if node.text != "FunctionPtr":
            return

        identifier_node = node.getChild(1)
        node.removeChild(identifier_node)

        self.last_func_ptr_declare.parent.insertChild(1, identifier_node)

        """
        remove redundant *
        """
        self.to_remove.add(node.getChild(0)
                           )