from antlr4.tree.Tree import TerminalNodeImpl
from src.antlr_files.expressionVisitor import *
from src.antlr_files.expressionParser import *

class ASTNode:
    def __init__(self, text):
        self.children = []
        self.text = text

    def add_children(self, child):
        self.children.append(child)

class ASTCreator(expressionVisitor):
    def __init__(self):
        self.parent = None

    def visitStart_(self, ctx: expressionParser.Start_Context):
        #ctx.getTypedRuleContexts(ctx)
        #ctx.enterRule()
        #ctx.parentCtx
        print(ctx.start, ctx.stop)
        print(ctx.getChildCount())
        print(ctx.getRuleContext())
        print(ctx.parser)
        ctx.getText()


        #ctx.getType()

        #ctx.expr(0).copy()
        #print(ctx.getText())

        #ctx.parser
        #ctx.toString()
        self.parent = ASTNode(ctx.getText())
        self.visitChildren(ctx)
        self.visitTerminal(ctx)

        print("u")
        print(" v", ctx.getRuleContext())

    # Visit a parse tree produced by expressionParser#expr.
    def visitExpr(self, ctx: expressionParser.ExprContext):
        print(ctx.expr())

        self.makeNode(ctx)

    # Visit a parse tree produced by expressionParser#boolexpr.
    def visitBoolexpr(self, ctx: expressionParser.BoolexprContext):

        self.makeNode(ctx)

    # Visit a parse tree produced by expressionParser#literal.
    def visitLiteral(self, ctx: expressionParser.LiteralContext):
        print("aooop", ctx.INT())

        self.makeNode(ctx)

    def makeNode(self, ctx):
        for child in ctx.children:
            if isinstance(child, TerminalNodeImpl):
                print()
                print("childT ", child.getText())
                print(child.getSymbol())
                print(child.getSymbol().type) #Type matches with the index of the symbolicnames array from the Lexer,["",INT,LEFTPAREN,...]

        ctx.getAltNumber()

        node = ASTNode(ctx.getText())

        self.parent.add_children(node)

        old_parent = self.parent
        self.parent = node
        self.visitChildren(ctx)

        self.parent = old_parent
