# Generated from /home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/grammar/expression.g4 by ANTLR 4.13.1
# encoding: utf-8
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
	from typing import TextIO
else:
	from typing.io import TextIO

def serializedATN():
    return [
        4,1,49,175,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,
        1,0,3,0,30,8,0,1,0,1,0,1,0,1,1,1,1,1,1,5,1,38,8,1,10,1,12,1,41,9,
        1,1,2,1,2,1,3,1,3,1,4,1,4,1,4,1,4,1,4,1,4,1,4,1,4,1,5,1,5,1,5,1,
        5,1,5,3,5,60,8,5,1,5,4,5,63,8,5,11,5,12,5,64,1,6,1,6,1,6,1,6,1,7,
        1,7,1,7,1,7,1,7,3,7,76,8,7,1,7,1,7,1,7,1,7,1,7,1,8,3,8,84,8,8,1,
        8,1,8,5,8,88,8,8,10,8,12,8,91,9,8,1,9,1,9,1,9,1,9,3,9,97,8,9,1,10,
        5,10,100,8,10,10,10,12,10,103,9,10,1,10,1,10,1,10,1,10,1,11,1,11,
        1,11,1,11,1,11,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,
        1,12,1,12,1,12,1,12,1,12,1,12,1,12,3,12,131,8,12,1,12,1,12,1,12,
        1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,
        1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,
        1,12,5,12,163,8,12,10,12,12,12,166,9,12,1,13,1,13,1,13,1,13,1,13,
        3,13,173,8,13,1,13,0,1,24,14,0,2,4,6,8,10,12,14,16,18,20,22,24,26,
        0,11,1,0,43,44,1,0,10,14,2,0,17,19,45,45,2,0,20,20,22,24,1,0,22,
        23,1,0,25,28,2,0,20,20,29,30,1,0,25,26,1,0,31,32,1,0,33,36,1,0,37,
        38,193,0,29,1,0,0,0,2,39,1,0,0,0,4,42,1,0,0,0,6,44,1,0,0,0,8,46,
        1,0,0,0,10,59,1,0,0,0,12,66,1,0,0,0,14,70,1,0,0,0,16,83,1,0,0,0,
        18,92,1,0,0,0,20,101,1,0,0,0,22,108,1,0,0,0,24,130,1,0,0,0,26,172,
        1,0,0,0,28,30,3,4,2,0,29,28,1,0,0,0,29,30,1,0,0,0,30,31,1,0,0,0,
        31,32,3,2,1,0,32,33,5,0,0,1,33,1,1,0,0,0,34,38,3,8,4,0,35,38,3,10,
        5,0,36,38,3,6,3,0,37,34,1,0,0,0,37,35,1,0,0,0,37,36,1,0,0,0,38,41,
        1,0,0,0,39,37,1,0,0,0,39,40,1,0,0,0,40,3,1,0,0,0,41,39,1,0,0,0,42,
        43,5,1,0,0,43,5,1,0,0,0,44,45,7,0,0,0,45,7,1,0,0,0,46,47,3,16,8,
        0,47,48,5,45,0,0,48,49,5,2,0,0,49,50,5,3,0,0,50,51,5,4,0,0,51,52,
        3,2,1,0,52,53,5,5,0,0,53,9,1,0,0,0,54,60,3,18,9,0,55,60,3,24,12,
        0,56,60,3,20,10,0,57,60,3,12,6,0,58,60,3,14,7,0,59,54,1,0,0,0,59,
        55,1,0,0,0,59,56,1,0,0,0,59,57,1,0,0,0,59,58,1,0,0,0,60,62,1,0,0,
        0,61,63,5,6,0,0,62,61,1,0,0,0,63,64,1,0,0,0,64,62,1,0,0,0,64,65,
        1,0,0,0,65,11,1,0,0,0,66,67,5,7,0,0,67,68,3,16,8,0,68,69,5,45,0,
        0,69,13,1,0,0,0,70,71,5,8,0,0,71,72,5,2,0,0,72,73,5,9,0,0,73,75,
        7,1,0,0,74,76,5,6,0,0,75,74,1,0,0,0,75,76,1,0,0,0,76,77,1,0,0,0,
        77,78,5,9,0,0,78,79,5,15,0,0,79,80,3,24,12,0,80,81,5,3,0,0,81,15,
        1,0,0,0,82,84,5,16,0,0,83,82,1,0,0,0,83,84,1,0,0,0,84,85,1,0,0,0,
        85,89,7,2,0,0,86,88,5,20,0,0,87,86,1,0,0,0,88,91,1,0,0,0,89,87,1,
        0,0,0,89,90,1,0,0,0,90,17,1,0,0,0,91,89,1,0,0,0,92,93,3,16,8,0,93,
        96,5,45,0,0,94,95,5,21,0,0,95,97,3,24,12,0,96,94,1,0,0,0,96,97,1,
        0,0,0,97,19,1,0,0,0,98,100,5,20,0,0,99,98,1,0,0,0,100,103,1,0,0,
        0,101,99,1,0,0,0,101,102,1,0,0,0,102,104,1,0,0,0,103,101,1,0,0,0,
        104,105,5,45,0,0,105,106,5,21,0,0,106,107,3,24,12,0,107,21,1,0,0,
        0,108,109,5,2,0,0,109,110,3,16,8,0,110,111,5,3,0,0,111,112,3,24,
        12,0,112,23,1,0,0,0,113,114,6,12,-1,0,114,131,3,26,13,0,115,116,
        5,2,0,0,116,117,3,16,8,0,117,118,5,3,0,0,118,119,3,24,12,15,119,
        131,1,0,0,0,120,121,5,2,0,0,121,122,3,24,12,0,122,123,5,3,0,0,123,
        131,1,0,0,0,124,125,7,3,0,0,125,131,3,24,12,13,126,127,5,45,0,0,
        127,131,7,4,0,0,128,129,7,5,0,0,129,131,3,24,12,11,130,113,1,0,0,
        0,130,115,1,0,0,0,130,120,1,0,0,0,130,124,1,0,0,0,130,126,1,0,0,
        0,130,128,1,0,0,0,131,164,1,0,0,0,132,133,10,10,0,0,133,134,7,6,
        0,0,134,163,3,24,12,11,135,136,10,9,0,0,136,137,7,7,0,0,137,163,
        3,24,12,10,138,139,10,8,0,0,139,140,7,8,0,0,140,163,3,24,12,9,141,
        142,10,7,0,0,142,143,7,9,0,0,143,163,3,24,12,8,144,145,10,6,0,0,
        145,146,7,10,0,0,146,163,3,24,12,7,147,148,10,5,0,0,148,149,5,24,
        0,0,149,163,3,24,12,6,150,151,10,4,0,0,151,152,5,39,0,0,152,163,
        3,24,12,5,153,154,10,3,0,0,154,155,5,40,0,0,155,163,3,24,12,4,156,
        157,10,2,0,0,157,158,5,41,0,0,158,163,3,24,12,3,159,160,10,1,0,0,
        160,161,5,42,0,0,161,163,3,24,12,2,162,132,1,0,0,0,162,135,1,0,0,
        0,162,138,1,0,0,0,162,141,1,0,0,0,162,144,1,0,0,0,162,147,1,0,0,
        0,162,150,1,0,0,0,162,153,1,0,0,0,162,156,1,0,0,0,162,159,1,0,0,
        0,163,166,1,0,0,0,164,162,1,0,0,0,164,165,1,0,0,0,165,25,1,0,0,0,
        166,164,1,0,0,0,167,173,5,46,0,0,168,173,5,47,0,0,169,173,5,48,0,
        0,170,173,5,45,0,0,171,173,3,22,11,0,172,167,1,0,0,0,172,168,1,0,
        0,0,172,169,1,0,0,0,172,170,1,0,0,0,172,171,1,0,0,0,173,27,1,0,0,
        0,14,29,37,39,59,64,75,83,89,96,101,130,162,164,172
    ]

class expressionParser ( Parser ):

    grammarFileName = "expression.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'#include <stdio.h>'", "'('", "')'", 
                     "'{'", "'}'", "';'", "'typedef'", "'printf'", "'\"'", 
                     "'%s'", "'%d'", "'%x'", "'%f'", "'%c'", "','", "'const'", 
                     "'int'", "'char'", "'float'", "'*'", "'='", "'++'", 
                     "'--'", "'&'", "'+'", "'-'", "'~'", "'!'", "'/'", "'%'", 
                     "'>>'", "'<<'", "'<'", "'>'", "'>='", "'<='", "'=='", 
                     "'!='", "'^'", "'|'", "'&&'", "'||'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "MULTILINE", 
                      "SINGLECOMMENT", "IDENTIFIER", "INT", "FLOAT", "CHAR", 
                      "WS" ]

    RULE_start_ = 0
    RULE_code = 1
    RULE_include = 2
    RULE_comment = 3
    RULE_function = 4
    RULE_line = 5
    RULE_typedef = 6
    RULE_printf = 7
    RULE_type = 8
    RULE_declaration = 9
    RULE_assignment = 10
    RULE_conversion = 11
    RULE_expr = 12
    RULE_literal = 13

    ruleNames =  [ "start_", "code", "include", "comment", "function", "line", 
                   "typedef", "printf", "type", "declaration", "assignment", 
                   "conversion", "expr", "literal" ]

    EOF = Token.EOF
    T__0=1
    T__1=2
    T__2=3
    T__3=4
    T__4=5
    T__5=6
    T__6=7
    T__7=8
    T__8=9
    T__9=10
    T__10=11
    T__11=12
    T__12=13
    T__13=14
    T__14=15
    T__15=16
    T__16=17
    T__17=18
    T__18=19
    T__19=20
    T__20=21
    T__21=22
    T__22=23
    T__23=24
    T__24=25
    T__25=26
    T__26=27
    T__27=28
    T__28=29
    T__29=30
    T__30=31
    T__31=32
    T__32=33
    T__33=34
    T__34=35
    T__35=36
    T__36=37
    T__37=38
    T__38=39
    T__39=40
    T__40=41
    T__41=42
    MULTILINE=43
    SINGLECOMMENT=44
    IDENTIFIER=45
    INT=46
    FLOAT=47
    CHAR=48
    WS=49

    def __init__(self, input:TokenStream, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.13.1")
        self._interp = ParserATNSimulator(self, self.atn, self.decisionsToDFA, self.sharedContextCache)
        self._predicates = None




    class Start_Context(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def code(self):
            return self.getTypedRuleContext(expressionParser.CodeContext,0)


        def EOF(self):
            return self.getToken(expressionParser.EOF, 0)

        def include(self):
            return self.getTypedRuleContext(expressionParser.IncludeContext,0)


        def getRuleIndex(self):
            return expressionParser.RULE_start_

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterStart_" ):
                listener.enterStart_(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitStart_" ):
                listener.exitStart_(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitStart_" ):
                return visitor.visitStart_(self)
            else:
                return visitor.visitChildren(self)




    def start_(self):

        localctx = expressionParser.Start_Context(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_start_)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 29
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==1:
                self.state = 28
                self.include()


            self.state = 31
            self.code()
            self.state = 32
            self.match(expressionParser.EOF)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class CodeContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def function(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.FunctionContext)
            else:
                return self.getTypedRuleContext(expressionParser.FunctionContext,i)


        def line(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.LineContext)
            else:
                return self.getTypedRuleContext(expressionParser.LineContext,i)


        def comment(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.CommentContext)
            else:
                return self.getTypedRuleContext(expressionParser.CommentContext,i)


        def getRuleIndex(self):
            return expressionParser.RULE_code

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterCode" ):
                listener.enterCode(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitCode" ):
                listener.exitCode(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitCode" ):
                return visitor.visitCode(self)
            else:
                return visitor.visitChildren(self)




    def code(self):

        localctx = expressionParser.CodeContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_code)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 39
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 554154395107716) != 0):
                self.state = 37
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,1,self._ctx)
                if la_ == 1:
                    self.state = 34
                    self.function()
                    pass

                elif la_ == 2:
                    self.state = 35
                    self.line()
                    pass

                elif la_ == 3:
                    self.state = 36
                    self.comment()
                    pass


                self.state = 41
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class IncludeContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser


        def getRuleIndex(self):
            return expressionParser.RULE_include

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterInclude" ):
                listener.enterInclude(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitInclude" ):
                listener.exitInclude(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitInclude" ):
                return visitor.visitInclude(self)
            else:
                return visitor.visitChildren(self)




    def include(self):

        localctx = expressionParser.IncludeContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_include)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 42
            self.match(expressionParser.T__0)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class CommentContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def MULTILINE(self):
            return self.getToken(expressionParser.MULTILINE, 0)

        def SINGLECOMMENT(self):
            return self.getToken(expressionParser.SINGLECOMMENT, 0)

        def getRuleIndex(self):
            return expressionParser.RULE_comment

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterComment" ):
                listener.enterComment(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitComment" ):
                listener.exitComment(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitComment" ):
                return visitor.visitComment(self)
            else:
                return visitor.visitChildren(self)




    def comment(self):

        localctx = expressionParser.CommentContext(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_comment)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 44
            _la = self._input.LA(1)
            if not(_la==43 or _la==44):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class FunctionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def type_(self):
            return self.getTypedRuleContext(expressionParser.TypeContext,0)


        def IDENTIFIER(self):
            return self.getToken(expressionParser.IDENTIFIER, 0)

        def code(self):
            return self.getTypedRuleContext(expressionParser.CodeContext,0)


        def getRuleIndex(self):
            return expressionParser.RULE_function

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFunction" ):
                listener.enterFunction(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFunction" ):
                listener.exitFunction(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFunction" ):
                return visitor.visitFunction(self)
            else:
                return visitor.visitChildren(self)




    def function(self):

        localctx = expressionParser.FunctionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_function)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 46
            self.type_()
            self.state = 47
            self.match(expressionParser.IDENTIFIER)
            self.state = 48
            self.match(expressionParser.T__1)
            self.state = 49
            self.match(expressionParser.T__2)
            self.state = 50
            self.match(expressionParser.T__3)
            self.state = 51
            self.code()
            self.state = 52
            self.match(expressionParser.T__4)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class LineContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def declaration(self):
            return self.getTypedRuleContext(expressionParser.DeclarationContext,0)


        def expr(self):
            return self.getTypedRuleContext(expressionParser.ExprContext,0)


        def assignment(self):
            return self.getTypedRuleContext(expressionParser.AssignmentContext,0)


        def typedef(self):
            return self.getTypedRuleContext(expressionParser.TypedefContext,0)


        def printf(self):
            return self.getTypedRuleContext(expressionParser.PrintfContext,0)


        def getRuleIndex(self):
            return expressionParser.RULE_line

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterLine" ):
                listener.enterLine(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitLine" ):
                listener.exitLine(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitLine" ):
                return visitor.visitLine(self)
            else:
                return visitor.visitChildren(self)




    def line(self):

        localctx = expressionParser.LineContext(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_line)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 59
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,3,self._ctx)
            if la_ == 1:
                self.state = 54
                self.declaration()
                pass

            elif la_ == 2:
                self.state = 55
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 56
                self.assignment()
                pass

            elif la_ == 4:
                self.state = 57
                self.typedef()
                pass

            elif la_ == 5:
                self.state = 58
                self.printf()
                pass


            self.state = 62 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 61
                self.match(expressionParser.T__5)
                self.state = 64 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not (_la==6):
                    break

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class TypedefContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def type_(self):
            return self.getTypedRuleContext(expressionParser.TypeContext,0)


        def IDENTIFIER(self):
            return self.getToken(expressionParser.IDENTIFIER, 0)

        def getRuleIndex(self):
            return expressionParser.RULE_typedef

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterTypedef" ):
                listener.enterTypedef(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitTypedef" ):
                listener.exitTypedef(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitTypedef" ):
                return visitor.visitTypedef(self)
            else:
                return visitor.visitChildren(self)




    def typedef(self):

        localctx = expressionParser.TypedefContext(self, self._ctx, self.state)
        self.enterRule(localctx, 12, self.RULE_typedef)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 66
            self.match(expressionParser.T__6)
            self.state = 67
            self.type_()
            self.state = 68
            self.match(expressionParser.IDENTIFIER)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class PrintfContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def expr(self):
            return self.getTypedRuleContext(expressionParser.ExprContext,0)


        def getRuleIndex(self):
            return expressionParser.RULE_printf

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterPrintf" ):
                listener.enterPrintf(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitPrintf" ):
                listener.exitPrintf(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitPrintf" ):
                return visitor.visitPrintf(self)
            else:
                return visitor.visitChildren(self)




    def printf(self):

        localctx = expressionParser.PrintfContext(self, self._ctx, self.state)
        self.enterRule(localctx, 14, self.RULE_printf)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 70
            self.match(expressionParser.T__7)
            self.state = 71
            self.match(expressionParser.T__1)
            self.state = 72
            self.match(expressionParser.T__8)
            self.state = 73
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 31744) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 75
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==6:
                self.state = 74
                self.match(expressionParser.T__5)


            self.state = 77
            self.match(expressionParser.T__8)
            self.state = 78
            self.match(expressionParser.T__14)

            self.state = 79
            self.expr(0)
            self.state = 80
            self.match(expressionParser.T__2)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class TypeContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENTIFIER(self):
            return self.getToken(expressionParser.IDENTIFIER, 0)

        def getRuleIndex(self):
            return expressionParser.RULE_type

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterType" ):
                listener.enterType(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitType" ):
                listener.exitType(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitType" ):
                return visitor.visitType(self)
            else:
                return visitor.visitChildren(self)




    def type_(self):

        localctx = expressionParser.TypeContext(self, self._ctx, self.state)
        self.enterRule(localctx, 16, self.RULE_type)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 83
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==16:
                self.state = 82
                self.match(expressionParser.T__15)


            self.state = 85
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 35184373006336) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 89
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==20:
                self.state = 86
                self.match(expressionParser.T__19)
                self.state = 91
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class DeclarationContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def type_(self):
            return self.getTypedRuleContext(expressionParser.TypeContext,0)


        def IDENTIFIER(self):
            return self.getToken(expressionParser.IDENTIFIER, 0)

        def expr(self):
            return self.getTypedRuleContext(expressionParser.ExprContext,0)


        def getRuleIndex(self):
            return expressionParser.RULE_declaration

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterDeclaration" ):
                listener.enterDeclaration(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitDeclaration" ):
                listener.exitDeclaration(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitDeclaration" ):
                return visitor.visitDeclaration(self)
            else:
                return visitor.visitChildren(self)




    def declaration(self):

        localctx = expressionParser.DeclarationContext(self, self._ctx, self.state)
        self.enterRule(localctx, 18, self.RULE_declaration)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 92
            self.type_()
            self.state = 93
            self.match(expressionParser.IDENTIFIER)
            self.state = 96
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==21:
                self.state = 94
                self.match(expressionParser.T__20)
                self.state = 95
                self.expr(0)


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class AssignmentContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENTIFIER(self):
            return self.getToken(expressionParser.IDENTIFIER, 0)

        def expr(self):
            return self.getTypedRuleContext(expressionParser.ExprContext,0)


        def getRuleIndex(self):
            return expressionParser.RULE_assignment

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAssignment" ):
                listener.enterAssignment(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAssignment" ):
                listener.exitAssignment(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAssignment" ):
                return visitor.visitAssignment(self)
            else:
                return visitor.visitChildren(self)




    def assignment(self):

        localctx = expressionParser.AssignmentContext(self, self._ctx, self.state)
        self.enterRule(localctx, 20, self.RULE_assignment)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 101
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==20:
                self.state = 98
                self.match(expressionParser.T__19)
                self.state = 103
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 104
            self.match(expressionParser.IDENTIFIER)

            self.state = 105
            self.match(expressionParser.T__20)
            self.state = 106
            self.expr(0)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ConversionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def type_(self):
            return self.getTypedRuleContext(expressionParser.TypeContext,0)


        def expr(self):
            return self.getTypedRuleContext(expressionParser.ExprContext,0)


        def getRuleIndex(self):
            return expressionParser.RULE_conversion

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterConversion" ):
                listener.enterConversion(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitConversion" ):
                listener.exitConversion(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitConversion" ):
                return visitor.visitConversion(self)
            else:
                return visitor.visitChildren(self)




    def conversion(self):

        localctx = expressionParser.ConversionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 22, self.RULE_conversion)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 108
            self.match(expressionParser.T__1)
            self.state = 109
            self.type_()
            self.state = 110
            self.match(expressionParser.T__2)
            self.state = 111
            self.expr(0)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ExprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def literal(self):
            return self.getTypedRuleContext(expressionParser.LiteralContext,0)


        def type_(self):
            return self.getTypedRuleContext(expressionParser.TypeContext,0)


        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.ExprContext)
            else:
                return self.getTypedRuleContext(expressionParser.ExprContext,i)


        def IDENTIFIER(self):
            return self.getToken(expressionParser.IDENTIFIER, 0)

        def getRuleIndex(self):
            return expressionParser.RULE_expr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterExpr" ):
                listener.enterExpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitExpr" ):
                listener.exitExpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitExpr" ):
                return visitor.visitExpr(self)
            else:
                return visitor.visitChildren(self)



    def expr(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = expressionParser.ExprContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 24
        self.enterRecursionRule(localctx, 24, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 130
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,10,self._ctx)
            if la_ == 1:
                self.state = 114
                self.literal()
                pass

            elif la_ == 2:
                self.state = 115
                self.match(expressionParser.T__1)
                self.state = 116
                self.type_()
                self.state = 117
                self.match(expressionParser.T__2)
                self.state = 118
                self.expr(15)
                pass

            elif la_ == 3:
                self.state = 120
                self.match(expressionParser.T__1)
                self.state = 121
                self.expr(0)
                self.state = 122
                self.match(expressionParser.T__2)
                pass

            elif la_ == 4:
                self.state = 124
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 30408704) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 125
                self.expr(13)
                pass

            elif la_ == 5:
                self.state = 126
                self.match(expressionParser.IDENTIFIER)
                self.state = 127
                _la = self._input.LA(1)
                if not(_la==22 or _la==23):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                pass

            elif la_ == 6:
                self.state = 128
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 503316480) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 129
                self.expr(11)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 164
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,12,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 162
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,11,self._ctx)
                    if la_ == 1:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 132
                        if not self.precpred(self._ctx, 10):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 10)")
                        self.state = 133
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 1611661312) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 134
                        self.expr(11)
                        pass

                    elif la_ == 2:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 135
                        if not self.precpred(self._ctx, 9):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 9)")
                        self.state = 136
                        _la = self._input.LA(1)
                        if not(_la==25 or _la==26):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 137
                        self.expr(10)
                        pass

                    elif la_ == 3:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 138
                        if not self.precpred(self._ctx, 8):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 8)")
                        self.state = 139
                        _la = self._input.LA(1)
                        if not(_la==31 or _la==32):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 140
                        self.expr(9)
                        pass

                    elif la_ == 4:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 141
                        if not self.precpred(self._ctx, 7):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 7)")
                        self.state = 142
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 128849018880) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 143
                        self.expr(8)
                        pass

                    elif la_ == 5:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 144
                        if not self.precpred(self._ctx, 6):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 6)")
                        self.state = 145
                        _la = self._input.LA(1)
                        if not(_la==37 or _la==38):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 146
                        self.expr(7)
                        pass

                    elif la_ == 6:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 147
                        if not self.precpred(self._ctx, 5):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 5)")
                        self.state = 148
                        self.match(expressionParser.T__23)
                        self.state = 149
                        self.expr(6)
                        pass

                    elif la_ == 7:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 150
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 151
                        self.match(expressionParser.T__38)
                        self.state = 152
                        self.expr(5)
                        pass

                    elif la_ == 8:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 153
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 154
                        self.match(expressionParser.T__39)
                        self.state = 155
                        self.expr(4)
                        pass

                    elif la_ == 9:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 156
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 157
                        self.match(expressionParser.T__40)
                        self.state = 158
                        self.expr(3)
                        pass

                    elif la_ == 10:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 159
                        if not self.precpred(self._ctx, 1):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                        self.state = 160
                        self.match(expressionParser.T__41)
                        self.state = 161
                        self.expr(2)
                        pass

             
                self.state = 166
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,12,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class LiteralContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def INT(self):
            return self.getToken(expressionParser.INT, 0)

        def FLOAT(self):
            return self.getToken(expressionParser.FLOAT, 0)

        def CHAR(self):
            return self.getToken(expressionParser.CHAR, 0)

        def IDENTIFIER(self):
            return self.getToken(expressionParser.IDENTIFIER, 0)

        def conversion(self):
            return self.getTypedRuleContext(expressionParser.ConversionContext,0)


        def getRuleIndex(self):
            return expressionParser.RULE_literal

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterLiteral" ):
                listener.enterLiteral(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitLiteral" ):
                listener.exitLiteral(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitLiteral" ):
                return visitor.visitLiteral(self)
            else:
                return visitor.visitChildren(self)




    def literal(self):

        localctx = expressionParser.LiteralContext(self, self._ctx, self.state)
        self.enterRule(localctx, 26, self.RULE_literal)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 172
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [46]:
                self.state = 167
                self.match(expressionParser.INT)
                pass
            elif token in [47]:
                self.state = 168
                self.match(expressionParser.FLOAT)
                pass
            elif token in [48]:
                self.state = 169
                self.match(expressionParser.CHAR)
                pass
            elif token in [45]:
                self.state = 170
                self.match(expressionParser.IDENTIFIER)
                pass
            elif token in [2]:
                self.state = 171
                self.conversion()
                pass
            else:
                raise NoViableAltException(self)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx



    def sempred(self, localctx:RuleContext, ruleIndex:int, predIndex:int):
        if self._predicates == None:
            self._predicates = dict()
        self._predicates[12] = self.expr_sempred
        pred = self._predicates.get(ruleIndex, None)
        if pred is None:
            raise Exception("No predicate with index:" + str(ruleIndex))
        else:
            return pred(localctx, predIndex)

    def expr_sempred(self, localctx:ExprContext, predIndex:int):
            if predIndex == 0:
                return self.precpred(self._ctx, 10)
         

            if predIndex == 1:
                return self.precpred(self._ctx, 9)
         

            if predIndex == 2:
                return self.precpred(self._ctx, 8)
         

            if predIndex == 3:
                return self.precpred(self._ctx, 7)
         

            if predIndex == 4:
                return self.precpred(self._ctx, 6)
         

            if predIndex == 5:
                return self.precpred(self._ctx, 5)
         

            if predIndex == 6:
                return self.precpred(self._ctx, 4)
         

            if predIndex == 7:
                return self.precpred(self._ctx, 3)
         

            if predIndex == 8:
                return self.precpred(self._ctx, 2)
         

            if predIndex == 9:
                return self.precpred(self._ctx, 1)
         




