from src.parser.Tables.SymbolTable import *


class ASTTableCreator(ASTVisitor):
    """
    Traverses through the three and creates the symbol table
    """
    def visit(self, ast: AST):
        self.postorder(ast.root)

    def visitNode(self, node: ASTNode):
        if node.text == "Declaration" or node.text == "Function":
            child = node.findType("Type")
            is_const = False
            latest_datatype = ""

            for grandchild in child.children:
                if grandchild.text == "const":
                    is_const = True
                elif grandchild.text == "*":
                    latest_datatype = SymbolTypePtr(latest_datatype, is_const)
                else:
                    if not ASTTypedefReplacer.isBaseType(grandchild):
                        latest_datatype = SymbolType(grandchild.text, is_const)  # Keep the typedef name
                    else:
                        latest_datatype = SymbolType(grandchild.text.upper(), is_const)

            """
            the value in the symbol table is initially empty
            """
            symbol_entry = SymbolEntry(node.text, latest_datatype, node.children[1].text, None, node.children[1], None)
            node.symbol_table.add(symbol_entry)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
