# Generated from /home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/grammar/expression.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .expressionParser import expressionParser
else:
    from expressionParser import expressionParser

# This class defines a complete listener for a parse tree produced by expressionParser.
class expressionListener(ParseTreeListener):

    # Enter a parse tree produced by expressionParser#start_.
    def enterStart_(self, ctx:expressionParser.Start_Context):
        pass

    # Exit a parse tree produced by expressionParser#start_.
    def exitStart_(self, ctx:expressionParser.Start_Context):
        pass


    # Enter a parse tree produced by expressionParser#expr.
    def enterExpr(self, ctx:expressionParser.ExprContext):
        pass

    # Exit a parse tree produced by expressionParser#expr.
    def exitExpr(self, ctx:expressionParser.ExprContext):
        pass


    # Enter a parse tree produced by expressionParser#literal.
    def enterLiteral(self, ctx:expressionParser.LiteralContext):
        pass

    # Exit a parse tree produced by expressionParser#literal.
    def exitLiteral(self, ctx:expressionParser.LiteralContext):
        pass



del expressionParser