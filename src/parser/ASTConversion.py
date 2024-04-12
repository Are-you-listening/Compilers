from src.parser.CTypes.COperationHandler import *
from src.parser.Tables.SymbolTable import *


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

        if node.text == "Dereference":
            """when we have a 'Dereference' node, the type after executing this node, will be 1 ptr less, than it was 
            before"""
            child = node.getChild(0)
            data_type, ptrs = self.type_mapping[child]

            """
            when trying to dereference a non-ptr, throw an error
            """
            if len(ptrs) == 0:
                ErrorExporter.invalidDereferenceNotPtr(node.linenr, (data_type, ptrs))

            ptrs = ptrs[:-1]  # Remove 1 ptr
            self.type_mapping[node] = (data_type, ptrs)
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

        if node.text not in ("Literal", "Expr", "Declaration", "Assignment"):
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
                        ErrorExporter.invalidOperation(node.linenr, operator, self.to_string_type(to_type),
                                                       self.to_string_type(check_type))

                """
                for the non-first type, we will take the richest type
                """
                richest_native_type = self.rc.get_richest(to_type[0], check_type[0])

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

        if operator in ("&&", "||"):
            """
            logical operators expect booleans so we convert the given entry into a boolean
            """
            to_type = ("BOOL", "")

        """
        add implicit conversions as explicit
        """
        for child in node.children:
            type_tup = self.type_mapping.get(child, (None, None))
            if type_tup == (None, None):
                continue

            if type_tup != to_type:
                if to_type == ("BOOL", ""):
                    """
                    logical operators expect booleans so we convert the given entry into a boolean
                    """
                    self.addConversion(child, ("BOOL", ""))

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
                        ErrorExporter.invalidAssignment(child.linenr, self.to_string_type(to_type),
                                                        self.to_string_type(type_tup))
                    else:
                        ErrorExporter.invalidOperation(child.linenr, operator, self.to_string_type(to_type),
                                                       self.to_string_type(type_tup))
                    continue

                if operator is not None:
                    if not self.compatible(type_tup, to_type, operator):
                        """
                        in case we have incompatible type
                        """
                        ErrorExporter.invalidOperation(child.linenr, operator, self.to_string_type(to_type),
                                                       self.to_string_type(type_tup))
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

                self.pointer_warning_check(child.linenr, to_type, type_tup)
                self.narrowing_warning_check(child.linenr, to_type, type_tup)

                self.addConversion(child, to_type)

        """
        equality operators give an integer back
        """
        if operator in ("==", "!=", "<=", ">=", "<", ">", "&&", "||", "!"):
            self.type_mapping[node] = ("BOOL", "")
        else:
            self.type_mapping[node] = to_type

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            type_entry = node.getSymbolTable().getEntry(node.text)
            data_type, ptrs = type_entry.getPtrTuple()

            """
            Use LLVM ptr format
            """
            ptrs += "*"

            self.type_mapping[node] = (data_type, ptrs)

        elif node.type in types:
            self.type_mapping[node] = (node.type, '')

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
        ptrs = ""
        for child in node.children:
            if child.text.upper() in types:
                data_type = child.text.upper()

            if child.text == "*":
                ptrs += "*"

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
            if ptr_less_type[0] == "FLOAT" and len(ptr_less_type[1]) == 0 and operator not in (
                    "==", "<=", ">=", "<", ">", "!=", "&&", "||"):
                incompatible = True

        return not incompatible

    @staticmethod
    def to_string_type(type_tup):
        if type_tup[1] == "":
            return type_tup[0]

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

        if len(to_type[1]) != len(type_tup2[1]) or to_type[0] != type_tup2[0]:
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

        if self.rc.get_poorest(to_tup[0], type_tup[0]) == type_tup[0]:
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
            ASTNodeTerminal(to_type[0], type_node, type_node.getSymbolTable(), "Not Used",
                            None, None))

        for t_child in to_type[1].split():
            type_node.addChildren(
                ASTNodeTerminal(t_child, type_node, type_node.getSymbolTable(), "Not Used",
                                None, None))
        node.addNodeParent(new_node)
