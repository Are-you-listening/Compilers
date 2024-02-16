# Generated from C:/Users/lucas/OneDrive/Documents/Compilers/Compilers/grammar/expression.g4 by ANTLR 4.13.1
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
        4,1,10,60,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,1,0,1,0,1,0,5,0,12,8,0,
        10,0,12,0,15,9,0,1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,3,1,27,
        8,1,1,1,1,1,1,1,5,1,32,8,1,10,1,12,1,35,9,1,1,2,1,2,1,2,1,2,1,2,
        1,2,1,2,1,2,1,2,1,2,1,2,3,2,48,8,2,1,2,1,2,1,2,5,2,53,8,2,10,2,12,
        2,56,9,2,1,3,1,3,1,3,0,2,2,4,4,0,2,4,6,0,0,62,0,8,1,0,0,0,2,26,1,
        0,0,0,4,47,1,0,0,0,6,57,1,0,0,0,8,13,3,2,1,0,9,10,5,1,0,0,10,12,
        3,2,1,0,11,9,1,0,0,0,12,15,1,0,0,0,13,11,1,0,0,0,13,14,1,0,0,0,14,
        16,1,0,0,0,15,13,1,0,0,0,16,17,5,0,0,1,17,1,1,0,0,0,18,19,6,1,-1,
        0,19,27,3,6,3,0,20,21,5,9,0,0,21,22,3,2,1,0,22,23,5,10,0,0,23,27,
        1,0,0,0,24,25,5,8,0,0,25,27,3,2,1,2,26,18,1,0,0,0,26,20,1,0,0,0,
        26,24,1,0,0,0,27,33,1,0,0,0,28,29,10,1,0,0,29,30,5,4,0,0,30,32,3,
        2,1,2,31,28,1,0,0,0,32,35,1,0,0,0,33,31,1,0,0,0,33,34,1,0,0,0,34,
        3,1,0,0,0,35,33,1,0,0,0,36,37,6,2,-1,0,37,38,5,9,0,0,38,39,3,4,2,
        0,39,40,5,10,0,0,40,48,1,0,0,0,41,42,3,2,1,0,42,43,5,5,0,0,43,44,
        3,2,1,0,44,48,1,0,0,0,45,46,5,7,0,0,46,48,3,4,2,2,47,36,1,0,0,0,
        47,41,1,0,0,0,47,45,1,0,0,0,48,54,1,0,0,0,49,50,10,1,0,0,50,51,5,
        6,0,0,51,53,3,4,2,2,52,49,1,0,0,0,53,56,1,0,0,0,54,52,1,0,0,0,54,
        55,1,0,0,0,55,5,1,0,0,0,56,54,1,0,0,0,57,58,5,2,0,0,58,7,1,0,0,0,
        5,13,26,33,47,54
    ]

class expressionParser ( Parser ):

    grammarFileName = "expression.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "';'", "<INVALID>", "<INVALID>", "<INVALID>", 
                     "<INVALID>", "<INVALID>", "'!'", "<INVALID>", "'('", 
                     "')'" ]

    symbolicNames = [ "<INVALID>", "<INVALID>", "INT", "WS", "BASEOP", "BOOLOP", 
                      "LOGICALOP", "UNARYLOIGICALOP", "UNARYOP", "LEFTPAREN", 
                      "RIGHTPAREN" ]

    RULE_start_ = 0
    RULE_expr = 1
    RULE_boolexpr = 2
    RULE_literal = 3

    ruleNames =  [ "start_", "expr", "boolexpr", "literal" ]

    EOF = Token.EOF
    T__0=1
    INT=2
    WS=3
    BASEOP=4
    BOOLOP=5
    LOGICALOP=6
    UNARYLOIGICALOP=7
    UNARYOP=8
    LEFTPAREN=9
    RIGHTPAREN=10

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

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.ExprContext)
            else:
                return self.getTypedRuleContext(expressionParser.ExprContext,i)


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
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 8
            self.expr(0)
            self.state = 13
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==1:
                self.state = 9
                self.match(expressionParser.T__0)
                self.state = 10
                self.expr(0)
                self.state = 15
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 16
            self.match(expressionParser.EOF)
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


        def LEFTPAREN(self):
            return self.getToken(expressionParser.LEFTPAREN, 0)

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.ExprContext)
            else:
                return self.getTypedRuleContext(expressionParser.ExprContext,i)


        def RIGHTPAREN(self):
            return self.getToken(expressionParser.RIGHTPAREN, 0)

        def UNARYOP(self):
            return self.getToken(expressionParser.UNARYOP, 0)

        def BASEOP(self):
            return self.getToken(expressionParser.BASEOP, 0)

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
        _startState = 2
        self.enterRecursionRule(localctx, 2, self.RULE_expr, _p)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 26
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [2]:
                self.state = 19
                self.literal()
                pass
            elif token in [9]:
                self.state = 20
                self.match(expressionParser.LEFTPAREN)
                self.state = 21
                self.expr(0)
                self.state = 22
                self.match(expressionParser.RIGHTPAREN)
                pass
            elif token in [8]:
                self.state = 24
                self.match(expressionParser.UNARYOP)
                self.state = 25
                self.expr(2)
                pass
            else:
                raise NoViableAltException(self)

            self._ctx.stop = self._input.LT(-1)
            self.state = 33
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,2,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    localctx = expressionParser.ExprContext(self, _parentctx, _parentState)
                    self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                    self.state = 28
                    if not self.precpred(self._ctx, 1):
                        from antlr4.error.Errors import FailedPredicateException
                        raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                    self.state = 29
                    self.match(expressionParser.BASEOP)
                    self.state = 30
                    self.expr(2) 
                self.state = 35
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,2,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class BoolexprContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def LEFTPAREN(self):
            return self.getToken(expressionParser.LEFTPAREN, 0)

        def boolexpr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.BoolexprContext)
            else:
                return self.getTypedRuleContext(expressionParser.BoolexprContext,i)


        def RIGHTPAREN(self):
            return self.getToken(expressionParser.RIGHTPAREN, 0)

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(expressionParser.ExprContext)
            else:
                return self.getTypedRuleContext(expressionParser.ExprContext,i)


        def BOOLOP(self):
            return self.getToken(expressionParser.BOOLOP, 0)

        def UNARYLOIGICALOP(self):
            return self.getToken(expressionParser.UNARYLOIGICALOP, 0)

        def LOGICALOP(self):
            return self.getToken(expressionParser.LOGICALOP, 0)

        def getRuleIndex(self):
            return expressionParser.RULE_boolexpr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterBoolexpr" ):
                listener.enterBoolexpr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitBoolexpr" ):
                listener.exitBoolexpr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitBoolexpr" ):
                return visitor.visitBoolexpr(self)
            else:
                return visitor.visitChildren(self)



    def boolexpr(self, _p:int=0):
        _parentctx = self._ctx
        _parentState = self.state
        localctx = expressionParser.BoolexprContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 4
        self.enterRecursionRule(localctx, 4, self.RULE_boolexpr, _p)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 47
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,3,self._ctx)
            if la_ == 1:
                self.state = 37
                self.match(expressionParser.LEFTPAREN)
                self.state = 38
                self.boolexpr(0)
                self.state = 39
                self.match(expressionParser.RIGHTPAREN)
                pass

            elif la_ == 2:
                self.state = 41
                self.expr(0)
                self.state = 42
                self.match(expressionParser.BOOLOP)
                self.state = 43
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 45
                self.match(expressionParser.UNARYLOIGICALOP)
                self.state = 46
                self.boolexpr(2)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 54
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,4,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    localctx = expressionParser.BoolexprContext(self, _parentctx, _parentState)
                    self.pushNewRecursionContext(localctx, _startState, self.RULE_boolexpr)
                    self.state = 49
                    if not self.precpred(self._ctx, 1):
                        from antlr4.error.Errors import FailedPredicateException
                        raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                    self.state = 50
                    self.match(expressionParser.LOGICALOP)
                    self.state = 51
                    self.boolexpr(2) 
                self.state = 56
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,4,self._ctx)

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
        self.enterRule(localctx, 6, self.RULE_literal)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 57
            self.match(expressionParser.INT)
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
        self._predicates[1] = self.expr_sempred
        self._predicates[2] = self.boolexpr_sempred
        pred = self._predicates.get(ruleIndex, None)
        if pred is None:
            raise Exception("No predicate with index:" + str(ruleIndex))
        else:
            return pred(localctx, predIndex)

    def expr_sempred(self, localctx:ExprContext, predIndex:int):
            if predIndex == 0:
                return self.precpred(self._ctx, 1)
         

    def boolexpr_sempred(self, localctx:BoolexprContext, predIndex:int):
            if predIndex == 1:
                return self.precpred(self._ctx, 1)
         




