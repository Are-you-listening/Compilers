from src.parser.ASTVisitor import *
from src.parser.IdentifierReplacerVisitor import IdentifierReplacerVisitor
from src.parser.ConstantFoldingVisitor import ConstantFoldingVisitor
from src.parser.ErrorExporter import *


class ValueAdderVisitor(ASTVisitor):
    """
    AST visitor that adds identifier values to the symbol table
    """
    def __init__(self, lexer):
        self.lexer = lexer

    def visitNode(self, node: ASTNode):
        if node.text == "Declaration" or node.text == "Assignment":
            equal_node = node.findType('=')
            if equal_node is not None:

                counter = 0
                for child in node.children:
                    if child.text == "=":
                        break
                    counter += 1

                ident = node.getChild(counter - 1)
                val = node.getChild(counter + 1)

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
                    replacer = IdentifierReplacerVisitor(self.lexer)
                    replacer.preorder(val)

                    constantfolder = ConstantFoldingVisitor(self.lexer)
                    constantfolder.postorder(val)

                    # after the constant folder is done, we have to revisit this node
                    if val.text == "Expr":
                        ErrorExporter.invalidRvalue(ident.text)
                    else:
                        for entry in ident.getSymbolTable().symbols:
                            if entry.name == ident.text:
                                entry.value = val.text

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass


