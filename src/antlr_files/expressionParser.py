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
        4,1,37,124,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,1,0,1,0,1,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,
        1,1,1,1,2,5,2,33,8,2,10,2,12,2,36,9,2,1,3,1,3,1,3,3,3,41,8,3,1,3,
        4,3,44,8,3,11,3,12,3,45,1,4,3,4,49,8,4,1,4,1,4,5,4,53,8,4,10,4,12,
        4,56,9,4,1,5,1,5,1,5,1,5,3,5,62,8,5,1,6,1,6,1,6,1,6,1,7,1,7,1,7,
        1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,3,7,85,8,
        7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,
        7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,1,7,5,7,117,
        8,7,10,7,12,7,120,9,7,1,8,1,8,1,8,0,1,14,9,0,2,4,6,8,10,12,14,16,
        0,10,1,0,7,9,2,0,10,10,12,14,1,0,12,13,1,0,15,18,2,0,10,10,19,20,
        1,0,15,16,1,0,21,22,1,0,23,26,1,0,27,28,1,0,33,36,136,0,18,1,0,0,
        0,2,23,1,0,0,0,4,34,1,0,0,0,6,40,1,0,0,0,8,48,1,0,0,0,10,57,1,0,
        0,0,12,63,1,0,0,0,14,84,1,0,0,0,16,121,1,0,0,0,18,19,3,4,2,0,19,
        20,3,2,1,0,20,21,3,4,2,0,21,22,5,0,0,1,22,1,1,0,0,0,23,24,3,8,4,
        0,24,25,5,33,0,0,25,26,5,1,0,0,26,27,5,2,0,0,27,28,5,3,0,0,28,29,
        3,4,2,0,29,30,5,4,0,0,30,3,1,0,0,0,31,33,3,6,3,0,32,31,1,0,0,0,33,
        36,1,0,0,0,34,32,1,0,0,0,34,35,1,0,0,0,35,5,1,0,0,0,36,34,1,0,0,
        0,37,41,3,10,5,0,38,41,3,14,7,0,39,41,3,12,6,0,40,37,1,0,0,0,40,
        38,1,0,0,0,40,39,1,0,0,0,41,43,1,0,0,0,42,44,5,5,0,0,43,42,1,0,0,
        0,44,45,1,0,0,0,45,43,1,0,0,0,45,46,1,0,0,0,46,7,1,0,0,0,47,49,5,
        6,0,0,48,47,1,0,0,0,48,49,1,0,0,0,49,50,1,0,0,0,50,54,7,0,0,0,51,
        53,5,10,0,0,52,51,1,0,0,0,53,56,1,0,0,0,54,52,1,0,0,0,54,55,1,0,
        0,0,55,9,1,0,0,0,56,54,1,0,0,0,57,58,3,8,4,0,58,61,5,33,0,0,59,60,
        5,11,0,0,60,62,3,14,7,0,61,59,1,0,0,0,61,62,1,0,0,0,62,11,1,0,0,
        0,63,64,5,33,0,0,64,65,5,11,0,0,65,66,3,14,7,0,66,13,1,0,0,0,67,
        68,6,7,-1,0,68,85,3,16,8,0,69,70,5,1,0,0,70,71,3,8,4,0,71,72,5,2,
        0,0,72,73,3,14,7,15,73,85,1,0,0,0,74,75,5,1,0,0,75,76,3,14,7,0,76,
        77,5,2,0,0,77,85,1,0,0,0,78,79,7,1,0,0,79,85,5,33,0,0,80,81,5,33,
        0,0,81,85,7,2,0,0,82,83,7,3,0,0,83,85,3,14,7,11,84,67,1,0,0,0,84,
        69,1,0,0,0,84,74,1,0,0,0,84,78,1,0,0,0,84,80,1,0,0,0,84,82,1,0,0,
        0,85,118,1,0,0,0,86,87,10,10,0,0,87,88,7,4,0,0,88,117,3,14,7,11,
        89,90,10,9,0,0,90,91,7,5,0,0,91,117,3,14,7,10,92,93,10,8,0,0,93,
        94,7,6,0,0,94,117,3,14,7,9,95,96,10,7,0,0,96,97,7,7,0,0,97,117,3,
        14,7,8,98,99,10,6,0,0,99,100,7,8,0,0,100,117,3,14,7,7,101,102,10,
        5,0,0,102,103,5,14,0,0,103,117,3,14,7,6,104,105,10,4,0,0,105,106,
        5,29,0,0,106,117,3,14,7,5,107,108,10,3,0,0,108,109,5,30,0,0,109,
        117,3,14,7,4,110,111,10,2,0,0,111,112,5,31,0,0,112,117,3,14,7,3,
        113,114,10,1,0,0,114,115,5,32,0,0,115,117,3,14,7,2,116,86,1,0,0,
        0,116,89,1,0,0,0,116,92,1,0,0,0,116,95,1,0,0,0,116,98,1,0,0,0,116,
        101,1,0,0,0,116,104,1,0,0,0,116,107,1,0,0,0,116,110,1,0,0,0,116,
        113,1,0,0,0,117,120,1,0,0,0,118,116,1,0,0,0,118,119,1,0,0,0,119,
        15,1,0,0,0,120,118,1,0,0,0,121,122,7,9,0,0,122,17,1,0,0,0,9,34,40,
        45,48,54,61,84,116,118
    ]

class expressionParser ( Parser ):

    grammarFileName = "expression.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "'('", "')'", "'{'", "'}'", "';'", "'const'", 
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
                      "<INVALID>", "IDENTIFIER", "INT", "FLOAT", "CHAR", 
                      "WS" ]

    RULE_start_ = 0
    RULE_function = 1
    RULE_lines = 2
    RULE_line = 3
    RULE_type = 4
    RULE_declaration = 5
    RULE_assignment = 6
    RULE_expr = 7
    RULE_literal = 8

    ruleNames =  [ "start_", "function", "lines", "line", "type", "declaration", 
                   "assignment", "expr", "literal" ]

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
    IDENTIFIER=33
    INT=34
    FLOAT=35
    CHAR=36
    WS=37

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

        def lines(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.LinesContext)
            else:
                return self.getTypedRuleContext(expressionParser.LinesContext,i)


        def function(self):
            return self.getTypedRuleContext(expressionParser.FunctionContext,0)


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
            self.state = 18
            self.lines()
            self.state = 19
            self.function()
            self.state = 20
            self.lines()
            self.state = 21
            self.match(expressionParser.EOF)
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
        self.enterRule(localctx, 2, self.RULE_function)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 23
            self.type_()
            self.state = 24
            self.match(expressionParser.IDENTIFIER)
            self.state = 25
            self.match(expressionParser.T__0)
            self.state = 26
            self.match(expressionParser.T__1)
            self.state = 27
            self.match(expressionParser.T__2)
            self.state = 28
            self.lines()
            self.state = 29
            self.match(expressionParser.T__3)
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
        self.enterRule(localctx, 4, self.RULE_lines)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 34
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,0,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 31
                    self.line() 
                self.state = 36
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,0,self._ctx)

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
        self.enterRule(localctx, 6, self.RULE_line)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 40
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,1,self._ctx)
            if la_ == 1:
                self.state = 37
                self.declaration()
                pass

            elif la_ == 2:
                self.state = 38
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 39
                self.assignment()
                pass


            self.state = 43 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 42
                self.match(expressionParser.T__4)
                self.state = 45 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not (_la==5):
                    break

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
        self.enterRule(localctx, 8, self.RULE_type)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 48
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==6:
                self.state = 47
                self.match(expressionParser.T__5)


            self.state = 50
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 896) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 54
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==10:
                self.state = 51
                self.match(expressionParser.T__9)
                self.state = 56
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
        self.enterRule(localctx, 10, self.RULE_declaration)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 57
            self.type_()
            self.state = 58
            self.match(expressionParser.IDENTIFIER)
            self.state = 61
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==11:
                self.state = 59
                self.match(expressionParser.T__10)
                self.state = 60
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
        self.enterRule(localctx, 12, self.RULE_assignment)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 63
            self.match(expressionParser.IDENTIFIER)

            self.state = 64
            self.match(expressionParser.T__10)
            self.state = 65
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
        _startState = 14
        self.enterRecursionRule(localctx, 14, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 84
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,6,self._ctx)
            if la_ == 1:
                self.state = 68
                self.literal()
                pass

            elif la_ == 2:
                self.state = 69
                self.match(expressionParser.T__0)
                self.state = 70
                self.type_()
                self.state = 71
                self.match(expressionParser.T__1)
                self.state = 72
                self.expr(15)
                pass

            elif la_ == 3:
                self.state = 74
                self.match(expressionParser.T__0)
                self.state = 75
                self.expr(0)
                self.state = 76
                self.match(expressionParser.T__1)
                pass

            elif la_ == 4:
                self.state = 78
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 29696) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 79
                self.match(expressionParser.IDENTIFIER)
                pass

            elif la_ == 5:
                self.state = 80
                self.match(expressionParser.IDENTIFIER)
                self.state = 81
                _la = self._input.LA(1)
                if not(_la==12 or _la==13):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                pass

            elif la_ == 6:
                self.state = 82
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 491520) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 83
                self.expr(11)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 118
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,8,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 116
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,7,self._ctx)
                    if la_ == 1:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 86
                        if not self.precpred(self._ctx, 10):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 10)")
                        self.state = 87
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 1573888) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 88
                        self.expr(11)
                        pass

                    elif la_ == 2:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 89
                        if not self.precpred(self._ctx, 9):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 9)")
                        self.state = 90
                        _la = self._input.LA(1)
                        if not(_la==15 or _la==16):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 91
                        self.expr(10)
                        pass

                    elif la_ == 3:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 92
                        if not self.precpred(self._ctx, 8):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 8)")
                        self.state = 93
                        _la = self._input.LA(1)
                        if not(_la==21 or _la==22):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 94
                        self.expr(9)
                        pass

                    elif la_ == 4:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 95
                        if not self.precpred(self._ctx, 7):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 7)")
                        self.state = 96
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 125829120) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 97
                        self.expr(8)
                        pass

                    elif la_ == 5:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 98
                        if not self.precpred(self._ctx, 6):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 6)")
                        self.state = 99
                        _la = self._input.LA(1)
                        if not(_la==27 or _la==28):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 100
                        self.expr(7)
                        pass

                    elif la_ == 6:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 101
                        if not self.precpred(self._ctx, 5):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 5)")
                        self.state = 102
                        self.match(expressionParser.T__13)
                        self.state = 103
                        self.expr(6)
                        pass

                    elif la_ == 7:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 104
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 105
                        self.match(expressionParser.T__28)
                        self.state = 106
                        self.expr(5)
                        pass

                    elif la_ == 8:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 107
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 108
                        self.match(expressionParser.T__29)
                        self.state = 109
                        self.expr(4)
                        pass

                    elif la_ == 9:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 110
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 111
                        self.match(expressionParser.T__30)
                        self.state = 112
                        self.expr(3)
                        pass

                    elif la_ == 10:
                        localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 113
                        if not self.precpred(self._ctx, 1):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                        self.state = 114
                        self.match(expressionParser.T__31)
                        self.state = 115
                        self.expr(2)
                        pass

             
                self.state = 120
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,8,self._ctx)

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
        self.enterRule(localctx, 16, self.RULE_literal)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 121
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 128849018880) != 0)):
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



    def sempred(self, localctx:RuleContext, ruleIndex:int, predIndex:int):
        if self._predicates == None:
            self._predicates = dict()
        self._predicates[7] = self.expr_sempred
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
         




