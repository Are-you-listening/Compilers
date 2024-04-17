from src.parser.Tables.SymbolTable import *
from src.parser.Tables.SymbolTypeArray import *


class ASTTableCreator(ASTVisitor):
    """
    Traverses through the three and creates the symbol table
    """
    def visit(self, ast: AST):
        self.postorder(ast.root)

    def visitNode(self, node: ASTNode):
        if node.text == "Declaration" or node.text == "Parameter":
            child = node.findType("Type")
            symbol_type = SymbolType

            self.__make_entry(node, child, symbol_type)

        if node.text == "Function":
            child = node.findType("Type")
            param_types = []

            for param in node.children[2].children:
                if param.children[0].children[0].text != "const":
                    param_types.append(param.children[0].children[0].text)
                else:
                    param_types.append(param.children[0].children[1].text)

            self.__make_entry(node, child, lambda d, c: FunctionSymbolType(d, c, param_types))

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    @staticmethod
    def __make_ptr_type(latest_datatype: SymbolType, is_const: bool, terminal_type: str):
        """
        We have 2 types of ptrs, normal ptrs and array ptrs (They do mostly the same, but are different for checks),
        whether a ptr is an array depends on the type, ARRAY_size is an ARRAY
        """
        if terminal_type.startswith("ARRAY_"):
            datatype = SymbolTypeArray(latest_datatype, is_const, int(terminal_type[6:]))
        else:
            datatype = SymbolTypePtr(latest_datatype, is_const)
        return datatype

    @staticmethod
    def __make_entry(node, child: ASTNodeTerminal, symbol_type):
        """
        Make symbol table entry
        :param node:
        :param child:
        :param symbol_type:
        :return:
        """

        is_const = False
        latest_datatype = None

        for grandchild in child.children:
            if grandchild.text == "const":

                """
                in case *const, the const is after, but it still needs to be applied
                """
                if latest_datatype is not None:
                    latest_datatype.const = True

                is_const = True
            elif grandchild.text == "*":
                is_const = False
                latest_datatype = ASTTableCreator.__make_ptr_type(latest_datatype, is_const, grandchild.type)
            else:
                if not ASTTypedefReplacer.isBaseType(grandchild):
                    latest_datatype = symbol_type(grandchild.text, is_const)  # Keep the typedef name
                else:
                    latest_datatype = symbol_type(grandchild.text.upper(), is_const)

        """
        the value in the symbol table is initially empty
        """
        symbol_entry = SymbolEntry(latest_datatype, node.children[1].text, None, node.children[1], None)
        node.symbol_table.add(symbol_entry)
