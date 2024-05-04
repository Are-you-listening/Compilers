from src.parser.Tables.SymbolTable import *
from src.parser.Tables.SymbolTypeStruct import *
from src.parser.CTypes.COperationHandler import *
from src.parser.ASTVisitor import *
from src.parser.ASTTypedefReplacer import ASTTypedefReplacer
from src.parser.Tables.SymbolTypeUnion import SymbolTypeUnion
from src.interal_tools.IntegrityChecks import PreConditions
from src.parser.AST import ASTNodeTypes
from src.parser.Tables.TypeNodehandler import TypeNodeHandler


class ASTTableCreator(ASTVisitor):
    """
    Traverses through the three and creates the symbol table
    """

    def __init__(self):
        self.table = None

        self.to_remove = set()
        self.param_list = []
        self.structTable = {}

    def visit(self, ast: AST):
        self.table = None
        self.param_list = []

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

            if currentNode not in visited and currentNode.text in ("Function", "Code", "Scope"):
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
    def __equalParamTypes(param_types_and_ptrs: list, param_types: list):
        if len(param_types_and_ptrs) != len(param_types):
            return False
        for i in range(len(param_types_and_ptrs)):
            if param_types_and_ptrs[i].getPtrTuple() != param_types[i].getPtrTuple():
                return False
        return True

    def __check_function_declarations(self, node: ASTNode, param_types_and_ptrs: list, return_type: SymbolType):
        function_node = node.children[1]
        # check if the function is already declared
        if function_node.symbol_table.exists(function_node.text) and isinstance(function_node.getSymbolTable().getEntry(function_node.text).getTypeObject(), FunctionSymbolType):
            # check if the return types match, if not, throw an error
            if return_type.getPtrTuple() != node.symbol_table.getEntry(function_node.text).getPtrTuple():
                ErrorExporter.conflictingFunctionReturnType(function_node.position, function_node.text)
            # check if the parameter types match, if not, throw an error
            if not self.__equalParamTypes(param_types_and_ptrs, node.symbol_table.getEntry(
                    function_node.text).getTypeObject().getParameterTypes()):
                ErrorExporter.conflictingFunctionParameterTypes(function_node.position, function_node.text)
            # check if the function is a declaration or a definition
            if node.getChildAmount() == 3:
                return
            else:
                # the function is a definition, check if it is already defined, if so, throw an error, else set it to defined
                if node.symbol_table.getEntry(function_node.text).is_function_defined():
                    ErrorExporter.functionRedefinition(function_node.position, function_node.text)
                else:
                    node.symbol_table.getEntry(function_node.text).set_function_defined(True)
        else:
            return

    def visitNode(self, node: ASTNode):
        """
        Assign the symbol table to the node
        """
        node.symbol_table = self.table

        if node.text == "Declaration" or node.text == "Parameter":
            child = node.getChild(0)

            PreConditions.assertInstanceOff(child, ASTNodeTypes)

            """
            
            if child.text == "FunctionPtr":

                symbol_type = self.__get_func_ptr_type(child)
                symbol_entry = SymbolEntry(symbol_type, node.children[1].text, None, node.children[1], None)
                symbol_entry.referenced = node.text == "Parameter"
                node.symbol_table.add(symbol_entry)

            else:
                symbol_type = self.__make_entry(node, child, SymbolType, node.text == "Parameter")
            """
            symbol_type = self.__make_entry(node, child, SymbolType, node.text == "Parameter")

            if node.text == "Parameter":
                self.param_list.append(symbol_type)

        if node.text in ("Function", "Code", "Scope"):
            """
            Go 1 scope back, and make sure the node its scope is recalibrated
            Because function definition needs to be in a global scope
            """
            if self.table.prev is not None:
                self.table = self.table.prev

                node.symbol_table = self.table

        if node.text == "Function":

            child = node.getChild(0)

            PreConditions.assertInstanceOff(child, ASTNodeTypes)

            param_types = self.param_list
            self.param_list = []
            # TODO remove this comment below depracted not in use anymore
            """
            if child.text == "FunctionPtr":

                return_type = self.__get_func_ptr_type(child)

            else:

                return_type = self.__get_data_type(child, SymbolType)
            self.__check_function_declarations(node, param_types, return_type)
            """

            """
            Make func type
            """
            return_type = child.symbol_type
            function_type = FunctionSymbolType(return_type, param_types)

            symbol_entry = SymbolEntry(function_type, node.children[1].text, None, node.children[1], None)
            node.symbol_table.add(symbol_entry)

            function_node = node.children[1]
            if node.getChildAmount() == 4:
                node.symbol_table.getEntry(function_node.text).set_function_defined(True)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        node.symbol_table = self.table

    def __make_struct_type(self, node: ASTNode):
        # TODO remove this function depracted not in use anymore
        structName = node.children[0].text  # First child is struct type
        pts_to = []

        i = 1  # We can skip the first 2 nodes, these are used for the Struct itself
        while i < len(node.children):
            child = node.children[i].children[0]  # Pick the type node
            identifier = node.children[i].children[1].text

            data_type = self.__get_data_type(child, SymbolType)
            pts_to.append(data_type)

            # Remove the struct data member identifier from the table, it is no actual member
            entry = self.table.getEntry(identifier)
            self.table.remove(entry)

            i += 1

        if node.text == "Union":  # For Unions, take the biggest type as type for all data members
            richest = self.getRichestType(pts_to)


            self.structs[structName] = SymbolTypeUnion(structName, richest, pts_to)
        else:
            self.structs[structName] = SymbolTypeStruct(structName, pts_to)


        self.to_remove.add(node)

    @staticmethod
    def getRichestType(pts_to: list):
        richest = pts_to[0]
        check = RichnessChecker(types)
        for pointee in pts_to:
            if isinstance(pointee,
                          SymbolTypeArray):  # Arrays are always the biggest since they contain 1 to multiple pointers
                richest = SymbolTypeArray(SymbolType("FLOAT", False), False, pointee.size)
                break
            if isinstance(pointee, SymbolTypePtr):
                richest = pointee
            else:
                data_type, ptrs = richest.getPtrTuple()
                data_type2, ptrs2 = pointee.getPtrTuple()
                if data_type2[0] == check.get_richest(data_type[0], data_type2[0]):
                    richest = pointee
        return richest

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
                    latest_datatype = symbol_type(grandchild.text, is_const)  # Keep the typedef name\

                elif TypeNodeHandler.getInstance().getStruct(grandchild.text) is not None:

                    latest_datatype = TypeNodeHandler.getInstance().getStruct(grandchild.text)
                else:
                    latest_datatype = symbol_type(grandchild.text.upper(), is_const)

        return latest_datatype

    def __make_entry(self, node, child: ASTNode, symbol_type, referenced=False):
        """
        Make symbol table entry
        :param node:
        :param child: Type node
        :param symbol_type:
        :return:
        """

        PreConditions.assertInstanceOff(child, ASTNodeTypes)

        symbol_type = child.symbol_type

        latest_datatype = symbol_type
        if latest_datatype.getBaseType() == "VOID":
            ErrorExporter.variableDeclaredVoid(node.position, node.children[1].text)

        """
        the value in the symbol table is initially empty
        """

        symbol_entry = SymbolEntry(latest_datatype, node.children[1].text, None, node.children[1], None)
        if referenced:
            symbol_entry.reference()
        node.symbol_table.add(symbol_entry)
        return latest_datatype

    @staticmethod
    def isStructType(text: str):
        """
        Returns true if the type is a struct defined by the user
        :param text:
        """
        return "struct" == text[0:6] or "union" == text[0:6]

    def __get_func_ptr_type(self, node: ASTNode):

        return_type_child = node.getChild(0)

        if return_type_child.text == "FunctionPtr":
            return_type = self.__get_func_ptr_type(return_type_child)
        else:
            return_type = self.__get_data_type(return_type_child, SymbolType)
        function_params = node.getChild(1)

        param_type_list = []
        for param in function_params.children:
            param_type = self.__get_data_type(param, SymbolType)
            param_type_list.append(param_type)

        function_type = FunctionSymbolType(return_type, param_type_list)
        func_ptr = SymbolTypePtr(function_type, False)

        return func_ptr
