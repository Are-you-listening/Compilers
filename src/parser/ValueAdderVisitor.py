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
            val = node.getChild(2)
        elif node.text == "Assignment":
            # there are 2 children: identifier and value
            ident = node.getChild(0)
            val = node.getChild(1)
        else:
            # should also check for increment operations
            # basically check for every operation that changes an identifier value
            return

        """" because of constant folding, val will be a terminal node with the value of the identifier
         if val is and 'Expr' node this means that an identifier is used in the RHS
         So we replace the identifier with it's Symbol Table value and redo constant folding"""

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

            # after the constant folder is done, we have to revisit this node
            if val.text != "Expr":
                ST = ident.getSymbolTable()
                for entry in ST.symbols.values():
                    if entry.name == ident.text:
                        entry.value = val.text

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass


