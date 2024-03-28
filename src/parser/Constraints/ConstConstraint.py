from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class ConstConstraint(Constraint):
    """
    Verifies the integrity of the const variables
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkNode(self, node: ASTNode):
        """
        We check that we don't do an assignment to a const value
        :param node:
        :return:
        """

        """
        check if we have an assignment
        """
        if node.text == "Assignment":

            deref_counter = 0
            assign_child = node.getChild(0)

            """
            the not isinstance(assign_child, ASTNodeTerminal) is to support a terminal called 'Dereference'
            """
            while assign_child.text == "Dereference" and not isinstance(assign_child, ASTNodeTerminal):
                assign_child = assign_child.getChild(0)
                deref_counter += 1

            entry = node.symbol_table.getEntry(assign_child.text)
            data_type, ptrs, const_list = entry.getJsonDataType()

            """
            When a LHS var has too many dereferences, we should throw an error, 
            this error will be thrown by ASTConversion
            And has nothing to do with this check, so If we come across such a thing ignore it here
            """
            if deref_counter >= len(const_list):
                return

            is_const = const_list[-deref_counter-1]

            if is_const:
                ErrorExporter.constComplaint(node.linenr, ("*"*deref_counter)+assign_child.text, assign_child.text,
                                             entry.getTypeObject().getStringType())

    def checkTerminalNode(self, node: ASTNodeTerminal):
        pass

    def throwException(self):
        pass
