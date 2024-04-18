# Generated from C:/Users/Lucas/PycharmProjects/Compilers/grammar/grammarC.g4 by ANTLR 4.13.1
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


    # Visit a parse tree produced by grammarCParser#include_guard.
    def visitInclude_guard(self, ctx:grammarCParser.Include_guardContext):
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


    # Visit a parse tree produced by grammarCParser#parameters.
    def visitParameters(self, ctx:grammarCParser.ParametersContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#parameter.
    def visitParameter(self, ctx:grammarCParser.ParameterContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#function_call.
    def visitFunction_call(self, ctx:grammarCParser.Function_callContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#parameter_call.
    def visitParameter_call(self, ctx:grammarCParser.Parameter_callContext):
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


    # Visit a parse tree produced by grammarCParser#define.
    def visitDefine(self, ctx:grammarCParser.DefineContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#if.
    def visitIf(self, ctx:grammarCParser.IfContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#for.
    def visitFor(self, ctx:grammarCParser.ForContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#while.
    def visitWhile(self, ctx:grammarCParser.WhileContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#anonymous_scope.
    def visitAnonymous_scope(self, ctx:grammarCParser.Anonymous_scopeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#switch.
    def visitSwitch(self, ctx:grammarCParser.SwitchContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#case.
    def visitCase(self, ctx:grammarCParser.CaseContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#default.
    def visitDefault(self, ctx:grammarCParser.DefaultContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#enum.
    def visitEnum(self, ctx:grammarCParser.EnumContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#printscanf.
    def visitPrintscanf(self, ctx:grammarCParser.PrintscanfContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#type.
    def visitType(self, ctx:grammarCParser.TypeContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#return.
    def visitReturn(self, ctx:grammarCParser.ReturnContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#structunion.
    def visitStructunion(self, ctx:grammarCParser.StructunionContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#function_ptr.
    def visitFunction_ptr(self, ctx:grammarCParser.Function_ptrContext):
        return self.visitChildren(ctx)


    # Visit a parse tree produced by grammarCParser#function_ptr_2.
    def visitFunction_ptr_2(self, ctx:grammarCParser.Function_ptr_2Context):
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



del grammarCParser