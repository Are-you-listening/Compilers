from src.parser.Tables.SymbolTable import *
from src.parser.Tables.SymbolTypeArray import *
from src.parser.Tables.SymbolTypeStruct import *


class ASTTableCreator(ASTVisitor):
    """
    Traverses through the three and creates the symbol table
    """
    def __init__(self):
        self.table = None
        self.structs = {}
        self.to_remove = set()

    def visit(self, ast: AST):
        self.table = None
        self.postorder(ast.root)

        for n in self.to_remove:
            n.parent.removeChild(n)

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

    @staticmethod
    def __equelParamTypes(param_types_and_ptrs: list, param_types: list):
        if len(param_types_and_ptrs) != len(param_types):
            return False
        for i in range(len(param_types_and_ptrs)):
            if param_types_and_ptrs[i].getPtrTuple() != param_types[i].getPtrTuple():
                return False
        return True


    def __check_function_declarations(self, node: ASTNode, param_types_and_ptrs: list, return_type: SymbolType ):
        function_node = node.children[1]
        #check if the function is already declared
        if function_node.symbol_table.exists(function_node.text):
            #check if the return types match, if not, throw an error
            if return_type.getPtrTuple() != node.symbol_table.getEntry(function_node.text).getPtrTuple():
                ErrorExporter.conflictingFunctionReturnType(function_node.linenr, function_node.text)
            #check if the parameter types match, if not, throw an error
            if not self.__equelParamTypes(param_types_and_ptrs, node.symbol_table.getEntry(function_node.text).getTypeObject().getParameterTypes()):
                ErrorExporter.conflictingFunctionParameterTypes(function_node.linenr, function_node.text)
            #check if the function is a declaration or a definition
            if node.getChildAmount() == 3:
                return
            else:
                #the function is a definition, check if it is already defined, if so, throw an error, else set it to defined
                if (node.symbol_table.getEntry(function_node.text).is_function_defined()):
                    ErrorExporter.functionRedefenition(function_node.linenr, function_node.text)
                else:
                    node.symbol_table.getEntry(function_node.text).set_function_defined(True)
        else:
            return

    def visitNode(self, node: ASTNode):
        """
        Assign the symbol table to the node
        """
        node.symbol_table = self.table

        if node.text == "Struct":
            self.__make_struct_type(node)
            return

        if node.text == "Declaration" or node.text == "Parameter":
            child = node.findType("Type")
            symbol_type = SymbolType

            self.__make_entry(node, child, symbol_type, True)

        if node.text in ("Function", "Code", "Scope"):
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
                param_type = self.__get_data_type(param.getChild(0), SymbolType)
                param_types.append(param_type)

            return_type = self.__get_data_type(child, SymbolType)

            self.__check_function_declarations(node, param_types, return_type)



            """
            Make func type
            """
            function_type = FunctionSymbolType(return_type, param_types)
            symbol_entry = SymbolEntry(function_type, node.children[1].text, None, node.children[1], None)
            node.symbol_table.add(symbol_entry)

            function_node = node.children[1]
            if node.getChildAmount() == 4:
                node.symbol_table.getEntry(function_node.text).set_function_defined(True)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        node.symbol_table = self.table

    def __make_struct_type(self, node: ASTNode):
        structName = node.children[0].text  # First child is struct type
        pts_to = []

        i = 1  # We can skip the first 2 nodes, these are used for the Struct ittself
        while i < len(node.children):
            child = node.children[i].children[0]  # Pick the type node

            data_type = self.__get_data_type(child, SymbolType)
            pts_to.append(data_type)

            i += 1

        self.structs[structName] = SymbolTypeStruct(pts_to, structName)
        self.to_remove.add(node)

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

    def __get_data_type(self, child, symbol_type):
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
                elif self.structs.get(grandchild.text) is not None:
                    latest_datatype = self.structs[grandchild.text]
                else:
                    latest_datatype = symbol_type(grandchild.text.upper(), is_const)

        return latest_datatype

    def __make_entry(self, node, child: ASTNodeTerminal, symbol_type, referenced=False):
        """
        Make symbol table entry
        :param node:
        :param child: Type node
        :param symbol_type:
        :return:
        """
        latest_datatype = self.__get_data_type(child, symbol_type)

        """
        the value in the symbol table is initially empty
        """
        symbol_entry = SymbolEntry(latest_datatype, node.children[1].text, None, node.children[1], None)
        if referenced:
            symbol_entry.reference()
        node.symbol_table.add(symbol_entry)

    @staticmethod
    def isStructType(text: str):
        """
        Returns true if the type is a struct defined by the user
        :param text:
        """
        return "struct" == text[0:6]


