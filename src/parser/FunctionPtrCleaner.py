from src.parser.ASTVisitor import *


class FunctionPtrCleaner(ASTVisitor):
    """
    This class will clean function ptr declarations so the end up with a similar format as normal declarations
    """

    def __init__(self):
        self.to_remove = set()
        self.last_func_ptr_declare = None
        self.skip = set()

    def visit(self, ast: AST):
        self.to_remove = set()
        self.skip = set()
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
        self.__check_function_ptr_return(node)

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
        if node.text != "FunctionPtr" or node in self.skip:
            return

        identifier_node = node.getChild(1)
        node.removeChild(identifier_node)

        self.last_func_ptr_declare.parent.insertChild(1, identifier_node)

        """
        remove redundant *
        """
        self.to_remove.add(node.getChild(0))

    def __check_function_ptr_return(self, node: ASTNode):
        """
        In case a function returns a function ptr, we receive a weird format,
        This visitor will clean that format
        """
        if node.text != "Function":
            return

        """
        In case our function node has 4 children, no function ptrs are being returned
        """
        if node.getChildAmount() <= 4:
            return

        type_node = node.getChild(0)

        """
        remove func ptr '*', using preorder we are able to directly remove this child
        """
        node.removeChild(node.getChild(1))

        """
        Add function Ptr node as parent of the type
        """

        function_ptr_node = ASTNode("FunctionPtr", node, node.getSymbolTable(), node.position, node.structTable)
        type_node.addNodeParent(function_ptr_node)

        """
        Move the functionPtr Param to be a child of FunctionPtr
        """

        func_param = node.getChild(3)
        node.removeChild(func_param)

        function_ptr_node.addChildren(func_param)
        func_param.parent = function_ptr_node

        self.skip.add(function_ptr_node)
