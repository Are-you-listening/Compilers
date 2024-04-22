from src.parser.Tables.SymbolTable import *


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

            is_pointer = False
            for child in reversed(type_node.children):
                if child.text == "*":
                    if not child.type.startswith("ARRAY"):
                        is_pointer = True
                    break

            if not is_pointer:
                self.__make_init_list(node)

    @staticmethod
    def __make_init_list(node):
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

        init_list = ASTNode("InitList", node.parent, node.getSymbolTable(), node.linenr, node.virtuallinenr)

        """
        Replace the string with the initialization list of characters
        """
        node.parent.replaceChild(node, init_list)

        for char in splitted_string:
            char_node = ASTNodeTerminal(f"'{char}'", init_list, node.getSymbolTable(), "CHAR", node.linenr,
                                        node.virtuallinenr)
            init_list.addChildren(char_node)

    def __add_last_byte(self, node):
        node.text = node.text+"\00"
