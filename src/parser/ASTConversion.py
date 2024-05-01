from src.parser.ASTTableCreator import *
from src.parser.Constraints.FunctionReturnConstraint import findFunction


class ASTConversion(ASTVisitor):
    """
    Makes implicit conversions explicit
    """

    def __init__(self):
        self.rc = RichnessChecker(types)

        """
        Map each node on its resulting type after the node has been executed
        """
        self.type_mapping = {}

        """
        Map 'Dereference' nodes above a pointer to the pointer node so it can be used later to give the correct type 
        to Expr nodes
        """
        self.structPtrMap = {}

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

        if node.text == "Dereference" or is_array:
            self.handle_dereference(node, is_array)

            return

        if node.text in ["scanf", "printf"]:
            self.type_mapping[node] = SymbolType("INT", False)

        if node.text == "Conversion":
            """
            When we have a conversion node, the new type will be the type defined in the conversion
            """

            type_value = node.getChild(0)
            data_type = self.calculateType(type_value)

            """
            check first is the conversion is redundant (float) of float
            """
            if self.type_mapping[node.getChild(1)] == data_type:
                """
                this case the conversion is redundant
                """
                node.parent.replaceChild(node, node.getChild(1))

            self.type_mapping[node] = data_type
            return

        if node.text == "ParameterCalls":
            corresponding_function_type = self.get_function_type(node)

            parameterTypes = corresponding_function_type.getParameterTypes()
            """
            check if has the right amount of arguments
            """
            if len(node.children) < len(parameterTypes):
                ErrorExporter.tooFewFunctionArguments(node.position, len(parameterTypes), len(node.children), self.subtree_to_text(node.parent.children[0]))
            if len(node.children) > len(parameterTypes):
                ErrorExporter.tooManyFunctionArguments(node.position, len(parameterTypes), len(node.children), self.subtree_to_text(node.parent.children[0]))
            return

        if node.text not in ("Literal", "Expr", "Declaration", "Assignment", "Return", "ParameterCall"):

            """
            For our conversion we are only interested in Nodes that have a type,
             things like comments are useless to check
            """
            return

        """
        now we are going to decide which type we should convert to if we do not yet have that type
        """
        to_type: SymbolType = None
        operator = self.get_operator(node)

        if node.text in ("Literal", "Expr"):

            """
            if we have an expression that is a function call, we need to check that we call a function
            """
            if node.text == "Expr" and node.getChildAmount() == 3 and node.getChild(1).text == "()":
                called_type: SymbolType = self.type_mapping.get(node.getChild(0))
                """
                In case we do a function call on a not function we will throw this error
                """
                if not isinstance(called_type, FunctionSymbolType):
                    ErrorExporter.functionCallNotFunction(node.position, self.subtree_to_text(node.getChild(0)),
                                                          called_type)

            """
            check the type of the children to calculate our type.
            We need to take the richest type for expressions
            """
            for child in node.children:
                """
                when a child does not have a type, we will ignore it
                """
                check_type: SymbolType = self.type_mapping.get(child, None)
                if check_type is None:
                    continue

                """
                first type does not have to check if it is richer
                """
                if to_type is None:
                    to_type = check_type
                    continue

                """
                ptrs cannot do operations together, but ptr+int is allowed.
                To check this, we will take the min of to_type and type_tup their ptr length, and this always needs
                to be 0, else we throw een error
                """
                if not to_type.isBase() and not check_type.isBase():

                    """
                    pointers cannot do operation together unless condition operations
                    """

                    if operator not in ("==", "<=", ">=", "<", ">", "!="):
                        """
                        when the op is invalid for ptrs
                        """

                        ErrorExporter.invalidOperation(node.position, operator, to_type, check_type)

                """
                for the non-first type, we will take the richest type
                """

                if to_type.getBaseType() == "VOID" or check_type.getBaseType() == "VOID":
                    ErrorExporter().incorrectVoidFuncUse(node.position)
                richest_native_type = self.rc.get_richest(to_type.getBaseType(), check_type.getBaseType())

                richest_native_type = SymbolType(richest_native_type, False)

                """
                when 2 conflicting ptr types choose the one with the most ptrs: '*'
                Because, PTR+PTR will be rejected in the future, and int+PTR, will be just fine
                """

                if check_type.getPtrAmount() > to_type.getPtrAmount():
                    temp_to = check_type
                elif check_type.getPtrAmount() < to_type.getPtrAmount():
                    temp_to = to_type
                else:
                    temp_to = richest_native_type

                    for i in range(check_type.getPtrAmount()):
                        temp_to = SymbolTypePtr(temp_to, False)

                to_type = temp_to

        if node.text in ("Declaration", "Assignment"):
            assign_node = node.getChild(0)
            assign_type = self.type_mapping[assign_node]
            """
            be default 1 ptr is added, so remove it again, because assignment
            """
            to_type = assign_type.deReference()
            """
            make sure assignment doesn't convert to a ptr less
            """
            self.type_mapping[assign_node] = to_type

            if node.text == "Assignment":
                """
                Check if we assign to const assign node, if so throw an error
                """
                if assign_type.union:
                    real_type = self.type_mapping[node.getChild(0)]

                    self.addConversion(assign_node, SymbolTypePtr(real_type, False).getPtrTuple())
                    self.type_mapping[assign_node] = real_type
                    to_type = real_type

                const_assign = to_type.isConst()

                if const_assign:
                    ErrorExporter.constComplaint(node.position, self.subtree_to_text(assign_node),
                                                 self.subtree_to_text(assign_node), self.format_type(to_type))

        if node.text == "ParameterCall":
            """
            Do an implicit conversion of the parameters
            """

            corresponding_function_type = self.get_function_type(node.parent)

            parameterTypes = corresponding_function_type.getParameterTypes()

            index = node.parent.findChild(node)
            if index < 0 or index >= len(parameterTypes):
                return

            to_type = parameterTypes[index]

        if operator in ("&&", "||"):
            """
            logical operators expect booleans so we convert the given entry into a boolean
            """
            to_type = SymbolType("BOOL", False)

        if node.text == "Return":
            function = findFunction(node)
            function_name = function.getChild(0).text

            function_type = function.getSymbolTable().getEntry(function_name).getTypeObject()
            to_type = function_type.return_type

        """
        add implicit conversions as explicit
        """

        for child in node.children:
            type_tup: SymbolType = self.type_mapping.get(child, None)

            if type_tup is None:
                continue

            if type_tup != to_type:

                if to_type.isBase() and to_type.getBaseType() == "BOOL":
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
                        ErrorExporter.invalidAssignment(child.position, to_type, type_tup)
                    else:

                        ErrorExporter.invalidOperation(child.position, operator, to_type, type_tup)
                    continue

                if operator is not None:
                    if not self.compatible(type_tup, to_type, operator):
                        """
                        in case we have incompatible type
                        """
                        ErrorExporter.invalidOperation(child.position, operator, to_type, type_tup)
                        continue

                    if operator in ("==", "!=", "<=", ">=", "<", ">"):
                        ErrorExporter.IncompatibleComparison(child.position, to_type, type_tup)
                        self.addConversion(child, to_type.getPtrTuple())
                        continue

                    """
                    in case ptr+int, we don't need to convert the int,
                    only counts for operators not assignments
                    """
                    if to_type.getPtrAmount() > 0 and type_tup.isBase():
                        """
                        ptr+int, does not require to convert the int to an int*
                        """
                        continue

                self.pointer_warning_check(child.position, to_type, type_tup)
                if to_type.getBaseType() == "VOID" or type_tup.getBaseType() == "VOID":
                    ErrorExporter().incorrectVoidFuncUse(node.position)
                self.narrowing_warning_check(child.position, to_type, type_tup)

                self.addConversion(child, to_type.getPtrTuple())

        """
        equality operators give an integer back
        """

        if operator == "()":
            """
            In case we have a function call, we want to continue with the return type, for where it is used,
            not the function type itself
            """
            self.type_mapping[node] = to_type.return_type

        elif operator in ("==", "!=", "<=", ">=", "<", ">", "&&", "||", "!"):
            self.type_mapping[node] = SymbolType("BOOL", False)

        else:
            self.type_mapping[node] = to_type

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        """
        In Case we have an identifier we want to retrieve the type of symbol table entry corresponding
        to this identifier
        """
        if node.type == "IDENTIFIER":
            """
            if the identifier is a function call,
            we make sure that we use the function and not a variable with the same name
            """
            type_entry = None
            if node.getSiblingNeighbour(1) and node.getSiblingNeighbour(1).text == "()":
                current_table = node.getSymbolTable()
                while current_table.prev is not None:
                    type_entry = current_table.getEntry(node.text)
                    if type_entry:
                        type_object = type_entry.getTypeObject()
                        while isinstance(type_object, SymbolTypePtr):
                            type_object = type_object.pts_to
                        if isinstance(type_object, FunctionSymbolType):
                            break
                    current_table = current_table.prev
            else:
                type_entry = node.getSymbolTable().getEntry(node.text)

            type_object = type_entry.getTypeObject()

            """
            The identifier itself is just a reference to the object, so we add another extra SymbolPtrType
            """

            type_object = SymbolTypePtr(type_object, False)

            self.type_mapping[node] = type_object

        elif node.type in types:
            self.type_mapping[node] = SymbolType(node.type, False)
        elif node.text == "()":
            """
            Simulate a single dereference on the left side
            """
            left_sibling = node.getSiblingNeighbour(-1)
            left_type = self.type_mapping[left_sibling]
            self.type_mapping[left_sibling] = left_type.deReference()

    @staticmethod
    def replaceIdentifierWithIndex(node: ASTNode, struct_name: SymbolType):
        """
        Replace the data field identifier of a struct with a corresponding index
        :param node: Struct Node
        :param struct_name: name of the struct
        :return:
        """
        index_node = node.children[0].getSiblingNeighbour(1).getSiblingNeighbour(1)
        identifier = index_node.text

        union_assignment = False
        if node.structTable.isUnion(struct_name.getBaseType(), node.position):  # If we have a Union

            p = node
            while p.parent is not None and p.parent.text not in ("Code", "Function", "Assignment", "Block", "Scope"):
                p = p.parent
            union_assignment = p.parent.text == "Assignment" and p.parent.findChild(p) == 0

            index = node.structTable.getEntry(struct_name.getBaseType(), identifier, node.position)
            data_type_index = index
        else:
            index = node.structTable.getEntry(struct_name.getBaseType(), identifier, node.position)  # Replace the struct data member name with an index
            data_type_index = index

        index_node.text = index

        return data_type_index, union_assignment

    @staticmethod
    def calculateType(node: ASTNode):
        """
        provided node is a type node
        :param node:
        :return:
        """

        if node.text != "Type":
            raise Exception("wrong node type")

        data_type = None
        for child in node.children:
            if child.text.upper() in types:
                data_type = SymbolType(child.text.upper(), False)

            if child.text == "*":
                data_type = SymbolTypePtr(data_type, False)

        return data_type

    @staticmethod
    def compatible(type_tup: SymbolType, to_type: SymbolType, operator: str):
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
            ASTConversion.to_string_type(type_tup.getPtrTuple()), operator, ASTConversion.to_string_type(to_type.getPtrTuple())) in blocklist
        if ASTConversion.to_string_type(type_tup.getPtrTuple()) in incompatible_ops.keys():
            incompatible = incompatible or operator in incompatible_ops.get(ASTConversion.to_string_type(type_tup.getPtrTuple()))

        if ASTConversion.to_string_type(to_type.getPtrTuple()) in incompatible_ops.keys():
            incompatible = incompatible or operator in incompatible_ops.get(ASTConversion.to_string_type(to_type.getPtrTuple()))
        return not incompatible

    @staticmethod
    def compatible_2(type_tup: SymbolType, to_type: SymbolType, operator: str):
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

        if max(to_type.getPtrAmount(), type_tup.getPtrAmount()) != 0:
            ptr_less_type = to_type
            if type_tup.getPtrAmount() == 0:
                ptr_less_type = type_tup

            """
            check if 1 is a PTR and 1 is a FLOAT to say the operation is invalid
            Some operations like '&&' are still valid
            """
            if ptr_less_type.getBaseType() == "FLOAT" and ptr_less_type.getPtrAmount() == 0 and operator not in (
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
    def pointer_warning_check(position: Position, to_type: SymbolType, type_tup2: SymbolType):
        """
        when float* to int* convert we need to throw a warning
        This function will check for such situations and throw a warning accordingly
        :param position:
        :param to_type:
        :param type_tup2:
        :return:
        """

        """
        when no ptrs are in the file, this check does nothing
        """
        if max(to_type.getPtrAmount(), type_tup2.getPtrAmount()) == 0:
            return

        if to_type.getPtrAmount() != type_tup2.getPtrAmount() or to_type.getBaseType() != type_tup2.getBaseType():
            """
            when ptr amount is different or when type a ptr points to is different
            """

            """
            when comparison operator is given -> other error message
            """
            ErrorExporter.IncompatiblePtrTypesWarning(position, to_type, type_tup2)

            return

    def narrowing_warning_check(self, position: Position, to_tup: SymbolType, type_tup: SymbolType):
        """
        Give a warning when an implicit conversion narrows the type

        :param position:
        :param to_tup:
        :param type_tup:
        :return:
        """

        """
        ignore ptrs for this
        """
        if max(to_tup.getPtrAmount(), type_tup.getPtrAmount()) != 0:
            return

        if self.rc.get_poorest(to_tup.getBaseType(), type_tup.getBaseType()) == type_tup.getBaseType():
            return

        ErrorExporter.narrowingTypesWarning(position, to_tup, type_tup)

    @staticmethod
    def addConversion(node: ASTNode, to_type: tuple):
        """
        add a conversion to the provided type

        :param to_type:
        :param node:
        :return:
        """

        new_node = ASTNode("Conversion", node.parent, node.getSymbolTable(), node.position, node.structTable)
        type_node = ASTNode("Type", new_node, new_node.getSymbolTable(), node.position, node.structTable)
        new_node.addChildren(type_node)

        """
        add datatype
        """
        type_node.addChildren(
            ASTNodeTerminal(to_type[0][0], type_node, type_node.getSymbolTable(), "CASTING",
                            node.position, node.structTable))

        for t_child in to_type[1]:
            conversion_ptr = t_child[0]
            t_type = "CASTING"
            if t_child[0] != "*":
                conversion_ptr = "*"
                t_type = f"ARRAY_{t_child[0]}"

            type_node.addChildren(ASTNodeTerminal(conversion_ptr, type_node, type_node.getSymbolTable(), t_type,
                                  node.position, node.structTable))
        node.addNodeParent(new_node)
        return new_node

    @staticmethod
    def subtree_to_text(node: ASTNode):
        text = ""
        if isinstance(node, ASTNodeTerminal):

            text += node.text

        ass = node.parent.text == "Assignment" and node.text == "Dereference"
        if ass:
            text += "*("

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
    def format_type(format_type: SymbolType):
        type_text = ""
        while isinstance(format_type, SymbolTypePtr):

            const = ""
            if format_type.isConst():
                const = "const"

            type_text = f"*{const}" + type_text
            format_type = format_type.deReference()

        const = ""
        if format_type.isConst():
            const = "const"

        type_text = f"{const} {format_type.getBaseType()}" + type_text

        return type_text

    def get_function_type(self, node: ASTNode):
        """
        node needs to be a ParameterCalls Node
        """

        corresponding_function_type = self.type_mapping.get(node.parent.children[0])

        """
        Support for a(1), when 'a' is a function ptr, by adding an extra dereference
        """
        if isinstance(corresponding_function_type, SymbolTypePtr) and \
                isinstance(corresponding_function_type.pts_to, FunctionSymbolType):
            child = node.parent.children[0]

            deref = ASTNode("Dereference", child.parent, child.getSymbolTable(), node.position, node.structTable)
            child.addNodeParent(deref)
            self.visitNode(deref)
            corresponding_function_type = self.type_mapping.get(node.parent.children[0])

        if not isinstance(corresponding_function_type, FunctionSymbolType):
            print("he")
            ErrorExporter.functionCallNotFunction(node.position, self.subtree_to_text(node.parent.children[0]),
                                                  corresponding_function_type)

        return corresponding_function_type

    def handle_dereference(self, node: ASTNode, is_array):
        """
        This Function handles dereferences
        """

        data_type3 = None

        override = True

        """when we have a 'Dereference' node, the type after executing this node, will be 1 ptr less, than it was
                    before"""
        child = node.getChild(0)
        data_type: SymbolType = self.type_mapping[child]

        """
        We we do a [] access, we need to check that the value provided is an integer
        """

        is_struct = False
        if is_array:

            data_type2 = self.type_mapping[node.getChild(2)]

            if not data_type2.isBase() or data_type2.getType() != "INT":
                ErrorExporter.invalidArrayIndex(node.position, data_type2)

            """
            The array has by default 1 ptr, but it it is the only 1, the array is not really an array
            """
            if data_type.getPtrAmount() <= 1 and not isinstance(data_type.deReference(), SymbolTypeStruct):
                ErrorExporter.invalidDereferenceNotPtr(node.position, data_type, True)

            is_struct = self.is_struct(node)
            if is_struct:
                data_type3, override = self.handle_struct(node)

        """
        when trying to dereference a non-ptr, throw an error
        """
        if data_type.isBase():
            ErrorExporter.invalidDereferenceNotPtr(node.position, data_type)

        if isinstance(data_type,
                      SymbolTypeStruct):  # Can't further dereference; '.'/'[]' operator is used on the wrong type
            ErrorExporter.invalidOperation(node.position, '.', data_type, None)

        data_type = data_type.deReference()

        if override:
            self.type_mapping[node] = data_type
            if is_struct:
                self.type_mapping[node] = data_type3

    def is_struct(self, node: ASTNode):
        """
        Check if a node that will be dereferenced is a struct type
        """
        child = node.getChild(0)
        data_type = self.type_mapping[child]
        if isinstance(data_type, SymbolTypePtr) and isinstance(data_type.deReference(), SymbolTypeStruct):
            return True

        return False

    def handle_struct(self, node: ASTNode):
        override = True

        lchild = node.getChild(0)  # LHS of the '.' 'operator
        """
        Get the struct ptr type from the left child
        """
        struct_ptr_type = self.type_mapping[lchild]
        struct_type = struct_ptr_type.pts_to

        """
        Use the struct type to translate 'struct'.'value' -> struct[index]
        """
        data_type_index, union_assignment = self.replaceIdentifierWithIndex(node, struct_type)

        if union_assignment:
            """
            In case we have a union assignment
            """
            data_type = struct_type.getStoreType()
            node.getChild(2).text = 0

            store_data_type = struct_type.getElementType(data_type_index)

            self.type_mapping[node] = store_data_type
            override = False

        else:
            """
            In case we do not have a union assignment,we want to retrieve the value in his appropriate type
            """
            data_type = struct_type.getElementType(data_type_index)
            if isinstance(struct_type, SymbolTypeUnion):
                store_type = struct_type.getStoreType()

                """
                When we retrieve a type that doesn't match the store type, we will do a conversion so we end up 
                with reading the right type
                """
                if store_type != data_type:
                    self.addConversion(node, data_type.getPtrTuple())
                data_type = store_type

        if data_type.union:
            node.getChild(2).text = 0

        return data_type, override
