# Generated from /home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/grammar/grammarC.g4 by ANTLR 4.13.1
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


    # Enter a parse tree produced by grammarCParser#include_guard.
    def enterInclude_guard(self, ctx:grammarCParser.Include_guardContext):
        pass

    # Exit a parse tree produced by grammarCParser#include_guard.
    def exitInclude_guard(self, ctx:grammarCParser.Include_guardContext):
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


    # Enter a parse tree produced by grammarCParser#parameters.
    def enterParameters(self, ctx:grammarCParser.ParametersContext):
        pass

    # Exit a parse tree produced by grammarCParser#parameters.
    def exitParameters(self, ctx:grammarCParser.ParametersContext):
        pass


    # Enter a parse tree produced by grammarCParser#parameter.
    def enterParameter(self, ctx:grammarCParser.ParameterContext):
        pass

    # Exit a parse tree produced by grammarCParser#parameter.
    def exitParameter(self, ctx:grammarCParser.ParameterContext):
        pass


    # Enter a parse tree produced by grammarCParser#function_call.
    def enterFunction_call(self, ctx:grammarCParser.Function_callContext):
        pass

    # Exit a parse tree produced by grammarCParser#function_call.
    def exitFunction_call(self, ctx:grammarCParser.Function_callContext):
        pass


    # Enter a parse tree produced by grammarCParser#block_line.
    def enterBlock_line(self, ctx:grammarCParser.Block_lineContext):
        pass

    # Exit a parse tree produced by grammarCParser#block_line.
    def exitBlock_line(self, ctx:grammarCParser.Block_lineContext):
        pass


    # Enter a parse tree produced by grammarCParser#block_code.
    def enterBlock_code(self, ctx:grammarCParser.Block_codeContext):
        pass

    # Exit a parse tree produced by grammarCParser#block_code.
    def exitBlock_code(self, ctx:grammarCParser.Block_codeContext):
        pass


    # Enter a parse tree produced by grammarCParser#typedef.
    def enterTypedef(self, ctx:grammarCParser.TypedefContext):
        pass

    # Exit a parse tree produced by grammarCParser#typedef.
    def exitTypedef(self, ctx:grammarCParser.TypedefContext):
        pass


    # Enter a parse tree produced by grammarCParser#define.
    def enterDefine(self, ctx:grammarCParser.DefineContext):
        pass

    # Exit a parse tree produced by grammarCParser#define.
    def exitDefine(self, ctx:grammarCParser.DefineContext):
        pass


    # Enter a parse tree produced by grammarCParser#if.
    def enterIf(self, ctx:grammarCParser.IfContext):
        pass

    # Exit a parse tree produced by grammarCParser#if.
    def exitIf(self, ctx:grammarCParser.IfContext):
        pass


    # Enter a parse tree produced by grammarCParser#for.
    def enterFor(self, ctx:grammarCParser.ForContext):
        pass

    # Exit a parse tree produced by grammarCParser#for.
    def exitFor(self, ctx:grammarCParser.ForContext):
        pass


    # Enter a parse tree produced by grammarCParser#while.
    def enterWhile(self, ctx:grammarCParser.WhileContext):
        pass

    # Exit a parse tree produced by grammarCParser#while.
    def exitWhile(self, ctx:grammarCParser.WhileContext):
        pass


    # Enter a parse tree produced by grammarCParser#anonymous_scope.
    def enterAnonymous_scope(self, ctx:grammarCParser.Anonymous_scopeContext):
        pass

    # Exit a parse tree produced by grammarCParser#anonymous_scope.
    def exitAnonymous_scope(self, ctx:grammarCParser.Anonymous_scopeContext):
        pass


    # Enter a parse tree produced by grammarCParser#switch.
    def enterSwitch(self, ctx:grammarCParser.SwitchContext):
        pass

    # Exit a parse tree produced by grammarCParser#switch.
    def exitSwitch(self, ctx:grammarCParser.SwitchContext):
        pass


    # Enter a parse tree produced by grammarCParser#case.
    def enterCase(self, ctx:grammarCParser.CaseContext):
        pass

    # Exit a parse tree produced by grammarCParser#case.
    def exitCase(self, ctx:grammarCParser.CaseContext):
        pass


    # Enter a parse tree produced by grammarCParser#default.
    def enterDefault(self, ctx:grammarCParser.DefaultContext):
        pass

    # Exit a parse tree produced by grammarCParser#default.
    def exitDefault(self, ctx:grammarCParser.DefaultContext):
        pass


    # Enter a parse tree produced by grammarCParser#enum.
    def enterEnum(self, ctx:grammarCParser.EnumContext):
        pass

    # Exit a parse tree produced by grammarCParser#enum.
    def exitEnum(self, ctx:grammarCParser.EnumContext):
        pass


    # Enter a parse tree produced by grammarCParser#printscanf.
    def enterPrintscanf(self, ctx:grammarCParser.PrintscanfContext):
        pass

    # Exit a parse tree produced by grammarCParser#printscanf.
    def exitPrintscanf(self, ctx:grammarCParser.PrintscanfContext):
        pass


    # Enter a parse tree produced by grammarCParser#type.
    def enterType(self, ctx:grammarCParser.TypeContext):
        pass

    # Exit a parse tree produced by grammarCParser#type.
    def exitType(self, ctx:grammarCParser.TypeContext):
        pass


    # Enter a parse tree produced by grammarCParser#return.
    def enterReturn(self, ctx:grammarCParser.ReturnContext):
        pass

    # Exit a parse tree produced by grammarCParser#return.
    def exitReturn(self, ctx:grammarCParser.ReturnContext):
        pass


    # Enter a parse tree produced by grammarCParser#structunion.
    def enterStructunion(self, ctx:grammarCParser.StructunionContext):
        pass

    # Exit a parse tree produced by grammarCParser#structunion.
    def exitStructunion(self, ctx:grammarCParser.StructunionContext):
        pass


    # Enter a parse tree produced by grammarCParser#function_ptr.
    def enterFunction_ptr(self, ctx:grammarCParser.Function_ptrContext):
        pass

    # Exit a parse tree produced by grammarCParser#function_ptr.
    def exitFunction_ptr(self, ctx:grammarCParser.Function_ptrContext):
        pass


    # Enter a parse tree produced by grammarCParser#function_ptr_2.
    def enterFunction_ptr_2(self, ctx:grammarCParser.Function_ptr_2Context):
        pass

    # Exit a parse tree produced by grammarCParser#function_ptr_2.
    def exitFunction_ptr_2(self, ctx:grammarCParser.Function_ptr_2Context):
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



del grammarCParser