from src.parser.ASTVisitor import *
from src.internal_tools.IntegrityChecks import PreConditions
from src.parser.AST import ASTNodeTypes
class StringToArray(ASTVisitor):
    """
    This visitor will make it possible to represent strings as char arrays

    This will do 2 things:
    - Make sure the declaration is an array instead of a ptr
    - Convert the input string to an initializer list

    If our string is not assigned to an array, we can safely say that our string cannot be altered and so,
    we can store it as a global string. To support this option, we will just keep the string in such cases
    """

    def visit(self, ast: AST):
        self.preorder(ast.root)

    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type != "STRING":
            return

        """
        remove '"' at start and end of string
        """
        node.text = node.text[1:-1]

        self.__add_last_byte(node)

        if node.parent.text == "Declaration":
            """
            In case of a declaration we will check if we have a ptr or an array
            """

            type_node = node.parent.getChild(0)
            PreConditions.assertInstanceOff(type_node, ASTNodeTypes)

            is_pointer = type_node.symbol_type.getPtrAmount() > 0

            if not is_pointer:
                self.__make_init_list(node)

    @staticmethod
    def __make_init_list(node: ASTNode):
        splitted_string = []
        backslash = False

        """
        Split the characters while keeping special characters using '\' together
        """

        string = node.text

        for char in string:
            if char == "\\" and not backslash:
                backslash = True
                continue

            temp = ""
            if backslash:
                temp += "\\"
            temp += char
            splitted_string.append(temp)

            backslash = False

        """
        Using the characters we will make an initialization list
        """

        init_list = ASTNode("InitList", node.parent, node.getSymbolTable(), node.position, node.structTable)

        """
        Replace the string with the initialization list of characters
        """
        node.parent.replaceChild(node, init_list)

        for char in splitted_string:
            char_node = ASTNodeTerminal(f"'{char}'", init_list, node.getSymbolTable(), "CHAR", node.position,
                                        node.structTable)
            init_list.addChildren(char_node)

    @staticmethod
    def __add_last_byte(node: ASTNode):
        node.text = node.text+"\00"
