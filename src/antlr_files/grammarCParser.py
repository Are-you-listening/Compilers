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
        4,1,65,473,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,
        2,14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,
        7,20,2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,
        2,27,7,27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,2,33,
        7,33,1,0,1,0,1,0,1,1,1,1,1,1,4,1,75,8,1,11,1,12,1,76,1,1,1,1,1,1,
        1,1,5,1,83,8,1,10,1,12,1,86,9,1,1,1,5,1,89,8,1,10,1,12,1,92,9,1,
        1,2,1,2,1,2,1,2,1,2,1,3,1,3,1,3,1,4,1,4,1,5,1,5,1,5,1,5,1,5,1,5,
        1,5,1,5,1,5,3,5,113,8,5,1,5,5,5,116,8,5,10,5,12,5,119,9,5,1,6,1,
        6,1,6,1,6,1,6,1,6,1,6,3,6,128,8,6,1,7,1,7,1,7,5,7,133,8,7,10,7,12,
        7,136,9,7,1,7,3,7,139,8,7,1,8,1,8,1,8,1,9,1,9,1,9,1,9,3,9,148,8,
        9,1,9,1,9,3,9,152,8,9,1,9,1,9,1,9,1,9,5,9,158,8,9,10,9,12,9,161,
        9,9,1,9,3,9,164,8,9,1,9,4,9,167,8,9,11,9,12,9,168,1,10,1,10,1,11,
        1,11,1,11,1,11,1,11,3,11,178,8,11,1,12,1,12,4,12,182,8,12,11,12,
        12,12,183,1,12,1,12,1,12,1,12,1,12,1,12,1,12,1,12,5,12,194,8,12,
        10,12,12,12,197,9,12,1,12,5,12,200,8,12,10,12,12,12,203,9,12,1,13,
        1,13,1,13,1,13,1,14,1,14,1,14,3,14,212,8,14,1,14,1,14,3,14,216,8,
        14,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,15,1,
        15,3,15,231,8,15,3,15,233,8,15,1,16,1,16,1,16,3,16,238,8,16,1,16,
        1,16,3,16,242,8,16,1,16,1,16,3,16,246,8,16,1,16,1,16,1,16,1,16,1,
        16,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,17,1,18,1,18,1,18,1,18,1,
        19,1,19,1,19,1,19,1,19,1,19,1,19,5,19,272,8,19,10,19,12,19,275,9,
        19,1,19,1,19,1,20,1,20,1,20,3,20,282,8,20,1,20,1,20,1,20,1,21,1,
        21,1,21,1,21,1,22,1,22,1,22,1,22,1,22,5,22,296,8,22,10,22,12,22,
        299,9,22,1,22,3,22,302,8,22,1,22,1,22,1,23,1,23,1,23,1,23,1,23,5,
        23,311,8,23,10,23,12,23,314,9,23,1,23,1,23,1,24,3,24,319,8,24,1,
        24,1,24,1,24,1,24,1,24,1,24,1,24,3,24,328,8,24,1,24,5,24,331,8,24,
        10,24,12,24,334,9,24,1,25,1,25,3,25,338,8,25,1,26,1,26,1,26,1,26,
        5,26,344,8,26,10,26,12,26,347,9,26,1,26,4,26,350,8,26,11,26,12,26,
        351,1,26,1,26,1,27,1,27,1,27,1,28,1,28,1,28,1,28,3,28,363,8,28,1,
        28,1,28,1,28,1,28,1,28,1,29,1,29,1,29,3,29,373,8,29,1,29,1,29,3,
        29,377,8,29,1,30,5,30,380,8,30,10,30,12,30,383,9,30,1,30,1,30,3,
        30,387,8,30,1,30,1,30,1,30,1,31,1,31,1,31,1,31,1,31,3,31,397,8,31,
        1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,5,32,407,8,32,10,32,12,32,
        410,9,32,1,32,3,32,413,8,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,
        32,1,32,1,32,1,32,3,32,426,8,32,1,32,1,32,1,32,1,32,1,32,1,32,1,
        32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,
        32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,1,32,5,32,458,8,
        32,10,32,12,32,461,9,32,1,33,1,33,1,33,1,33,1,33,1,33,3,33,469,8,
        33,3,33,471,8,33,1,33,0,1,64,34,0,2,4,6,8,10,12,14,16,18,20,22,24,
        26,28,30,32,34,36,38,40,42,44,46,48,50,52,54,56,58,60,62,64,66,0,
        14,2,0,5,5,64,64,1,0,57,58,1,0,26,27,2,0,25,25,33,34,2,0,11,11,28,
        28,1,0,33,34,2,0,11,11,37,39,1,0,37,38,2,0,16,16,40,42,2,0,11,11,
        43,44,2,0,16,16,40,40,1,0,45,46,1,0,47,50,1,0,51,52,529,0,68,1,0,
        0,0,2,84,1,0,0,0,4,93,1,0,0,0,6,98,1,0,0,0,8,101,1,0,0,0,10,103,
        1,0,0,0,12,127,1,0,0,0,14,138,1,0,0,0,16,140,1,0,0,0,18,151,1,0,
        0,0,20,170,1,0,0,0,22,177,1,0,0,0,24,195,1,0,0,0,26,204,1,0,0,0,
        28,208,1,0,0,0,30,217,1,0,0,0,32,234,1,0,0,0,34,252,1,0,0,0,36,260,
        1,0,0,0,38,264,1,0,0,0,40,278,1,0,0,0,42,286,1,0,0,0,44,290,1,0,
        0,0,46,305,1,0,0,0,48,318,1,0,0,0,50,335,1,0,0,0,52,339,1,0,0,0,
        54,355,1,0,0,0,56,358,1,0,0,0,58,369,1,0,0,0,60,381,1,0,0,0,62,391,
        1,0,0,0,64,425,1,0,0,0,66,470,1,0,0,0,68,69,3,2,1,0,69,70,5,0,0,
        1,70,1,1,0,0,0,71,83,3,10,5,0,72,74,3,12,6,0,73,75,5,1,0,0,74,73,
        1,0,0,0,75,76,1,0,0,0,76,74,1,0,0,0,76,77,1,0,0,0,77,83,1,0,0,0,
        78,83,3,8,4,0,79,83,3,6,3,0,80,83,3,28,14,0,81,83,3,4,2,0,82,71,
        1,0,0,0,82,72,1,0,0,0,82,78,1,0,0,0,82,79,1,0,0,0,82,80,1,0,0,0,
        82,81,1,0,0,0,83,86,1,0,0,0,84,82,1,0,0,0,84,85,1,0,0,0,85,90,1,
        0,0,0,86,84,1,0,0,0,87,89,5,1,0,0,88,87,1,0,0,0,89,92,1,0,0,0,90,
        88,1,0,0,0,90,91,1,0,0,0,91,3,1,0,0,0,92,90,1,0,0,0,93,94,5,2,0,
        0,94,95,5,59,0,0,95,96,3,2,1,0,96,97,5,3,0,0,97,5,1,0,0,0,98,99,
        5,4,0,0,99,100,7,0,0,0,100,7,1,0,0,0,101,102,7,1,0,0,102,9,1,0,0,
        0,103,104,3,48,24,0,104,105,5,59,0,0,105,106,5,6,0,0,106,107,3,14,
        7,0,107,112,5,7,0,0,108,109,5,8,0,0,109,110,3,24,12,0,110,111,5,
        9,0,0,111,113,1,0,0,0,112,108,1,0,0,0,112,113,1,0,0,0,113,117,1,
        0,0,0,114,116,5,1,0,0,115,114,1,0,0,0,116,119,1,0,0,0,117,115,1,
        0,0,0,117,118,1,0,0,0,118,11,1,0,0,0,119,117,1,0,0,0,120,128,3,58,
        29,0,121,128,3,64,32,0,122,128,3,60,30,0,123,128,3,26,13,0,124,128,
        3,44,22,0,125,128,3,52,26,0,126,128,3,54,27,0,127,120,1,0,0,0,127,
        121,1,0,0,0,127,122,1,0,0,0,127,123,1,0,0,0,127,124,1,0,0,0,127,
        125,1,0,0,0,127,126,1,0,0,0,128,13,1,0,0,0,129,130,3,16,8,0,130,
        131,5,10,0,0,131,133,1,0,0,0,132,129,1,0,0,0,133,136,1,0,0,0,134,
        132,1,0,0,0,134,135,1,0,0,0,135,137,1,0,0,0,136,134,1,0,0,0,137,
        139,3,16,8,0,138,134,1,0,0,0,138,139,1,0,0,0,139,15,1,0,0,0,140,
        141,3,48,24,0,141,142,5,59,0,0,142,17,1,0,0,0,143,144,5,6,0,0,144,
        147,5,11,0,0,145,148,3,18,9,0,146,148,5,59,0,0,147,145,1,0,0,0,147,
        146,1,0,0,0,148,149,1,0,0,0,149,152,5,7,0,0,150,152,5,59,0,0,151,
        143,1,0,0,0,151,150,1,0,0,0,152,166,1,0,0,0,153,163,5,6,0,0,154,
        155,3,20,10,0,155,156,5,10,0,0,156,158,1,0,0,0,157,154,1,0,0,0,158,
        161,1,0,0,0,159,157,1,0,0,0,159,160,1,0,0,0,160,162,1,0,0,0,161,
        159,1,0,0,0,162,164,3,20,10,0,163,159,1,0,0,0,163,164,1,0,0,0,164,
        165,1,0,0,0,165,167,5,7,0,0,166,153,1,0,0,0,167,168,1,0,0,0,168,
        166,1,0,0,0,168,169,1,0,0,0,169,19,1,0,0,0,170,171,3,64,32,0,171,
        21,1,0,0,0,172,178,3,12,6,0,173,178,3,46,23,0,174,178,5,12,0,0,175,
        178,5,13,0,0,176,178,3,50,25,0,177,172,1,0,0,0,177,173,1,0,0,0,177,
        174,1,0,0,0,177,175,1,0,0,0,177,176,1,0,0,0,178,23,1,0,0,0,179,181,
        3,22,11,0,180,182,5,1,0,0,181,180,1,0,0,0,182,183,1,0,0,0,183,181,
        1,0,0,0,183,184,1,0,0,0,184,194,1,0,0,0,185,194,3,8,4,0,186,194,
        3,30,15,0,187,194,3,32,16,0,188,194,3,34,17,0,189,194,3,36,18,0,
        190,194,3,38,19,0,191,194,3,6,3,0,192,194,3,28,14,0,193,179,1,0,
        0,0,193,185,1,0,0,0,193,186,1,0,0,0,193,187,1,0,0,0,193,188,1,0,
        0,0,193,189,1,0,0,0,193,190,1,0,0,0,193,191,1,0,0,0,193,192,1,0,
        0,0,194,197,1,0,0,0,195,193,1,0,0,0,195,196,1,0,0,0,196,201,1,0,
        0,0,197,195,1,0,0,0,198,200,5,1,0,0,199,198,1,0,0,0,200,203,1,0,
        0,0,201,199,1,0,0,0,201,202,1,0,0,0,202,25,1,0,0,0,203,201,1,0,0,
        0,204,205,5,14,0,0,205,206,3,48,24,0,206,207,5,59,0,0,207,27,1,0,
        0,0,208,209,5,15,0,0,209,215,5,59,0,0,210,212,5,16,0,0,211,210,1,
        0,0,0,211,212,1,0,0,0,212,213,1,0,0,0,213,216,3,66,33,0,214,216,
        3,48,24,0,215,211,1,0,0,0,215,214,1,0,0,0,216,29,1,0,0,0,217,218,
        5,17,0,0,218,219,5,6,0,0,219,220,3,64,32,0,220,221,5,7,0,0,221,222,
        5,8,0,0,222,223,3,24,12,0,223,232,5,9,0,0,224,230,5,18,0,0,225,226,
        5,8,0,0,226,227,3,24,12,0,227,228,5,9,0,0,228,231,1,0,0,0,229,231,
        3,30,15,0,230,225,1,0,0,0,230,229,1,0,0,0,231,233,1,0,0,0,232,224,
        1,0,0,0,232,233,1,0,0,0,233,31,1,0,0,0,234,235,5,19,0,0,235,237,
        5,6,0,0,236,238,3,22,11,0,237,236,1,0,0,0,237,238,1,0,0,0,238,239,
        1,0,0,0,239,241,5,1,0,0,240,242,3,22,11,0,241,240,1,0,0,0,241,242,
        1,0,0,0,242,243,1,0,0,0,243,245,5,1,0,0,244,246,3,22,11,0,245,244,
        1,0,0,0,245,246,1,0,0,0,246,247,1,0,0,0,247,248,5,7,0,0,248,249,
        5,8,0,0,249,250,3,24,12,0,250,251,5,9,0,0,251,33,1,0,0,0,252,253,
        5,20,0,0,253,254,5,6,0,0,254,255,3,22,11,0,255,256,5,7,0,0,256,257,
        5,8,0,0,257,258,3,24,12,0,258,259,5,9,0,0,259,35,1,0,0,0,260,261,
        5,8,0,0,261,262,3,24,12,0,262,263,5,9,0,0,263,37,1,0,0,0,264,265,
        5,21,0,0,265,266,5,6,0,0,266,267,5,59,0,0,267,268,5,7,0,0,268,273,
        5,8,0,0,269,272,3,40,20,0,270,272,3,42,21,0,271,269,1,0,0,0,271,
        270,1,0,0,0,272,275,1,0,0,0,273,271,1,0,0,0,273,274,1,0,0,0,274,
        276,1,0,0,0,275,273,1,0,0,0,276,277,5,9,0,0,277,39,1,0,0,0,278,281,
        5,22,0,0,279,282,3,66,33,0,280,282,5,59,0,0,281,279,1,0,0,0,281,
        280,1,0,0,0,282,283,1,0,0,0,283,284,5,23,0,0,284,285,3,24,12,0,285,
        41,1,0,0,0,286,287,5,24,0,0,287,288,5,23,0,0,288,289,3,24,12,0,289,
        43,1,0,0,0,290,291,5,25,0,0,291,292,5,59,0,0,292,297,5,8,0,0,293,
        294,5,59,0,0,294,296,5,10,0,0,295,293,1,0,0,0,296,299,1,0,0,0,297,
        295,1,0,0,0,297,298,1,0,0,0,298,301,1,0,0,0,299,297,1,0,0,0,300,
        302,5,59,0,0,301,300,1,0,0,0,301,302,1,0,0,0,302,303,1,0,0,0,303,
        304,5,9,0,0,304,45,1,0,0,0,305,306,7,2,0,0,306,307,5,6,0,0,307,312,
        5,64,0,0,308,309,5,10,0,0,309,311,3,64,32,0,310,308,1,0,0,0,311,
        314,1,0,0,0,312,310,1,0,0,0,312,313,1,0,0,0,313,315,1,0,0,0,314,
        312,1,0,0,0,315,316,5,7,0,0,316,47,1,0,0,0,317,319,5,28,0,0,318,
        317,1,0,0,0,318,319,1,0,0,0,319,327,1,0,0,0,320,328,5,29,0,0,321,
        328,5,30,0,0,322,328,5,31,0,0,323,328,5,32,0,0,324,325,7,3,0,0,325,
        328,5,59,0,0,326,328,5,59,0,0,327,320,1,0,0,0,327,321,1,0,0,0,327,
        322,1,0,0,0,327,323,1,0,0,0,327,324,1,0,0,0,327,326,1,0,0,0,328,
        332,1,0,0,0,329,331,7,4,0,0,330,329,1,0,0,0,331,334,1,0,0,0,332,
        330,1,0,0,0,332,333,1,0,0,0,333,49,1,0,0,0,334,332,1,0,0,0,335,337,
        5,35,0,0,336,338,3,64,32,0,337,336,1,0,0,0,337,338,1,0,0,0,338,51,
        1,0,0,0,339,340,7,5,0,0,340,341,5,59,0,0,341,345,5,8,0,0,342,344,
        3,58,29,0,343,342,1,0,0,0,344,347,1,0,0,0,345,343,1,0,0,0,345,346,
        1,0,0,0,346,349,1,0,0,0,347,345,1,0,0,0,348,350,5,1,0,0,349,348,
        1,0,0,0,350,351,1,0,0,0,351,349,1,0,0,0,351,352,1,0,0,0,352,353,
        1,0,0,0,353,354,5,9,0,0,354,53,1,0,0,0,355,356,3,48,24,0,356,357,
        3,56,28,0,357,55,1,0,0,0,358,359,5,6,0,0,359,362,5,11,0,0,360,363,
        3,56,28,0,361,363,5,59,0,0,362,360,1,0,0,0,362,361,1,0,0,0,363,364,
        1,0,0,0,364,365,5,7,0,0,365,366,5,6,0,0,366,367,3,14,7,0,367,368,
        5,7,0,0,368,57,1,0,0,0,369,370,3,48,24,0,370,372,5,59,0,0,371,373,
        5,63,0,0,372,371,1,0,0,0,372,373,1,0,0,0,373,376,1,0,0,0,374,375,
        5,36,0,0,375,377,3,64,32,0,376,374,1,0,0,0,376,377,1,0,0,0,377,59,
        1,0,0,0,378,380,5,11,0,0,379,378,1,0,0,0,380,383,1,0,0,0,381,379,
        1,0,0,0,381,382,1,0,0,0,382,384,1,0,0,0,383,381,1,0,0,0,384,386,
        5,59,0,0,385,387,5,63,0,0,386,385,1,0,0,0,386,387,1,0,0,0,387,388,
        1,0,0,0,388,389,5,36,0,0,389,390,3,64,32,0,390,61,1,0,0,0,391,392,
        5,6,0,0,392,393,3,48,24,0,393,396,5,7,0,0,394,397,3,66,33,0,395,
        397,3,64,32,0,396,394,1,0,0,0,396,395,1,0,0,0,397,63,1,0,0,0,398,
        399,6,32,-1,0,399,426,3,66,33,0,400,426,3,62,31,0,401,426,3,18,9,
        0,402,412,5,8,0,0,403,404,3,64,32,0,404,405,5,10,0,0,405,407,1,0,
        0,0,406,403,1,0,0,0,407,410,1,0,0,0,408,406,1,0,0,0,408,409,1,0,
        0,0,409,411,1,0,0,0,410,408,1,0,0,0,411,413,3,64,32,0,412,408,1,
        0,0,0,412,413,1,0,0,0,413,414,1,0,0,0,414,426,5,9,0,0,415,416,5,
        6,0,0,416,417,3,64,32,0,417,418,5,7,0,0,418,426,1,0,0,0,419,420,
        7,6,0,0,420,426,3,64,32,13,421,422,5,59,0,0,422,426,7,7,0,0,423,
        424,7,8,0,0,424,426,3,64,32,11,425,398,1,0,0,0,425,400,1,0,0,0,425,
        401,1,0,0,0,425,402,1,0,0,0,425,415,1,0,0,0,425,419,1,0,0,0,425,
        421,1,0,0,0,425,423,1,0,0,0,426,459,1,0,0,0,427,428,10,10,0,0,428,
        429,7,9,0,0,429,458,3,64,32,11,430,431,10,9,0,0,431,432,7,10,0,0,
        432,458,3,64,32,10,433,434,10,8,0,0,434,435,7,11,0,0,435,458,3,64,
        32,9,436,437,10,7,0,0,437,438,7,12,0,0,438,458,3,64,32,8,439,440,
        10,6,0,0,440,441,7,13,0,0,441,458,3,64,32,7,442,443,10,5,0,0,443,
        444,5,39,0,0,444,458,3,64,32,6,445,446,10,4,0,0,446,447,5,53,0,0,
        447,458,3,64,32,5,448,449,10,3,0,0,449,450,5,54,0,0,450,458,3,64,
        32,4,451,452,10,2,0,0,452,453,5,55,0,0,453,458,3,64,32,3,454,455,
        10,1,0,0,455,456,5,56,0,0,456,458,3,64,32,2,457,427,1,0,0,0,457,
        430,1,0,0,0,457,433,1,0,0,0,457,436,1,0,0,0,457,439,1,0,0,0,457,
        442,1,0,0,0,457,445,1,0,0,0,457,448,1,0,0,0,457,451,1,0,0,0,457,
        454,1,0,0,0,458,461,1,0,0,0,459,457,1,0,0,0,459,460,1,0,0,0,460,
        65,1,0,0,0,461,459,1,0,0,0,462,471,5,60,0,0,463,471,5,61,0,0,464,
        471,5,62,0,0,465,471,5,64,0,0,466,468,5,59,0,0,467,469,5,63,0,0,
        468,467,1,0,0,0,468,469,1,0,0,0,469,471,1,0,0,0,470,462,1,0,0,0,
        470,463,1,0,0,0,470,464,1,0,0,0,470,465,1,0,0,0,470,466,1,0,0,0,
        471,67,1,0,0,0,51,76,82,84,90,112,117,127,134,138,147,151,159,163,
        168,177,183,193,195,201,211,215,230,232,237,241,245,271,273,281,
        297,301,312,318,327,332,337,345,351,362,372,376,381,386,396,408,
        412,425,457,459,468,470
    ]

class grammarCParser ( Parser ):

    grammarFileName = "grammarC.g4"

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    sharedContextCache = PredictionContextCache()

    literalNames = [ "<INVALID>", "';'", "'#ifndef'", "'#endif'", "'#include'", 
                     "'<stdio.h>'", "'('", "')'", "'{'", "'}'", "','", "'*'", 
                     "'break'", "'continue'", "'typedef'", "'#define'", 
                     "'-'", "'if'", "'else'", "'for'", "'while'", "'switch'", 
                     "'case'", "':'", "'default'", "'enum'", "'printf'", 
                     "'scanf'", "'const'", "'int'", "'char'", "'float'", 
                     "'void'", "'struct'", "'union'", "'return'", "'='", 
                     "'++'", "'--'", "'&'", "'+'", "'~'", "'!'", "'/'", 
                     "'%'", "'>>'", "'<<'", "'<'", "'>'", "'>='", "'<='", 
                     "'=='", "'!='", "'^'", "'|'", "'&&'", "'||'" ]

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
                      "<INVALID>", "MULTILINE", "SINGLECOMMENT", "IDENTIFIER", 
                      "INT", "FLOAT", "CHAR", "ARRAY", "STRING", "WS" ]

    RULE_start_ = 0
    RULE_code = 1
    RULE_include_guard = 2
    RULE_include = 3
    RULE_comment = 4
    RULE_function = 5
    RULE_line = 6
    RULE_parameters = 7
    RULE_parameter = 8
    RULE_function_call = 9
    RULE_parameter_call = 10
    RULE_block_line = 11
    RULE_block_code = 12
    RULE_typedef = 13
    RULE_define = 14
    RULE_if = 15
    RULE_for = 16
    RULE_while = 17
    RULE_anonymous_scope = 18
    RULE_switch = 19
    RULE_case = 20
    RULE_default = 21
    RULE_enum = 22
    RULE_printscanf = 23
    RULE_type = 24
    RULE_return = 25
    RULE_structunion = 26
    RULE_function_ptr = 27
    RULE_function_ptr_2 = 28
    RULE_declaration = 29
    RULE_assignment = 30
    RULE_conversion = 31
    RULE_expr = 32
    RULE_literal = 33

    ruleNames =  [ "start_", "code", "include_guard", "include", "comment", 
                   "function", "line", "parameters", "parameter", "function_call", 
                   "parameter_call", "block_line", "block_code", "typedef", 
                   "define", "if", "for", "while", "anonymous_scope", "switch", 
                   "case", "default", "enum", "printscanf", "type", "return", 
                   "structunion", "function_ptr", "function_ptr_2", "declaration", 
                   "assignment", "conversion", "expr", "literal" ]

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
    MULTILINE=57
    SINGLECOMMENT=58
    IDENTIFIER=59
    INT=60
    FLOAT=61
    CHAR=62
    ARRAY=63
    STRING=64
    WS=65

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
            self.state = 68
            self.code()
            self.state = 69
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
            self.state = 84
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while ((((_la - 2)) & ~0x3f) == 0 and ((1 << (_la - 2)) & 6881502403816878677) != 0):
                self.state = 82
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,1,self._ctx)
                if la_ == 1:
                    self.state = 71
                    self.function()
                    pass

                elif la_ == 2:
                    self.state = 72
                    self.line()
                    self.state = 74 
                    self._errHandler.sync(self)
                    _alt = 1
                    while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                        if _alt == 1:
                            self.state = 73
                            self.match(grammarCParser.T__0)

                        else:
                            raise NoViableAltException(self)
                        self.state = 76 
                        self._errHandler.sync(self)
                        _alt = self._interp.adaptivePredict(self._input,0,self._ctx)

                    pass

                elif la_ == 3:
                    self.state = 78
                    self.comment()
                    pass

                elif la_ == 4:
                    self.state = 79
                    self.include()
                    pass

                elif la_ == 5:
                    self.state = 80
                    self.define()
                    pass

                elif la_ == 6:
                    self.state = 81
                    self.include_guard()
                    pass


                self.state = 86
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 90
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==1:
                self.state = 87
                self.match(grammarCParser.T__0)
                self.state = 92
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
            self.state = 93
            self.match(grammarCParser.T__1)
            self.state = 94
            self.match(grammarCParser.IDENTIFIER)
            self.state = 95
            self.code()
            self.state = 96
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
            self.state = 98
            self.match(grammarCParser.T__3)
            self.state = 99
            _la = self._input.LA(1)
            if not(_la==5 or _la==64):
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
            self.state = 101
            _la = self._input.LA(1)
            if not(_la==57 or _la==58):
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

        def parameters(self):
            return self.getTypedRuleContext(grammarCParser.ParametersContext,0)


        def type_(self):
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


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
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 103
            self.type_()
            self.state = 104
            self.match(grammarCParser.IDENTIFIER)
            self.state = 105
            self.match(grammarCParser.T__5)
            self.state = 106
            self.parameters()
            self.state = 107
            self.match(grammarCParser.T__6)
            self.state = 112
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,4,self._ctx)
            if la_ == 1:
                self.state = 108
                self.match(grammarCParser.T__7)
                self.state = 109
                self.block_code()
                self.state = 110
                self.match(grammarCParser.T__8)


            self.state = 117
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,5,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 114
                    self.match(grammarCParser.T__0) 
                self.state = 119
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


        def enum(self):
            return self.getTypedRuleContext(grammarCParser.EnumContext,0)


        def structunion(self):
            return self.getTypedRuleContext(grammarCParser.StructunionContext,0)


        def function_ptr(self):
            return self.getTypedRuleContext(grammarCParser.Function_ptrContext,0)


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
            self.state = 127
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,6,self._ctx)
            if la_ == 1:
                self.state = 120
                self.declaration()
                pass

            elif la_ == 2:
                self.state = 121
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 122
                self.assignment()
                pass

            elif la_ == 4:
                self.state = 123
                self.typedef()
                pass

            elif la_ == 5:
                self.state = 124
                self.enum()
                pass

            elif la_ == 6:
                self.state = 125
                self.structunion()
                pass

            elif la_ == 7:
                self.state = 126
                self.function_ptr()
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class ParametersContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def parameter(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ParameterContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ParameterContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_parameters

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterParameters" ):
                listener.enterParameters(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitParameters" ):
                listener.exitParameters(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitParameters" ):
                return visitor.visitParameters(self)
            else:
                return visitor.visitChildren(self)




    def parameters(self):

        localctx = grammarCParser.ParametersContext(self, self._ctx, self.state)
        self.enterRule(localctx, 14, self.RULE_parameters)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 138
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if (((_la) & ~0x3f) == 0 and ((1 << _la) & 576460786428280832) != 0):
                self.state = 134
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,7,self._ctx)
                while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                    if _alt==1:
                        self.state = 129
                        self.parameter()
                        self.state = 130
                        self.match(grammarCParser.T__9) 
                    self.state = 136
                    self._errHandler.sync(self)
                    _alt = self._interp.adaptivePredict(self._input,7,self._ctx)

                self.state = 137
                self.parameter()


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
        self.enterRule(localctx, 16, self.RULE_parameter)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 140
            self.type_()
            self.state = 141
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

        def function_call(self):
            return self.getTypedRuleContext(grammarCParser.Function_callContext,0)


        def parameter_call(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.Parameter_callContext)
            else:
                return self.getTypedRuleContext(grammarCParser.Parameter_callContext,i)


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
        self.enterRule(localctx, 18, self.RULE_function_call)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 151
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [6]:
                self.state = 143
                self.match(grammarCParser.T__5)
                self.state = 144
                self.match(grammarCParser.T__10)
                self.state = 147
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,9,self._ctx)
                if la_ == 1:
                    self.state = 145
                    self.function_call()
                    pass

                elif la_ == 2:
                    self.state = 146
                    self.match(grammarCParser.IDENTIFIER)
                    pass


                self.state = 149
                self.match(grammarCParser.T__6)
                pass
            elif token in [59]:
                self.state = 150
                self.match(grammarCParser.IDENTIFIER)
                pass
            else:
                raise NoViableAltException(self)

            self.state = 166 
            self._errHandler.sync(self)
            _alt = 1
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt == 1:
                    self.state = 153
                    self.match(grammarCParser.T__5)
                    self.state = 163
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)
                    if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 423338500264297509) != 0):
                        self.state = 159
                        self._errHandler.sync(self)
                        _alt = self._interp.adaptivePredict(self._input,11,self._ctx)
                        while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                            if _alt==1:
                                self.state = 154
                                self.parameter_call()
                                self.state = 155
                                self.match(grammarCParser.T__9) 
                            self.state = 161
                            self._errHandler.sync(self)
                            _alt = self._interp.adaptivePredict(self._input,11,self._ctx)

                        self.state = 162
                        self.parameter_call()


                    self.state = 165
                    self.match(grammarCParser.T__6)

                else:
                    raise NoViableAltException(self)
                self.state = 168 
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,13,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Parameter_callContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def expr(self):
            return self.getTypedRuleContext(grammarCParser.ExprContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_parameter_call

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterParameter_call" ):
                listener.enterParameter_call(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitParameter_call" ):
                listener.exitParameter_call(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitParameter_call" ):
                return visitor.visitParameter_call(self)
            else:
                return visitor.visitChildren(self)




    def parameter_call(self):

        localctx = grammarCParser.Parameter_callContext(self, self._ctx, self.state)
        self.enterRule(localctx, 20, self.RULE_parameter_call)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 170
            self.expr(0)
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


        def printscanf(self):
            return self.getTypedRuleContext(grammarCParser.PrintscanfContext,0)


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
        self.enterRule(localctx, 22, self.RULE_block_line)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 177
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [6, 8, 11, 14, 16, 25, 28, 29, 30, 31, 32, 33, 34, 37, 38, 39, 40, 41, 42, 59, 60, 61, 62, 64]:
                self.state = 172
                self.line()
                pass
            elif token in [26, 27]:
                self.state = 173
                self.printscanf()
                pass
            elif token in [12]:
                self.state = 174
                self.match(grammarCParser.T__11)
                pass
            elif token in [13]:
                self.state = 175
                self.match(grammarCParser.T__12)
                pass
            elif token in [35]:
                self.state = 176
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
        self.enterRule(localctx, 24, self.RULE_block_code)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 195
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while ((((_la - 4)) & ~0x3f) == 0 and ((1 << (_la - 4)) & 1720375603114524565) != 0):
                self.state = 193
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,16,self._ctx)
                if la_ == 1:
                    self.state = 179
                    self.block_line()
                    self.state = 181 
                    self._errHandler.sync(self)
                    _alt = 1
                    while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                        if _alt == 1:
                            self.state = 180
                            self.match(grammarCParser.T__0)

                        else:
                            raise NoViableAltException(self)
                        self.state = 183 
                        self._errHandler.sync(self)
                        _alt = self._interp.adaptivePredict(self._input,15,self._ctx)

                    pass

                elif la_ == 2:
                    self.state = 185
                    self.comment()
                    pass

                elif la_ == 3:
                    self.state = 186
                    self.if_()
                    pass

                elif la_ == 4:
                    self.state = 187
                    self.for_()
                    pass

                elif la_ == 5:
                    self.state = 188
                    self.while_()
                    pass

                elif la_ == 6:
                    self.state = 189
                    self.anonymous_scope()
                    pass

                elif la_ == 7:
                    self.state = 190
                    self.switch()
                    pass

                elif la_ == 8:
                    self.state = 191
                    self.include()
                    pass

                elif la_ == 9:
                    self.state = 192
                    self.define()
                    pass


                self.state = 197
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 201
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==1:
                self.state = 198
                self.match(grammarCParser.T__0)
                self.state = 203
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
        self.enterRule(localctx, 26, self.RULE_typedef)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 204
            self.match(grammarCParser.T__13)
            self.state = 205
            self.type_()
            self.state = 206
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

        def type_(self):
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


        def literal(self):
            return self.getTypedRuleContext(grammarCParser.LiteralContext,0)


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
        self.enterRule(localctx, 28, self.RULE_define)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 208
            self.match(grammarCParser.T__14)
            self.state = 209
            self.match(grammarCParser.IDENTIFIER)
            self.state = 215
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,20,self._ctx)
            if la_ == 1:
                self.state = 211
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if _la==16:
                    self.state = 210
                    self.match(grammarCParser.T__15)


                self.state = 213
                self.literal()
                pass

            elif la_ == 2:
                self.state = 214
                self.type_()
                pass


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
        self.enterRule(localctx, 30, self.RULE_if)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 217
            self.match(grammarCParser.T__16)
            self.state = 218
            self.match(grammarCParser.T__5)
            self.state = 219
            self.expr(0)
            self.state = 220
            self.match(grammarCParser.T__6)
            self.state = 221
            self.match(grammarCParser.T__7)
            self.state = 222
            self.block_code()
            self.state = 223
            self.match(grammarCParser.T__8)
            self.state = 232
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==18:
                self.state = 224
                self.match(grammarCParser.T__17)
                self.state = 230
                self._errHandler.sync(self)
                token = self._input.LA(1)
                if token in [8]:
                    self.state = 225
                    self.match(grammarCParser.T__7)
                    self.state = 226
                    self.block_code()
                    self.state = 227
                    self.match(grammarCParser.T__8)
                    pass
                elif token in [17]:
                    self.state = 229
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
        self.enterRule(localctx, 32, self.RULE_for)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 234
            self.match(grammarCParser.T__18)
            self.state = 235
            self.match(grammarCParser.T__5)
            self.state = 237
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 423338501337515493) != 0):
                self.state = 236
                self.block_line()


            self.state = 239
            self.match(grammarCParser.T__0)
            self.state = 241
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 423338501337515493) != 0):
                self.state = 240
                self.block_line()


            self.state = 243
            self.match(grammarCParser.T__0)
            self.state = 245
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 423338501337515493) != 0):
                self.state = 244
                self.block_line()


            self.state = 247
            self.match(grammarCParser.T__6)
            self.state = 248
            self.match(grammarCParser.T__7)
            self.state = 249
            self.block_code()
            self.state = 250
            self.match(grammarCParser.T__8)
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
        self.enterRule(localctx, 34, self.RULE_while)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 252
            self.match(grammarCParser.T__19)
            self.state = 253
            self.match(grammarCParser.T__5)
            self.state = 254
            self.block_line()
            self.state = 255
            self.match(grammarCParser.T__6)
            self.state = 256
            self.match(grammarCParser.T__7)
            self.state = 257
            self.block_code()
            self.state = 258
            self.match(grammarCParser.T__8)
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
        self.enterRule(localctx, 36, self.RULE_anonymous_scope)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 260
            self.match(grammarCParser.T__7)
            self.state = 261
            self.block_code()
            self.state = 262
            self.match(grammarCParser.T__8)
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

        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def case(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.CaseContext)
            else:
                return self.getTypedRuleContext(grammarCParser.CaseContext,i)


        def default(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.DefaultContext)
            else:
                return self.getTypedRuleContext(grammarCParser.DefaultContext,i)


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
        self.enterRule(localctx, 38, self.RULE_switch)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 264
            self.match(grammarCParser.T__20)
            self.state = 265
            self.match(grammarCParser.T__5)
            self.state = 266
            self.match(grammarCParser.IDENTIFIER)
            self.state = 267
            self.match(grammarCParser.T__6)
            self.state = 268
            self.match(grammarCParser.T__7)
            self.state = 273
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==22 or _la==24:
                self.state = 271
                self._errHandler.sync(self)
                token = self._input.LA(1)
                if token in [22]:
                    self.state = 269
                    self.case()
                    pass
                elif token in [24]:
                    self.state = 270
                    self.default()
                    pass
                else:
                    raise NoViableAltException(self)

                self.state = 275
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 276
            self.match(grammarCParser.T__8)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class CaseContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def block_code(self):
            return self.getTypedRuleContext(grammarCParser.Block_codeContext,0)


        def literal(self):
            return self.getTypedRuleContext(grammarCParser.LiteralContext,0)


        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def getRuleIndex(self):
            return grammarCParser.RULE_case

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterCase" ):
                listener.enterCase(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitCase" ):
                listener.exitCase(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitCase" ):
                return visitor.visitCase(self)
            else:
                return visitor.visitChildren(self)




    def case(self):

        localctx = grammarCParser.CaseContext(self, self._ctx, self.state)
        self.enterRule(localctx, 40, self.RULE_case)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 278
            self.match(grammarCParser.T__21)
            self.state = 281
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,28,self._ctx)
            if la_ == 1:
                self.state = 279
                self.literal()
                pass

            elif la_ == 2:
                self.state = 280
                self.match(grammarCParser.IDENTIFIER)
                pass


            self.state = 283
            self.match(grammarCParser.T__22)
            self.state = 284
            self.block_code()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class DefaultContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def block_code(self):
            return self.getTypedRuleContext(grammarCParser.Block_codeContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_default

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterDefault" ):
                listener.enterDefault(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitDefault" ):
                listener.exitDefault(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitDefault" ):
                return visitor.visitDefault(self)
            else:
                return visitor.visitChildren(self)




    def default(self):

        localctx = grammarCParser.DefaultContext(self, self._ctx, self.state)
        self.enterRule(localctx, 42, self.RULE_default)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 286
            self.match(grammarCParser.T__23)
            self.state = 287
            self.match(grammarCParser.T__22)
            self.state = 288
            self.block_code()
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
        self.enterRule(localctx, 44, self.RULE_enum)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 290
            self.match(grammarCParser.T__24)
            self.state = 291
            self.match(grammarCParser.IDENTIFIER)
            self.state = 292
            self.match(grammarCParser.T__7)
            self.state = 297
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,29,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 293
                    self.match(grammarCParser.IDENTIFIER)
                    self.state = 294
                    self.match(grammarCParser.T__9) 
                self.state = 299
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,29,self._ctx)

            self.state = 301
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==59:
                self.state = 300
                self.match(grammarCParser.IDENTIFIER)


            self.state = 303
            self.match(grammarCParser.T__8)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class PrintscanfContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def STRING(self):
            return self.getToken(grammarCParser.STRING, 0)

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ExprContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ExprContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_printscanf

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterPrintscanf" ):
                listener.enterPrintscanf(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitPrintscanf" ):
                listener.exitPrintscanf(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitPrintscanf" ):
                return visitor.visitPrintscanf(self)
            else:
                return visitor.visitChildren(self)




    def printscanf(self):

        localctx = grammarCParser.PrintscanfContext(self, self._ctx, self.state)
        self.enterRule(localctx, 46, self.RULE_printscanf)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 305
            _la = self._input.LA(1)
            if not(_la==26 or _la==27):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 306
            self.match(grammarCParser.T__5)
            self.state = 307
            self.match(grammarCParser.STRING)
            self.state = 312
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==10:
                self.state = 308
                self.match(grammarCParser.T__9)
                self.state = 309
                self.expr(0)
                self.state = 314
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 315
            self.match(grammarCParser.T__6)
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
        self.enterRule(localctx, 48, self.RULE_type)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 318
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==28:
                self.state = 317
                self.match(grammarCParser.T__27)


            self.state = 327
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [29]:
                self.state = 320
                self.match(grammarCParser.T__28)
                pass
            elif token in [30]:
                self.state = 321
                self.match(grammarCParser.T__29)
                pass
            elif token in [31]:
                self.state = 322
                self.match(grammarCParser.T__30)
                pass
            elif token in [32]:
                self.state = 323
                self.match(grammarCParser.T__31)
                pass
            elif token in [25, 33, 34]:
                self.state = 324
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 25803358208) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 325
                self.match(grammarCParser.IDENTIFIER)
                pass
            elif token in [59]:
                self.state = 326
                self.match(grammarCParser.IDENTIFIER)
                pass
            else:
                raise NoViableAltException(self)

            self.state = 332
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,34,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 329
                    _la = self._input.LA(1)
                    if not(_la==11 or _la==28):
                        self._errHandler.recoverInline(self)
                    else:
                        self._errHandler.reportMatch(self)
                        self.consume() 
                self.state = 334
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,34,self._ctx)

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
        self.enterRule(localctx, 50, self.RULE_return)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 335
            self.match(grammarCParser.T__34)
            self.state = 337
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 423338500264297509) != 0):
                self.state = 336
                self.expr(0)


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class StructunionContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def declaration(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.DeclarationContext)
            else:
                return self.getTypedRuleContext(grammarCParser.DeclarationContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_structunion

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterStructunion" ):
                listener.enterStructunion(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitStructunion" ):
                listener.exitStructunion(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitStructunion" ):
                return visitor.visitStructunion(self)
            else:
                return visitor.visitChildren(self)




    def structunion(self):

        localctx = grammarCParser.StructunionContext(self, self._ctx, self.state)
        self.enterRule(localctx, 52, self.RULE_structunion)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 339
            _la = self._input.LA(1)
            if not(_la==33 or _la==34):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 340
            self.match(grammarCParser.IDENTIFIER)
            self.state = 341
            self.match(grammarCParser.T__7)
            self.state = 345
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & 576460786428280832) != 0):
                self.state = 342
                self.declaration()
                self.state = 347
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 349 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 348
                self.match(grammarCParser.T__0)
                self.state = 351 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not (_la==1):
                    break

            self.state = 353
            self.match(grammarCParser.T__8)
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Function_ptrContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def function_ptr_2(self):
            return self.getTypedRuleContext(grammarCParser.Function_ptr_2Context,0)


        def type_(self):
            return self.getTypedRuleContext(grammarCParser.TypeContext,0)


        def getRuleIndex(self):
            return grammarCParser.RULE_function_ptr

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFunction_ptr" ):
                listener.enterFunction_ptr(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFunction_ptr" ):
                listener.exitFunction_ptr(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFunction_ptr" ):
                return visitor.visitFunction_ptr(self)
            else:
                return visitor.visitChildren(self)




    def function_ptr(self):

        localctx = grammarCParser.Function_ptrContext(self, self._ctx, self.state)
        self.enterRule(localctx, 54, self.RULE_function_ptr)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 355
            self.type_()
            self.state = 356
            self.function_ptr_2()
        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Function_ptr_2Context(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def parameters(self):
            return self.getTypedRuleContext(grammarCParser.ParametersContext,0)


        def function_ptr_2(self):
            return self.getTypedRuleContext(grammarCParser.Function_ptr_2Context,0)


        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def getRuleIndex(self):
            return grammarCParser.RULE_function_ptr_2

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterFunction_ptr_2" ):
                listener.enterFunction_ptr_2(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitFunction_ptr_2" ):
                listener.exitFunction_ptr_2(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitFunction_ptr_2" ):
                return visitor.visitFunction_ptr_2(self)
            else:
                return visitor.visitChildren(self)




    def function_ptr_2(self):

        localctx = grammarCParser.Function_ptr_2Context(self, self._ctx, self.state)
        self.enterRule(localctx, 56, self.RULE_function_ptr_2)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 358
            self.match(grammarCParser.T__5)
            self.state = 359
            self.match(grammarCParser.T__10)
            self.state = 362
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [6]:
                self.state = 360
                self.function_ptr_2()
                pass
            elif token in [59]:
                self.state = 361
                self.match(grammarCParser.IDENTIFIER)
                pass
            else:
                raise NoViableAltException(self)

            self.state = 364
            self.match(grammarCParser.T__6)
            self.state = 365
            self.match(grammarCParser.T__5)
            self.state = 366
            self.parameters()
            self.state = 367
            self.match(grammarCParser.T__6)
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

        def ARRAY(self):
            return self.getToken(grammarCParser.ARRAY, 0)

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
        self.enterRule(localctx, 58, self.RULE_declaration)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 369
            self.type_()
            self.state = 370
            self.match(grammarCParser.IDENTIFIER)
            self.state = 372
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==63:
                self.state = 371
                self.match(grammarCParser.ARRAY)


            self.state = 376
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==36:
                self.state = 374
                self.match(grammarCParser.T__35)
                self.state = 375
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


        def ARRAY(self):
            return self.getToken(grammarCParser.ARRAY, 0)

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
        self.enterRule(localctx, 60, self.RULE_assignment)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 381
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==11:
                self.state = 378
                self.match(grammarCParser.T__10)
                self.state = 383
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 384
            self.match(grammarCParser.IDENTIFIER)
            self.state = 386
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==63:
                self.state = 385
                self.match(grammarCParser.ARRAY)


            self.state = 388
            self.match(grammarCParser.T__35)
            self.state = 389
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
        self.enterRule(localctx, 62, self.RULE_conversion)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 391
            self.match(grammarCParser.T__5)
            self.state = 392
            self.type_()
            self.state = 393
            self.match(grammarCParser.T__6)
            self.state = 396
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,43,self._ctx)
            if la_ == 1:
                self.state = 394
                self.literal()
                pass

            elif la_ == 2:
                self.state = 395
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
        _startState = 64
        self.enterRecursionRule(localctx, 64, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 425
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,46,self._ctx)
            if la_ == 1:
                self.state = 399
                self.literal()
                pass

            elif la_ == 2:
                self.state = 400
                self.conversion()
                pass

            elif la_ == 3:
                self.state = 401
                self.function_call()
                pass

            elif la_ == 4:
                self.state = 402
                self.match(grammarCParser.T__7)
                self.state = 412
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 423338500264297509) != 0):
                    self.state = 408
                    self._errHandler.sync(self)
                    _alt = self._interp.adaptivePredict(self._input,44,self._ctx)
                    while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                        if _alt==1:
                            self.state = 403
                            self.expr(0)
                            self.state = 404
                            self.match(grammarCParser.T__9) 
                        self.state = 410
                        self._errHandler.sync(self)
                        _alt = self._interp.adaptivePredict(self._input,44,self._ctx)

                    self.state = 411
                    self.expr(0)


                self.state = 414
                self.match(grammarCParser.T__8)
                pass

            elif la_ == 5:
                self.state = 415
                self.match(grammarCParser.T__5)
                self.state = 416
                self.expr(0)
                self.state = 417
                self.match(grammarCParser.T__6)
                pass

            elif la_ == 6:
                self.state = 419
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 962072676352) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 420
                self.expr(13)
                pass

            elif la_ == 7:
                self.state = 421
                self.match(grammarCParser.IDENTIFIER)
                self.state = 422
                _la = self._input.LA(1)
                if not(_la==37 or _la==38):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                pass

            elif la_ == 8:
                self.state = 423
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 7696581459968) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 424
                self.expr(11)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 459
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,48,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 457
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,47,self._ctx)
                    if la_ == 1:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 427
                        if not self.precpred(self._ctx, 10):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 10)")
                        self.state = 428
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 26388279068672) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 429
                        self.expr(11)
                        pass

                    elif la_ == 2:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 430
                        if not self.precpred(self._ctx, 9):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 9)")
                        self.state = 431
                        _la = self._input.LA(1)
                        if not(_la==16 or _la==40):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 432
                        self.expr(10)
                        pass

                    elif la_ == 3:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 433
                        if not self.precpred(self._ctx, 8):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 8)")
                        self.state = 434
                        _la = self._input.LA(1)
                        if not(_la==45 or _la==46):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 435
                        self.expr(9)
                        pass

                    elif la_ == 4:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 436
                        if not self.precpred(self._ctx, 7):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 7)")
                        self.state = 437
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 2111062325329920) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 438
                        self.expr(8)
                        pass

                    elif la_ == 5:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 439
                        if not self.precpred(self._ctx, 6):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 6)")
                        self.state = 440
                        _la = self._input.LA(1)
                        if not(_la==51 or _la==52):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 441
                        self.expr(7)
                        pass

                    elif la_ == 6:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 442
                        if not self.precpred(self._ctx, 5):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 5)")
                        self.state = 443
                        self.match(grammarCParser.T__38)
                        self.state = 444
                        self.expr(6)
                        pass

                    elif la_ == 7:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 445
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 446
                        self.match(grammarCParser.T__52)
                        self.state = 447
                        self.expr(5)
                        pass

                    elif la_ == 8:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 448
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 449
                        self.match(grammarCParser.T__53)
                        self.state = 450
                        self.expr(4)
                        pass

                    elif la_ == 9:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 451
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 452
                        self.match(grammarCParser.T__54)
                        self.state = 453
                        self.expr(3)
                        pass

                    elif la_ == 10:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 454
                        if not self.precpred(self._ctx, 1):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                        self.state = 455
                        self.match(grammarCParser.T__55)
                        self.state = 456
                        self.expr(2)
                        pass

             
                self.state = 461
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,48,self._ctx)

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

        def STRING(self):
            return self.getToken(grammarCParser.STRING, 0)

        def IDENTIFIER(self):
            return self.getToken(grammarCParser.IDENTIFIER, 0)

        def ARRAY(self):
            return self.getToken(grammarCParser.ARRAY, 0)

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
        self.enterRule(localctx, 66, self.RULE_literal)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 470
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [60]:
                self.state = 462
                self.match(grammarCParser.INT)
                pass
            elif token in [61]:
                self.state = 463
                self.match(grammarCParser.FLOAT)
                pass
            elif token in [62]:
                self.state = 464
                self.match(grammarCParser.CHAR)
                pass
            elif token in [64]:
                self.state = 465
                self.match(grammarCParser.STRING)
                pass
            elif token in [59]:
                self.state = 466
                self.match(grammarCParser.IDENTIFIER)
                self.state = 468
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,49,self._ctx)
                if la_ == 1:
                    self.state = 467
                    self.match(grammarCParser.ARRAY)


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
        self._predicates[32] = self.expr_sempred
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
         




