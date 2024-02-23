
from src.parser.Constraints.MainFoundConstraint import *


class ConstraintChecker(ASTVisitor):
    """
    Visitor to visualize the AST tree using dot
    """
    def __init__(self, lexer):
        self.constraints = [MainFoundConstraint(lexer)]

    def visitNode(self, node: ASTNode):
        for c in self.constraints:
            if not c.isAccepted():
                c.checkNode(node)

    def visitNodeTerminal(self, node: ASTNodeTerminal):
        for c in self.constraints:
            if not c.isAccepted():
                c.checkTerminalNode(node)

    def visit(self, ast: AST):
        super(ConstraintChecker, self).visit(ast)
        for c in self.constraints:
            if not c.isAccepted():
                c.throwException()
