# Generated from C:/Users/lucas/OneDrive/Documents/Compilers/Compilers/grammar/expression.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .expressionParser import expressionParser
else:
    from expressionParser import expressionParser

# This class defines a complete generic visitor for a parse tree produced by expressionParser.

class expressionVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by expressionParser#start_.
    def visitStart_(self, ctx:expressionParser.Start_Context):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#expr.
    def visitExpr(self, ctx:expressionParser.ExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#boolexpr.
    def visitBoolexpr(self, ctx:expressionParser.BoolexprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#literal.
    def visitLiteral(self, ctx:expressionParser.LiteralContext):
        return self.visitChildren(ctx)



del expressionParser