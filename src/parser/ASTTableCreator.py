from src.parser.Tables.SymbolTable import *
from src.parser.Tables.SymbolTypeArray import *


class ASTTableCreator(ASTVisitor):
    """
    Traverses through the three and creates the symbol table
    """
    def __init__(self):
        self.table = None

    def visit(self, ast: AST):
        self.table = None
        self.postorder(ast.root)

    def postorder(self, root: ASTNode):
        """for child in root.children:
            self.postorder(child)
        root.accept(self)"""

        stack = [root]
        visited = set()

        while len(stack) > 0:

            current_index = len(stack) - 1
            currentNode = stack[current_index]  # get top of stack without popping it

            if currentNode not in visited and currentNode.text in ("Function", "Code"):
                """
                Create a new scope for the children
                """
                temp = SymbolTable(self.table)
                if self.table is not None:
                    self.table.nextTable(temp)
                self.table = temp

            do_visit = True
            for child in reversed(currentNode.getChildren()):

                if child not in visited and child not in stack:
                    stack.append(child)
                    do_visit = False

            if do_visit:
                currentNode.accept(self)
                stack.pop(current_index)

            visited.add(currentNode)

    def visitNode(self, node: ASTNode):
        """
        Assign the symbol table to the node
        """
        node.symbol_table = self.table

        if node.text == "Declaration" or node.text == "Parameter":
            child = node.findType("Type")
            symbol_type = SymbolType

            self.__make_entry(node, child, symbol_type)

        if node.text in ("Function", "Code"):
            """
            Go 1 scope back, and make sure the node its scope is recalibrated
            Because function definition needs to be in a global scope
            """
            if self.table.prev is not None:
                self.table = self.table.prev
                node.symbol_table = self.table

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
        node.symbol_table = self.table

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
