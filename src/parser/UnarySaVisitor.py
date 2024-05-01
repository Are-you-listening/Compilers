from src.parser.ASTTableCreator import *


class UnarySaVisitor(ASTVisitor):
    def visitNode(self, node: ASTNode):
        if node.text == "Expr" and node.getChildAmount() == 2:
            if node.getChild(0).text in ("++", "--"):
                variable_child = node.getChild(1)
            elif node.getChild(1).text in ("++", "--"):
                variable_child = node.getChild(0)
            dereference_count = 0
            while variable_child.text == "Dereference":
                variable_child = variable_child.getChild(0)
                dereference_count += 1
            if variable_child.text == "Expr":
                return
            type_entry = node.getSymbolTable().getEntry(variable_child.text)
            if type_entry is None or type_entry.isConst():
                ErrorExporter.invalidUnary(node.position)
                return
            type_object = type_entry.getTypeObject()
            pointer_count = 0
            while isinstance(type_object, SymbolTypePtr):
                type_object = type_object.pts_to
                pointer_count += 1
            if dereference_count -1 != pointer_count:
                ErrorExporter.invalidUnary(node.position)
                return

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass
