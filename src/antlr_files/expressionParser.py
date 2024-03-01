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
        4,1,41,161,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,1,0,1,0,1,0,5,0,28,
        8,0,10,0,12,0,31,9,0,1,0,1,0,1,1,1,1,5,1,37,8,1,10,1,12,1,40,9,1,
        1,1,1,1,3,1,44,8,1,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,3,5,3,55,8,
        3,10,3,12,3,58,9,3,1,4,1,4,1,4,1,4,3,4,64,8,4,1,4,4,4,67,8,4,11,
        4,12,4,68,1,5,1,5,1,5,1,5,1,6,3,6,76,8,6,1,6,1,6,5,6,80,8,6,10,6,
        12,6,83,9,6,1,7,1,7,1,7,1,7,3,7,89,8,7,1,8,1,8,1,8,1,8,1,9,1,9,1,
        9,1,9,1,9,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,
        1,10,1,10,1,10,1,10,1,10,1,10,3,10,117,8,10,1,10,1,10,1,10,1,10,
        1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,
        1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,1,10,
        5,10,149,8,10,10,10,12,10,152,9,10,1,11,1,11,1,11,1,11,1,11,3,11,
        159,8,11,1,11,1,38,1,20,12,0,2,4,6,8,10,12,14,16,18,20,22,0,9,1,
        0,10,12,2,0,13,13,15,17,1,0,15,16,1,0,18,21,2,0,13,13,22,23,1,0,
        18,19,1,0,24,25,1,0,26,29,1,0,30,31,180,0,29,1,0,0,0,2,43,1,0,0,
        0,4,45,1,0,0,0,6,56,1,0,0,0,8,63,1,0,0,0,10,70,1,0,0,0,12,75,1,0,
        0,0,14,84,1,0,0,0,16,90,1,0,0,0,18,94,1,0,0,0,20,116,1,0,0,0,22,
        158,1,0,0,0,24,28,3,4,2,0,25,28,3,8,4,0,26,28,3,2,1,0,27,24,1,0,
        0,0,27,25,1,0,0,0,27,26,1,0,0,0,28,31,1,0,0,0,29,27,1,0,0,0,29,30,
        1,0,0,0,30,32,1,0,0,0,31,29,1,0,0,0,32,33,5,0,0,1,33,1,1,0,0,0,34,
        38,5,1,0,0,35,37,9,0,0,0,36,35,1,0,0,0,37,40,1,0,0,0,38,39,1,0,0,
        0,38,36,1,0,0,0,39,41,1,0,0,0,40,38,1,0,0,0,41,44,5,2,0,0,42,44,
        5,36,0,0,43,34,1,0,0,0,43,42,1,0,0,0,44,3,1,0,0,0,45,46,3,12,6,0,
        46,47,5,37,0,0,47,48,5,3,0,0,48,49,5,4,0,0,49,50,5,5,0,0,50,51,3,
        6,3,0,51,52,5,6,0,0,52,5,1,0,0,0,53,55,3,8,4,0,54,53,1,0,0,0,55,
        58,1,0,0,0,56,54,1,0,0,0,56,57,1,0,0,0,57,7,1,0,0,0,58,56,1,0,0,
        0,59,64,3,14,7,0,60,64,3,20,10,0,61,64,3,16,8,0,62,64,3,10,5,0,63,
        59,1,0,0,0,63,60,1,0,0,0,63,61,1,0,0,0,63,62,1,0,0,0,64,66,1,0,0,
        0,65,67,5,7,0,0,66,65,1,0,0,0,67,68,1,0,0,0,68,66,1,0,0,0,68,69,
        1,0,0,0,69,9,1,0,0,0,70,71,5,8,0,0,71,72,3,12,6,0,72,73,5,37,0,0,
        73,11,1,0,0,0,74,76,5,9,0,0,75,74,1,0,0,0,75,76,1,0,0,0,76,77,1,
        0,0,0,77,81,7,0,0,0,78,80,5,13,0,0,79,78,1,0,0,0,80,83,1,0,0,0,81,
        79,1,0,0,0,81,82,1,0,0,0,82,13,1,0,0,0,83,81,1,0,0,0,84,85,3,12,
        6,0,85,88,5,37,0,0,86,87,5,14,0,0,87,89,3,20,10,0,88,86,1,0,0,0,
        88,89,1,0,0,0,89,15,1,0,0,0,90,91,5,37,0,0,91,92,5,14,0,0,92,93,
        3,20,10,0,93,17,1,0,0,0,94,95,5,3,0,0,95,96,3,12,6,0,96,97,5,4,0,
        0,97,98,3,22,11,0,98,19,1,0,0,0,99,100,6,10,-1,0,100,117,3,22,11,
        0,101,102,5,3,0,0,102,103,3,12,6,0,103,104,5,4,0,0,104,105,3,20,
        10,15,105,117,1,0,0,0,106,107,5,3,0,0,107,108,3,20,10,0,108,109,
        5,4,0,0,109,117,1,0,0,0,110,111,7,1,0,0,111,117,5,37,0,0,112,113,
        5,37,0,0,113,117,7,2,0,0,114,115,7,3,0,0,115,117,3,20,10,11,116,
        99,1,0,0,0,116,101,1,0,0,0,116,106,1,0,0,0,116,110,1,0,0,0,116,112,
        1,0,0,0,116,114,1,0,0,0,117,150,1,0,0,0,118,119,10,10,0,0,119,120,
        7,4,0,0,120,149,3,20,10,11,121,122,10,9,0,0,122,123,7,5,0,0,123,
        149,3,20,10,10,124,125,10,8,0,0,125,126,7,6,0,0,126,149,3,20,10,
        9,127,128,10,7,0,0,128,129,7,7,0,0,129,149,3,20,10,8,130,131,10,
        6,0,0,131,132,7,8,0,0,132,149,3,20,10,7,133,134,10,5,0,0,134,135,
        5,17,0,0,135,149,3,20,10,6,136,137,10,4,0,0,137,138,5,32,0,0,138,
        149,3,20,10,5,139,140,10,3,0,0,140,141,5,33,0,0,141,149,3,20,10,
        4,142,143,10,2,0,0,143,144,5,34,0,0,144,149,3,20,10,3,145,146,10,
        1,0,0,146,147,5,35,0,0,147,149,3,20,10,2,148,118,1,0,0,0,148,121,
        1,0,0,0,148,124,1,0,0,0,148,127,1,0,0,0,148,130,1,0,0,0,148,133,
        1,0,0,0,148,136,1,0,0,0,148,139,1,0,0,0,148,142,1,0,0,0,148,145,
        1,0,0,0,149,152,1,0,0,0,150,148,1,0,0,0,150,151,1,0,0,0,151,21,1,
        0,0,0,152,150,1,0,0,0,153,159,5,38,0,0,154,159,5,39,0,0,155,159,
        5,40,0,0,156,159,5,37,0,0,157,159,3,18,9,0,158,153,1,0,0,0,158,154,
        1,0,0,0,158,155,1,0,0,0,158,156,1,0,0,0,158,157,1,0,0,0,159,23,1,
        0,0,0,14,27,29,38,43,56,63,68,75,81,88,116,148,150,158
    ]

class expressionParser ( Parser ):

    grammarFileName = "expression.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'/*'", "'*/'", "'('", "')'", "'{'", "'}'", 
                     "';'", "'typedef'", "'const'", "'int'", "'char'", "'float'", 
                     "'*'", "'='", "'++'", "'--'", "'&'", "'+'", "'-'", 
                     "'~'", "'!'", "'/'", "'%'", "'>>'", "'<<'", "'<'", 
                     "'>'", "'>='", "'<='", "'=='", "'!='", "'^'", "'|'", 
                     "'&&'", "'||'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "SINGLECOMMENT", "IDENTIFIER", "INT", "FLOAT", "CHAR", 
                      "WS" ]

    RULE_start_ = 0
    RULE_comment = 1
    RULE_function = 2
    RULE_lines = 3
    RULE_line = 4
    RULE_typedef = 5
    RULE_type = 6
    RULE_declaration = 7
    RULE_assignment = 8
    RULE_conversion = 9
    RULE_expr = 10
    RULE_literal = 11

    ruleNames =  [ "start_", "comment", "function", "lines", "line", "typedef", 
                   "type", "declaration", "assignment", "conversion", "expr", 
                   "literal" ]

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
    SINGLECOMMENT=36
    IDENTIFIER=37
    INT=38
    FLOAT=39
    CHAR=40
    WS=41

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

        def EOF(self):
            return self.getToken(expressionParser.EOF, 0)

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
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 2130307956490) != 0):
                self.state = 27
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,0,self._ctx)
                if la_ == 1:
                    self.state = 24
                    self.function()
                    pass

                elif la_ == 2:
                    self.state = 25
                    self.line()
                    pass

                elif la_ == 3:
                    self.state = 26
                    self.comment()
                    pass


                self.state = 31
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 32
            self.match(expressionParser.EOF)
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
        self.enterRule(localctx, 2, self.RULE_comment)
        try:
            self.state = 43
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [1]:
                self.enterOuterAlt(localctx, 1)
                self.state = 34
                self.match(expressionParser.T__0)
                self.state = 38
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,2,self._ctx)
                while _alt!=1 and _alt!=ATN.INVALID_ALT_NUMBER:
                    if _alt==1+1:
                        self.state = 35
                        self.matchWildcard() 
                    self.state = 40
                    self._errHandler.sync(self)
                    _alt = self._interp.adaptivePredict(self._input,2,self._ctx)

                self.state = 41
                self.match(expressionParser.T__1)
                pass
            elif token in [36]:
                self.enterOuterAlt(localctx, 2)
                self.state = 42
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

        def lines(self):
            return self.getTypedRuleContext(expressionParser.LinesContext,0)


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
        self.enterRule(localctx, 4, self.RULE_function)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 45
            self.type_()
            self.state = 46
            self.match(expressionParser.IDENTIFIER)
            self.state = 47
            self.match(expressionParser.T__2)
            self.state = 48
            self.match(expressionParser.T__3)
            self.state = 49
            self.match(expressionParser.T__4)
            self.state = 50
            self.lines()
            self.state = 51
            self.match(expressionParser.T__5)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class LinesContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def line(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.LineContext)
            else:
                return self.getTypedRuleContext(expressionParser.LineContext,i)


        def getRuleIndex(self):
            return expressionParser.RULE_lines

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterLines" ):
                listener.enterLines(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitLines" ):
                listener.exitLines(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitLines" ):
                return visitor.visitLines(self)
            else:
                return visitor.visitChildren(self)




    def lines(self):

        localctx = expressionParser.LinesContext(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_lines)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 56
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 2061588479752) != 0):
                self.state = 53
                self.line()
                self.state = 58
                self._errHandler.sync(self)
                _la = self._input.LA(1)

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
            self.state = 63
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,5,self._ctx)
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


            self.state = 66 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 65
                self.match(expressionParser.T__6)
                self.state = 68 
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
            self.state = 70
            self.match(expressionParser.T__7)
            self.state = 71
            self.type_()
            self.state = 72
            self.match(expressionParser.IDENTIFIER)
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
        self.enterRule(localctx, 12, self.RULE_type)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 75
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==9:
                self.state = 74
                self.match(expressionParser.T__8)


            self.state = 77
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 7168) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 81
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==13:
                self.state = 78
                self.match(expressionParser.T__12)
                self.state = 83
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
        self.enterRule(localctx, 14, self.RULE_declaration)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 84
            self.type_()
            self.state = 85
            self.match(expressionParser.IDENTIFIER)
            self.state = 88
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==14:
                self.state = 86
                self.match(expressionParser.T__13)
                self.state = 87
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
        self.enterRule(localctx, 16, self.RULE_assignment)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 90
            self.match(expressionParser.IDENTIFIER)

            self.state = 91
            self.match(expressionParser.T__13)
            self.state = 92
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
        self.enterRule(localctx, 18, self.RULE_conversion)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 94
            self.match(expressionParser.T__2)
            self.state = 95
            self.type_()
            self.state = 96
            self.match(expressionParser.T__3)
            self.state = 97
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
        _startState = 20
        self.enterRecursionRule(localctx, 20, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 116
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,10,self._ctx)
            if la_ == 1:
                self.state = 100
                self.literal()
                pass

            elif la_ == 2:
                self.state = 101
                self.match(expressionParser.T__2)
                self.state = 102
                self.type_()
                self.state = 103
                self.match(expressionParser.T__3)
                self.state = 104
                self.expr(15)
                pass

            elif la_ == 3:
                self.state = 106
                self.match(expressionParser.T__2)
                self.state = 107
                self.expr(0)
                self.state = 108
                self.match(expressionParser.T__3)
                pass

            elif la_ == 4:
                self.state = 110
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 237568) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 111
                self.match(expressionParser.IDENTIFIER)
                pass

            elif la_ == 5:
                self.state = 112
                self.match(expressionParser.IDENTIFIER)
                self.state = 113
                _la = self._input.LA(1)
                if not(_la==15 or _la==16):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                pass

            elif la_ == 6:
                self.state = 114
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 3932160) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 115
                self.expr(11)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 150
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,12,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 148
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,11,self._ctx)
                    if la_ == 1:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 118
                        if not self.precpred(self._ctx, 10):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 10)")
                        self.state = 119
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 12591104) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 120
                        self.expr(11)
                        pass

                    elif la_ == 2:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 121
                        if not self.precpred(self._ctx, 9):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 9)")
                        self.state = 122
                        _la = self._input.LA(1)
                        if not(_la==18 or _la==19):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 123
                        self.expr(10)
                        pass

                    elif la_ == 3:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 124
                        if not self.precpred(self._ctx, 8):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 8)")
                        self.state = 125
                        _la = self._input.LA(1)
                        if not(_la==24 or _la==25):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 126
                        self.expr(9)
                        pass

                    elif la_ == 4:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 127
                        if not self.precpred(self._ctx, 7):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 7)")
                        self.state = 128
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 1006632960) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 129
                        self.expr(8)
                        pass

                    elif la_ == 5:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 130
                        if not self.precpred(self._ctx, 6):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 6)")
                        self.state = 131
                        _la = self._input.LA(1)
                        if not(_la==30 or _la==31):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 132
                        self.expr(7)
                        pass

                    elif la_ == 6:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 133
                        if not self.precpred(self._ctx, 5):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 5)")
                        self.state = 134
                        self.match(expressionParser.T__16)
                        self.state = 135
                        self.expr(6)
                        pass

                    elif la_ == 7:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 136
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 137
                        self.match(expressionParser.T__31)
                        self.state = 138
                        self.expr(5)
                        pass

                    elif la_ == 8:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 139
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 140
                        self.match(expressionParser.T__32)
                        self.state = 141
                        self.expr(4)
                        pass

                    elif la_ == 9:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 142
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 143
                        self.match(expressionParser.T__33)
                        self.state = 144
                        self.expr(3)
                        pass

                    elif la_ == 10:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 145
                        if not self.precpred(self._ctx, 1):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                        self.state = 146
                        self.match(expressionParser.T__34)
                        self.state = 147
                        self.expr(2)
                        pass

             
                self.state = 152
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
        self.enterRule(localctx, 22, self.RULE_literal)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 158
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [38]:
                self.state = 153
                self.match(expressionParser.INT)
                pass
            elif token in [39]:
                self.state = 154
                self.match(expressionParser.FLOAT)
                pass
            elif token in [40]:
                self.state = 155
                self.match(expressionParser.CHAR)
                pass
            elif token in [37]:
                self.state = 156
                self.match(expressionParser.IDENTIFIER)
                pass
            elif token in [3]:
                self.state = 157
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
        self._predicates[10] = self.expr_sempred
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
         




