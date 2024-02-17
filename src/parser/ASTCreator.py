from antlr4.tree.Tree import TerminalNodeImpl
from src.antlr_files.expressionVisitor import *
from src.antlr_files.expressionParser import *
from AST import *


class ASTCreator(expressionVisitor):
    def __init__(self):
        self.parent = None

    def visitStart_(self, ctx: expressionParser.Start_Context):
        self.parent = ASTNode("Start")
        self.visitChildren(ctx)

    def visitExpr(self, ctx: expressionParser.ExprContext):
        self.makeNode(ctx, "Expr")

    def visitBoolexpr(self, ctx: expressionParser.BoolexprContext):
        self.makeNode(ctx, "Boolexpr")

    def visitLiteral(self, ctx):
        self.makeNode(ctx, "Literal")

    def visitTerminal(self, ctx):
        node = ASTNodeTerminal(ctx.getText(), ctx.getSymbol().type)
        self.parent.add_children(node)

    def makeNode(self, ctx, type: str):
        node = ASTNode(type)
        self.parent.add_children(node)
        old_parent = self.parent
        self.parent = node
        self.visitChildren(ctx)

        self.parent = old_parent