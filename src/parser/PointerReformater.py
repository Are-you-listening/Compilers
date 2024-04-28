from src.parser.ASTVisitor import *
from src.parser.ErrorExporter import *


class PointerReformater(ASTVisitor):
    """
    Reformat the '->' pointer operator towards (* ). operators. e.g. ptr->value become (*ptr).value
    """
    def visitNode(self, node: ASTNode):
        pass

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        if node.text == '->':
            lsib = node.getSiblingNeighbour(-1)
            parent = node.parent

            # Create a new Exp node with children: '*' and lsib
            new_expr = ASTNode("Expr", parent, lsib.symbol_table, lsib.linenr, lsib.virtuallinenr)
            new_star = ASTNodeTerminal("*", new_expr, lsib.symbol_table, -1, lsib.linenr, lsib.virtuallinenr)
            new_expr.addChildren(new_star)
            new_expr.addChildren(lsib)

            parent.replaceChild(lsib, new_expr)
            lsib.parent = new_expr
            node.text = '.'  # Replace the operator
