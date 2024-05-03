from src.parser.ErrorExporter import *
from src.parser.ASTVisitor import *
from src.parser.SwitchConverter import SwitchConverter
import copy


class ArrayCleaner(ASTVisitor):
    """
    This class will check if their exists an array node for a declaration ex: int a[5], and translate it
    to a type in ex: -> int* a, we will still need to take into account, how much memory we need to allocate
    We do this by making the type look like the following
    Type -> subtrees: 'int', ('*', with type: ARRAY_5 (size), to encode our array size)
    """

    def __init__(self):
        self.to_remove = set()

        """
        Map to keep into account which declarations and assignments use an array, to use this information
        for the initialization list. The keys of these mappings are declaration nodes and the values arrays of 
        the indexes
        """
        self.array_map = {}

    def visit(self, ast: AST):
        self.to_remove = set()
        self.array_map = {}

        self.preorder(ast.root)
        for n in self.to_remove:
            n.parent.removeChild(n)

    def visitNode(self, node: ASTNode):
        self.__check_declaration(node)
        self.__check_access(node)
        self.__check_init_list(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def __check_declaration(self, node: ASTNode):
        """
        When we come across a declaration, we want to change the [5] to a * on the type
        If an array part exist, it will be found on child index 2
        """

        """
        Check if node is a declaration
        """
        if node.text not in ("Declaration", "Parameter"):
            return

        """
        Check if the declaration has enough children
        """
        if node.getChildAmount() < 3:
            return

        """
        check if the child index 2 is a terminal with type array
        """
        if node.getChild(2).text != "ARRAY":
            return

        type_node = node.getChild(0)

        array_sizes = self.array_size(node.getChild(2), True)

        self.array_map[node] = array_sizes

        for i, new_ptr_val in enumerate(reversed(array_sizes)):
            if i == 0 and node.text == "Parameter":
                data_type = "PTR"
            else:
                data_type = f"ARRAY_{new_ptr_val}"

            new_ptr = ASTNodeTerminal("*", type_node.parent, type_node.getSymbolTable(), data_type,
                                      type_node.position, type_node.structTable)
            type_node.addChildren(new_ptr)

        self.to_remove.add(node.getChild(2))

    def __check_access(self, node: ASTNode):
        """
        This function will check if we have array access

        The original array format would be node 1: 'x', node 2: '[1][3],...'
        We will change it to an operation with operator '[]'
        """
        if node.getChildAmount() < 2:
            return

        if node.getChild(1).text != "ARRAY":
            return

        array_node = node.getChild(1)
        """
        In case the assignment is an array access, we need to do the following
        
        assume we have x[1] = 5;
        
        we will translate the left hand side so the resulting expression is *(x+1) = 5
        """

        left_child = node.getChild(0)
        left_child.parent.removeChild(left_child)
        left_child.parent = None

        for new_ptr_val in array_node.children:
            """
            Create a new parent: 'Expr', with children left hand side the identifier and right hand side the + index
            """
            access_expr_node = ASTNode("Expr", None, node.getSymbolTable(), node.position, node.structTable)

            access_expr_node.addChildren(left_child)
            left_child.parent = access_expr_node

            access_expr_node.addChildren(ASTNodeTerminal("[]", access_expr_node, node.getSymbolTable(), "", node.position, node.structTable))

            access_expr_node.addChildren(new_ptr_val)
            new_ptr_val.parent = access_expr_node

            left_child = access_expr_node

        node.insertChild(0, left_child)

        self.to_remove.add(node.getChild(1))

        """
        Remove redundant literal node
        """
        if node.text == "Literal":
            """
            remove the literal node by replacing the literal node in the parent with the first literal child
            """
            node.parent.replaceChild(node, node.getChild(0))

    @staticmethod
    def array_size(array_node: ASTNode, check_int: bool = False):
        array_sizes = []
        for child in array_node.children:

            if check_int:
                if not isinstance(child, ASTNodeTerminal):
                    ErrorExporter.invalidArraySize(array_node.position, array_node.parent.getChild(1).text,
                                                   (("Expression", False), []))
                if child.type != "INT":
                    ErrorExporter.invalidArraySize(array_node.position, array_node.parent.getChild(1).text,
                                                   ((child.type, False), []))

            array_sizes.append(child.text)

        return array_sizes

    def __check_init_list(self, node: ASTNode):
        if node.text != "InitList":
            return

        if node.parent.text == "InitList":
            return

        """
        We check if the initialize list is a valid list. This means that this list only exists for declarations
        of arrays.
        """

        if node.parent not in self.array_map:
            ErrorExporter.lostInitializerList(node.position)
            return

        array_sizes = self.array_map.get(node.parent)

        """
        Check if the size and format of the initialization list matches the size of the array.
        During this loop we will also map a virtual grid (same size as the array) to each of the initial value node
        """
        current_check_nodes = [([], node)]

        """
        In this list all the values of the init list will be put using a tuple indicating its position
        """
        value_list = []

        declared_variable = node.parent.getChild(1).text

        for i, array_size in enumerate(array_sizes):
            last_dimension = i == len(array_sizes)-1
            new_current_nodes = []
            """
            Convert size in string to int
            """
            size = int(array_size)
            for current_node_tup in current_check_nodes:
                node_index, current_node = current_node_tup
                if size != current_node.getChildAmount():
                    ErrorExporter.wrongInitializationListSize(node.position, declared_variable)

                """
                Add the children to the next current node check
                """
                if last_dimension:
                    """
                    When we have the last dimension, we will constantly be checking the values,
                    so we store these values in a list for better access later on
                    """
                    for j, c in enumerate(current_node.children):
                        value_list.append((node_index+[j], c))
                else:
                    for j, c in enumerate(current_node.children):
                        if c.text != "InitList":
                            ErrorExporter.wrongInitializationListFormat(node.position, declared_variable)

                        new_current_nodes.append((node_index+[j], c))

            current_check_nodes = new_current_nodes

        """
        We will convert the data from our initialization list into assignments
        """

        code_node: ASTNode = node.parent.parent

        """
        for each value we will create an assignment to its corresponding position on the array,
        each value in value_list is a tuple starting with the assignment index part followed by the corresponding node
        """

        type_node2 = node.parent.getChild(0)


        for indexing, v in value_list:

            type_node3 = SwitchConverter.createCopy(type_node2)
            type_node3.addChildren(ASTNodeTerminal("*", type_node3, node.parent.getSymbolTable(), "Not used", node.parent.position,
                                      node.parent.structTable))

            to_remove = set()
            for i, t in enumerate(type_node3.children):
                if t.text == "const":
                    print("hwdw", t.text)
                    to_remove.add(t)

            for r in to_remove:
                type_node3.removeChild(r)

            assignment_node = ASTNode("Assignment", code_node, node.parent.getSymbolTable(), node.parent.position,
                                      node.parent.structTable)

            assign_to = assignment_node
            if len(to_remove) > 0:
                conversion = ASTNode("Conversion", assignment_node, node.parent.getSymbolTable(), node.parent.position,
                                     node.parent.structTable)

                assignment_node.addChildren(conversion)

                conversion.addChildren(type_node3)
                type_node3.parent = conversion
                assign_to = conversion

            var_node = ASTNodeTerminal(declared_variable, assign_to, assignment_node.getSymbolTable(),
                                       "IDENTIFIER", assignment_node.position, assignment_node.structTable)

            assign_to.addChildren(var_node)

            array_node = ASTNode("ARRAY", assignment_node, assignment_node.getSymbolTable(),
                                 assignment_node.position, assignment_node.structTable)

            assignment_node.addChildren(array_node)

            """
            Add each array index entry to the ARRAY subtree
            """
            for index in indexing:
                index_node = ASTNodeTerminal(index, array_node, assignment_node.getSymbolTable(),
                                             "INT", assignment_node.position, assignment_node.structTable)

                array_node.addChildren(index_node)

            """
            Add value sub tree as assignment
            """
            assignment_node.addChildren(v)
            v.parent = assignment_node

            """
            Add the assignment as a line of code right after the declaration
            """
            code_node.insertChild(code_node.findChild(node.parent) + 1, assignment_node)

            """
            Do the cleanup of this visitor for assignments
            """
            self.visitNode(assignment_node)

        """
        remove the initialization list from the tree
        """
        self.to_remove.add(node)
