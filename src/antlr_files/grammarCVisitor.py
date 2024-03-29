# Generated from /home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/grammar/grammarC.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .grammarCParser import grammarCParser
else:
    from grammarCParser import grammarCParser

# This class defines a complete generic visitor for a parse tree produced by grammarCParser.

class grammarCVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by grammarCParser#start_.
    def visitStart_(self, ctx:grammarCParser.Start_Context):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#code.
    def visitCode(self, ctx:grammarCParser.CodeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#include.
    def visitInclude(self, ctx:grammarCParser.IncludeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#comment.
    def visitComment(self, ctx:grammarCParser.CommentContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#function.
    def visitFunction(self, ctx:grammarCParser.FunctionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#line.
    def visitLine(self, ctx:grammarCParser.LineContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#block_line.
    def visitBlock_line(self, ctx:grammarCParser.Block_lineContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#block_code.
    def visitBlock_code(self, ctx:grammarCParser.Block_codeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#typedef.
    def visitTypedef(self, ctx:grammarCParser.TypedefContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#if_statement.
    def visitIf_statement(self, ctx:grammarCParser.If_statementContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#printf.
    def visitPrintf(self, ctx:grammarCParser.PrintfContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#type.
    def visitType(self, ctx:grammarCParser.TypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#declaration.
    def visitDeclaration(self, ctx:grammarCParser.DeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#assignment.
    def visitAssignment(self, ctx:grammarCParser.AssignmentContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#conversion.
    def visitConversion(self, ctx:grammarCParser.ConversionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#expr.
    def visitExpr(self, ctx:grammarCParser.ExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#literal.
    def visitLiteral(self, ctx:grammarCParser.LiteralContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#return.
    def visitReturn(self, ctx:grammarCParser.ReturnContext):
        return self.visitChildren(ctx)



del grammarCParser