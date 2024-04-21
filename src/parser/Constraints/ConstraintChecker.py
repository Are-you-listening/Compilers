from src.parser.Constraints.MainFoundConstraint import *
from src.parser.Constraints.ConstConstraint import *
from src.parser.Constraints.RedefinitionConstrained import *
from src.parser.Constraints.AmpersandConstraint import *
from src.parser.Constraints.PrintfConstraint import *
from src.parser.Constraints.UndeclaredConstrained import *
from src.parser.Constraints.GlobalsConstrained import *
from src.parser.Constraints.CleanGlobalScopeConstraint import *
from src.parser.Constraints.IOConstraint import *
from src.parser.Constraints.UndefinedReferenceConstraint import *

class ConstraintChecker(ASTVisitor):
    """
    Visitor to check all nodes to verify certain constraints
    """

    def __init__(self, includeSTDIO):
        self.constraints = [CleanGlobalScope(), MainFoundConstraint(), RedefinitionConstraint(), UndeclaredConstrained(), ConstConstraint(),
                            AmpersandConstraint(), PrintfConstraint(), UndeclaredConstrained(), GlobalsConstrained(), IOConstraint(includeSTDIO), UndefinedReferenceConstraint()]

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
            if c.isRejected() is None:
                if not c.isAccepted():
                    c.throwException()
                    # sys.exit()
            else:
                if c.isRejected():
                    c.throwException()
                    # sys.exit()
