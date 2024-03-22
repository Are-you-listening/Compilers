from src.parser.ASTVisitor import *
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
        :param ast:
        :return:
        """
        root = ast.root
        self.postorder(root)

    def visitNode(self, node: ASTNode):
        """
        Visit AST Nodes and give it a type, if the type changes implicit, add conversion nodes
        :param node: the node we are currently checking
        :return:
        """

        if node.text == "Dereference":
            """
            when we have a 'Dereference' node, the type after executing this node, will be 1 ptr less, than it was before
            """
            child = node.getChild(0)
            data_type, ptrs = self.type_mapping[child]
            ptrs = ptrs[:-1]  # Remove 1 ptr
            self.type_mapping[node] = (data_type, ptrs)
            return

        if node.text == "Conversion":
            """
            When we have a conversion node, the new type will be the type defined in the conversion
            """
            type_value = node.getChild(0)
            data_type, ptrs = self.calculateType(type_value)
            self.type_mapping[node] = (data_type, ptrs)
            return

        if node.text not in ("Literal", "Expr", "Declaration", "Assignment"):
            """
            For our conversion we are only interested in Nodes that have a type, things like comments are useless to check
            """
            return

        """
        now we are going to decide which type we should convert to if we do not yet have that type
        """
        to_type: tuple = (None, None)

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
                    operator = child.getSiblingNeighbour(-1).text
                    ErrorExporter.invalidOperation(node.linenr, operator, self.to_string_type(to_type),
                                                   self.to_string_type(check_type))

                """
                for the non-first type, we will take the richest type
                """
                richest_native_type = self.rc.get_richest(to_type[0], check_type[0])
                to_type = (richest_native_type, to_type[1])

        """
        Verify if the operators are allowed | Semantic Analyse
        """

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

        """
        add implicit conversions as explicit
        """
        for child in node.children:
            type_tup = self.type_mapping.get(child, (None, None))
            if type_tup == (None, None):
                continue

            if type_tup != to_type:

                self.pointer_warning_check(node.linenr, to_type, type_tup)

                operator = self.get_sibling_operator(child)
                if operator is not None and not self.compatible(type_tup, to_type, operator):
                    """
                    in case we have incompatible type
                    """
                    ErrorExporter.invalidOperation(node.linenr, operator, self.to_string_type(to_type),
                                                   self.to_string_type(type_tup))

                new_node = ASTNode("Conversion", node, child.getSymbolTable())
                type_node = ASTNode("Type", new_node, new_node.getSymbolTable())
                new_node.addChildren(type_node)

                """
                add datatype
                """
                type_node.addChildren(
                    ASTNodeTerminal(to_type[0], type_node, type_node.getSymbolTable(), "Not Used",
                                    None))

                for t_child in to_type[1].split():
                    type_node.addChildren(
                        ASTNodeTerminal(t_child, type_node, type_node.getSymbolTable(), "Not Used",
                                        None))
                child.addNodeParent(new_node)

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
        incompatible = incompatible or (ASTConversion.to_string_type(type_tup), operator, ASTConversion.to_string_type(to_type)) in blocklist
        if ASTConversion.to_string_type(type_tup) in incompatible_ops.keys():
            incompatible = incompatible or operator in incompatible_ops.get(ASTConversion.to_string_type(type_tup))

        if ASTConversion.to_string_type(to_type) in incompatible_ops.keys():
            incompatible = incompatible or operator in incompatible_ops.get(ASTConversion.to_string_type(to_type))

        type_set = {ASTConversion.to_string_type(type_tup), ASTConversion.to_string_type(to_type)}

        if "FLOAT" in type_set and "PTR" in type_set:
            incompatible = True

        return not incompatible


    @staticmethod
    def to_string_type(type_tup):
        if type_tup[1] == "":
            return type_tup[0]

        return "PTR"

    @staticmethod
    def get_sibling_operator(node: ASTNode):
        if node.parent.getChildAmount() != 3:
            return None

        if node.parent.findChild(node) == 0:
            """
            if left operator
            """
            return node.getSiblingNeighbour(1).text
        elif node.parent.findChild(node) == 2:
            """
            if right operator
            """
            return node.getSiblingNeighbour(-1).text

        return None

    @staticmethod
    def pointer_warning_check(line_nr: int, type_tup1: tuple, type_tup2: tuple):
        """
        when float* to int* convert we need to throw a warning
        This function will check for such situations and throw a warning accordingly
        :param line_nr:
        :param type_tup1:
        :param type_tup2:
        :return:
        """

        """
        when no ptrs are in the file, this check does nothing
        """
        if max(len(type_tup1[1]), len(type_tup2[1])) == 0:
            return

        if len(type_tup1[1]) != len(type_tup2[1]):
            """
            when ptr amount is different
            """
            ErrorExporter.IncompatiblePtrTypesWarning(line_nr, type_tup1, type_tup2)
            return

        if type_tup1[0] != type_tup2[0]:
            """
            when type a ptr points to is different
            """
            ErrorExporter.IncompatiblePtrTypesWarning(line_nr, type_tup1, type_tup2)
            return
