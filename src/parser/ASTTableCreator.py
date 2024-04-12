from src.parser.Tables.SymbolTable import *


class ASTTableCreator(ASTVisitor):
    """
    Traverses through the three and creates the symbol table
    """
    def visit(self, ast: AST):
        self.postorder(ast.root)

    def visitNode(self, node: ASTNode):
        if node.text == "Declaration" or node.text == "Parameter":
            child = node.findType("Type")
            is_const = False
            latest_datatype = None

            for grandchild in child.children:
                if grandchild.text == "const":

                    """
                    in case *const, the const is after, but it still needs to be applied
                    """
                    if latest_datatype is not None:
                        latest_datatype.const = True

                    is_const = True
                elif grandchild.text == "*":
                    is_const = False
                    latest_datatype = SymbolTypePtr(latest_datatype, is_const)
                else:
                    if not ASTTypedefReplacer.isBaseType(grandchild):
                        latest_datatype = SymbolType(grandchild.text, is_const)  # Keep the typedef name
                    else:
                        latest_datatype = SymbolType(grandchild.text.upper(), is_const)

            """
            the value in the symbol table is initially empty
            """
            symbol_entry = SymbolEntry(latest_datatype, node.children[1].text, None, node.children[1], None)
            node.symbol_table.add(symbol_entry)
        if node.text == "Function":
            child = node.findType("Type")
            is_const = False
            param_types = []
            latest_datatype = None

            for param in node.children[2].children:
                if param.children[0].children[0].text != "const":
                    param_types.append(param.children[0].children[0].text)
                else:
                    param_types.append(param.children[0].children[1].text)
            for grandchild in child.children:
                if grandchild.text == "const":

                    """
                    in case *const, the const is after, but it still needs to be applied
                    """
                    if latest_datatype is not None:
                        latest_datatype.const = True

                    is_const = True
                elif grandchild.text == "*":
                    is_const = False
                    latest_datatype = SymbolTypePtr(latest_datatype, is_const)
                else:
                    if not ASTTypedefReplacer.isBaseType(grandchild):
                        latest_datatype = FunctionSymbolType(grandchild.text, is_const, param_types)  # Keep the typedef name
                    else:
                        latest_datatype = FunctionSymbolType(grandchild.text.upper(), is_const, param_types)

            """
            the value in the symbol table is initially empty
            """
            symbol_entry = SymbolEntry(latest_datatype, node.children[1].text, None, node.children[1], None)
            node.symbol_table.add(symbol_entry)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
