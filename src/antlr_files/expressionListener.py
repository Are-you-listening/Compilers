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


    # Enter a parse tree produced by expressionParser#function.
    def enterFunction(self, ctx:expressionParser.FunctionContext):
        pass

    # Exit a parse tree produced by expressionParser#function.
    def exitFunction(self, ctx:expressionParser.FunctionContext):
        pass


    # Enter a parse tree produced by expressionParser#lines.
    def enterLines(self, ctx:expressionParser.LinesContext):
        pass

    # Exit a parse tree produced by expressionParser#lines.
    def exitLines(self, ctx:expressionParser.LinesContext):
        pass


    # Enter a parse tree produced by expressionParser#line.
    def enterLine(self, ctx:expressionParser.LineContext):
        pass

    # Exit a parse tree produced by expressionParser#line.
    def exitLine(self, ctx:expressionParser.LineContext):
        pass


    # Enter a parse tree produced by expressionParser#type.
    def enterType(self, ctx:expressionParser.TypeContext):
        pass

    # Exit a parse tree produced by expressionParser#type.
    def exitType(self, ctx:expressionParser.TypeContext):
        pass


    # Enter a parse tree produced by expressionParser#declaration.
    def enterDeclaration(self, ctx:expressionParser.DeclarationContext):
        pass

    # Exit a parse tree produced by expressionParser#declaration.
    def exitDeclaration(self, ctx:expressionParser.DeclarationContext):
        pass


    # Enter a parse tree produced by expressionParser#assignment.
    def enterAssignment(self, ctx:expressionParser.AssignmentContext):
        pass

    # Exit a parse tree produced by expressionParser#assignment.
    def exitAssignment(self, ctx:expressionParser.AssignmentContext):
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