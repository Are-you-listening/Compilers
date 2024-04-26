from src.parser.CTypes.COperationHandler import *
from src.parser.ASTTableCreator import *
from src.parser.Constraints.FunctionReturnConstraint import findfunction

class ASTConversion(ASTVisitor):
    """
    Makes implicit conversions explicit
    """

    def __init__(self, structTable):
        self.rc = RichnessChecker(types)

        """
        Map each node on its resulting type after the node has been executed
        """
        self.type_mapping = {}

        self.structTable = structTable  # Keep track of the struct names and their data fields
        self.structPtrMap = {}  # Map 'Dereference' nodes above a pointer to the pointer node so it can be used later to give the correct type to Expr nodes

    def visit(self, ast: AST):
        """
        do a visitor in postorder, so we can construct type_mapping to the node types of the children first.
        This makes it possible for parents to access the types of their children and set its own type accordingly
        :return:
        """
        self.postorder(ast.root)

    def visitNode(self, node: ASTNode):
        """
        Visit AST Nodes and give it a type, if the type changes implicit, add conversion nodes
        :param node: the node we are currently checking
        :return:
        """
        is_array = (node.text == "Expr" and node.getChildAmount() == 3 and node.getChild(1).text == "[]")
        is_struct = False

        print(is_array, is_struct, node.text)

        if is_array:  # TODO fix the statement
            child = node.getChild(0)
            data_type, ptrs = self.type_mapping[child]
            if data_type[0] not in ["FLOAT", "CHAR", "INT"]:
                is_struct = True
                #is_array = False

        if is_struct:  # TODO Need a way to pass the type to the node above
            #tempPtrs = [('*', False)]
            tempPtrs = []
            index = int(node.getChild(2).text)  # Index of the struct data member
            lchild = node.getChild(0)  # LHS of the '.' 'operator
            if lchild.text == "Dereference":
                lchild = self.structPtrMap.get(node.getChild(0))

            type_object = node.symbol_table.getEntry(lchild.text).getTypeObject()
            if isinstance(type_object, SymbolTypePtr):
                #tempPtrs = [('*', False)]
                tempPtrs = []
                #print(node.text)
                while isinstance(type_object, SymbolTypePtr):  # We need to find the StructType
                    tempPtrs.append(('*', False))
                    type_object = type_object.pts_to
            else:
                #print('y')
                data_type2, tempPtrs = self.type_mapping[lchild]

            data_type, ptrs = type_object.pts_to[index].getPtrTuple()
            ptrs = tempPtrs + ptrs
            self.type_mapping[node] = (data_type, ptrs)
            #print("struct", node.text, node.parent.text, data_type, ptrs)


        if node.text == "Dereference" or is_array:


            """when we have a 'Dereference' node, the type after executing this node, will be 1 ptr less, than it was 
            before"""
            child = node.getChild(0)
            #if not is_struct:
            data_type, ptrs = self.type_mapping[child]
            print('before', is_struct, is_array, node.text, node.parent.text, data_type, ptrs)

            #print("array", data_type, ptrs)

            """
            We we do a [] access, we need to check that the value provided is an integer
            """
            if is_array:
                data_type2, ptrs2 = self.type_mapping[node.getChild(2)]

                if data_type2[0] != "INT" or len(ptrs2) > 0:
                    ErrorExporter.invalidArrayIndex(node.linenr, (data_type2, ptrs2))

                """
                The array has by default 1 ptr, but it it is the only 1, the array is not really an array
                """
                if len(ptrs) <= 1:
                    ErrorExporter.invalidDereferenceNotPtr(node.linenr, (data_type, ptrs[:-1]), True)
            """
            when trying to dereference a non-ptr, throw an error
            """
            if len(ptrs) == 0:
                ErrorExporter.invalidDereferenceNotPtr(node.linenr, (data_type, ptrs))

            ptrs = ptrs[:-1]  # Remove 1 ptr
            # if not is_struct:
            self.type_mapping[node] = (data_type, ptrs)
            #print("array change: ", node.text , data_type, ptrs)
            print('after' , is_struct, is_array, node.text, node.parent.text, data_type, ptrs)
            return

        if node.text == "Conversion":
            """
            When we have a conversion node, the new type will be the type defined in the conversion
            """

            type_value = node.getChild(0)
            data_type, ptrs = self.calculateType(type_value)

            """
            check first is the conversion is redundant (float) of float
            """
            if self.type_mapping[node.getChild(1)] == (data_type, ptrs):
                """
                this case the conversion is redundant
                """
                node.parent.replaceChild(node, node.getChild(1))

            self.type_mapping[node] = (data_type, ptrs)
            return
        if node.text not in ("Literal", "Expr", "Declaration", "Assignment", "ParameterCall", "FunctionCall", "Return"):

            """
            For our conversion we are only interested in Nodes that have a type,
             things like comments are useless to check
            """
            return

        """
        now we are going to decide which type we should convert to if we do not yet have that type
        """
        to_type: tuple = (None, None)
        operator = self.get_operator(node)

        if node.text in ("Literal", "Expr"):
            """
            check the type of the children to calculate our type.
            We need to take the richest type for expressions
            """
            for child in node.children:
                """
                when a child does not have a type, we will ignore it
                """
                check_type: tuple = self.type_mapping.get(child, None)
                if check_type is None:
                    continue

                """
                first type does not have to check if it is richer
                """
                if to_type == (None, None):
                    to_type = check_type
                    continue

                """
                ptrs cannot do operations together, but ptr+int is allowed.
                To check this, we will take the min of to_type and type_tup their ptr length, and this always needs
                to be 0, else we throw een error
                """
                if min(len(to_type[1]), len(check_type[1])) != 0:

                    """
                    pointers cannot do operation together unless condition operations
                    """

                    if operator not in ("==", "<=", ">=", "<", ">", "!="):
                        """
                        when the op is invalid for ptrs
                        """
                        ErrorExporter.invalidOperation(node.linenr, operator, to_type, check_type)

                """
                for the non-first type, we will take the richest type
                """
                richest_native_type = self.rc.get_richest(to_type[0][0], check_type[0][0])
                richest_native_type = (richest_native_type, False)
                """
                when 2 conflicting ptr types choose the one with the most ptrs: '*'
                Because, PTR+PTR will be rejected in the future, and int+PTR, will be just fine
                """
                to_ptr = to_type[1]
                if len(check_type[1]) > len(to_type[1]):
                    to_ptr = check_type[1]
                    richest_native_type = check_type[0]
                elif len(to_type[1]) > len(check_type[1]):
                    richest_native_type = to_type[0]

                to_type = (richest_native_type, to_ptr)

        """for declaration and assignment the type is the type of the value that is declared/assigned (and not the 
        necessarily the poorest type)"""
        if node.text == "FunctionCall":
            functionNode = node.children[0]
            while functionNode.text == "Dereference":
                functionNode = functionNode.children[0]

            return_type = node.parent.getSymbolTable().getEntry(functionNode.text).getPtrTuple()

            self.type_mapping[node] = return_type
            return

        if node.text in ("Declaration", "Assignment"):
            assign_node = node.getChild(0)
            assign_type = self.type_mapping[assign_node]

            """
            be default 1 ptr is added, so remove it again, because assignment
            """
            to_type = (assign_type[0], assign_type[1][:-1])
            """
            make sure assignment doesn't convert to a ptr less
            """
            self.type_mapping[assign_node] = to_type

            if node.text == "Assignment":
                """
                Check if we assign to const assign node, if so throw an error
                """

                if len(to_type[1]) > 0:
                    const_assign = to_type[1][0][1]
                else:
                    const_assign = to_type[0][1]

                if const_assign:
                    ErrorExporter.constComplaint(node.linenr, self.subtree_to_text(assign_node),
                                                 self.subtree_to_text(assign_node), self.format_type(to_type))

        if node.text == "ParameterCall":
            functionNode = node.parent.children[0]

            parameterTypes = node.parent.getSymbolTable().getEntry(functionNode.text).getTypeObject().getParameterTypes()
            """
            check if has the right amount of arguments
            """
            if len(node.parent.children) - 1 < len(parameterTypes):
                ErrorExporter.tooFewFunctionArguments(node.linenr, len(parameterTypes), len(node.children), functionNode.text)
            if len(node.parent.children) - 1 > len(parameterTypes):
                ErrorExporter.tooManyFunctionArguments(node.linenr, len(parameterTypes), len(node.children), functionNode.text)
            """
            be default 1 ptr is added, so remove it again, because assignment
            """

            """
            TODO: support for ptrs in function calls (string zijn sterretjes)
            """
            to_type = parameterTypes[node.parent.findChild(node) - 1].getPtrTuple()
            """
            make sure assignment doesn't convert to a ptr less
            """
        if operator in ("&&", "||"):
            """
            logical operators expect booleans so we convert the given entry into a boolean
            """
            to_type = (("BOOL", False), [])


        if node.text == "Return":
            function = findfunction(node)
            function_name = function.getChild(0).text

            return_type = function.getSymbolTable().getEntry(function_name).getPtrTuple()
            to_type = return_type

        """
        add implicit conversions as explicit
        """
        for child in node.children:
            type_tup = self.type_mapping.get(child, (None, None))
            if type_tup == (None, None):
                continue

            # TODO Temp
            # if type_tup[0][0] in self.structTable.keys() or to_type[0][0] in self.structTable.keys():  # Don't check struct types
            #     continue

            if type_tup[0][0] != to_type[0][0] or type_tup[1] != to_type[1]:
                if to_type[0][0] == "BOOL" and len(to_type[1]) == 0:
                    """
                    logical operators expect booleans so we convert the given entry into a boolean
                    """
                    self.addConversion(child, (("BOOL", False), []))

                    """
                    use continue so we don't throw warnings/errors for booleans
                    """
                    continue

                """
                make sure that pointers and floats are not combined in invalid ways
                int* v = 0.0; or float v = (ptr)              
                """

                if not self.compatible_2(type_tup, to_type, operator):
                    if operator is None:

                        """
                        when no operator, it is an assignment
                        """
                        ErrorExporter.invalidAssignment(child.linenr, to_type, type_tup)
                    else:
                        ErrorExporter.invalidOperation(child.linenr, operator, to_type, type_tup)
                    continue

                if operator is not None:
                    if not self.compatible(type_tup, to_type, operator):
                        """
                        in case we have incompatible type
                        """
                        ErrorExporter.invalidOperation(child.linenr, operator, to_type, type_tup)
                        continue

                    if operator in ("==", "!=", "<=", ">=", "<", ">"):
                        ErrorExporter.IncompatibleComparison(child.linenr, to_type, type_tup)
                        self.addConversion(child, to_type)
                        continue

                    """
                    in case ptr+int, we don't need to convert the int,
                    only counts for operators not assignments
                    """
                    if len(to_type[1]) > 0 and len(type_tup[1]) == 0:
                        """
                        ptr+int, does not require to convert the int to an int*
                        """
                        continue
                if child.text == "Expr" and child.getChildAmount() == 3 and child.getChild(1).text == "[]":
                    continue
                self.pointer_warning_check(child.linenr, to_type, type_tup)
                self.narrowing_warning_check(child.linenr, to_type, type_tup)

                self.addConversion(child, to_type)

        """
        equality operators give an integer back
        """
        if operator in ("==", "!=", "<=", ">=", "<", ">", "&&", "||", "!"):
            self.type_mapping[node] = (("BOOL", False), [])
        else:
            self.type_mapping[node] = to_type

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            type_entry = node.getSymbolTable().getEntry(node.text)
            type_object = type_entry.getTypeObject()

            if isinstance(type_object, SymbolTypePtr):
                pointee = type_object.pts_to
                while isinstance(pointee, SymbolTypePtr):
                    pointee = pointee.pts_to

            if isinstance(type_object, SymbolTypeStruct) or (isinstance(type_object, SymbolTypePtr) and isinstance(pointee, SymbolTypeStruct)):
                data_type, ptrs = self.handleStruct(node)
            else:
                data_type, ptrs = type_entry.getPtrTuple()


            """
            Use LLVM ptr format
            """
            ptrs.append(("*", False)) # TODO Maybe this shouldn't be done for structs?

            #print( node.text, data_type, ptrs)

            self.type_mapping[node] = (data_type, ptrs)

        elif node.type in types:
            self.type_mapping[node] = ((node.type, False), [])

    def replaceIdentifierWithIndex(self, oldGuy, struct_name):
        """
        Replace the data field identifier of a struct with a corresponding index
        :param oldGuy: Struct Node
        :param struct_name: name of the struct
        :return:
        """
        index_node = oldGuy.children[0].getSiblingNeighbour(1).getSiblingNeighbour(1)
        identifier = index_node.text

        index = self.structTable[struct_name].index(identifier)  # Replace the struct data member name with an index
        index_node.text = index

        #print('replacing identifier with index')

    def handleStruct(self, node):
        type_entry = node.getSymbolTable().getEntry(node.text)
        type_object = type_entry.getTypeObject()

        oldGuy = node.parent
        oldGuy_passed = False
        #ptrss = []
        while oldGuy.text == "Dereference":
            #ptrss += [('*', False)]
            oldGuy_passed = True
            oldGuy = oldGuy.parent

        # if node.parent.text == "Dereference" and node.symbol_table.getEntry(node.text) is not None:
        #     type_object = node.symbol_table.getEntry(node.text).getTypeObject()
        #     if isinstance(type_object, SymbolTypePtr) and type_object.data_type == "PTR" and isinstance(type_object.pts_to, SymbolTypeStruct):
        #         data_type, ptrs = type_entry.getPtrTuple()
        #         print(node.text)
        #         return data_type, ptrs

        if node.getSiblingNeighbour(-1) is not None and node.getSiblingNeighbour(-1).text == "[]":  # RHS of the '.' operator
            index = int(node.text)  # Get the index of the struct data member
            data_type, ptrs = type_object.getElementType(index)
        elif node.getSiblingNeighbour(1) is not None and node.getSiblingNeighbour(1).text == "[]":  # LHS of the '.' operator
            ptrs = [('*', False)]
            data_type, ptrs2 = type_object.getPtrTuple()
            ptrs += ptrs2
            self.replaceIdentifierWithIndex(oldGuy, data_type[0])
        # elif node.text == "Declaration":
        #     data_type, ptrs = type_entry.getPtrTuple()
        #     ptrs = [('*', False)] + ptrs
        elif oldGuy_passed:
            data_type, ptrs = type_object.getPtrTuple()
            self.replaceIdentifierWithIndex(oldGuy,data_type[0])

            temp = node.parent
            while temp.text == "Dereference":
                self.structPtrMap[temp] = node
                temp = temp.parent

        else:
            data_type, ptrs = type_object.getPtrTuple()

        return data_type, ptrs



    @staticmethod
    def calculateType(node: ASTNode):
        """
        provided node is a type node
        :param node:
        :return:
        """

        if node.text != "Type":
            raise Exception("wrong node type")

        data_type = ""
        ptrs = []
        for child in node.children:
            if child.text.upper() in types:
                data_type = (child.text.upper(), False)

            if child.text == "*":
                ptrs.append(("*", False))

        return data_type, ptrs

    @staticmethod
    def compatible(type_tup: tuple, to_type: tuple, operator: str):
        """
        Check the blacklist for absolute incompatible operations or types
        :param operator:
        :param to_type:
        :param type_tup:
        :return:
        """
        blocklist = [("PTR", "+", "PTR"), ("PTR", "*", "PTR"), ("PTR", "*", "INT"), ("PTR", "*", "CHAR"),
                     ("CHAR", "*", "PTR"), ("INT", "*", "PTR")]
        incompatible_ops = {  # Keep a list of absolutely incompatible types & operations
            "FLOAT": ["%", "|", "&", "~", "CHAR"],  # FLOAT & CHAR are always incompatible
            "PTR": ["/", "^", ">>", "<<", "%", "|", "~"]
        }

        incompatible = False
        incompatible = incompatible or (
            ASTConversion.to_string_type(type_tup), operator, ASTConversion.to_string_type(to_type)) in blocklist
        if ASTConversion.to_string_type(type_tup) in incompatible_ops.keys():
            incompatible = incompatible or operator in incompatible_ops.get(ASTConversion.to_string_type(type_tup))

        if ASTConversion.to_string_type(to_type) in incompatible_ops.keys():
            incompatible = incompatible or operator in incompatible_ops.get(ASTConversion.to_string_type(to_type))
        return not incompatible

    @staticmethod
    def compatible_2(type_tup: tuple, to_type: tuple, operator: str):
        """
        check specific compatibility for ptrs and float combinations
        :param type_tup:
        :param to_type:
        :param operator:
        :return:
        """

        """
        verify it is not ptr+float, or something like that
        """
        incompatible = False

        if max(len(to_type[1]), len(type_tup[1])) != 0:
            ptr_less_type = to_type
            if len(type_tup[1]) == 0:
                ptr_less_type = type_tup

            """
            check if 1 is a PTR and 1 is a FLOAT to say the operation is invalid
            Some operations like '&&' are still valid
            """
            if ptr_less_type[0][0] == "FLOAT" and len(ptr_less_type[1]) == 0 and operator not in (
                    "==", "<=", ">=", "<", ">", "!=", "&&", "||"):
                incompatible = True

        return not incompatible

    @staticmethod
    def to_string_type(type_tup):
        if len(type_tup[1]) == 0:
            return type_tup[0][0]

        return "PTR"

    @staticmethod
    def get_operator(node: ASTNode):
        """
        Find the operator of a node
        :param node: the node whose operator we want
        :return:
        """
        for child in node.children:
            if not isinstance(child, ASTNodeTerminal):
                continue
            if child.type not in types and child.type != "IDENTIFIER":
                return child.text

        return None

    @staticmethod
    def pointer_warning_check(line_nr: int, to_type: tuple, type_tup2: tuple):
        """
        when float* to int* convert we need to throw a warning
        This function will check for such situations and throw a warning accordingly
        :param line_nr:
        :param to_type:
        :param type_tup2:
        :return:
        """

        """
        when no ptrs are in the file, this check does nothing
        """
        if max(len(to_type[1]), len(type_tup2[1])) == 0:
            return

        if len(to_type[1]) != len(type_tup2[1]) or to_type[0][0] != type_tup2[0][0]:
            """
            when ptr amount is different or when type a ptr points to is different
            """

            """
            when comparison operator is given -> other error message
            """
            ErrorExporter.IncompatiblePtrTypesWarning(line_nr, to_type, type_tup2)

            return

    def narrowing_warning_check(self, line_nr: int, to_tup: tuple, type_tup: tuple):
        """
        Give a warning when an implicit conversion narrows the type

        :param line_nr:
        :param to_tup:
        :param type_tup:
        :return:
        """

        """
        ignore ptrs for this
        """
        if max(len(to_tup[1]), len(type_tup[1])) != 0:
            return
        if self.rc.get_poorest(to_tup[0][0], type_tup[0][0]) == type_tup[0][0]:
            return

        ErrorExporter.narrowingTypesWarning(line_nr, to_tup, type_tup)

    @staticmethod
    def addConversion(node: ASTNode, to_type: tuple):
        """
        add a conversion to the provided type

        :param to_type:
        :param node:
        :return:
        """

        new_node = ASTNode("Conversion", node.parent, node.getSymbolTable(), node.linenr, node.virtuallinenr)
        type_node = ASTNode("Type", new_node, new_node.getSymbolTable(), node.linenr, node.virtuallinenr)
        new_node.addChildren(type_node)

        """
        add datatype
        """
        type_node.addChildren(
            ASTNodeTerminal(to_type[0][0], type_node, type_node.getSymbolTable(), "Not Used",
                            node.linenr, node.virtuallinenr))

        for t_child in to_type[1]:
            type_node.addChildren(
                ASTNodeTerminal(t_child[0], type_node, type_node.getSymbolTable(), "Not Used",
                                node.linenr, node.virtuallinenr))
        node.addNodeParent(new_node)

    @staticmethod
    def subtree_to_text(node: ASTNode):
        text = ""
        if isinstance(node, ASTNodeTerminal):

            text += node.text

        ass = node.parent.text == "Assignment" and node.text == "Dereference"
        if ass:
            text += "*("

        #print(node)

        brackets_needed = False


        if node.text == "Dereference":
            brackets_needed = not isinstance(node.getChild(0), ASTNodeTerminal) or node.getChild(0).type != "IDENTIFIER"

            if brackets_needed:
                text += "("

        for child in node.children:
            text += ASTConversion.subtree_to_text(child)

        if brackets_needed:
            text += ")"

        if ass:
            text += ")"

        return text

    @staticmethod
    def format_type(format_type: tuple):
        const = ""
        if format_type[0][1]:
            const = "const"

        type_text = f"{const} {format_type[0][0]}"
        for p in reversed(format_type[1]):
            const = ""
            if p[1]:
                const = "const"
            type_text += f"*{const}"
        return type_text
