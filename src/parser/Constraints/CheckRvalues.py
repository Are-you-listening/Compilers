from src.parser.ErrorExporter import *
from src.parser.ASTVisitor import *


class CheckRvalues(ASTVisitor):
    """
    check for invalid Rvalues. For example:
    1 = 3;
    """

    def __init__(self):
        self.rejected = False
        self.error_node = None
        self.unary_test = False

    def visitNode(self, node: ASTNode):
        if node.text not in ("Assignment", "Expr"):
            return
        if node.text == "Expr" and node.getChildAmount() == 2 and (node.getChild(0).text in ("++", "--") or node.getChild(1).text in ("++", "--")):
            self.unary_test = True
            if node.getChild(0).text in ("++", "--"):
                to_check = node.getChild(1)
            elif node.getChild(1).text in ("++", "--"):
                to_check = node.getChild(0)
        elif node.text == "Assignment":
            to_check = node.getChild(0)
        else:
            return


        if to_check.getChild(1) and to_check.getChild(1).text == "[]":
            # arrays are handled elsewhere
            return

        if isinstance(to_check, ASTNode) and to_check.text == "Dereference":
            return

        if isinstance(to_check, ASTNode) and to_check.text == "Expr":
            # check for situations like: *(x+1) = 4;
            if to_check.getChild(0) and to_check.getChild(0).text == "*":
                return
            if to_check.getChildAmount() >= 2 and to_check.getChild(1).text in ("+", "-", "*", "/", "%", "++", "--", "|", "^", "&&", "||", "<<", ">>", "==", "!=", "<", ">", "<=", ">=") \
                    or to_check.getChild(0).text in ("++", "--", "&", "+", "-", "~", "!"):
                self.error_node = to_check
                self.throwException()

        if isinstance(to_check, ASTNodeTerminal) and to_check.type == "IDENTIFIER":
            return

        self.error_node = to_check
        self.throwException()

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        pass

    def throwException(self):
        error_cause = self.error_node.text
        if not isinstance(self.error_node, ASTNodeTerminal):
            error_cause = ""
            for leaf in self.error_node.getLeaves():
                error_cause += leaf.text
        if self.unary_test:
            ErrorExporter.invalidUnary(self.error_node.position)
        else:
            ErrorExporter.invalidRvalue(error_cause, self.error_node.position)
        self.rejected = True

    def isRejected(self):
        return self.rejected
