# Generated from /home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/grammar/grammarC.g4 by ANTLR 4.13.1
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
        4,1,66,385,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,
        2,14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,
        7,20,2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,
        1,0,1,0,1,0,1,1,1,1,1,1,4,1,61,8,1,11,1,12,1,62,1,1,1,1,1,1,1,1,
        5,1,69,8,1,10,1,12,1,72,9,1,1,1,5,1,75,8,1,10,1,12,1,78,9,1,1,2,
        1,2,1,2,1,2,1,2,1,3,1,3,1,3,1,4,1,4,1,5,1,5,3,5,92,8,5,1,5,1,5,1,
        5,5,5,97,8,5,10,5,12,5,100,9,5,1,5,1,5,1,5,1,5,1,5,3,5,107,8,5,1,
        5,5,5,110,8,5,10,5,12,5,113,9,5,1,6,1,6,1,6,1,6,1,6,3,6,120,8,6,
        1,7,1,7,1,7,1,8,1,8,1,8,1,8,1,8,5,8,130,8,8,10,8,12,8,133,9,8,1,
        8,3,8,136,8,8,1,8,1,8,1,9,1,9,1,9,1,9,1,9,3,9,145,8,9,1,10,1,10,
        4,10,149,8,10,11,10,12,10,150,1,10,1,10,1,10,1,10,1,10,1,10,1,10,
        1,10,5,10,161,8,10,10,10,12,10,164,9,10,1,10,5,10,167,8,10,10,10,
        12,10,170,9,10,1,11,1,11,1,11,1,11,1,12,1,12,1,12,1,12,5,12,180,
        8,12,10,12,12,12,183,9,12,1,12,3,12,186,8,12,1,12,1,12,1,13,1,13,
        1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,1,13,3,13,203,
        8,13,3,13,205,8,13,1,14,1,14,1,14,3,14,210,8,14,1,14,1,14,3,14,214,
        8,14,1,14,1,14,3,14,218,8,14,1,14,1,14,1,14,1,14,1,14,1,15,1,15,
        1,15,1,15,1,15,1,15,1,15,1,15,1,16,1,16,1,16,1,16,1,17,1,17,1,17,
        1,17,1,17,1,17,1,17,1,17,3,17,245,8,17,1,17,1,17,5,17,249,8,17,10,
        17,12,17,252,9,17,1,17,1,17,1,18,1,18,1,18,1,18,1,18,5,18,261,8,
        18,10,18,12,18,264,9,18,1,18,3,18,267,8,18,1,18,1,18,1,19,1,19,1,
        19,1,19,5,19,275,8,19,10,19,12,19,278,9,19,1,19,1,19,5,19,282,8,
        19,10,19,12,19,285,9,19,1,19,1,19,1,19,1,19,1,19,1,20,3,20,293,8,
        20,1,20,1,20,1,20,3,20,298,8,20,5,20,300,8,20,10,20,12,20,303,9,
        20,1,21,1,21,3,21,307,8,21,1,22,1,22,1,22,1,22,3,22,313,8,22,1,23,
        5,23,316,8,23,10,23,12,23,319,9,23,1,23,1,23,1,23,1,23,1,24,1,24,
        1,24,1,24,1,24,3,24,330,8,24,1,25,1,25,1,25,1,25,1,25,1,25,1,25,
        1,25,1,25,1,25,1,25,1,25,1,25,1,25,3,25,346,8,25,1,25,1,25,1,25,
        1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,
        1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,1,25,
        1,25,5,25,378,8,25,10,25,12,25,381,9,25,1,26,1,26,1,26,2,276,283,
        1,50,27,0,2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,
        42,44,46,48,50,52,0,13,2,0,5,5,65,65,1,0,59,60,1,0,26,30,2,0,32,
        34,61,61,2,0,35,35,38,40,1,0,38,39,1,0,41,44,2,0,35,35,45,46,1,0,
        41,42,1,0,47,48,1,0,49,52,1,0,53,54,1,0,61,64,426,0,54,1,0,0,0,2,
        70,1,0,0,0,4,79,1,0,0,0,6,84,1,0,0,0,8,87,1,0,0,0,10,91,1,0,0,0,
        12,119,1,0,0,0,14,121,1,0,0,0,16,124,1,0,0,0,18,144,1,0,0,0,20,162,
        1,0,0,0,22,171,1,0,0,0,24,175,1,0,0,0,26,189,1,0,0,0,28,206,1,0,
        0,0,30,224,1,0,0,0,32,232,1,0,0,0,34,236,1,0,0,0,36,255,1,0,0,0,
        38,270,1,0,0,0,40,292,1,0,0,0,42,304,1,0,0,0,44,308,1,0,0,0,46,317,
        1,0,0,0,48,324,1,0,0,0,50,345,1,0,0,0,52,382,1,0,0,0,54,55,3,2,1,
        0,55,56,5,0,0,1,56,1,1,0,0,0,57,69,3,10,5,0,58,60,3,12,6,0,59,61,
        5,1,0,0,60,59,1,0,0,0,61,62,1,0,0,0,62,60,1,0,0,0,62,63,1,0,0,0,
        63,69,1,0,0,0,64,69,3,8,4,0,65,69,3,6,3,0,66,69,3,24,12,0,67,69,
        3,4,2,0,68,57,1,0,0,0,68,58,1,0,0,0,68,64,1,0,0,0,68,65,1,0,0,0,
        68,66,1,0,0,0,68,67,1,0,0,0,69,72,1,0,0,0,70,68,1,0,0,0,70,71,1,
        0,0,0,71,76,1,0,0,0,72,70,1,0,0,0,73,75,5,1,0,0,74,73,1,0,0,0,75,
        78,1,0,0,0,76,74,1,0,0,0,76,77,1,0,0,0,77,3,1,0,0,0,78,76,1,0,0,
        0,79,80,5,2,0,0,80,81,5,61,0,0,81,82,3,2,1,0,82,83,5,3,0,0,83,5,
        1,0,0,0,84,85,5,4,0,0,85,86,7,0,0,0,86,7,1,0,0,0,87,88,7,1,0,0,88,
        9,1,0,0,0,89,92,3,40,20,0,90,92,5,6,0,0,91,89,1,0,0,0,91,90,1,0,
        0,0,92,93,1,0,0,0,93,94,5,61,0,0,94,98,5,7,0,0,95,97,3,14,7,0,96,
        95,1,0,0,0,97,100,1,0,0,0,98,96,1,0,0,0,98,99,1,0,0,0,99,101,1,0,
        0,0,100,98,1,0,0,0,101,106,5,8,0,0,102,103,5,9,0,0,103,104,3,20,
        10,0,104,105,5,10,0,0,105,107,1,0,0,0,106,102,1,0,0,0,106,107,1,
        0,0,0,107,111,1,0,0,0,108,110,5,1,0,0,109,108,1,0,0,0,110,113,1,
        0,0,0,111,109,1,0,0,0,111,112,1,0,0,0,112,11,1,0,0,0,113,111,1,0,
        0,0,114,120,3,44,22,0,115,120,3,50,25,0,116,120,3,46,23,0,117,120,
        3,22,11,0,118,120,3,36,18,0,119,114,1,0,0,0,119,115,1,0,0,0,119,
        116,1,0,0,0,119,117,1,0,0,0,119,118,1,0,0,0,120,13,1,0,0,0,121,122,
        3,40,20,0,122,123,5,61,0,0,123,15,1,0,0,0,124,125,5,61,0,0,125,135,
        5,7,0,0,126,127,3,50,25,0,127,128,5,11,0,0,128,130,1,0,0,0,129,126,
        1,0,0,0,130,133,1,0,0,0,131,129,1,0,0,0,131,132,1,0,0,0,132,134,
        1,0,0,0,133,131,1,0,0,0,134,136,3,50,25,0,135,131,1,0,0,0,135,136,
        1,0,0,0,136,137,1,0,0,0,137,138,5,8,0,0,138,17,1,0,0,0,139,145,3,
        12,6,0,140,145,3,38,19,0,141,145,5,12,0,0,142,145,5,13,0,0,143,145,
        3,42,21,0,144,139,1,0,0,0,144,140,1,0,0,0,144,141,1,0,0,0,144,142,
        1,0,0,0,144,143,1,0,0,0,145,19,1,0,0,0,146,148,3,18,9,0,147,149,
        5,1,0,0,148,147,1,0,0,0,149,150,1,0,0,0,150,148,1,0,0,0,150,151,
        1,0,0,0,151,161,1,0,0,0,152,161,3,8,4,0,153,161,3,26,13,0,154,161,
        3,28,14,0,155,161,3,30,15,0,156,161,3,32,16,0,157,161,3,34,17,0,
        158,161,3,6,3,0,159,161,3,24,12,0,160,146,1,0,0,0,160,152,1,0,0,
        0,160,153,1,0,0,0,160,154,1,0,0,0,160,155,1,0,0,0,160,156,1,0,0,
        0,160,157,1,0,0,0,160,158,1,0,0,0,160,159,1,0,0,0,161,164,1,0,0,
        0,162,160,1,0,0,0,162,163,1,0,0,0,163,168,1,0,0,0,164,162,1,0,0,
        0,165,167,5,1,0,0,166,165,1,0,0,0,167,170,1,0,0,0,168,166,1,0,0,
        0,168,169,1,0,0,0,169,21,1,0,0,0,170,168,1,0,0,0,171,172,5,14,0,
        0,172,173,3,40,20,0,173,174,5,61,0,0,174,23,1,0,0,0,175,176,5,15,
        0,0,176,185,5,61,0,0,177,181,5,7,0,0,178,180,3,14,7,0,179,178,1,
        0,0,0,180,183,1,0,0,0,181,179,1,0,0,0,181,182,1,0,0,0,182,184,1,
        0,0,0,183,181,1,0,0,0,184,186,5,8,0,0,185,177,1,0,0,0,185,186,1,
        0,0,0,186,187,1,0,0,0,187,188,3,50,25,0,188,25,1,0,0,0,189,190,5,
        16,0,0,190,191,5,7,0,0,191,192,3,50,25,0,192,193,5,8,0,0,193,194,
        5,9,0,0,194,195,3,20,10,0,195,204,5,10,0,0,196,202,5,17,0,0,197,
        198,5,9,0,0,198,199,3,20,10,0,199,200,5,10,0,0,200,203,1,0,0,0,201,
        203,3,26,13,0,202,197,1,0,0,0,202,201,1,0,0,0,203,205,1,0,0,0,204,
        196,1,0,0,0,204,205,1,0,0,0,205,27,1,0,0,0,206,207,5,18,0,0,207,
        209,5,7,0,0,208,210,3,18,9,0,209,208,1,0,0,0,209,210,1,0,0,0,210,
        211,1,0,0,0,211,213,5,1,0,0,212,214,3,18,9,0,213,212,1,0,0,0,213,
        214,1,0,0,0,214,215,1,0,0,0,215,217,5,1,0,0,216,218,3,18,9,0,217,
        216,1,0,0,0,217,218,1,0,0,0,218,219,1,0,0,0,219,220,5,8,0,0,220,
        221,5,9,0,0,221,222,3,20,10,0,222,223,5,10,0,0,223,29,1,0,0,0,224,
        225,5,19,0,0,225,226,5,7,0,0,226,227,3,18,9,0,227,228,5,8,0,0,228,
        229,5,9,0,0,229,230,3,20,10,0,230,231,5,10,0,0,231,31,1,0,0,0,232,
        233,5,9,0,0,233,234,3,20,10,0,234,235,5,10,0,0,235,33,1,0,0,0,236,
        237,5,20,0,0,237,238,5,7,0,0,238,239,5,61,0,0,239,240,5,8,0,0,240,
        250,5,9,0,0,241,244,5,21,0,0,242,245,3,52,26,0,243,245,5,61,0,0,
        244,242,1,0,0,0,244,243,1,0,0,0,245,246,1,0,0,0,246,247,5,22,0,0,
        247,249,3,20,10,0,248,241,1,0,0,0,249,252,1,0,0,0,250,248,1,0,0,
        0,250,251,1,0,0,0,251,253,1,0,0,0,252,250,1,0,0,0,253,254,5,10,0,
        0,254,35,1,0,0,0,255,256,5,23,0,0,256,257,5,61,0,0,257,262,5,9,0,
        0,258,259,5,61,0,0,259,261,5,11,0,0,260,258,1,0,0,0,261,264,1,0,
        0,0,262,260,1,0,0,0,262,263,1,0,0,0,263,266,1,0,0,0,264,262,1,0,
        0,0,265,267,5,61,0,0,266,265,1,0,0,0,266,267,1,0,0,0,267,268,1,0,
        0,0,268,269,5,10,0,0,269,37,1,0,0,0,270,271,5,24,0,0,271,272,5,7,
        0,0,272,276,5,25,0,0,273,275,9,0,0,0,274,273,1,0,0,0,275,278,1,0,
        0,0,276,277,1,0,0,0,276,274,1,0,0,0,277,279,1,0,0,0,278,276,1,0,
        0,0,279,283,7,2,0,0,280,282,9,0,0,0,281,280,1,0,0,0,282,285,1,0,
        0,0,283,284,1,0,0,0,283,281,1,0,0,0,284,286,1,0,0,0,285,283,1,0,
        0,0,286,287,5,25,0,0,287,288,5,11,0,0,288,289,3,50,25,0,289,290,
        5,8,0,0,290,39,1,0,0,0,291,293,5,31,0,0,292,291,1,0,0,0,292,293,
        1,0,0,0,293,294,1,0,0,0,294,301,7,3,0,0,295,297,5,35,0,0,296,298,
        5,31,0,0,297,296,1,0,0,0,297,298,1,0,0,0,298,300,1,0,0,0,299,295,
        1,0,0,0,300,303,1,0,0,0,301,299,1,0,0,0,301,302,1,0,0,0,302,41,1,
        0,0,0,303,301,1,0,0,0,304,306,5,36,0,0,305,307,3,50,25,0,306,305,
        1,0,0,0,306,307,1,0,0,0,307,43,1,0,0,0,308,309,3,40,20,0,309,312,
        5,61,0,0,310,311,5,37,0,0,311,313,3,50,25,0,312,310,1,0,0,0,312,
        313,1,0,0,0,313,45,1,0,0,0,314,316,5,35,0,0,315,314,1,0,0,0,316,
        319,1,0,0,0,317,315,1,0,0,0,317,318,1,0,0,0,318,320,1,0,0,0,319,
        317,1,0,0,0,320,321,5,61,0,0,321,322,5,37,0,0,322,323,3,50,25,0,
        323,47,1,0,0,0,324,325,5,7,0,0,325,326,3,40,20,0,326,329,5,8,0,0,
        327,330,3,52,26,0,328,330,3,50,25,0,329,327,1,0,0,0,329,328,1,0,
        0,0,330,49,1,0,0,0,331,332,6,25,-1,0,332,346,3,52,26,0,333,346,3,
        48,24,0,334,346,3,16,8,0,335,336,5,7,0,0,336,337,3,50,25,0,337,338,
        5,8,0,0,338,346,1,0,0,0,339,340,7,4,0,0,340,346,3,50,25,13,341,342,
        5,61,0,0,342,346,7,5,0,0,343,344,7,6,0,0,344,346,3,50,25,11,345,
        331,1,0,0,0,345,333,1,0,0,0,345,334,1,0,0,0,345,335,1,0,0,0,345,
        339,1,0,0,0,345,341,1,0,0,0,345,343,1,0,0,0,346,379,1,0,0,0,347,
        348,10,10,0,0,348,349,7,7,0,0,349,378,3,50,25,11,350,351,10,9,0,
        0,351,352,7,8,0,0,352,378,3,50,25,10,353,354,10,8,0,0,354,355,7,
        9,0,0,355,378,3,50,25,9,356,357,10,7,0,0,357,358,7,10,0,0,358,378,
        3,50,25,8,359,360,10,6,0,0,360,361,7,11,0,0,361,378,3,50,25,7,362,
        363,10,5,0,0,363,364,5,40,0,0,364,378,3,50,25,6,365,366,10,4,0,0,
        366,367,5,55,0,0,367,378,3,50,25,5,368,369,10,3,0,0,369,370,5,56,
        0,0,370,378,3,50,25,4,371,372,10,2,0,0,372,373,5,57,0,0,373,378,
        3,50,25,3,374,375,10,1,0,0,375,376,5,58,0,0,376,378,3,50,25,2,377,
        347,1,0,0,0,377,350,1,0,0,0,377,353,1,0,0,0,377,356,1,0,0,0,377,
        359,1,0,0,0,377,362,1,0,0,0,377,365,1,0,0,0,377,368,1,0,0,0,377,
        371,1,0,0,0,377,374,1,0,0,0,378,381,1,0,0,0,379,377,1,0,0,0,379,
        380,1,0,0,0,380,51,1,0,0,0,381,379,1,0,0,0,382,383,7,12,0,0,383,
        53,1,0,0,0,39,62,68,70,76,91,98,106,111,119,131,135,144,150,160,
        162,168,181,185,202,204,209,213,217,244,250,262,266,276,283,292,
        297,301,306,312,317,329,345,377,379
    ]

class grammarCParser ( Parser ):

    grammarFileName = "grammarC.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "';'", "'#ifndef'", "'#endif'", "'#include'", 
                     "'<stdio.h>'", "'void'", "'('", "')'", "'{'", "'}'", 
                     "','", "'break'", "'continue'", "'typedef'", "'#define'", 
                     "'if'", "'else'", "'for'", "'while'", "'switch'", "'case'", 
                     "':'", "'enum'", "'printf'", "'\"'", "'%s'", "'%d'", 
                     "'%x'", "'%f'", "'%c'", "'const'", "'int'", "'char'", 
                     "'float'", "'*'", "'return'", "'='", "'++'", "'--'", 
                     "'&'", "'+'", "'-'", "'~'", "'!'", "'/'", "'%'", "'>>'", 
                     "'<<'", "'<'", "'>'", "'>='", "'<='", "'=='", "'!='", 
                     "'^'", "'|'", "'&&'", "'||'" ]

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
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "<INVALID>", "<INVALID>", "<INVALID>", "MULTILINE", 
                      "SINGLECOMMENT", "IDENTIFIER", "INT", "FLOAT", "CHAR", 
                      "STRING", "WS" ]

    RULE_start_ = 0
    RULE_code = 1
    RULE_include_guard = 2
    RULE_include = 3
    RULE_comment = 4
    RULE_function = 5
    RULE_line = 6
    RULE_parameter = 7
    RULE_function_call = 8
    RULE_block_line = 9
    RULE_block_code = 10
    RULE_typedef = 11
    RULE_define = 12
    RULE_if = 13
    RULE_for = 14
    RULE_while = 15
    RULE_anonymous_scope = 16
    RULE_switch = 17
    RULE_enum = 18
    RULE_printf = 19
    RULE_type = 20
    RULE_return = 21
    RULE_declaration = 22
    RULE_assignment = 23
    RULE_conversion = 24
    RULE_expr = 25
    RULE_literal = 26

    ruleNames =  [ "start_", "code", "include_guard", "include", "comment", 
                   "function", "line", "parameter", "function_call", "block_line", 
                   "block_code", "typedef", "define", "if", "for", "while", 
                   "anonymous_scope", "switch", "enum", "printf", "type", 
                   "return", "declaration", "assignment", "conversion", 
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
    T__42=43
    T__43=44
    T__44=45
    T__45=46
    T__46=47
    T__47=48
    T__48=49
    T__49=50
    T__50=51
    T__51=52
    T__52=53
    T__53=54
    T__54=55
    T__55=56
    T__56=57
    T__57=58
    MULTILINE=59
    SINGLECOMMENT=60
    IDENTIFIER=61
    INT=62
    FLOAT=63
    CHAR=64
    STRING=65
    WS=66

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
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 54
            self.code()
            self.state = 55
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


        def include(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.IncludeContext)
            else:
                return self.getTypedRuleContext(grammarCParser.IncludeContext,i)


        def define(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.DefineContext)
            else:
                return self.getTypedRuleContext(grammarCParser.DefineContext,i)


        def include_guard(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.Include_guardContext)
            else:
                return self.getTypedRuleContext(grammarCParser.Include_guardContext,i)


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
            self.state = 70
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while ((((_la - 2)) & ~0x3f) == 0 and ((1 << (_la - 2)) & 9079265592797573173) != 0):
                self.state = 68
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,1,self._ctx)
                if la_ == 1:
                    self.state = 57
                    self.function()
                    pass

                elif la_ == 2:
                    self.state = 58
                    self.line()
                    self.state = 60 
                    self._errHandler.sync(self)
                    _alt = 1
                    while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                        if _alt == 1:
                            self.state = 59
                            self.match(grammarCParser.T__0)

                        else:
                            raise NoViableAltException(self)
                        self.state = 62 
                        self._errHandler.sync(self)
                        _alt = self._interp.adaptivePredict(self._input,0,self._ctx)

                    pass

                elif la_ == 3:
                    self.state = 64
                    self.comment()
                    pass

                elif la_ == 4:
                    self.state = 65
                    self.include()
                    pass

                elif la_ == 5:
                    self.state = 66
                    self.define()
                    pass

                elif la_ == 6:
                    self.state = 67
                    self.include_guard()
                    pass


                self.state = 72
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 76
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==1:
                self.state = 73
                self.match(grammarCParser.T__0)
                self.state = 78
                self._errHandler.sync(self)
                _la = self._input.LA(1)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Include_guardContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def code(self):
            return self.getTypedRuleContext(grammarCParser.CodeContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_include_guard

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterInclude_guard" ):
                listener.enterInclude_guard(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitInclude_guard" ):
                listener.exitInclude_guard(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitInclude_guard" ):
                return visitor.visitInclude_guard(self)
            else:
                return visitor.visitChildren(self)




    def include_guard(self):

        localctx = grammarCParser.Include_guardContext(self, self._ctx, self.state)
        self.enterRule(localctx, 4, self.RULE_include_guard)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 79
            self.match(grammarCParser.T__1)
            self.state = 80
            self.match(grammarCParser.IDENTIFIER)
            self.state = 81
            self.code()
            self.state = 82
            self.match(grammarCParser.T__2)
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

        def STRING(self):
            return self.getToken(grammarCParser.STRING, 0)

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
        self.enterRule(localctx, 6, self.RULE_include)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 84
            self.match(grammarCParser.T__3)
            self.state = 85
            _la = self._input.LA(1)
            if not(_la==5 or _la==65):
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
        self.enterRule(localctx, 8, self.RULE_comment)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 87
            _la = self._input.LA(1)
            if not(_la==59 or _la==60):
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

        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def type_(self):
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


        def parameter(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ParameterContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ParameterContext,i)


        def block_code(self):
            return self.getTypedRuleContext(grammarCParser.Block_codeContext,0)


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
        self.enterRule(localctx, 10, self.RULE_function)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 91
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [31, 32, 33, 34, 61]:
                self.state = 89
                self.type_()
                pass
            elif token in [6]:
                self.state = 90
                self.match(grammarCParser.T__5)
                pass
            else:
                raise NoViableAltException(self)

            self.state = 93
            self.match(grammarCParser.IDENTIFIER)
            self.state = 94
            self.match(grammarCParser.T__6)
            self.state = 98
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 2305843041425948672) != 0):
                self.state = 95
                self.parameter()
                self.state = 100
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 101
            self.match(grammarCParser.T__7)
            self.state = 106
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==9:
                self.state = 102
                self.match(grammarCParser.T__8)
                self.state = 103
                self.block_code()
                self.state = 104
                self.match(grammarCParser.T__9)


            self.state = 111
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,7,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 108
                    self.match(grammarCParser.T__0) 
                self.state = 113
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,7,self._ctx)

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


        def enum(self):
            return self.getTypedRuleContext(grammarCParser.EnumContext,0)


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
        self.enterRule(localctx, 12, self.RULE_line)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 119
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,8,self._ctx)
            if la_ == 1:
                self.state = 114
                self.declaration()
                pass

            elif la_ == 2:
                self.state = 115
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 116
                self.assignment()
                pass

            elif la_ == 4:
                self.state = 117
                self.typedef()
                pass

            elif la_ == 5:
                self.state = 118
                self.enum()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ParameterContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def type_(self):
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def getRuleIndex(self):
            return grammarCParser.RULE_parameter

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterParameter" ):
                listener.enterParameter(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitParameter" ):
                listener.exitParameter(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitParameter" ):
                return visitor.visitParameter(self)
            else:
                return visitor.visitChildren(self)




    def parameter(self):

        localctx = grammarCParser.ParameterContext(self, self._ctx, self.state)
        self.enterRule(localctx, 14, self.RULE_parameter)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 121
            self.type_()
            self.state = 122
            self.match(grammarCParser.IDENTIFIER)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Function_callContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ExprContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ExprContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_function_call

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFunction_call" ):
                listener.enterFunction_call(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFunction_call" ):
                listener.exitFunction_call(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFunction_call" ):
                return visitor.visitFunction_call(self)
            else:
                return visitor.visitChildren(self)




    def function_call(self):

        localctx = grammarCParser.Function_callContext(self, self._ctx, self.state)
        self.enterRule(localctx, 16, self.RULE_function_call)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 124
            self.match(grammarCParser.IDENTIFIER)
            self.state = 125
            self.match(grammarCParser.T__6)
            self.state = 135
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 7)) & ~0x3f) == 0 and ((1 << (_la - 7)) & 270216250641088513) != 0):
                self.state = 131
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,9,self._ctx)
                while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                    if _alt==1:
                        self.state = 126
                        self.expr(0)
                        self.state = 127
                        self.match(grammarCParser.T__10) 
                    self.state = 133
                    self._errHandler.sync(self)
                    _alt = self._interp.adaptivePredict(self._input,9,self._ctx)

                self.state = 134
                self.expr(0)


            self.state = 137
            self.match(grammarCParser.T__7)
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

        def line(self):
            return self.getTypedRuleContext(grammarCParser.LineContext,0)


        def printf(self):
            return self.getTypedRuleContext(grammarCParser.PrintfContext,0)


        def return_(self):
            return self.getTypedRuleContext(grammarCParser.ReturnContext,0)


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
        self.enterRule(localctx, 18, self.RULE_block_line)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 144
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [7, 14, 23, 31, 32, 33, 34, 35, 38, 39, 40, 41, 42, 43, 44, 61, 62, 63, 64]:
                self.state = 139
                self.line()
                pass
            elif token in [24]:
                self.state = 140
                self.printf()
                pass
            elif token in [12]:
                self.state = 141
                self.match(grammarCParser.T__11)
                pass
            elif token in [13]:
                self.state = 142
                self.match(grammarCParser.T__12)
                pass
            elif token in [36]:
                self.state = 143
                self.return_()
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


        def if_(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.IfContext)
            else:
                return self.getTypedRuleContext(grammarCParser.IfContext,i)


        def for_(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ForContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ForContext,i)


        def while_(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.WhileContext)
            else:
                return self.getTypedRuleContext(grammarCParser.WhileContext,i)


        def anonymous_scope(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.Anonymous_scopeContext)
            else:
                return self.getTypedRuleContext(grammarCParser.Anonymous_scopeContext,i)


        def switch(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.SwitchContext)
            else:
                return self.getTypedRuleContext(grammarCParser.SwitchContext,i)


        def include(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.IncludeContext)
            else:
                return self.getTypedRuleContext(grammarCParser.IncludeContext,i)


        def define(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.DefineContext)
            else:
                return self.getTypedRuleContext(grammarCParser.DefineContext,i)


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
        self.enterRule(localctx, 20, self.RULE_block_code)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 162
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while ((((_la - 4)) & ~0x3f) == 0 and ((1 << (_la - 4)) & 2269816402495528745) != 0):
                self.state = 160
                self._errHandler.sync(self)
                token = self._input.LA(1)
                if token in [7, 12, 13, 14, 23, 24, 31, 32, 33, 34, 35, 36, 38, 39, 40, 41, 42, 43, 44, 61, 62, 63, 64]:
                    self.state = 146
                    self.block_line()
                    self.state = 148 
                    self._errHandler.sync(self)
                    _alt = 1
                    while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                        if _alt == 1:
                            self.state = 147
                            self.match(grammarCParser.T__0)

                        else:
                            raise NoViableAltException(self)
                        self.state = 150 
                        self._errHandler.sync(self)
                        _alt = self._interp.adaptivePredict(self._input,12,self._ctx)

                    pass
                elif token in [59, 60]:
                    self.state = 152
                    self.comment()
                    pass
                elif token in [16]:
                    self.state = 153
                    self.if_()
                    pass
                elif token in [18]:
                    self.state = 154
                    self.for_()
                    pass
                elif token in [19]:
                    self.state = 155
                    self.while_()
                    pass
                elif token in [9]:
                    self.state = 156
                    self.anonymous_scope()
                    pass
                elif token in [20]:
                    self.state = 157
                    self.switch()
                    pass
                elif token in [4]:
                    self.state = 158
                    self.include()
                    pass
                elif token in [15]:
                    self.state = 159
                    self.define()
                    pass
                else:
                    raise NoViableAltException(self)

                self.state = 164
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 168
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==1:
                self.state = 165
                self.match(grammarCParser.T__0)
                self.state = 170
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
        self.enterRule(localctx, 22, self.RULE_typedef)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 171
            self.match(grammarCParser.T__13)
            self.state = 172
            self.type_()
            self.state = 173
            self.match(grammarCParser.IDENTIFIER)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class DefineContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def expr(self):
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


        def parameter(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ParameterContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ParameterContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_define

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterDefine" ):
                listener.enterDefine(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitDefine" ):
                listener.exitDefine(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitDefine" ):
                return visitor.visitDefine(self)
            else:
                return visitor.visitChildren(self)




    def define(self):

        localctx = grammarCParser.DefineContext(self, self._ctx, self.state)
        self.enterRule(localctx, 24, self.RULE_define)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 175
            self.match(grammarCParser.T__14)
            self.state = 176
            self.match(grammarCParser.IDENTIFIER)
            self.state = 185
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,17,self._ctx)
            if la_ == 1:
                self.state = 177
                self.match(grammarCParser.T__6)
                self.state = 181
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                while (((_la) & ~0x3f) == 0 and ((1 << _la) & 2305843041425948672) != 0):
                    self.state = 178
                    self.parameter()
                    self.state = 183
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)

                self.state = 184
                self.match(grammarCParser.T__7)


            self.state = 187
            self.expr(0)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class IfContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def expr(self):
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


        def block_code(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.Block_codeContext)
            else:
                return self.getTypedRuleContext(grammarCParser.Block_codeContext,i)


        def if_(self):
            return self.getTypedRuleContext(grammarCParser.IfContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_if

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterIf" ):
                listener.enterIf(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitIf" ):
                listener.exitIf(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitIf" ):
                return visitor.visitIf(self)
            else:
                return visitor.visitChildren(self)




    def if_(self):

        localctx = grammarCParser.IfContext(self, self._ctx, self.state)
        self.enterRule(localctx, 26, self.RULE_if)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 189
            self.match(grammarCParser.T__15)
            self.state = 190
            self.match(grammarCParser.T__6)
            self.state = 191
            self.expr(0)
            self.state = 192
            self.match(grammarCParser.T__7)
            self.state = 193
            self.match(grammarCParser.T__8)
            self.state = 194
            self.block_code()
            self.state = 195
            self.match(grammarCParser.T__9)
            self.state = 204
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==17:
                self.state = 196
                self.match(grammarCParser.T__16)
                self.state = 202
                self._errHandler.sync(self)
                token = self._input.LA(1)
                if token in [9]:
                    self.state = 197
                    self.match(grammarCParser.T__8)
                    self.state = 198
                    self.block_code()
                    self.state = 199
                    self.match(grammarCParser.T__9)
                    pass
                elif token in [16]:
                    self.state = 201
                    self.if_()
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


    class ForContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def block_code(self):
            return self.getTypedRuleContext(grammarCParser.Block_codeContext,0)


        def block_line(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.Block_lineContext)
            else:
                return self.getTypedRuleContext(grammarCParser.Block_lineContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_for

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFor" ):
                listener.enterFor(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFor" ):
                listener.exitFor(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFor" ):
                return visitor.visitFor(self)
            else:
                return visitor.visitChildren(self)




    def for_(self):

        localctx = grammarCParser.ForContext(self, self._ctx, self.state)
        self.enterRule(localctx, 28, self.RULE_for)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 206
            self.match(grammarCParser.T__17)
            self.state = 207
            self.match(grammarCParser.T__6)
            self.state = 209
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 7)) & ~0x3f) == 0 and ((1 << (_la - 7)) & 270216251429814497) != 0):
                self.state = 208
                self.block_line()


            self.state = 211
            self.match(grammarCParser.T__0)
            self.state = 213
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 7)) & ~0x3f) == 0 and ((1 << (_la - 7)) & 270216251429814497) != 0):
                self.state = 212
                self.block_line()


            self.state = 215
            self.match(grammarCParser.T__0)
            self.state = 217
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 7)) & ~0x3f) == 0 and ((1 << (_la - 7)) & 270216251429814497) != 0):
                self.state = 216
                self.block_line()


            self.state = 219
            self.match(grammarCParser.T__7)
            self.state = 220
            self.match(grammarCParser.T__8)
            self.state = 221
            self.block_code()
            self.state = 222
            self.match(grammarCParser.T__9)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class WhileContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def block_line(self):
            return self.getTypedRuleContext(grammarCParser.Block_lineContext,0)


        def block_code(self):
            return self.getTypedRuleContext(grammarCParser.Block_codeContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_while

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterWhile" ):
                listener.enterWhile(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitWhile" ):
                listener.exitWhile(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitWhile" ):
                return visitor.visitWhile(self)
            else:
                return visitor.visitChildren(self)




    def while_(self):

        localctx = grammarCParser.WhileContext(self, self._ctx, self.state)
        self.enterRule(localctx, 30, self.RULE_while)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 224
            self.match(grammarCParser.T__18)
            self.state = 225
            self.match(grammarCParser.T__6)
            self.state = 226
            self.block_line()
            self.state = 227
            self.match(grammarCParser.T__7)
            self.state = 228
            self.match(grammarCParser.T__8)
            self.state = 229
            self.block_code()
            self.state = 230
            self.match(grammarCParser.T__9)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Anonymous_scopeContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def block_code(self):
            return self.getTypedRuleContext(grammarCParser.Block_codeContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_anonymous_scope

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterAnonymous_scope" ):
                listener.enterAnonymous_scope(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitAnonymous_scope" ):
                listener.exitAnonymous_scope(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitAnonymous_scope" ):
                return visitor.visitAnonymous_scope(self)
            else:
                return visitor.visitChildren(self)




    def anonymous_scope(self):

        localctx = grammarCParser.Anonymous_scopeContext(self, self._ctx, self.state)
        self.enterRule(localctx, 32, self.RULE_anonymous_scope)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 232
            self.match(grammarCParser.T__8)
            self.state = 233
            self.block_code()
            self.state = 234
            self.match(grammarCParser.T__9)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class SwitchContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENTIFIER(self, i:int=None):
            if i is None:
                return self.getTokens(grammarCParser.IDENTIFIER)
            else:
                return self.getToken(grammarCParser.IDENTIFIER, i)

        def block_code(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.Block_codeContext)
            else:
                return self.getTypedRuleContext(grammarCParser.Block_codeContext,i)


        def literal(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.LiteralContext)
            else:
                return self.getTypedRuleContext(grammarCParser.LiteralContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_switch

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterSwitch" ):
                listener.enterSwitch(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitSwitch" ):
                listener.exitSwitch(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitSwitch" ):
                return visitor.visitSwitch(self)
            else:
                return visitor.visitChildren(self)




    def switch(self):

        localctx = grammarCParser.SwitchContext(self, self._ctx, self.state)
        self.enterRule(localctx, 34, self.RULE_switch)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 236
            self.match(grammarCParser.T__19)
            self.state = 237
            self.match(grammarCParser.T__6)
            self.state = 238
            self.match(grammarCParser.IDENTIFIER)
            self.state = 239
            self.match(grammarCParser.T__7)
            self.state = 240
            self.match(grammarCParser.T__8)
            self.state = 250
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==21:
                self.state = 241
                self.match(grammarCParser.T__20)
                self.state = 244
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,23,self._ctx)
                if la_ == 1:
                    self.state = 242
                    self.literal()
                    pass

                elif la_ == 2:
                    self.state = 243
                    self.match(grammarCParser.IDENTIFIER)
                    pass


                self.state = 246
                self.match(grammarCParser.T__21)
                self.state = 247
                self.block_code()
                self.state = 252
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 253
            self.match(grammarCParser.T__9)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class EnumContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENTIFIER(self, i:int=None):
            if i is None:
                return self.getTokens(grammarCParser.IDENTIFIER)
            else:
                return self.getToken(grammarCParser.IDENTIFIER, i)

        def getRuleIndex(self):
            return grammarCParser.RULE_enum

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterEnum" ):
                listener.enterEnum(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitEnum" ):
                listener.exitEnum(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitEnum" ):
                return visitor.visitEnum(self)
            else:
                return visitor.visitChildren(self)




    def enum(self):

        localctx = grammarCParser.EnumContext(self, self._ctx, self.state)
        self.enterRule(localctx, 36, self.RULE_enum)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 255
            self.match(grammarCParser.T__22)
            self.state = 256
            self.match(grammarCParser.IDENTIFIER)
            self.state = 257
            self.match(grammarCParser.T__8)
            self.state = 262
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,25,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 258
                    self.match(grammarCParser.IDENTIFIER)
                    self.state = 259
                    self.match(grammarCParser.T__10) 
                self.state = 264
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,25,self._ctx)

            self.state = 266
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==61:
                self.state = 265
                self.match(grammarCParser.IDENTIFIER)


            self.state = 268
            self.match(grammarCParser.T__9)
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
        self.enterRule(localctx, 38, self.RULE_printf)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 270
            self.match(grammarCParser.T__23)
            self.state = 271
            self.match(grammarCParser.T__6)
            self.state = 272
            self.match(grammarCParser.T__24)
            self.state = 276
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,27,self._ctx)
            while _alt!=1 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1+1:
                    self.state = 273
                    self.matchWildcard() 
                self.state = 278
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,27,self._ctx)

            self.state = 279
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 2080374784) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 283
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,28,self._ctx)
            while _alt!=1 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1+1:
                    self.state = 280
                    self.matchWildcard() 
                self.state = 285
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,28,self._ctx)

            self.state = 286
            self.match(grammarCParser.T__24)
            self.state = 287
            self.match(grammarCParser.T__10)

            self.state = 288
            self.expr(0)
            self.state = 289
            self.match(grammarCParser.T__7)
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
        self.enterRule(localctx, 40, self.RULE_type)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 292
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==31:
                self.state = 291
                self.match(grammarCParser.T__30)


            self.state = 294
            _la = self._input.LA(1)
            if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 2305843039278465024) != 0)):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 301
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==35:
                self.state = 295
                self.match(grammarCParser.T__34)
                self.state = 297
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if _la==31:
                    self.state = 296
                    self.match(grammarCParser.T__30)


                self.state = 303
                self._errHandler.sync(self)
                _la = self._input.LA(1)

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

        def expr(self):
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


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
        self.enterRule(localctx, 42, self.RULE_return)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 304
            self.match(grammarCParser.T__35)
            self.state = 306
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 7)) & ~0x3f) == 0 and ((1 << (_la - 7)) & 270216250641088513) != 0):
                self.state = 305
                self.expr(0)


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
        self.enterRule(localctx, 44, self.RULE_declaration)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 308
            self.type_()
            self.state = 309
            self.match(grammarCParser.IDENTIFIER)
            self.state = 312
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==37:
                self.state = 310
                self.match(grammarCParser.T__36)
                self.state = 311
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
        self.enterRule(localctx, 46, self.RULE_assignment)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 317
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==35:
                self.state = 314
                self.match(grammarCParser.T__34)
                self.state = 319
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 320
            self.match(grammarCParser.IDENTIFIER)

            self.state = 321
            self.match(grammarCParser.T__36)
            self.state = 322
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
        self.enterRule(localctx, 48, self.RULE_conversion)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 324
            self.match(grammarCParser.T__6)
            self.state = 325
            self.type_()
            self.state = 326
            self.match(grammarCParser.T__7)
            self.state = 329
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,35,self._ctx)
            if la_ == 1:
                self.state = 327
                self.literal()
                pass

            elif la_ == 2:
                self.state = 328
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


        def conversion(self):
            return self.getTypedRuleContext(grammarCParser.ConversionContext,0)


        def function_call(self):
            return self.getTypedRuleContext(grammarCParser.Function_callContext,0)


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
        _startState = 50
        self.enterRecursionRule(localctx, 50, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 345
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,36,self._ctx)
            if la_ == 1:
                self.state = 332
                self.literal()
                pass

            elif la_ == 2:
                self.state = 333
                self.conversion()
                pass

            elif la_ == 3:
                self.state = 334
                self.function_call()
                pass

            elif la_ == 4:
                self.state = 335
                self.match(grammarCParser.T__6)
                self.state = 336
                self.expr(0)
                self.state = 337
                self.match(grammarCParser.T__7)
                pass

            elif la_ == 5:
                self.state = 339
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 1958505086976) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 340
                self.expr(13)
                pass

            elif la_ == 6:
                self.state = 341
                self.match(grammarCParser.IDENTIFIER)
                self.state = 342
                _la = self._input.LA(1)
                if not(_la==38 or _la==39):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                pass

            elif la_ == 7:
                self.state = 343
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 32985348833280) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 344
                self.expr(11)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 379
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,38,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 377
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,37,self._ctx)
                    if la_ == 1:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 347
                        if not self.precpred(self._ctx, 10):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 10)")
                        self.state = 348
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 105587476004864) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 349
                        self.expr(11)
                        pass

                    elif la_ == 2:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 350
                        if not self.precpred(self._ctx, 9):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 9)")
                        self.state = 351
                        _la = self._input.LA(1)
                        if not(_la==41 or _la==42):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 352
                        self.expr(10)
                        pass

                    elif la_ == 3:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 353
                        if not self.precpred(self._ctx, 8):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 8)")
                        self.state = 354
                        _la = self._input.LA(1)
                        if not(_la==47 or _la==48):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 355
                        self.expr(9)
                        pass

                    elif la_ == 4:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 356
                        if not self.precpred(self._ctx, 7):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 7)")
                        self.state = 357
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 8444249301319680) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 358
                        self.expr(8)
                        pass

                    elif la_ == 5:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 359
                        if not self.precpred(self._ctx, 6):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 6)")
                        self.state = 360
                        _la = self._input.LA(1)
                        if not(_la==53 or _la==54):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 361
                        self.expr(7)
                        pass

                    elif la_ == 6:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 362
                        if not self.precpred(self._ctx, 5):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 5)")
                        self.state = 363
                        self.match(grammarCParser.T__39)
                        self.state = 364
                        self.expr(6)
                        pass

                    elif la_ == 7:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 365
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 366
                        self.match(grammarCParser.T__54)
                        self.state = 367
                        self.expr(5)
                        pass

                    elif la_ == 8:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 368
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 369
                        self.match(grammarCParser.T__55)
                        self.state = 370
                        self.expr(4)
                        pass

                    elif la_ == 9:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 371
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 372
                        self.match(grammarCParser.T__56)
                        self.state = 373
                        self.expr(3)
                        pass

                    elif la_ == 10:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 374
                        if not self.precpred(self._ctx, 1):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                        self.state = 375
                        self.match(grammarCParser.T__57)
                        self.state = 376
                        self.expr(2)
                        pass

             
                self.state = 381
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,38,self._ctx)

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
        self.enterRule(localctx, 52, self.RULE_literal)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 382
            _la = self._input.LA(1)
            if not(((((_la - 61)) & ~0x3f) == 0 and ((1 << (_la - 61)) & 15) != 0)):
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
        self._predicates[25] = self.expr_sempred
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
         




