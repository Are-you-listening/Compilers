# Generated from /home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/grammar/grammarC.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .grammarCParser import grammarCParser
else:
    from grammarCParser import grammarCParser

# This class defines a complete listener for a parse tree produced by grammarCParser.
class grammarCListener(ParseTreeListener):

    # Enter a parse tree produced by grammarCParser#start_.
    def enterStart_(self, ctx:grammarCParser.Start_Context):
        pass

    # Exit a parse tree produced by grammarCParser#start_.
    def exitStart_(self, ctx:grammarCParser.Start_Context):
        pass


    # Enter a parse tree produced by grammarCParser#code.
    def enterCode(self, ctx:grammarCParser.CodeContext):
        pass

    # Exit a parse tree produced by grammarCParser#code.
    def exitCode(self, ctx:grammarCParser.CodeContext):
        pass


    # Enter a parse tree produced by grammarCParser#include.
    def enterInclude(self, ctx:grammarCParser.IncludeContext):
        pass

    # Exit a parse tree produced by grammarCParser#include.
    def exitInclude(self, ctx:grammarCParser.IncludeContext):
        pass


    # Enter a parse tree produced by grammarCParser#comment.
    def enterComment(self, ctx:grammarCParser.CommentContext):
        pass

    # Exit a parse tree produced by grammarCParser#comment.
    def exitComment(self, ctx:grammarCParser.CommentContext):
        pass


    # Enter a parse tree produced by grammarCParser#function.
    def enterFunction(self, ctx:grammarCParser.FunctionContext):
        pass

    # Exit a parse tree produced by grammarCParser#function.
    def exitFunction(self, ctx:grammarCParser.FunctionContext):
        pass


    # Enter a parse tree produced by grammarCParser#line.
    def enterLine(self, ctx:grammarCParser.LineContext):
        pass

    # Exit a parse tree produced by grammarCParser#line.
    def exitLine(self, ctx:grammarCParser.LineContext):
        pass


    # Enter a parse tree produced by grammarCParser#typedef.
    def enterTypedef(self, ctx:grammarCParser.TypedefContext):
        pass

    # Exit a parse tree produced by grammarCParser#typedef.
    def exitTypedef(self, ctx:grammarCParser.TypedefContext):
        pass


    # Enter a parse tree produced by grammarCParser#printf.
    def enterPrintf(self, ctx:grammarCParser.PrintfContext):
        pass

    # Exit a parse tree produced by grammarCParser#printf.
    def exitPrintf(self, ctx:grammarCParser.PrintfContext):
        pass


    # Enter a parse tree produced by grammarCParser#type.
    def enterType(self, ctx:grammarCParser.TypeContext):
        pass

    # Exit a parse tree produced by grammarCParser#type.
    def exitType(self, ctx:grammarCParser.TypeContext):
        pass


    # Enter a parse tree produced by grammarCParser#declaration.
    def enterDeclaration(self, ctx:grammarCParser.DeclarationContext):
        pass

    # Exit a parse tree produced by grammarCParser#declaration.
    def exitDeclaration(self, ctx:grammarCParser.DeclarationContext):
        pass


    # Enter a parse tree produced by grammarCParser#assignment.
    def enterAssignment(self, ctx:grammarCParser.AssignmentContext):
        pass

    # Exit a parse tree produced by grammarCParser#assignment.
    def exitAssignment(self, ctx:grammarCParser.AssignmentContext):
        pass


    # Enter a parse tree produced by grammarCParser#conversion.
    def enterConversion(self, ctx:grammarCParser.ConversionContext):
        pass

    # Exit a parse tree produced by grammarCParser#conversion.
    def exitConversion(self, ctx:grammarCParser.ConversionContext):
        pass


    # Enter a parse tree produced by grammarCParser#expr.
    def enterExpr(self, ctx:grammarCParser.ExprContext):
        pass

    # Exit a parse tree produced by grammarCParser#expr.
    def exitExpr(self, ctx:grammarCParser.ExprContext):
        pass


    # Enter a parse tree produced by grammarCParser#literal.
    def enterLiteral(self, ctx:grammarCParser.LiteralContext):
        pass

    # Exit a parse tree produced by grammarCParser#literal.
    def exitLiteral(self, ctx:grammarCParser.LiteralContext):
        pass


    # Enter a parse tree produced by grammarCParser#return.
    def enterReturn(self, ctx:grammarCParser.ReturnContext):
        pass

    # Exit a parse tree produced by grammarCParser#return.
    def exitReturn(self, ctx:grammarCParser.ReturnContext):
        pass



del grammarCParser