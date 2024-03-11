# Generated from /home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/grammar/expression.g4 by ANTLR 4.13.1
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


    # Visit a parse tree produced by expressionParser#code.
    def visitCode(self, ctx:expressionParser.CodeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#comment.
    def visitComment(self, ctx:expressionParser.CommentContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#function.
    def visitFunction(self, ctx:expressionParser.FunctionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#line.
    def visitLine(self, ctx:expressionParser.LineContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#typedef.
    def visitTypedef(self, ctx:expressionParser.TypedefContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#printf.
    def visitPrintf(self, ctx:expressionParser.PrintfContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#type.
    def visitType(self, ctx:expressionParser.TypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#declaration.
    def visitDeclaration(self, ctx:expressionParser.DeclarationContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#assignment.
    def visitAssignment(self, ctx:expressionParser.AssignmentContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#conversion.
    def visitConversion(self, ctx:expressionParser.ConversionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#expr.
    def visitExpr(self, ctx:expressionParser.ExprContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by expressionParser#literal.
    def visitLiteral(self, ctx:expressionParser.LiteralContext):
        return self.visitChildren(ctx)



del expressionParser