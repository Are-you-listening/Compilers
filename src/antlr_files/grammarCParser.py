# Generated from /home/tibov/Desktop/universiteit/bachlor-2/Compilers/Project/Compilers/grammar/grammarC.g4 by ANTLR 4.13.1
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
        4,1,53,266,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,
        2,14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,1,0,3,0,38,8,0,1,0,1,0,1,
        0,1,1,1,1,1,1,5,1,46,8,1,10,1,12,1,49,9,1,1,1,5,1,52,8,1,10,1,12,
        1,55,9,1,1,2,1,2,1,3,1,3,1,4,1,4,1,4,1,4,1,4,1,4,1,4,3,4,68,8,4,
        1,4,1,4,5,4,72,8,4,10,4,12,4,75,9,4,1,5,1,5,1,5,1,5,3,5,81,8,5,1,
        5,4,5,84,8,5,11,5,12,5,85,1,6,1,6,1,6,1,6,1,6,3,6,93,8,6,1,6,4,6,
        96,8,6,11,6,12,6,97,1,7,1,7,5,7,102,8,7,10,7,12,7,105,9,7,1,7,5,
        7,108,8,7,10,7,12,7,111,9,7,1,8,1,8,1,8,1,8,1,9,1,9,1,9,1,9,1,9,
        1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,1,9,5,9,132,8,9,10,9,12,9,135,
        9,9,1,9,1,9,1,9,1,9,1,9,3,9,142,8,9,1,10,1,10,1,10,1,10,5,10,148,
        8,10,10,10,12,10,151,9,10,1,10,1,10,5,10,155,8,10,10,10,12,10,158,
        9,10,1,10,1,10,1,10,1,10,1,10,1,11,3,11,166,8,11,1,11,1,11,1,11,
        3,11,171,8,11,5,11,173,8,11,10,11,12,11,176,9,11,1,12,1,12,1,12,
        1,12,3,12,182,8,12,1,13,5,13,185,8,13,10,13,12,13,188,9,13,1,13,
        1,13,1,13,1,13,1,14,1,14,1,14,1,14,1,14,3,14,199,8,14,1,15,1,15,
        1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
        1,15,1,15,3,15,218,8,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
        1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,
        1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,5,15,250,8,15,10,15,
        12,15,253,9,15,1,16,1,16,1,16,1,16,1,16,3,16,260,8,16,1,17,1,17,
        3,17,264,8,17,1,17,2,149,156,1,30,18,0,2,4,6,8,10,12,14,16,18,20,
        22,24,26,28,30,32,34,0,11,1,0,47,48,1,0,13,17,2,0,20,22,49,49,2,
        0,23,23,25,27,1,0,25,26,1,0,28,31,2,0,23,23,32,33,1,0,28,29,1,0,
        34,35,1,0,36,39,1,0,40,41,296,0,37,1,0,0,0,2,47,1,0,0,0,4,56,1,0,
        0,0,6,58,1,0,0,0,8,60,1,0,0,0,10,80,1,0,0,0,12,92,1,0,0,0,14,103,
        1,0,0,0,16,112,1,0,0,0,18,116,1,0,0,0,20,143,1,0,0,0,22,165,1,0,
        0,0,24,177,1,0,0,0,26,186,1,0,0,0,28,193,1,0,0,0,30,217,1,0,0,0,
        32,259,1,0,0,0,34,261,1,0,0,0,36,38,3,4,2,0,37,36,1,0,0,0,37,38,
        1,0,0,0,38,39,1,0,0,0,39,40,3,2,1,0,40,41,5,0,0,1,41,1,1,0,0,0,42,
        46,3,8,4,0,43,46,3,10,5,0,44,46,3,6,3,0,45,42,1,0,0,0,45,43,1,0,
        0,0,45,44,1,0,0,0,46,49,1,0,0,0,47,45,1,0,0,0,47,48,1,0,0,0,48,53,
        1,0,0,0,49,47,1,0,0,0,50,52,5,1,0,0,51,50,1,0,0,0,52,55,1,0,0,0,
        53,51,1,0,0,0,53,54,1,0,0,0,54,3,1,0,0,0,55,53,1,0,0,0,56,57,5,2,
        0,0,57,5,1,0,0,0,58,59,7,0,0,0,59,7,1,0,0,0,60,61,3,22,11,0,61,62,
        5,49,0,0,62,63,5,3,0,0,63,64,5,4,0,0,64,65,5,5,0,0,65,67,3,14,7,
        0,66,68,3,34,17,0,67,66,1,0,0,0,67,68,1,0,0,0,68,69,1,0,0,0,69,73,
        5,6,0,0,70,72,5,1,0,0,71,70,1,0,0,0,72,75,1,0,0,0,73,71,1,0,0,0,
        73,74,1,0,0,0,74,9,1,0,0,0,75,73,1,0,0,0,76,81,3,24,12,0,77,81,3,
        30,15,0,78,81,3,26,13,0,79,81,3,16,8,0,80,76,1,0,0,0,80,77,1,0,0,
        0,80,78,1,0,0,0,80,79,1,0,0,0,81,83,1,0,0,0,82,84,5,1,0,0,83,82,
        1,0,0,0,84,85,1,0,0,0,85,83,1,0,0,0,85,86,1,0,0,0,86,11,1,0,0,0,
        87,93,3,24,12,0,88,93,3,30,15,0,89,93,3,26,13,0,90,93,3,16,8,0,91,
        93,3,20,10,0,92,87,1,0,0,0,92,88,1,0,0,0,92,89,1,0,0,0,92,90,1,0,
        0,0,92,91,1,0,0,0,93,95,1,0,0,0,94,96,5,1,0,0,95,94,1,0,0,0,96,97,
        1,0,0,0,97,95,1,0,0,0,97,98,1,0,0,0,98,13,1,0,0,0,99,102,3,12,6,
        0,100,102,3,6,3,0,101,99,1,0,0,0,101,100,1,0,0,0,102,105,1,0,0,0,
        103,101,1,0,0,0,103,104,1,0,0,0,104,109,1,0,0,0,105,103,1,0,0,0,
        106,108,5,1,0,0,107,106,1,0,0,0,108,111,1,0,0,0,109,107,1,0,0,0,
        109,110,1,0,0,0,110,15,1,0,0,0,111,109,1,0,0,0,112,113,5,7,0,0,113,
        114,3,22,11,0,114,115,5,49,0,0,115,17,1,0,0,0,116,117,5,8,0,0,117,
        118,5,3,0,0,118,119,3,30,15,0,119,120,5,4,0,0,120,121,5,5,0,0,121,
        122,3,2,1,0,122,133,5,6,0,0,123,124,5,9,0,0,124,125,5,3,0,0,125,
        126,3,30,15,0,126,127,5,4,0,0,127,128,5,5,0,0,128,129,3,2,1,0,129,
        130,5,6,0,0,130,132,1,0,0,0,131,123,1,0,0,0,132,135,1,0,0,0,133,
        131,1,0,0,0,133,134,1,0,0,0,134,141,1,0,0,0,135,133,1,0,0,0,136,
        137,5,10,0,0,137,138,5,5,0,0,138,139,3,2,1,0,139,140,5,6,0,0,140,
        142,1,0,0,0,141,136,1,0,0,0,141,142,1,0,0,0,142,19,1,0,0,0,143,144,
        5,11,0,0,144,145,5,3,0,0,145,149,5,12,0,0,146,148,9,0,0,0,147,146,
        1,0,0,0,148,151,1,0,0,0,149,150,1,0,0,0,149,147,1,0,0,0,150,152,
        1,0,0,0,151,149,1,0,0,0,152,156,7,1,0,0,153,155,9,0,0,0,154,153,
        1,0,0,0,155,158,1,0,0,0,156,157,1,0,0,0,156,154,1,0,0,0,157,159,
        1,0,0,0,158,156,1,0,0,0,159,160,5,12,0,0,160,161,5,18,0,0,161,162,
        3,30,15,0,162,163,5,4,0,0,163,21,1,0,0,0,164,166,5,19,0,0,165,164,
        1,0,0,0,165,166,1,0,0,0,166,167,1,0,0,0,167,174,7,2,0,0,168,170,
        5,23,0,0,169,171,5,19,0,0,170,169,1,0,0,0,170,171,1,0,0,0,171,173,
        1,0,0,0,172,168,1,0,0,0,173,176,1,0,0,0,174,172,1,0,0,0,174,175,
        1,0,0,0,175,23,1,0,0,0,176,174,1,0,0,0,177,178,3,22,11,0,178,181,
        5,49,0,0,179,180,5,24,0,0,180,182,3,30,15,0,181,179,1,0,0,0,181,
        182,1,0,0,0,182,25,1,0,0,0,183,185,5,23,0,0,184,183,1,0,0,0,185,
        188,1,0,0,0,186,184,1,0,0,0,186,187,1,0,0,0,187,189,1,0,0,0,188,
        186,1,0,0,0,189,190,5,49,0,0,190,191,5,24,0,0,191,192,3,30,15,0,
        192,27,1,0,0,0,193,194,5,3,0,0,194,195,3,22,11,0,195,198,5,4,0,0,
        196,199,3,32,16,0,197,199,3,30,15,0,198,196,1,0,0,0,198,197,1,0,
        0,0,199,29,1,0,0,0,200,201,6,15,-1,0,201,218,3,32,16,0,202,203,5,
        3,0,0,203,204,3,22,11,0,204,205,5,4,0,0,205,206,3,30,15,15,206,218,
        1,0,0,0,207,208,5,3,0,0,208,209,3,30,15,0,209,210,5,4,0,0,210,218,
        1,0,0,0,211,212,7,3,0,0,212,218,3,30,15,13,213,214,5,49,0,0,214,
        218,7,4,0,0,215,216,7,5,0,0,216,218,3,30,15,11,217,200,1,0,0,0,217,
        202,1,0,0,0,217,207,1,0,0,0,217,211,1,0,0,0,217,213,1,0,0,0,217,
        215,1,0,0,0,218,251,1,0,0,0,219,220,10,10,0,0,220,221,7,6,0,0,221,
        250,3,30,15,11,222,223,10,9,0,0,223,224,7,7,0,0,224,250,3,30,15,
        10,225,226,10,8,0,0,226,227,7,8,0,0,227,250,3,30,15,9,228,229,10,
        7,0,0,229,230,7,9,0,0,230,250,3,30,15,8,231,232,10,6,0,0,232,233,
        7,10,0,0,233,250,3,30,15,7,234,235,10,5,0,0,235,236,5,27,0,0,236,
        250,3,30,15,6,237,238,10,4,0,0,238,239,5,42,0,0,239,250,3,30,15,
        5,240,241,10,3,0,0,241,242,5,43,0,0,242,250,3,30,15,4,243,244,10,
        2,0,0,244,245,5,44,0,0,245,250,3,30,15,3,246,247,10,1,0,0,247,248,
        5,45,0,0,248,250,3,30,15,2,249,219,1,0,0,0,249,222,1,0,0,0,249,225,
        1,0,0,0,249,228,1,0,0,0,249,231,1,0,0,0,249,234,1,0,0,0,249,237,
        1,0,0,0,249,240,1,0,0,0,249,243,1,0,0,0,249,246,1,0,0,0,250,253,
        1,0,0,0,251,249,1,0,0,0,251,252,1,0,0,0,252,31,1,0,0,0,253,251,1,
        0,0,0,254,260,5,50,0,0,255,260,5,51,0,0,256,260,5,52,0,0,257,260,
        5,49,0,0,258,260,3,28,14,0,259,254,1,0,0,0,259,255,1,0,0,0,259,256,
        1,0,0,0,259,257,1,0,0,0,259,258,1,0,0,0,260,33,1,0,0,0,261,263,5,
        46,0,0,262,264,5,1,0,0,263,262,1,0,0,0,263,264,1,0,0,0,264,35,1,
        0,0,0,28,37,45,47,53,67,73,80,85,92,97,101,103,109,133,141,149,156,
        165,170,174,181,186,198,217,249,251,259,263
    ]

class grammarCParser ( Parser ):

    grammarFileName = "grammarC.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "';'", "'#include <stdio.h>'", "'('", 
                     "')'", "'{'", "'}'", "'typedef'", "'if'", "'else if'", 
                     "'else'", "'printf'", "'\"'", "'%s'", "'%d'", "'%x'", 
                     "'%f'", "'%c'", "','", "'const'", "'int'", "'char'", 
                     "'float'", "'*'", "'='", "'++'", "'--'", "'&'", "'+'", 
                     "'-'", "'~'", "'!'", "'/'", "'%'", "'>>'", "'<<'", 
                     "'<'", "'>'", "'>='", "'<='", "'=='", "'!='", "'^'", 
                     "'|'", "'&&'", "'||'", "'return 0'" ]

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
                      "<INVALID>", "<INVALID>", "<INVALID>", "MULTILINE", 
                      "SINGLECOMMENT", "IDENTIFIER", "INT", "FLOAT", "CHAR", 
                      "WS" ]

    RULE_start_ = 0
    RULE_code = 1
    RULE_include = 2
    RULE_comment = 3
    RULE_function = 4
    RULE_line = 5
    RULE_block_line = 6
    RULE_block_code = 7
    RULE_typedef = 8
    RULE_if_statement = 9
    RULE_printf = 10
    RULE_type = 11
    RULE_declaration = 12
    RULE_assignment = 13
    RULE_conversion = 14
    RULE_expr = 15
    RULE_literal = 16
    RULE_return = 17

    ruleNames =  [ "start_", "code", "include", "comment", "function", "line", 
                   "block_line", "block_code", "typedef", "if_statement", 
                   "printf", "type", "declaration", "assignment", "conversion", 
                   "expr", "literal", "return" ]

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
    T__43=44
    T__44=45
    T__45=46
    MULTILINE=47
    SINGLECOMMENT=48
    IDENTIFIER=49
    INT=50
    FLOAT=51
    CHAR=52
    WS=53

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
            return self.getTypedRuleContext(grammarCParser.CodeContext,0)


        def EOF(self):
            return self.getToken(grammarCParser.EOF, 0)

        def include(self):
            return self.getTypedRuleContext(grammarCParser.IncludeContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_start_

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

        localctx = grammarCParser.Start_Context(self, self._ctx, self.state)
        self.enterRule(localctx, 0, self.RULE_start_)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 37
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==2:
                self.state = 36
                self.include()


            self.state = 39
            self.code()
            self.state = 40
            self.match(grammarCParser.EOF)
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
                return self.getTypedRuleContexts(grammarCParser.FunctionContext)
            else:
                return self.getTypedRuleContext(grammarCParser.FunctionContext,i)


        def line(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.LineContext)
            else:
                return self.getTypedRuleContext(grammarCParser.LineContext,i)


        def comment(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.CommentContext)
            else:
                return self.getTypedRuleContext(grammarCParser.CommentContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_code

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

        localctx = grammarCParser.CodeContext(self, self._ctx, self.state)
        self.enterRule(localctx, 2, self.RULE_code)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 47
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 8866466044051592) != 0):
                self.state = 45
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,1,self._ctx)
                if la_ == 1:
                    self.state = 42
                    self.function()
                    pass

                elif la_ == 2:
                    self.state = 43
                    self.line()
                    pass

                elif la_ == 3:
                    self.state = 44
                    self.comment()
                    pass


                self.state = 49
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 53
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==1:
                self.state = 50
                self.match(grammarCParser.T__0)
                self.state = 55
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
            return grammarCParser.RULE_include

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

        localctx = grammarCParser.IncludeContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_include)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 56
            self.match(grammarCParser.T__1)
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
            return self.getToken(grammarCParser.MULTILINE, 0)

        def SINGLECOMMENT(self):
            return self.getToken(grammarCParser.SINGLECOMMENT, 0)

        def getRuleIndex(self):
            return grammarCParser.RULE_comment

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

        localctx = grammarCParser.CommentContext(self, self._ctx, self.state)
        self.enterRule(localctx, 6, self.RULE_comment)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 58
            _la = self._input.LA(1)
            if not(_la==47 or _la==48):
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
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def block_code(self):
            return self.getTypedRuleContext(grammarCParser.Block_codeContext,0)


        def return_(self):
            return self.getTypedRuleContext(grammarCParser.ReturnContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_function

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

        localctx = grammarCParser.FunctionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 8, self.RULE_function)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 60
            self.type_()
            self.state = 61
            self.match(grammarCParser.IDENTIFIER)
            self.state = 62
            self.match(grammarCParser.T__2)
            self.state = 63
            self.match(grammarCParser.T__3)
            self.state = 64
            self.match(grammarCParser.T__4)
            self.state = 65
            self.block_code()
            self.state = 67
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==46:
                self.state = 66
                self.return_()


            self.state = 69
            self.match(grammarCParser.T__5)
            self.state = 73
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,5,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 70
                    self.match(grammarCParser.T__0) 
                self.state = 75
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,5,self._ctx)

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
            return self.getTypedRuleContext(grammarCParser.DeclarationContext,0)


        def expr(self):
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


        def assignment(self):
            return self.getTypedRuleContext(grammarCParser.AssignmentContext,0)


        def typedef(self):
            return self.getTypedRuleContext(grammarCParser.TypedefContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_line

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

        localctx = grammarCParser.LineContext(self, self._ctx, self.state)
        self.enterRule(localctx, 10, self.RULE_line)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 80
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,6,self._ctx)
            if la_ == 1:
                self.state = 76
                self.declaration()
                pass

            elif la_ == 2:
                self.state = 77
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 78
                self.assignment()
                pass

            elif la_ == 4:
                self.state = 79
                self.typedef()
                pass


            self.state = 83 
            self._errHandler.sync(self)
            _alt = 1
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt == 1:
                    self.state = 82
                    self.match(grammarCParser.T__0)

                else:
                    raise NoViableAltException(self)
                self.state = 85 
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,7,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Block_lineContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def declaration(self):
            return self.getTypedRuleContext(grammarCParser.DeclarationContext,0)


        def expr(self):
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


        def assignment(self):
            return self.getTypedRuleContext(grammarCParser.AssignmentContext,0)


        def typedef(self):
            return self.getTypedRuleContext(grammarCParser.TypedefContext,0)


        def printf(self):
            return self.getTypedRuleContext(grammarCParser.PrintfContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_block_line

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterBlock_line" ):
                listener.enterBlock_line(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitBlock_line" ):
                listener.exitBlock_line(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitBlock_line" ):
                return visitor.visitBlock_line(self)
            else:
                return visitor.visitChildren(self)




    def block_line(self):

        localctx = grammarCParser.Block_lineContext(self, self._ctx, self.state)
        self.enterRule(localctx, 12, self.RULE_block_line)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 92
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,8,self._ctx)
            if la_ == 1:
                self.state = 87
                self.declaration()
                pass

            elif la_ == 2:
                self.state = 88
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 89
                self.assignment()
                pass

            elif la_ == 4:
                self.state = 90
                self.typedef()
                pass

            elif la_ == 5:
                self.state = 91
                self.printf()
                pass


            self.state = 95 
            self._errHandler.sync(self)
            _alt = 1
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt == 1:
                    self.state = 94
                    self.match(grammarCParser.T__0)

                else:
                    raise NoViableAltException(self)
                self.state = 97 
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,9,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Block_codeContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def block_line(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.Block_lineContext)
            else:
                return self.getTypedRuleContext(grammarCParser.Block_lineContext,i)


        def comment(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.CommentContext)
            else:
                return self.getTypedRuleContext(grammarCParser.CommentContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_block_code

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterBlock_code" ):
                listener.enterBlock_code(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitBlock_code" ):
                listener.exitBlock_code(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitBlock_code" ):
                return visitor.visitBlock_code(self)
            else:
                return visitor.visitChildren(self)




    def block_code(self):

        localctx = grammarCParser.Block_codeContext(self, self._ctx, self.state)
        self.enterRule(localctx, 14, self.RULE_block_code)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 103
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 8866466044053640) != 0):
                self.state = 101
                self._errHandler.sync(self)
                token = self._input.LA(1)
                if token in [3, 7, 11, 19, 20, 21, 22, 23, 25, 26, 27, 28, 29, 30, 31, 49, 50, 51, 52]:
                    self.state = 99
                    self.block_line()
                    pass
                elif token in [47, 48]:
                    self.state = 100
                    self.comment()
                    pass
                else:
                    raise NoViableAltException(self)

                self.state = 105
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 109
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==1:
                self.state = 106
                self.match(grammarCParser.T__0)
                self.state = 111
                self._errHandler.sync(self)
                _la = self._input.LA(1)

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
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def getRuleIndex(self):
            return grammarCParser.RULE_typedef

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

        localctx = grammarCParser.TypedefContext(self, self._ctx, self.state)
        self.enterRule(localctx, 16, self.RULE_typedef)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 112
            self.match(grammarCParser.T__6)
            self.state = 113
            self.type_()
            self.state = 114
            self.match(grammarCParser.IDENTIFIER)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class If_statementContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ExprContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ExprContext,i)


        def code(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.CodeContext)
            else:
                return self.getTypedRuleContext(grammarCParser.CodeContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_if_statement

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterIf_statement" ):
                listener.enterIf_statement(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitIf_statement" ):
                listener.exitIf_statement(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitIf_statement" ):
                return visitor.visitIf_statement(self)
            else:
                return visitor.visitChildren(self)




    def if_statement(self):

        localctx = grammarCParser.If_statementContext(self, self._ctx, self.state)
        self.enterRule(localctx, 18, self.RULE_if_statement)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 116
            self.match(grammarCParser.T__7)
            self.state = 117
            self.match(grammarCParser.T__2)
            self.state = 118
            self.expr(0)
            self.state = 119
            self.match(grammarCParser.T__3)
            self.state = 120
            self.match(grammarCParser.T__4)
            self.state = 121
            self.code()
            self.state = 122
            self.match(grammarCParser.T__5)
            self.state = 133
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==9:
                self.state = 123
                self.match(grammarCParser.T__8)
                self.state = 124
                self.match(grammarCParser.T__2)
                self.state = 125
                self.expr(0)
                self.state = 126
                self.match(grammarCParser.T__3)
                self.state = 127
                self.match(grammarCParser.T__4)
                self.state = 128
                self.code()
                self.state = 129
                self.match(grammarCParser.T__5)
                self.state = 135
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 141
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==10:
                self.state = 136
                self.match(grammarCParser.T__9)
                self.state = 137
                self.match(grammarCParser.T__4)
                self.state = 138
                self.code()
                self.state = 139
                self.match(grammarCParser.T__5)


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
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_printf

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

        localctx = grammarCParser.PrintfContext(self, self._ctx, self.state)
        self.enterRule(localctx, 20, self.RULE_printf)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 143
            self.match(grammarCParser.T__10)
            self.state = 144
            self.match(grammarCParser.T__2)
            self.state = 145
            self.match(grammarCParser.T__11)
            self.state = 149
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,15,self._ctx)
            while _alt!=1 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1+1:
                    self.state = 146
                    self.matchWildcard() 
                self.state = 151
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,15,self._ctx)

            self.state = 152
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 253952) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 156
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,16,self._ctx)
            while _alt!=1 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1+1:
                    self.state = 153
                    self.matchWildcard() 
                self.state = 158
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,16,self._ctx)

            self.state = 159
            self.match(grammarCParser.T__11)
            self.state = 160
            self.match(grammarCParser.T__17)

            self.state = 161
            self.expr(0)
            self.state = 162
            self.match(grammarCParser.T__3)
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
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def getRuleIndex(self):
            return grammarCParser.RULE_type

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

        localctx = grammarCParser.TypeContext(self, self._ctx, self.state)
        self.enterRule(localctx, 22, self.RULE_type)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 165
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==19:
                self.state = 164
                self.match(grammarCParser.T__18)


            self.state = 167
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 562949960761344) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 174
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==23:
                self.state = 168
                self.match(grammarCParser.T__22)
                self.state = 170
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if _la==19:
                    self.state = 169
                    self.match(grammarCParser.T__18)


                self.state = 176
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
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def expr(self):
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_declaration

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

        localctx = grammarCParser.DeclarationContext(self, self._ctx, self.state)
        self.enterRule(localctx, 24, self.RULE_declaration)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 177
            self.type_()
            self.state = 178
            self.match(grammarCParser.IDENTIFIER)
            self.state = 181
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==24:
                self.state = 179
                self.match(grammarCParser.T__23)
                self.state = 180
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
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def expr(self):
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_assignment

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

        localctx = grammarCParser.AssignmentContext(self, self._ctx, self.state)
        self.enterRule(localctx, 26, self.RULE_assignment)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 186
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==23:
                self.state = 183
                self.match(grammarCParser.T__22)
                self.state = 188
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 189
            self.match(grammarCParser.IDENTIFIER)

            self.state = 190
            self.match(grammarCParser.T__23)
            self.state = 191
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
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


        def literal(self):
            return self.getTypedRuleContext(grammarCParser.LiteralContext,0)


        def expr(self):
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_conversion

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

        localctx = grammarCParser.ConversionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 28, self.RULE_conversion)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 193
            self.match(grammarCParser.T__2)
            self.state = 194
            self.type_()
            self.state = 195
            self.match(grammarCParser.T__3)
            self.state = 198
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,22,self._ctx)
            if la_ == 1:
                self.state = 196
                self.literal()
                pass

            elif la_ == 2:
                self.state = 197
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
            return self.getTypedRuleContext(grammarCParser.LiteralContext,0)


        def type_(self):
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ExprContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ExprContext,i)


        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def getRuleIndex(self):
            return grammarCParser.RULE_expr

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
        localctx = grammarCParser.ExprContext(self, self._ctx, _parentState)
        _prevctx = localctx
        _startState = 30
        self.enterRecursionRule(localctx, 30, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 217
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,23,self._ctx)
            if la_ == 1:
                self.state = 201
                self.literal()
                pass

            elif la_ == 2:
                self.state = 202
                self.match(grammarCParser.T__2)
                self.state = 203
                self.type_()
                self.state = 204
                self.match(grammarCParser.T__3)
                self.state = 205
                self.expr(15)
                pass

            elif la_ == 3:
                self.state = 207
                self.match(grammarCParser.T__2)
                self.state = 208
                self.expr(0)
                self.state = 209
                self.match(grammarCParser.T__3)
                pass

            elif la_ == 4:
                self.state = 211
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 243269632) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 212
                self.expr(13)
                pass

            elif la_ == 5:
                self.state = 213
                self.match(grammarCParser.IDENTIFIER)
                self.state = 214
                _la = self._input.LA(1)
                if not(_la==25 or _la==26):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                pass

            elif la_ == 6:
                self.state = 215
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 4026531840) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 216
                self.expr(11)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 251
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,25,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 249
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,24,self._ctx)
                    if la_ == 1:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 219
                        if not self.precpred(self._ctx, 10):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 10)")
                        self.state = 220
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 12893290496) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 221
                        self.expr(11)
                        pass

                    elif la_ == 2:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 222
                        if not self.precpred(self._ctx, 9):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 9)")
                        self.state = 223
                        _la = self._input.LA(1)
                        if not(_la==28 or _la==29):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 224
                        self.expr(10)
                        pass

                    elif la_ == 3:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 225
                        if not self.precpred(self._ctx, 8):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 8)")
                        self.state = 226
                        _la = self._input.LA(1)
                        if not(_la==34 or _la==35):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 227
                        self.expr(9)
                        pass

                    elif la_ == 4:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 228
                        if not self.precpred(self._ctx, 7):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 7)")
                        self.state = 229
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 1030792151040) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 230
                        self.expr(8)
                        pass

                    elif la_ == 5:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 231
                        if not self.precpred(self._ctx, 6):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 6)")
                        self.state = 232
                        _la = self._input.LA(1)
                        if not(_la==40 or _la==41):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 233
                        self.expr(7)
                        pass

                    elif la_ == 6:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 234
                        if not self.precpred(self._ctx, 5):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 5)")
                        self.state = 235
                        self.match(grammarCParser.T__26)
                        self.state = 236
                        self.expr(6)
                        pass

                    elif la_ == 7:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 237
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 238
                        self.match(grammarCParser.T__41)
                        self.state = 239
                        self.expr(5)
                        pass

                    elif la_ == 8:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 240
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 241
                        self.match(grammarCParser.T__42)
                        self.state = 242
                        self.expr(4)
                        pass

                    elif la_ == 9:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 243
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 244
                        self.match(grammarCParser.T__43)
                        self.state = 245
                        self.expr(3)
                        pass

                    elif la_ == 10:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 246
                        if not self.precpred(self._ctx, 1):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                        self.state = 247
                        self.match(grammarCParser.T__44)
                        self.state = 248
                        self.expr(2)
                        pass

             
                self.state = 253
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,25,self._ctx)

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
            return self.getToken(grammarCParser.INT, 0)

        def FLOAT(self):
            return self.getToken(grammarCParser.FLOAT, 0)

        def CHAR(self):
            return self.getToken(grammarCParser.CHAR, 0)

        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def conversion(self):
            return self.getTypedRuleContext(grammarCParser.ConversionContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_literal

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

        localctx = grammarCParser.LiteralContext(self, self._ctx, self.state)
        self.enterRule(localctx, 32, self.RULE_literal)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 259
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [50]:
                self.state = 254
                self.match(grammarCParser.INT)
                pass
            elif token in [51]:
                self.state = 255
                self.match(grammarCParser.FLOAT)
                pass
            elif token in [52]:
                self.state = 256
                self.match(grammarCParser.CHAR)
                pass
            elif token in [49]:
                self.state = 257
                self.match(grammarCParser.IDENTIFIER)
                pass
            elif token in [3]:
                self.state = 258
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
            return grammarCParser.RULE_return

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

        localctx = grammarCParser.ReturnContext(self, self._ctx, self.state)
        self.enterRule(localctx, 34, self.RULE_return)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 261
            self.match(grammarCParser.T__45)
            self.state = 263
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==1:
                self.state = 262
                self.match(grammarCParser.T__0)


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
        self._predicates[15] = self.expr_sempred
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
         




