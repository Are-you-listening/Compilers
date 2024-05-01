from src.parser.Constraints.Constraint import *
from src.parser.ErrorExporter import *


class UndeclaredConstrained(Constraint):
    """
    Checks for undeclared variables
    """

    def __init__(self):
        super().__init__()
        self.rejected = False

    def checkTerminalNode(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            entry = node.symbol_table.getEntry(node.text)

            if entry is None or entry.firstDeclared.position.virtual_linenr > node.position.virtual_linenr:
                # still need to check if the var is not declared in a previous scope
                current_table = node.getSymbolTable().prev
                while current_table is not None:
                    current_entry = current_table.getEntry(node.text)
                    if current_entry is not None and current_entry.firstDeclared.position.virtual_linenr <= node.position.virtual_linenr:
                        return
                    current_table = current_table.prev

                self.rejected = True
                self.errorNode = node
                self.throwException()

    def checkNode(self, node: ASTNode):
        if node.text == "Assignment":
            self.checkViableAssignment(node)
        elif node.text == "Declaration":
            if len(node.children) >= 2:
                if not self.viableDeclaration(node.children[0], [node.children[1]]):
                    table = node.getSymbolTable().prev
                    if table is not None and table.getEntry(node.children[0].text) is not None:  # Declaration in a previous scope of the same name is allowed e.g. int True = True + 1 in which True is a variable name from a higher scope
                        return
                    self.errorNode = node.children[0]
                    self.rejected = True
                    self.throwException()

    def throwException(self):
        if self.errorNode is None:
            return
        ErrorExporter.undeclaredVariable(self.errorNode.text, self.errorNode.position)

    def checkViableAssignment(self, node):
        for child in node.children:
            if child.text == "Dereference":  # Go deeper
                self.checkViableAssignment(child)
            elif isinstance(child, ASTNodeTerminal):
                if child.type == "IDENTIFIER":
                    self.checkTerminalNode(child)
            else:
                self.checkViableAssignment(child)

    def viableDeclaration(self, identifier: ASTNode, children: list):
        """
        Checks if a given identifier is not used in its children, e.g. int z = z is not viable!
        :param identifier:
        :param children:
        :return:
        """
        for child in children:
            if child.text == identifier.text:
                lsib = child.getSiblingNeighbour(-1)
                if lsib is not None and lsib.text == '[]':  # Upon struct data member access, the data member name is structName.data-member, so not redeclared upon data member
                    return True
                return False
            return self.viableDeclaration(identifier, child.children)
        return True
