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

        """
        Keep track of the struct names and their data fields
        """
        self.structTable = structTable

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
        is_struct = False
        data_type3 = None

        if is_array:  # TODO fix the statement
            child = node.getChild(0)
            data_type = self.type_mapping[child]
            if isinstance(data_type, SymbolTypePtr) and isinstance(data_type.deReference(), SymbolTypeStruct):
                is_struct = True

        if is_struct:  # TODO Need a way to pass the type to the node above
            lchild = node.getChild(0)  # LHS of the '.' 'operator

            """
            Get the struct ptr type from the left child
            """
            struct_ptr_type = self.type_mapping[lchild]
            struct_type = struct_ptr_type.pts_to

            """
            Use the struct type to translate 'struct'.'value' -> struct[index]
            """
            self.replaceIdentifierWithIndex(node, struct_type)
            index = int(node.getChild(2).text)  # Index of the struct data member

            data_type = struct_type.getElementType(index)
            data_type3 = data_type

        if node.text == "Dereference" or is_array:

            """when we have a 'Dereference' node, the type after executing this node, will be 1 ptr less, than it was 
            before"""
            child = node.getChild(0)
            data_type: SymbolType = self.type_mapping[child]
            """
            We we do a [] access, we need to check that the value provided is an integer
            """
            if is_array:
                data_type2 = self.type_mapping[node.getChild(2)]

                if not data_type2.isBase() or data_type2.getType() != "INT":
                    ErrorExporter.invalidArrayIndex(node.linenr, data_type2)

                """
                The array has by default 1 ptr, but it it is the only 1, the array is not really an array
                """

                if data_type.getPtrAmount() <= 1 and not isinstance(data_type.deReference(), SymbolTypeStruct):
                    ErrorExporter.invalidDereferenceNotPtr(node.linenr, data_type, True)
            """
            when trying to dereference a non-ptr, throw an error
            """

            if data_type.isBase():
                ErrorExporter.invalidDereferenceNotPtr(node.linenr, data_type)

            data_type = data_type.deReference()

            self.type_mapping[node] = data_type
            if is_struct:
                self.type_mapping[node] = data_type3  # TODO Does this maybe need a dereference too?
            return

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
        if node.text not in ("Literal", "Expr", "Declaration", "Assignment", "ParameterCall", "FunctionCall", "Return"):

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

                        ErrorExporter.invalidOperation(node.linenr, operator, to_type, check_type)

                """
                for the non-first type, we will take the richest type
                """
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

        """for declaration and assignment the type is the type of the value that is declared/assigned (and not the 
        necessarily the poorest type)"""
        if node.text == "FunctionCall":
            functionNode = node.children[0]
            while functionNode.text == "Dereference":
                functionNode = functionNode.children[0]

            function_type = node.parent.getSymbolTable().getEntry(functionNode.text).getTypeObject()

            if not isinstance(function_type, FunctionSymbolType):
                raise Exception("Function symbol type required")

            self.type_mapping[node] = function_type.return_type
            return

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

                const_assign = to_type.isConst()

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
            to_type = parameterTypes[node.parent.findChild(node) - 1]
            """
            make sure assignment doesn't convert to a ptr less
            """
        if operator in ("&&", "||"):
            """
            logical operators expect booleans so we convert the given entry into a boolean
            """
            to_type = SymbolType("BOOL", False)

        if node.text == "Return":
            function = findfunction(node)
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

                self.pointer_warning_check(child.linenr, to_type, type_tup)
                self.narrowing_warning_check(child.linenr, to_type, type_tup)

                self.addConversion(child, to_type.getPtrTuple())

        """
        equality operators give an integer back
        """
        if operator in ("==", "!=", "<=", ">=", "<", ">", "&&", "||", "!"):
            self.type_mapping[node] = SymbolType("BOOL", False)

        else:
            self.type_mapping[node] = to_type

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        """
        In Case we have an identifier we want to retrieve the type of symbol table entry corresponding
        to this identifier
        """
        if node.type == "IDENTIFIER":
            type_entry = node.getSymbolTable().getEntry(node.text)
            type_object = type_entry.getTypeObject()

            """
            The identifier itself is just a reference to the object, so we add another extra SymbolPtrType
            """

            type_object = SymbolTypePtr(type_object, False)

            self.type_mapping[node] = type_object

        elif node.type in types:
            self.type_mapping[node] = SymbolType(node.type, False)

    def replaceIdentifierWithIndex(self, oldGuy, struct_name: SymbolType):
        """
        Replace the data field identifier of a struct with a corresponding index
        :param oldGuy: Struct Node
        :param struct_name: name of the struct
        :return:
        """
        index_node = oldGuy.children[0].getSiblingNeighbour(1).getSiblingNeighbour(1)
        identifier = index_node.text

        index = self.structTable[struct_name.getBaseType()].index(identifier)  # Replace the struct data member name with an index
        index_node.text = index

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
    def pointer_warning_check(line_nr: int, to_type: SymbolType, type_tup2: SymbolType):
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
        if max(to_type.getPtrAmount(), type_tup2.getPtrAmount()) == 0:
            return

        if to_type.getPtrAmount() != type_tup2.getPtrAmount() or to_type.getBaseType() != type_tup2.getBaseType():
            """
            when ptr amount is different or when type a ptr points to is different
            """

            """
            when comparison operator is given -> other error message
            """
            ErrorExporter.IncompatiblePtrTypesWarning(line_nr, to_type, type_tup2)

            return

    def narrowing_warning_check(self, line_nr: int, to_tup: SymbolType, type_tup: SymbolType):
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
        if max(to_tup.getPtrAmount(), type_tup.getPtrAmount()) != 0:
            return

        if self.rc.get_poorest(to_tup.getBaseType(), type_tup.getBaseType()) == type_tup.getBaseType():
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
