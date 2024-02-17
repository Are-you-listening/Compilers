from antlr4.tree.Tree import TerminalNodeImpl
from src.antlr_files.expressionVisitor import *
from src.antlr_files.expressionParser import *
from src.parser.AST import *


class ASTCreator(expressionVisitor):
    def __init__(self):
        self.parent = None
        self.AST = None

    def visit(self, tree):
        self.parent = None
        super(ASTCreator, self).visit(tree)
        self.AST = AST(self.parent)

    def visitStart_(self, ctx: expressionParser.Start_Context):
        self.parent = ASTNode("Start", None)
        self.visitChildren(ctx)

    def visitExpr(self, ctx: expressionParser.ExprContext):
        self.makeNode(ctx, "Expr")

    def visitLiteral(self, ctx):
        self.makeNode(ctx, "Literal")

    def visitTerminal(self, ctx):
        print("ter", ctx.getText())
        node = ASTNodeTerminal(ctx.getText(), self.parent, ctx.getSymbol().type)
        self.parent.add_children(node)

    def makeNode(self, ctx, type: str):
        node = ASTNode(type, self.parent)
        self.parent.add_children(node)
        old_parent = self.parent
        self.parent = node
        self.visitChildren(ctx)

        self.parent = old_parent

    def getAST(self):
        return self.AST
