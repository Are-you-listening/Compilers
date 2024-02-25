from src.parser.ASTVisitor import *

class ValueAdderVisitor(ASTVisitor):
    def __init__(self):
        pass

    def visitNode(self, node: ASTNode):
        if node.text == "Declaration":
            equal_node = node.findType('=')
            if equal_node is not None:
                ident = node.getChild(1)
                val = node.getChild(3)

                """" because of constant folding, val will be a terminal node with the value of the identifier
                 if val is and 'Expr' node this means that an identifier is used in the RHS
                 So we replace the identifier with it's Symbol Table value and redo constant folding"""

                if val.text != "Expr":
                    ST = ident.getSymbolTable()
                    for entry in ST.symbols:
                        if entry.name == ident.text:
                            entry.value = val.text


    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass


