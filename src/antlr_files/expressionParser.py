# Generated from /home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/grammar/expression.g4 by ANTLR 4.13.1
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
        4,1,50,195,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,
        2,14,7,14,1,0,3,0,32,8,0,1,0,1,0,1,0,1,1,1,1,1,1,5,1,40,8,1,10,1,
        12,1,43,9,1,1,2,1,2,1,3,1,3,1,4,1,4,1,4,1,4,1,4,1,4,1,4,3,4,56,8,
        4,1,4,1,4,1,5,1,5,1,5,1,5,1,5,3,5,65,8,5,1,5,4,5,68,8,5,11,5,12,
        5,69,1,6,1,6,1,6,1,6,1,7,1,7,1,7,1,7,5,7,80,8,7,10,7,12,7,83,9,7,
        1,7,1,7,5,7,87,8,7,10,7,12,7,90,9,7,1,7,1,7,1,7,1,7,1,7,1,8,3,8,
        98,8,8,1,8,1,8,5,8,102,8,8,10,8,12,8,105,9,8,1,9,1,9,1,9,1,9,3,9,
        111,8,9,1,10,5,10,114,8,10,10,10,12,10,117,9,10,1,10,1,10,1,10,1,
        10,1,11,1,11,1,11,1,11,1,11,3,11,128,8,11,1,12,1,12,1,12,1,12,1,
        12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,3,
        12,147,8,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,
        12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,
        12,1,12,1,12,1,12,1,12,1,12,1,12,5,12,179,8,12,10,12,12,12,182,9,
        12,1,13,1,13,1,13,1,13,1,13,3,13,189,8,13,1,14,1,14,3,14,193,8,14,
        1,14,2,81,88,1,24,15,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,0,11,
        1,0,44,45,1,0,10,14,2,0,17,19,46,46,2,0,20,20,22,24,1,0,22,23,1,
        0,25,28,2,0,20,20,29,30,1,0,25,26,1,0,31,32,1,0,33,36,1,0,37,38,
        216,0,31,1,0,0,0,2,41,1,0,0,0,4,44,1,0,0,0,6,46,1,0,0,0,8,48,1,0,
        0,0,10,64,1,0,0,0,12,71,1,0,0,0,14,75,1,0,0,0,16,97,1,0,0,0,18,106,
        1,0,0,0,20,115,1,0,0,0,22,122,1,0,0,0,24,146,1,0,0,0,26,188,1,0,
        0,0,28,190,1,0,0,0,30,32,3,4,2,0,31,30,1,0,0,0,31,32,1,0,0,0,32,
        33,1,0,0,0,33,34,3,2,1,0,34,35,5,0,0,1,35,1,1,0,0,0,36,40,3,8,4,
        0,37,40,3,10,5,0,38,40,3,6,3,0,39,36,1,0,0,0,39,37,1,0,0,0,39,38,
        1,0,0,0,40,43,1,0,0,0,41,39,1,0,0,0,41,42,1,0,0,0,42,3,1,0,0,0,43,
        41,1,0,0,0,44,45,5,1,0,0,45,5,1,0,0,0,46,47,7,0,0,0,47,7,1,0,0,0,
        48,49,3,16,8,0,49,50,5,46,0,0,50,51,5,2,0,0,51,52,5,3,0,0,52,53,
        5,4,0,0,53,55,3,2,1,0,54,56,3,28,14,0,55,54,1,0,0,0,55,56,1,0,0,
        0,56,57,1,0,0,0,57,58,5,5,0,0,58,9,1,0,0,0,59,65,3,18,9,0,60,65,
        3,24,12,0,61,65,3,20,10,0,62,65,3,12,6,0,63,65,3,14,7,0,64,59,1,
        0,0,0,64,60,1,0,0,0,64,61,1,0,0,0,64,62,1,0,0,0,64,63,1,0,0,0,65,
        67,1,0,0,0,66,68,5,6,0,0,67,66,1,0,0,0,68,69,1,0,0,0,69,67,1,0,0,
        0,69,70,1,0,0,0,70,11,1,0,0,0,71,72,5,7,0,0,72,73,3,16,8,0,73,74,
        5,46,0,0,74,13,1,0,0,0,75,76,5,8,0,0,76,77,5,2,0,0,77,81,5,9,0,0,
        78,80,9,0,0,0,79,78,1,0,0,0,80,83,1,0,0,0,81,82,1,0,0,0,81,79,1,
        0,0,0,82,84,1,0,0,0,83,81,1,0,0,0,84,88,7,1,0,0,85,87,9,0,0,0,86,
        85,1,0,0,0,87,90,1,0,0,0,88,89,1,0,0,0,88,86,1,0,0,0,89,91,1,0,0,
        0,90,88,1,0,0,0,91,92,5,9,0,0,92,93,5,15,0,0,93,94,3,24,12,0,94,
        95,5,3,0,0,95,15,1,0,0,0,96,98,5,16,0,0,97,96,1,0,0,0,97,98,1,0,
        0,0,98,99,1,0,0,0,99,103,7,2,0,0,100,102,5,20,0,0,101,100,1,0,0,
        0,102,105,1,0,0,0,103,101,1,0,0,0,103,104,1,0,0,0,104,17,1,0,0,0,
        105,103,1,0,0,0,106,107,3,16,8,0,107,110,5,46,0,0,108,109,5,21,0,
        0,109,111,3,24,12,0,110,108,1,0,0,0,110,111,1,0,0,0,111,19,1,0,0,
        0,112,114,5,20,0,0,113,112,1,0,0,0,114,117,1,0,0,0,115,113,1,0,0,
        0,115,116,1,0,0,0,116,118,1,0,0,0,117,115,1,0,0,0,118,119,5,46,0,
        0,119,120,5,21,0,0,120,121,3,24,12,0,121,21,1,0,0,0,122,123,5,2,
        0,0,123,124,3,16,8,0,124,127,5,3,0,0,125,128,3,26,13,0,126,128,3,
        24,12,0,127,125,1,0,0,0,127,126,1,0,0,0,128,23,1,0,0,0,129,130,6,
        12,-1,0,130,147,3,26,13,0,131,132,5,2,0,0,132,133,3,16,8,0,133,134,
        5,3,0,0,134,135,3,24,12,15,135,147,1,0,0,0,136,137,5,2,0,0,137,138,
        3,24,12,0,138,139,5,3,0,0,139,147,1,0,0,0,140,141,7,3,0,0,141,147,
        3,24,12,13,142,143,5,46,0,0,143,147,7,4,0,0,144,145,7,5,0,0,145,
        147,3,24,12,11,146,129,1,0,0,0,146,131,1,0,0,0,146,136,1,0,0,0,146,
        140,1,0,0,0,146,142,1,0,0,0,146,144,1,0,0,0,147,180,1,0,0,0,148,
        149,10,10,0,0,149,150,7,6,0,0,150,179,3,24,12,11,151,152,10,9,0,
        0,152,153,7,7,0,0,153,179,3,24,12,10,154,155,10,8,0,0,155,156,7,
        8,0,0,156,179,3,24,12,9,157,158,10,7,0,0,158,159,7,9,0,0,159,179,
        3,24,12,8,160,161,10,6,0,0,161,162,7,10,0,0,162,179,3,24,12,7,163,
        164,10,5,0,0,164,165,5,24,0,0,165,179,3,24,12,6,166,167,10,4,0,0,
        167,168,5,39,0,0,168,179,3,24,12,5,169,170,10,3,0,0,170,171,5,40,
        0,0,171,179,3,24,12,4,172,173,10,2,0,0,173,174,5,41,0,0,174,179,
        3,24,12,3,175,176,10,1,0,0,176,177,5,42,0,0,177,179,3,24,12,2,178,
        148,1,0,0,0,178,151,1,0,0,0,178,154,1,0,0,0,178,157,1,0,0,0,178,
        160,1,0,0,0,178,163,1,0,0,0,178,166,1,0,0,0,178,169,1,0,0,0,178,
        172,1,0,0,0,178,175,1,0,0,0,179,182,1,0,0,0,180,178,1,0,0,0,180,
        181,1,0,0,0,181,25,1,0,0,0,182,180,1,0,0,0,183,189,5,47,0,0,184,
        189,5,48,0,0,185,189,5,49,0,0,186,189,5,46,0,0,187,189,3,22,11,0,
        188,183,1,0,0,0,188,184,1,0,0,0,188,185,1,0,0,0,188,186,1,0,0,0,
        188,187,1,0,0,0,189,27,1,0,0,0,190,192,5,43,0,0,191,193,5,6,0,0,
        192,191,1,0,0,0,192,193,1,0,0,0,193,29,1,0,0,0,18,31,39,41,55,64,
        69,81,88,97,103,110,115,127,146,178,180,188,192
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
                     "'!='", "'^'", "'|'", "'&&'", "'||'", "'return 0'" ]

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
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "MULTILINE", "SINGLECOMMENT", "IDENTIFIER", "INT", 
                      "FLOAT", "CHAR", "WS" ]

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
    RULE_return = 14

    ruleNames =  [ "start_", "code", "include", "comment", "function", "line", 
                   "typedef", "printf", "type", "declaration", "assignment", 
                   "conversion", "expr", "literal", "return" ]

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
    T__42=43
    MULTILINE=44
    SINGLECOMMENT=45
    IDENTIFIER=46
    INT=47
    FLOAT=48
    CHAR=49
    WS=50

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
            self.state = 31
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==1:
                self.state = 30
                self.include()


            self.state = 33
            self.code()
            self.state = 34
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
            self.state = 41
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 1108308255506820) != 0):
                self.state = 39
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,1,self._ctx)
                if la_ == 1:
                    self.state = 36
                    self.function()
                    pass

                elif la_ == 2:
                    self.state = 37
                    self.line()
                    pass

                elif la_ == 3:
                    self.state = 38
                    self.comment()
                    pass


                self.state = 43
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
            self.state = 44
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
            self.state = 46
            _la = self._input.LA(1)
            if not(_la==44 or _la==45):
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


        def return_(self):
            return self.getTypedRuleContext(expressionParser.ReturnContext,0)


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
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 48
            self.type_()
            self.state = 49
            self.match(expressionParser.IDENTIFIER)
            self.state = 50
            self.match(expressionParser.T__1)
            self.state = 51
            self.match(expressionParser.T__2)
            self.state = 52
            self.match(expressionParser.T__3)
            self.state = 53
            self.code()
            self.state = 55
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==43:
                self.state = 54
                self.return_()


            self.state = 57
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
            self.state = 64
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,4,self._ctx)
            if la_ == 1:
                self.state = 59
                self.declaration()
                pass

            elif la_ == 2:
                self.state = 60
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 61
                self.assignment()
                pass

            elif la_ == 4:
                self.state = 62
                self.typedef()
                pass

            elif la_ == 5:
                self.state = 63
                self.printf()
                pass


            self.state = 67 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 66
                self.match(expressionParser.T__5)
                self.state = 69 
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
            self.state = 71
            self.match(expressionParser.T__6)
            self.state = 72
            self.type_()
            self.state = 73
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
            self.state = 75
            self.match(expressionParser.T__7)
            self.state = 76
            self.match(expressionParser.T__1)
            self.state = 77
            self.match(expressionParser.T__8)
            self.state = 81
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,6,self._ctx)
            while _alt!=1 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1+1:
                    self.state = 78
                    self.matchWildcard() 
                self.state = 83
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,6,self._ctx)

            self.state = 84
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 31744) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 88
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,7,self._ctx)
            while _alt!=1 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1+1:
                    self.state = 85
                    self.matchWildcard() 
                self.state = 90
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,7,self._ctx)

            self.state = 91
            self.match(expressionParser.T__8)
            self.state = 92
            self.match(expressionParser.T__14)

            self.state = 93
            self.expr(0)
            self.state = 94
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
            self.state = 97
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==16:
                self.state = 96
                self.match(expressionParser.T__15)


            self.state = 99
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 70368745095168) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 103
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==20:
                self.state = 100
                self.match(expressionParser.T__19)
                self.state = 105
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
            self.state = 106
            self.type_()
            self.state = 107
            self.match(expressionParser.IDENTIFIER)
            self.state = 110
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==21:
                self.state = 108
                self.match(expressionParser.T__20)
                self.state = 109
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
            self.state = 115
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==20:
                self.state = 112
                self.match(expressionParser.T__19)
                self.state = 117
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 118
            self.match(expressionParser.IDENTIFIER)

            self.state = 119
            self.match(expressionParser.T__20)
            self.state = 120
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


        def literal(self):
            return self.getTypedRuleContext(expressionParser.LiteralContext,0)


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
            self.state = 122
            self.match(expressionParser.T__1)
            self.state = 123
            self.type_()
            self.state = 124
            self.match(expressionParser.T__2)
            self.state = 127
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,12,self._ctx)
            if la_ == 1:
                self.state = 125
                self.literal()
                pass

            elif la_ == 2:
                self.state = 126
                self.expr(0)
                pass


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
            self.state = 146
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,13,self._ctx)
            if la_ == 1:
                self.state = 130
                self.literal()
                pass

            elif la_ == 2:
                self.state = 131
                self.match(expressionParser.T__1)
                self.state = 132
                self.type_()
                self.state = 133
                self.match(expressionParser.T__2)
                self.state = 134
                self.expr(15)
                pass

            elif la_ == 3:
                self.state = 136
                self.match(expressionParser.T__1)
                self.state = 137
                self.expr(0)
                self.state = 138
                self.match(expressionParser.T__2)
                pass

            elif la_ == 4:
                self.state = 140
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 30408704) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 141
                self.expr(13)
                pass

            elif la_ == 5:
                self.state = 142
                self.match(expressionParser.IDENTIFIER)
                self.state = 143
                _la = self._input.LA(1)
                if not(_la==22 or _la==23):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                pass

            elif la_ == 6:
                self.state = 144
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 503316480) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 145
                self.expr(11)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 180
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,15,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 178
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,14,self._ctx)
                    if la_ == 1:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 148
                        if not self.precpred(self._ctx, 10):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 10)")
                        self.state = 149
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 1611661312) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 150
                        self.expr(11)
                        pass

                    elif la_ == 2:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 151
                        if not self.precpred(self._ctx, 9):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 9)")
                        self.state = 152
                        _la = self._input.LA(1)
                        if not(_la==25 or _la==26):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 153
                        self.expr(10)
                        pass

                    elif la_ == 3:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 154
                        if not self.precpred(self._ctx, 8):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 8)")
                        self.state = 155
                        _la = self._input.LA(1)
                        if not(_la==31 or _la==32):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 156
                        self.expr(9)
                        pass

                    elif la_ == 4:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 157
                        if not self.precpred(self._ctx, 7):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 7)")
                        self.state = 158
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 128849018880) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 159
                        self.expr(8)
                        pass

                    elif la_ == 5:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 160
                        if not self.precpred(self._ctx, 6):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 6)")
                        self.state = 161
                        _la = self._input.LA(1)
                        if not(_la==37 or _la==38):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 162
                        self.expr(7)
                        pass

                    elif la_ == 6:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 163
                        if not self.precpred(self._ctx, 5):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 5)")
                        self.state = 164
                        self.match(expressionParser.T__23)
                        self.state = 165
                        self.expr(6)
                        pass

                    elif la_ == 7:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 166
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 167
                        self.match(expressionParser.T__38)
                        self.state = 168
                        self.expr(5)
                        pass

                    elif la_ == 8:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 169
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 170
                        self.match(expressionParser.T__39)
                        self.state = 171
                        self.expr(4)
                        pass

                    elif la_ == 9:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 172
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 173
                        self.match(expressionParser.T__40)
                        self.state = 174
                        self.expr(3)
                        pass

                    elif la_ == 10:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 175
                        if not self.precpred(self._ctx, 1):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                        self.state = 176
                        self.match(expressionParser.T__41)
                        self.state = 177
                        self.expr(2)
                        pass

             
                self.state = 182
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,15,self._ctx)

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
            self.state = 188
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [47]:
                self.state = 183
                self.match(expressionParser.INT)
                pass
            elif token in [48]:
                self.state = 184
                self.match(expressionParser.FLOAT)
                pass
            elif token in [49]:
                self.state = 185
                self.match(expressionParser.CHAR)
                pass
            elif token in [46]:
                self.state = 186
                self.match(expressionParser.IDENTIFIER)
                pass
            elif token in [2]:
                self.state = 187
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


    class ReturnContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser


        def getRuleIndex(self):
            return expressionParser.RULE_return

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterReturn" ):
                listener.enterReturn(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitReturn" ):
                listener.exitReturn(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitReturn" ):
                return visitor.visitReturn(self)
            else:
                return visitor.visitChildren(self)




    def return_(self):

        localctx = expressionParser.ReturnContext(self, self._ctx, self.state)
        self.enterRule(localctx, 28, self.RULE_return)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 190
            self.match(expressionParser.T__42)
            self.state = 192
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==6:
                self.state = 191
                self.match(expressionParser.T__5)


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
         




