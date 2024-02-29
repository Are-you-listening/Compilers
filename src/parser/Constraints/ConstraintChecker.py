from src.parser.Constraints.MainFoundConstraint import *
from src.parser.Constraints.ConstConstraint import *
from src.parser.Constraints.RedefinitionConstrained import *
from src.parser.Constraints.UndeclaredConstrained import *
from src.parser.Constraints.IncompatibleTypeOperationConstrained import *


class ConstraintChecker(ASTVisitor):
    """
    Visitor to check all nodes to verify certain constraints
    """
    def __init__(self, lexer):
        self.constraints = [MainFoundConstraint(), UndeclaredConstrained(), RedefinitionConstraint(), ConstConstraint(), IncompatibleTypeOperationConstrained(lexer)]

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
