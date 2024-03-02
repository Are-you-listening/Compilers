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
        4,1,48,206,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,1,0,1,0,
        1,0,1,1,1,1,1,1,5,1,33,8,1,10,1,12,1,36,9,1,1,2,1,2,5,2,40,8,2,10,
        2,12,2,43,9,2,1,2,1,2,3,2,47,8,2,1,3,1,3,1,3,1,3,1,3,1,3,1,3,1,3,
        1,4,1,4,1,4,1,4,1,4,3,4,62,8,4,1,4,4,4,65,8,4,11,4,12,4,66,1,5,1,
        5,1,5,1,5,1,6,1,6,1,6,1,6,1,6,1,6,3,6,79,8,6,1,6,1,6,1,6,1,6,1,6,
        1,6,1,6,3,6,88,8,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,3,6,97,8,6,1,6,1,
        6,1,6,1,6,1,6,1,6,1,6,3,6,106,8,6,1,6,1,6,1,6,1,6,1,6,1,6,1,6,3,
        6,115,8,6,1,6,3,6,118,8,6,1,7,3,7,121,8,7,1,7,1,7,5,7,125,8,7,10,
        7,12,7,128,9,7,1,8,1,8,1,8,1,8,3,8,134,8,8,1,9,1,9,1,9,1,9,1,10,
        1,10,1,10,1,10,1,10,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,
        1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,3,11,162,8,11,1,11,1,11,
        1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,
        1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,1,11,
        1,11,1,11,5,11,194,8,11,10,11,12,11,197,9,11,1,12,1,12,1,12,1,12,
        1,12,3,12,204,8,12,1,12,1,41,1,22,13,0,2,4,6,8,10,12,14,16,18,20,
        22,24,0,9,1,0,17,19,2,0,20,20,22,24,1,0,22,23,1,0,25,28,2,0,20,20,
        29,30,1,0,25,26,1,0,31,32,1,0,33,36,1,0,37,38,233,0,26,1,0,0,0,2,
        34,1,0,0,0,4,46,1,0,0,0,6,48,1,0,0,0,8,61,1,0,0,0,10,68,1,0,0,0,
        12,117,1,0,0,0,14,120,1,0,0,0,16,129,1,0,0,0,18,135,1,0,0,0,20,139,
        1,0,0,0,22,161,1,0,0,0,24,203,1,0,0,0,26,27,3,2,1,0,27,28,5,0,0,
        1,28,1,1,0,0,0,29,33,3,6,3,0,30,33,3,8,4,0,31,33,3,4,2,0,32,29,1,
        0,0,0,32,30,1,0,0,0,32,31,1,0,0,0,33,36,1,0,0,0,34,32,1,0,0,0,34,
        35,1,0,0,0,35,3,1,0,0,0,36,34,1,0,0,0,37,41,5,1,0,0,38,40,9,0,0,
        0,39,38,1,0,0,0,40,43,1,0,0,0,41,42,1,0,0,0,41,39,1,0,0,0,42,44,
        1,0,0,0,43,41,1,0,0,0,44,47,5,2,0,0,45,47,5,43,0,0,46,37,1,0,0,0,
        46,45,1,0,0,0,47,5,1,0,0,0,48,49,3,14,7,0,49,50,5,44,0,0,50,51,5,
        3,0,0,51,52,5,4,0,0,52,53,5,5,0,0,53,54,3,2,1,0,54,55,5,6,0,0,55,
        7,1,0,0,0,56,62,3,16,8,0,57,62,3,22,11,0,58,62,3,18,9,0,59,62,3,
        10,5,0,60,62,3,12,6,0,61,56,1,0,0,0,61,57,1,0,0,0,61,58,1,0,0,0,
        61,59,1,0,0,0,61,60,1,0,0,0,62,64,1,0,0,0,63,65,5,7,0,0,64,63,1,
        0,0,0,65,66,1,0,0,0,66,64,1,0,0,0,66,67,1,0,0,0,67,9,1,0,0,0,68,
        69,5,8,0,0,69,70,3,14,7,0,70,71,5,44,0,0,71,11,1,0,0,0,72,73,5,9,
        0,0,73,74,5,3,0,0,74,75,5,10,0,0,75,78,5,11,0,0,76,79,5,44,0,0,77,
        79,3,24,12,0,78,76,1,0,0,0,78,77,1,0,0,0,79,80,1,0,0,0,80,118,5,
        4,0,0,81,82,5,9,0,0,82,83,5,3,0,0,83,84,5,12,0,0,84,87,5,11,0,0,
        85,88,5,44,0,0,86,88,3,24,12,0,87,85,1,0,0,0,87,86,1,0,0,0,88,89,
        1,0,0,0,89,118,5,4,0,0,90,91,5,9,0,0,91,92,5,3,0,0,92,93,5,13,0,
        0,93,96,5,11,0,0,94,97,5,44,0,0,95,97,3,24,12,0,96,94,1,0,0,0,96,
        95,1,0,0,0,97,98,1,0,0,0,98,118,5,4,0,0,99,100,5,9,0,0,100,101,5,
        3,0,0,101,102,5,14,0,0,102,105,5,11,0,0,103,106,5,44,0,0,104,106,
        3,24,12,0,105,103,1,0,0,0,105,104,1,0,0,0,106,107,1,0,0,0,107,118,
        5,4,0,0,108,109,5,9,0,0,109,110,5,3,0,0,110,111,5,15,0,0,111,114,
        5,11,0,0,112,115,5,44,0,0,113,115,3,24,12,0,114,112,1,0,0,0,114,
        113,1,0,0,0,115,116,1,0,0,0,116,118,5,4,0,0,117,72,1,0,0,0,117,81,
        1,0,0,0,117,90,1,0,0,0,117,99,1,0,0,0,117,108,1,0,0,0,118,13,1,0,
        0,0,119,121,5,16,0,0,120,119,1,0,0,0,120,121,1,0,0,0,121,122,1,0,
        0,0,122,126,7,0,0,0,123,125,5,20,0,0,124,123,1,0,0,0,125,128,1,0,
        0,0,126,124,1,0,0,0,126,127,1,0,0,0,127,15,1,0,0,0,128,126,1,0,0,
        0,129,130,3,14,7,0,130,133,5,44,0,0,131,132,5,21,0,0,132,134,3,22,
        11,0,133,131,1,0,0,0,133,134,1,0,0,0,134,17,1,0,0,0,135,136,5,44,
        0,0,136,137,5,21,0,0,137,138,3,22,11,0,138,19,1,0,0,0,139,140,5,
        3,0,0,140,141,3,14,7,0,141,142,5,4,0,0,142,143,3,24,12,0,143,21,
        1,0,0,0,144,145,6,11,-1,0,145,162,3,24,12,0,146,147,5,3,0,0,147,
        148,3,14,7,0,148,149,5,4,0,0,149,150,3,22,11,15,150,162,1,0,0,0,
        151,152,5,3,0,0,152,153,3,22,11,0,153,154,5,4,0,0,154,162,1,0,0,
        0,155,156,7,1,0,0,156,162,5,44,0,0,157,158,5,44,0,0,158,162,7,2,
        0,0,159,160,7,3,0,0,160,162,3,22,11,11,161,144,1,0,0,0,161,146,1,
        0,0,0,161,151,1,0,0,0,161,155,1,0,0,0,161,157,1,0,0,0,161,159,1,
        0,0,0,162,195,1,0,0,0,163,164,10,10,0,0,164,165,7,4,0,0,165,194,
        3,22,11,11,166,167,10,9,0,0,167,168,7,5,0,0,168,194,3,22,11,10,169,
        170,10,8,0,0,170,171,7,6,0,0,171,194,3,22,11,9,172,173,10,7,0,0,
        173,174,7,7,0,0,174,194,3,22,11,8,175,176,10,6,0,0,176,177,7,8,0,
        0,177,194,3,22,11,7,178,179,10,5,0,0,179,180,5,24,0,0,180,194,3,
        22,11,6,181,182,10,4,0,0,182,183,5,39,0,0,183,194,3,22,11,5,184,
        185,10,3,0,0,185,186,5,40,0,0,186,194,3,22,11,4,187,188,10,2,0,0,
        188,189,5,41,0,0,189,194,3,22,11,3,190,191,10,1,0,0,191,192,5,42,
        0,0,192,194,3,22,11,2,193,163,1,0,0,0,193,166,1,0,0,0,193,169,1,
        0,0,0,193,172,1,0,0,0,193,175,1,0,0,0,193,178,1,0,0,0,193,181,1,
        0,0,0,193,184,1,0,0,0,193,187,1,0,0,0,193,190,1,0,0,0,194,197,1,
        0,0,0,195,193,1,0,0,0,195,196,1,0,0,0,196,23,1,0,0,0,197,195,1,0,
        0,0,198,204,5,45,0,0,199,204,5,46,0,0,200,204,5,47,0,0,201,204,5,
        44,0,0,202,204,3,20,10,0,203,198,1,0,0,0,203,199,1,0,0,0,203,200,
        1,0,0,0,203,201,1,0,0,0,203,202,1,0,0,0,204,25,1,0,0,0,19,32,34,
        41,46,61,66,78,87,96,105,114,117,120,126,133,161,193,195,203
    ]

class expressionParser ( Parser ):

    grammarFileName = "expression.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'/*'", "'*/'", "'('", "')'", "'{'", "'}'", 
                     "';'", "'typedef'", "'printf'", "'%s'", "','", "'%d'", 
                     "'%x'", "'%f'", "'%c'", "'const'", "'int'", "'char'", 
                     "'float'", "'*'", "'='", "'++'", "'--'", "'&'", "'+'", 
                     "'-'", "'~'", "'!'", "'/'", "'%'", "'>>'", "'<<'", 
                     "'<'", "'>'", "'>='", "'<='", "'=='", "'!='", "'^'", 
                     "'|'", "'&&'", "'||'" ]

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
                      "<INVALID>", "<INVALID>", "<INVALID>", "SINGLECOMMENT", 
                      "IDENTIFIER", "INT", "FLOAT", "CHAR", "WS" ]

    RULE_start_ = 0
    RULE_code = 1
    RULE_comment = 2
    RULE_function = 3
    RULE_line = 4
    RULE_typedef = 5
    RULE_printf = 6
    RULE_type = 7
    RULE_declaration = 8
    RULE_assignment = 9
    RULE_conversion = 10
    RULE_expr = 11
    RULE_literal = 12

    ruleNames =  [ "start_", "code", "comment", "function", "line", "typedef", 
                   "printf", "type", "declaration", "assignment", "conversion", 
                   "expr", "literal" ]

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
    SINGLECOMMENT=43
    IDENTIFIER=44
    INT=45
    FLOAT=46
    CHAR=47
    WS=48

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
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 26
            self.code()
            self.state = 27
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
            self.state = 34
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 272679418397450) != 0):
                self.state = 32
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,0,self._ctx)
                if la_ == 1:
                    self.state = 29
                    self.function()
                    pass

                elif la_ == 2:
                    self.state = 30
                    self.line()
                    pass

                elif la_ == 3:
                    self.state = 31
                    self.comment()
                    pass


                self.state = 36
                self._errHandler.sync(self)
                _la = self._input.LA(1)

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
        self.enterRule(localctx, 4, self.RULE_comment)
        try:
            self.state = 46
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [1]:
                self.enterOuterAlt(localctx, 1)
                self.state = 37
                self.match(expressionParser.T__0)
                self.state = 41
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,2,self._ctx)
                while _alt!=1 and _alt!=ATN.INVALID_ALT_NUMBER:
                    if _alt==1+1:
                        self.state = 38
                        self.matchWildcard() 
                    self.state = 43
                    self._errHandler.sync(self)
                    _alt = self._interp.adaptivePredict(self._input,2,self._ctx)

                self.state = 44
                self.match(expressionParser.T__1)
                pass
            elif token in [43]:
                self.enterOuterAlt(localctx, 2)
                self.state = 45
                self.match(expressionParser.SINGLECOMMENT)
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
        self.enterRule(localctx, 6, self.RULE_function)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 48
            self.type_()
            self.state = 49
            self.match(expressionParser.IDENTIFIER)
            self.state = 50
            self.match(expressionParser.T__2)
            self.state = 51
            self.match(expressionParser.T__3)
            self.state = 52
            self.match(expressionParser.T__4)
            self.state = 53
            self.code()
            self.state = 54
            self.match(expressionParser.T__5)
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
        self.enterRule(localctx, 8, self.RULE_line)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 61
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,4,self._ctx)
            if la_ == 1:
                self.state = 56
                self.declaration()
                pass

            elif la_ == 2:
                self.state = 57
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 58
                self.assignment()
                pass

            elif la_ == 4:
                self.state = 59
                self.typedef()
                pass

            elif la_ == 5:
                self.state = 60
                self.printf()
                pass


            self.state = 64 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 63
                self.match(expressionParser.T__6)
                self.state = 66 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not (_la==7):
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
        self.enterRule(localctx, 10, self.RULE_typedef)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 68
            self.match(expressionParser.T__7)
            self.state = 69
            self.type_()
            self.state = 70
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

        def IDENTIFIER(self):
            return self.getToken(expressionParser.IDENTIFIER, 0)

        def literal(self):
            return self.getTypedRuleContext(expressionParser.LiteralContext,0)


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
        self.enterRule(localctx, 12, self.RULE_printf)
        try:
            self.state = 117
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,11,self._ctx)
            if la_ == 1:
                self.enterOuterAlt(localctx, 1)
                self.state = 72
                self.match(expressionParser.T__8)
                self.state = 73
                self.match(expressionParser.T__2)
                self.state = 74
                self.match(expressionParser.T__9)
                self.state = 75
                self.match(expressionParser.T__10)
                self.state = 78
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,6,self._ctx)
                if la_ == 1:
                    self.state = 76
                    self.match(expressionParser.IDENTIFIER)
                    pass

                elif la_ == 2:
                    self.state = 77
                    self.literal()
                    pass


                self.state = 80
                self.match(expressionParser.T__3)
                pass

            elif la_ == 2:
                self.enterOuterAlt(localctx, 2)
                self.state = 81
                self.match(expressionParser.T__8)
                self.state = 82
                self.match(expressionParser.T__2)
                self.state = 83
                self.match(expressionParser.T__11)
                self.state = 84
                self.match(expressionParser.T__10)
                self.state = 87
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,7,self._ctx)
                if la_ == 1:
                    self.state = 85
                    self.match(expressionParser.IDENTIFIER)
                    pass

                elif la_ == 2:
                    self.state = 86
                    self.literal()
                    pass


                self.state = 89
                self.match(expressionParser.T__3)
                pass

            elif la_ == 3:
                self.enterOuterAlt(localctx, 3)
                self.state = 90
                self.match(expressionParser.T__8)
                self.state = 91
                self.match(expressionParser.T__2)
                self.state = 92
                self.match(expressionParser.T__12)
                self.state = 93
                self.match(expressionParser.T__10)
                self.state = 96
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,8,self._ctx)
                if la_ == 1:
                    self.state = 94
                    self.match(expressionParser.IDENTIFIER)
                    pass

                elif la_ == 2:
                    self.state = 95
                    self.literal()
                    pass


                self.state = 98
                self.match(expressionParser.T__3)
                pass

            elif la_ == 4:
                self.enterOuterAlt(localctx, 4)
                self.state = 99
                self.match(expressionParser.T__8)
                self.state = 100
                self.match(expressionParser.T__2)
                self.state = 101
                self.match(expressionParser.T__13)
                self.state = 102
                self.match(expressionParser.T__10)
                self.state = 105
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,9,self._ctx)
                if la_ == 1:
                    self.state = 103
                    self.match(expressionParser.IDENTIFIER)
                    pass

                elif la_ == 2:
                    self.state = 104
                    self.literal()
                    pass


                self.state = 107
                self.match(expressionParser.T__3)
                pass

            elif la_ == 5:
                self.enterOuterAlt(localctx, 5)
                self.state = 108
                self.match(expressionParser.T__8)
                self.state = 109
                self.match(expressionParser.T__2)
                self.state = 110
                self.match(expressionParser.T__14)
                self.state = 111
                self.match(expressionParser.T__10)
                self.state = 114
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,10,self._ctx)
                if la_ == 1:
                    self.state = 112
                    self.match(expressionParser.IDENTIFIER)
                    pass

                elif la_ == 2:
                    self.state = 113
                    self.literal()
                    pass


                self.state = 116
                self.match(expressionParser.T__3)
                pass


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
        self.enterRule(localctx, 14, self.RULE_type)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 120
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==16:
                self.state = 119
                self.match(expressionParser.T__15)


            self.state = 122
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 917504) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 126
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==20:
                self.state = 123
                self.match(expressionParser.T__19)
                self.state = 128
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
        self.enterRule(localctx, 16, self.RULE_declaration)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 129
            self.type_()
            self.state = 130
            self.match(expressionParser.IDENTIFIER)
            self.state = 133
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==21:
                self.state = 131
                self.match(expressionParser.T__20)
                self.state = 132
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
        self.enterRule(localctx, 18, self.RULE_assignment)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 135
            self.match(expressionParser.IDENTIFIER)

            self.state = 136
            self.match(expressionParser.T__20)
            self.state = 137
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
        self.enterRule(localctx, 20, self.RULE_conversion)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 139
            self.match(expressionParser.T__2)
            self.state = 140
            self.type_()
            self.state = 141
            self.match(expressionParser.T__3)
            self.state = 142
            self.literal()
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
        _startState = 22
        self.enterRecursionRule(localctx, 22, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 161
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,15,self._ctx)
            if la_ == 1:
                self.state = 145
                self.literal()
                pass

            elif la_ == 2:
                self.state = 146
                self.match(expressionParser.T__2)
                self.state = 147
                self.type_()
                self.state = 148
                self.match(expressionParser.T__3)
                self.state = 149
                self.expr(15)
                pass

            elif la_ == 3:
                self.state = 151
                self.match(expressionParser.T__2)
                self.state = 152
                self.expr(0)
                self.state = 153
                self.match(expressionParser.T__3)
                pass

            elif la_ == 4:
                self.state = 155
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 30408704) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 156
                self.match(expressionParser.IDENTIFIER)
                pass

            elif la_ == 5:
                self.state = 157
                self.match(expressionParser.IDENTIFIER)
                self.state = 158
                _la = self._input.LA(1)
                if not(_la==22 or _la==23):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                pass

            elif la_ == 6:
                self.state = 159
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 503316480) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 160
                self.expr(11)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 195
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,17,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 193
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,16,self._ctx)
                    if la_ == 1:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 163
                        if not self.precpred(self._ctx, 10):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 10)")
                        self.state = 164
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 1611661312) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 165
                        self.expr(11)
                        pass

                    elif la_ == 2:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 166
                        if not self.precpred(self._ctx, 9):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 9)")
                        self.state = 167
                        _la = self._input.LA(1)
                        if not(_la==25 or _la==26):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 168
                        self.expr(10)
                        pass

                    elif la_ == 3:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 169
                        if not self.precpred(self._ctx, 8):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 8)")
                        self.state = 170
                        _la = self._input.LA(1)
                        if not(_la==31 or _la==32):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 171
                        self.expr(9)
                        pass

                    elif la_ == 4:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 172
                        if not self.precpred(self._ctx, 7):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 7)")
                        self.state = 173
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 128849018880) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 174
                        self.expr(8)
                        pass

                    elif la_ == 5:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 175
                        if not self.precpred(self._ctx, 6):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 6)")
                        self.state = 176
                        _la = self._input.LA(1)
                        if not(_la==37 or _la==38):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 177
                        self.expr(7)
                        pass

                    elif la_ == 6:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 178
                        if not self.precpred(self._ctx, 5):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 5)")
                        self.state = 179
                        self.match(expressionParser.T__23)
                        self.state = 180
                        self.expr(6)
                        pass

                    elif la_ == 7:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 181
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 182
                        self.match(expressionParser.T__38)
                        self.state = 183
                        self.expr(5)
                        pass

                    elif la_ == 8:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 184
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 185
                        self.match(expressionParser.T__39)
                        self.state = 186
                        self.expr(4)
                        pass

                    elif la_ == 9:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 187
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 188
                        self.match(expressionParser.T__40)
                        self.state = 189
                        self.expr(3)
                        pass

                    elif la_ == 10:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 190
                        if not self.precpred(self._ctx, 1):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                        self.state = 191
                        self.match(expressionParser.T__41)
                        self.state = 192
                        self.expr(2)
                        pass

             
                self.state = 197
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,17,self._ctx)

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
        self.enterRule(localctx, 24, self.RULE_literal)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 203
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [45]:
                self.state = 198
                self.match(expressionParser.INT)
                pass
            elif token in [46]:
                self.state = 199
                self.match(expressionParser.FLOAT)
                pass
            elif token in [47]:
                self.state = 200
                self.match(expressionParser.CHAR)
                pass
            elif token in [44]:
                self.state = 201
                self.match(expressionParser.IDENTIFIER)
                pass
            elif token in [3]:
                self.state = 202
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
        self._predicates[11] = self.expr_sempred
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
         




