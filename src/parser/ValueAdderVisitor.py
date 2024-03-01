from src.parser.ASTVisitor import *
from src.parser.IdentifierReplacerVisitor import IdentifierReplacerVisitor
from src.parser.ConstantFoldingVisitor import ConstantFoldingVisitor
from src.parser.ErrorExporter import *


class ValueAdderVisitor(ASTVisitor):
    """
    AST visitor that adds identifier values to the symbol table
    """
    def __init__(self):
        pass

    def visitNode(self, node: ASTNode):
        if node.text == "Declaration":
            # there are 3 children: type, ident and value
            ident = node.getChild(1)
        elif node.text == "Assignment":
            # there are 2 children: identifier and value
            ident = node.getChild(0)
        else:
            # should also check for increment operations
            # basically check for every operation that changes an identifier value
            return

        val = node.getChild(-1)
        if val.text != "Expr":
            ST = ident.getSymbolTable()
            for entry in ST.symbols.values():
                if entry.name == ident.text:
                    entry.value = val.text
        else:
            # replace all the identifiers in the RHS with their symbol table value
            replacer = IdentifierReplacerVisitor()
            replacer.preorder(val)

            constantfolder = ConstantFoldingVisitor()
            constantfolder.postorder(val)

            val = node.getChild(-1)

            # after the constant folder is done, we have to revisit this node
            if val.text != "Expr":
                ST = ident.getSymbolTable()
                entry = ST.symbols[ident.text]
                entry.value = val.text

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            # if it is a variable and it is not the node where it is first declared -> update firstUsed if necessary
            entry = node.getSymbolTable().symbols[node.text]
            if node != entry.firstDeclared:
                entry.firstUsed = node
