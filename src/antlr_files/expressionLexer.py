# Generated from C:/Users/lucas/OneDrive/Documents/Compilers/Compilers/grammar/expression.g4 by ANTLR 4.13.1
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
    from typing import TextIO
else:
    from typing.io import TextIO


def serializedATN():
    return [
        4,0,10,68,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,
        6,7,6,2,7,7,7,2,8,7,8,2,9,7,9,1,0,1,0,1,1,4,1,25,8,1,11,1,12,1,26,
        1,2,4,2,30,8,2,11,2,12,2,31,1,2,1,2,1,3,1,3,1,3,1,3,1,3,1,3,3,3,
        42,8,3,1,4,1,4,1,4,1,4,1,4,1,4,1,4,1,4,1,4,3,4,53,8,4,1,5,1,5,1,
        5,1,5,3,5,59,8,5,1,6,1,6,1,7,1,7,1,8,1,8,1,9,1,9,0,0,10,1,1,3,2,
        5,3,7,4,9,5,11,6,13,7,15,8,17,9,19,10,1,0,6,1,0,48,57,3,0,9,10,13,
        13,32,32,4,0,37,37,42,43,45,45,47,47,4,0,38,38,94,94,124,124,126,
        126,2,0,60,60,62,62,2,0,43,43,45,45,77,0,1,1,0,0,0,0,3,1,0,0,0,0,
        5,1,0,0,0,0,7,1,0,0,0,0,9,1,0,0,0,0,11,1,0,0,0,0,13,1,0,0,0,0,15,
        1,0,0,0,0,17,1,0,0,0,0,19,1,0,0,0,1,21,1,0,0,0,3,24,1,0,0,0,5,29,
        1,0,0,0,7,41,1,0,0,0,9,52,1,0,0,0,11,58,1,0,0,0,13,60,1,0,0,0,15,
        62,1,0,0,0,17,64,1,0,0,0,19,66,1,0,0,0,21,22,5,59,0,0,22,2,1,0,0,
        0,23,25,7,0,0,0,24,23,1,0,0,0,25,26,1,0,0,0,26,24,1,0,0,0,26,27,
        1,0,0,0,27,4,1,0,0,0,28,30,7,1,0,0,29,28,1,0,0,0,30,31,1,0,0,0,31,
        29,1,0,0,0,31,32,1,0,0,0,32,33,1,0,0,0,33,34,6,2,0,0,34,6,1,0,0,
        0,35,42,7,2,0,0,36,37,5,62,0,0,37,42,5,62,0,0,38,39,5,60,0,0,39,
        42,5,60,0,0,40,42,7,3,0,0,41,35,1,0,0,0,41,36,1,0,0,0,41,38,1,0,
        0,0,41,40,1,0,0,0,42,8,1,0,0,0,43,44,5,61,0,0,44,53,5,61,0,0,45,
        53,7,4,0,0,46,47,5,62,0,0,47,53,5,61,0,0,48,49,5,60,0,0,49,53,5,
        61,0,0,50,51,5,33,0,0,51,53,5,61,0,0,52,43,1,0,0,0,52,45,1,0,0,0,
        52,46,1,0,0,0,52,48,1,0,0,0,52,50,1,0,0,0,53,10,1,0,0,0,54,55,5,
        38,0,0,55,59,5,38,0,0,56,57,5,124,0,0,57,59,5,124,0,0,58,54,1,0,
        0,0,58,56,1,0,0,0,59,12,1,0,0,0,60,61,5,33,0,0,61,14,1,0,0,0,62,
        63,7,5,0,0,63,16,1,0,0,0,64,65,5,40,0,0,65,18,1,0,0,0,66,67,5,41,
        0,0,67,20,1,0,0,0,6,0,26,31,41,52,58,1,6,0,0
    ]

class expressionLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    T__0 = 1
    INT = 2
    WS = 3
    BASEOP = 4
    BOOLOP = 5
    LOGICALOP = 6
    UNARYLOIGICALOP = 7
    UNARYOP = 8
    LEFTPAREN = 9
    RIGHTPAREN = 10

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
            "';'", "'!'", "'('", "')'" ]

    symbolicNames = [ "<INVALID>",
            "INT", "WS", "BASEOP", "BOOLOP", "LOGICALOP", "UNARYLOIGICALOP", 
            "UNARYOP", "LEFTPAREN", "RIGHTPAREN" ]

    ruleNames = [ "T__0", "INT", "WS", "BASEOP", "BOOLOP", "LOGICALOP", 
                  "UNARYLOIGICALOP", "UNARYOP", "LEFTPAREN", "RIGHTPAREN" ]

    grammarFileName = "expression.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.13.1")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


