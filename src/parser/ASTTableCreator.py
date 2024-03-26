from src.parser.ASTVisitor import *
from src.parser.Tables.SymbolTable import *


class ASTTableCreator(ASTVisitor):
    """
    Traverses through the three and creates the symbol table
    """

    def __init__(self, ast: AST):
        super().__init__(ast)

    def visit(self):
        root = self.ast.root
        self.postorder(root)

    def visitNode(self, node: ASTNode):
        if node.text == "Declaration" or node.text == "Function":
            child = node.findType("Type")
            is_const = False
            latest_datatype = ""

            for grandchild in child.children:
                if grandchild.text == "const":
                    is_const = True
                elif grandchild.text == "*":
                    latest_datatype = SymbolTypePtr(latest_datatype)
                else:
                    if not ASTTypedefReplacer.isBaseType(grandchild):
                        latest_datatype = SymbolType(grandchild.text)  # Keep the typedef name
                    else:
                        latest_datatype = SymbolType(grandchild.text.upper())

            """
            the value in the symbol table is initially empty
            """
            symbol_entry = SymbolEntry(node.text, latest_datatype, node.children[1].text, is_const, None,
                                       node,
                                       None)
            node.symbol_table.add(symbol_entry)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
