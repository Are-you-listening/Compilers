from src.parser.ASTVisitor import *
from src.parser.ConstantFoldingVisitor import ConstantFoldingVisitor
from src.parser.IdentifierReplacerVisitor import IdentifierReplacerVisitor
from src.parser.CTypes.COperationHandler import *


class ValueAdderVisitor(ASTVisitor):
    """
    AST visitor that adds identifier values to the symbol table
    """
    def __init__(self):
        pass

    def visitNode(self, node: ASTNode):
        if node.text in ("Declaration", "Assignment"):
            # there are 2 children: identifier and value
            ident = node.getChild(0)
        else:
            return

        if ident.text == "Dereference":
            return

        val = node.getChild(-1)
        entry = ident.getSymbolTable().symbols[ident.text]
        entry.value = val
        # If the left side has a dereference this means that it is a pointer,
        # so we only do replacements on the left side and don't change anything in the symbol table
        if (val.text not in ("Expr", "Dereference", "Conversion")) and (ident.text != "Dereference"):

            convertDict = dict(INT=CFunctionExecuterInt(), FLOAT=CFunctionExecuterFloat(), CHAR=CFunctionExecuterChar())

            if val.type in convertDict.keys() and entry.typeObject in convertDict:
                converter = convertDict[val.type]
                ST = node.getSymbolTable().getEntry(ident.text)
                newVal = converter.convertTo(val.text, ST.typeObject.data_type)
                val.text = newVal

            entry.value = val

        else:
            # replace all the identifiers in the RHS with their symbol table value
            replacer = IdentifierReplacerVisitor()
            replacer.preorder(val)

            # it is possible that some identifiers have been replaced with their values,
            # so we retry the constant folding and see if we are able to get a single value out of it
            constantFolder = ConstantFoldingVisitor()
            constantFolder.postorder(val)

            val = node.getChild(-1)
            entry.value = val

            # check if the constant folder was able to do something
            # if the value node contains "expr" then there is still something on the RHS that we couldn't replace
            """
            if (val.text not in ("Expr", "Dereference")) and (ident.text != "Dereference"):
                ST = ident.getSymbolTable()
                entry = ST.symbols[ident.text]
"""
    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.type == "IDENTIFIER":
            # if it is a variable, and it is not the node where it is first declared -> update firstUsed if necessary
            entry = node.getSymbolTable().getEntry(node.text)
            if node != entry.firstDeclared:
                entry.firstUsed = node
