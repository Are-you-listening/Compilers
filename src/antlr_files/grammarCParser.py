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
        4,1,67,490,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,2,5,7,5,2,6,7,
        6,2,7,7,7,2,8,7,8,2,9,7,9,2,10,7,10,2,11,7,11,2,12,7,12,2,13,7,13,
        2,14,7,14,2,15,7,15,2,16,7,16,2,17,7,17,2,18,7,18,2,19,7,19,2,20,
        7,20,2,21,7,21,2,22,7,22,2,23,7,23,2,24,7,24,2,25,7,25,2,26,7,26,
        2,27,7,27,2,28,7,28,2,29,7,29,2,30,7,30,2,31,7,31,2,32,7,32,2,33,
        7,33,2,34,7,34,2,35,7,35,1,0,1,0,1,0,1,1,1,1,1,1,4,1,79,8,1,11,1,
        12,1,80,1,1,1,1,1,1,1,1,5,1,87,8,1,10,1,12,1,90,9,1,1,1,5,1,93,8,
        1,10,1,12,1,96,9,1,1,2,1,2,1,2,1,2,1,2,1,3,1,3,1,3,1,4,1,4,1,5,1,
        5,1,5,1,5,1,5,1,5,1,5,1,5,1,5,3,5,117,8,5,1,5,5,5,120,8,5,10,5,12,
        5,123,9,5,1,6,1,6,1,6,1,6,1,6,1,6,1,6,3,6,132,8,6,1,7,1,7,1,7,5,
        7,137,8,7,10,7,12,7,140,9,7,1,7,3,7,143,8,7,1,8,1,8,1,8,3,8,148,
        8,8,1,9,1,9,1,9,1,9,3,9,154,8,9,1,9,1,9,3,9,158,8,9,1,9,1,9,1,9,
        1,9,5,9,164,8,9,10,9,12,9,167,9,9,1,9,3,9,170,8,9,1,9,4,9,173,8,
        9,11,9,12,9,174,1,10,1,10,1,11,1,11,1,11,1,11,1,11,3,11,184,8,11,
        1,12,1,12,4,12,188,8,12,11,12,12,12,189,1,12,1,12,1,12,1,12,1,12,
        1,12,1,12,1,12,5,12,200,8,12,10,12,12,12,203,9,12,1,12,5,12,206,
        8,12,10,12,12,12,209,9,12,1,13,1,13,1,13,1,13,1,14,1,14,1,14,3,14,
        218,8,14,1,14,1,14,3,14,222,8,14,1,15,1,15,1,15,1,15,1,15,1,15,1,
        15,1,15,1,15,1,15,1,15,1,15,1,15,3,15,237,8,15,3,15,239,8,15,1,16,
        1,16,1,16,3,16,244,8,16,1,16,1,16,3,16,248,8,16,1,16,1,16,3,16,252,
        8,16,1,16,1,16,1,16,1,16,1,16,1,17,1,17,1,17,1,17,1,17,1,17,1,17,
        1,17,1,18,1,18,1,18,1,18,1,19,1,19,1,19,1,19,1,19,1,19,1,19,5,19,
        278,8,19,10,19,12,19,281,9,19,1,19,1,19,1,20,1,20,1,20,3,20,288,
        8,20,1,20,1,20,1,20,1,21,1,21,1,21,1,21,1,22,1,22,1,22,1,22,1,22,
        5,22,302,8,22,10,22,12,22,305,9,22,1,22,3,22,308,8,22,1,22,1,22,
        1,23,1,23,1,23,1,23,1,23,5,23,317,8,23,10,23,12,23,320,9,23,1,23,
        1,23,1,24,3,24,325,8,24,1,24,1,24,1,24,1,24,1,24,1,24,1,24,3,24,
        334,8,24,1,24,5,24,337,8,24,10,24,12,24,340,9,24,1,25,1,25,3,25,
        344,8,25,1,26,1,26,1,26,1,26,5,26,350,8,26,10,26,12,26,353,9,26,
        1,26,4,26,356,8,26,11,26,12,26,357,4,26,360,8,26,11,26,12,26,361,
        1,26,1,26,1,27,1,27,1,27,1,28,1,28,1,28,1,28,3,28,373,8,28,1,28,
        1,28,1,28,1,28,1,28,1,29,1,29,1,29,3,29,383,8,29,1,29,1,29,3,29,
        387,8,29,1,30,1,30,1,30,1,30,1,31,1,31,1,31,1,31,1,31,3,31,398,8,
        31,1,32,1,32,1,32,5,32,403,8,32,10,32,12,32,406,9,32,1,32,3,32,409,
        8,32,1,33,1,33,1,33,1,33,1,33,3,33,416,8,33,1,33,1,33,1,33,1,33,
        1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,3,33,432,8,33,
        1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,
        1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,1,33,
        1,33,1,33,1,33,1,33,1,33,1,33,1,33,5,33,467,8,33,10,33,12,33,470,
        9,33,1,34,1,34,1,34,1,34,4,34,476,8,34,11,34,12,34,477,1,35,1,35,
        1,35,1,35,1,35,1,35,3,35,486,8,35,3,35,488,8,35,1,35,0,1,66,36,0,
        2,4,6,8,10,12,14,16,18,20,22,24,26,28,30,32,34,36,38,40,42,44,46,
        48,50,52,54,56,58,60,62,64,66,68,70,0,14,2,0,5,5,66,66,1,0,60,61,
        1,0,26,27,2,0,25,25,33,34,2,0,11,11,28,28,1,0,33,34,2,0,11,11,37,
        39,1,0,37,38,2,0,16,16,41,43,2,0,11,11,44,45,2,0,16,16,41,41,1,0,
        46,47,1,0,48,51,1,0,52,53,547,0,72,1,0,0,0,2,88,1,0,0,0,4,97,1,0,
        0,0,6,102,1,0,0,0,8,105,1,0,0,0,10,107,1,0,0,0,12,131,1,0,0,0,14,
        142,1,0,0,0,16,144,1,0,0,0,18,157,1,0,0,0,20,176,1,0,0,0,22,183,
        1,0,0,0,24,201,1,0,0,0,26,210,1,0,0,0,28,214,1,0,0,0,30,223,1,0,
        0,0,32,240,1,0,0,0,34,258,1,0,0,0,36,266,1,0,0,0,38,270,1,0,0,0,
        40,284,1,0,0,0,42,292,1,0,0,0,44,296,1,0,0,0,46,311,1,0,0,0,48,324,
        1,0,0,0,50,341,1,0,0,0,52,345,1,0,0,0,54,365,1,0,0,0,56,368,1,0,
        0,0,58,379,1,0,0,0,60,388,1,0,0,0,62,392,1,0,0,0,64,408,1,0,0,0,
        66,431,1,0,0,0,68,475,1,0,0,0,70,487,1,0,0,0,72,73,3,2,1,0,73,74,
        5,0,0,1,74,1,1,0,0,0,75,87,3,10,5,0,76,78,3,12,6,0,77,79,5,1,0,0,
        78,77,1,0,0,0,79,80,1,0,0,0,80,78,1,0,0,0,80,81,1,0,0,0,81,87,1,
        0,0,0,82,87,3,8,4,0,83,87,3,6,3,0,84,87,3,28,14,0,85,87,3,4,2,0,
        86,75,1,0,0,0,86,76,1,0,0,0,86,82,1,0,0,0,86,83,1,0,0,0,86,84,1,
        0,0,0,86,85,1,0,0,0,87,90,1,0,0,0,88,86,1,0,0,0,88,89,1,0,0,0,89,
        94,1,0,0,0,90,88,1,0,0,0,91,93,5,1,0,0,92,91,1,0,0,0,93,96,1,0,0,
        0,94,92,1,0,0,0,94,95,1,0,0,0,95,3,1,0,0,0,96,94,1,0,0,0,97,98,5,
        2,0,0,98,99,5,62,0,0,99,100,3,2,1,0,100,101,5,3,0,0,101,5,1,0,0,
        0,102,103,5,4,0,0,103,104,7,0,0,0,104,7,1,0,0,0,105,106,7,1,0,0,
        106,9,1,0,0,0,107,108,3,48,24,0,108,109,5,62,0,0,109,110,5,6,0,0,
        110,111,3,14,7,0,111,116,5,7,0,0,112,113,5,8,0,0,113,114,3,24,12,
        0,114,115,5,9,0,0,115,117,1,0,0,0,116,112,1,0,0,0,116,117,1,0,0,
        0,117,121,1,0,0,0,118,120,5,1,0,0,119,118,1,0,0,0,120,123,1,0,0,
        0,121,119,1,0,0,0,121,122,1,0,0,0,122,11,1,0,0,0,123,121,1,0,0,0,
        124,132,3,58,29,0,125,132,3,66,33,0,126,132,3,60,30,0,127,132,3,
        26,13,0,128,132,3,44,22,0,129,132,3,52,26,0,130,132,3,54,27,0,131,
        124,1,0,0,0,131,125,1,0,0,0,131,126,1,0,0,0,131,127,1,0,0,0,131,
        128,1,0,0,0,131,129,1,0,0,0,131,130,1,0,0,0,132,13,1,0,0,0,133,134,
        3,16,8,0,134,135,5,10,0,0,135,137,1,0,0,0,136,133,1,0,0,0,137,140,
        1,0,0,0,138,136,1,0,0,0,138,139,1,0,0,0,139,141,1,0,0,0,140,138,
        1,0,0,0,141,143,3,16,8,0,142,138,1,0,0,0,142,143,1,0,0,0,143,15,
        1,0,0,0,144,145,3,48,24,0,145,147,5,62,0,0,146,148,3,68,34,0,147,
        146,1,0,0,0,147,148,1,0,0,0,148,17,1,0,0,0,149,150,5,6,0,0,150,153,
        5,11,0,0,151,154,3,18,9,0,152,154,5,62,0,0,153,151,1,0,0,0,153,152,
        1,0,0,0,154,155,1,0,0,0,155,158,5,7,0,0,156,158,5,62,0,0,157,149,
        1,0,0,0,157,156,1,0,0,0,158,172,1,0,0,0,159,169,5,6,0,0,160,161,
        3,20,10,0,161,162,5,10,0,0,162,164,1,0,0,0,163,160,1,0,0,0,164,167,
        1,0,0,0,165,163,1,0,0,0,165,166,1,0,0,0,166,168,1,0,0,0,167,165,
        1,0,0,0,168,170,3,20,10,0,169,165,1,0,0,0,169,170,1,0,0,0,170,171,
        1,0,0,0,171,173,5,7,0,0,172,159,1,0,0,0,173,174,1,0,0,0,174,172,
        1,0,0,0,174,175,1,0,0,0,175,19,1,0,0,0,176,177,3,66,33,0,177,21,
        1,0,0,0,178,184,3,12,6,0,179,184,3,46,23,0,180,184,5,12,0,0,181,
        184,5,13,0,0,182,184,3,50,25,0,183,178,1,0,0,0,183,179,1,0,0,0,183,
        180,1,0,0,0,183,181,1,0,0,0,183,182,1,0,0,0,184,23,1,0,0,0,185,187,
        3,22,11,0,186,188,5,1,0,0,187,186,1,0,0,0,188,189,1,0,0,0,189,187,
        1,0,0,0,189,190,1,0,0,0,190,200,1,0,0,0,191,200,3,8,4,0,192,200,
        3,30,15,0,193,200,3,32,16,0,194,200,3,34,17,0,195,200,3,36,18,0,
        196,200,3,38,19,0,197,200,3,6,3,0,198,200,3,28,14,0,199,185,1,0,
        0,0,199,191,1,0,0,0,199,192,1,0,0,0,199,193,1,0,0,0,199,194,1,0,
        0,0,199,195,1,0,0,0,199,196,1,0,0,0,199,197,1,0,0,0,199,198,1,0,
        0,0,200,203,1,0,0,0,201,199,1,0,0,0,201,202,1,0,0,0,202,207,1,0,
        0,0,203,201,1,0,0,0,204,206,5,1,0,0,205,204,1,0,0,0,206,209,1,0,
        0,0,207,205,1,0,0,0,207,208,1,0,0,0,208,25,1,0,0,0,209,207,1,0,0,
        0,210,211,5,14,0,0,211,212,3,48,24,0,212,213,5,62,0,0,213,27,1,0,
        0,0,214,215,5,15,0,0,215,221,5,62,0,0,216,218,5,16,0,0,217,216,1,
        0,0,0,217,218,1,0,0,0,218,219,1,0,0,0,219,222,3,70,35,0,220,222,
        3,48,24,0,221,217,1,0,0,0,221,220,1,0,0,0,222,29,1,0,0,0,223,224,
        5,17,0,0,224,225,5,6,0,0,225,226,3,66,33,0,226,227,5,7,0,0,227,228,
        5,8,0,0,228,229,3,24,12,0,229,238,5,9,0,0,230,236,5,18,0,0,231,232,
        5,8,0,0,232,233,3,24,12,0,233,234,5,9,0,0,234,237,1,0,0,0,235,237,
        3,30,15,0,236,231,1,0,0,0,236,235,1,0,0,0,237,239,1,0,0,0,238,230,
        1,0,0,0,238,239,1,0,0,0,239,31,1,0,0,0,240,241,5,19,0,0,241,243,
        5,6,0,0,242,244,3,22,11,0,243,242,1,0,0,0,243,244,1,0,0,0,244,245,
        1,0,0,0,245,247,5,1,0,0,246,248,3,22,11,0,247,246,1,0,0,0,247,248,
        1,0,0,0,248,249,1,0,0,0,249,251,5,1,0,0,250,252,3,22,11,0,251,250,
        1,0,0,0,251,252,1,0,0,0,252,253,1,0,0,0,253,254,5,7,0,0,254,255,
        5,8,0,0,255,256,3,24,12,0,256,257,5,9,0,0,257,33,1,0,0,0,258,259,
        5,20,0,0,259,260,5,6,0,0,260,261,3,22,11,0,261,262,5,7,0,0,262,263,
        5,8,0,0,263,264,3,24,12,0,264,265,5,9,0,0,265,35,1,0,0,0,266,267,
        5,8,0,0,267,268,3,24,12,0,268,269,5,9,0,0,269,37,1,0,0,0,270,271,
        5,21,0,0,271,272,5,6,0,0,272,273,5,62,0,0,273,274,5,7,0,0,274,279,
        5,8,0,0,275,278,3,40,20,0,276,278,3,42,21,0,277,275,1,0,0,0,277,
        276,1,0,0,0,278,281,1,0,0,0,279,277,1,0,0,0,279,280,1,0,0,0,280,
        282,1,0,0,0,281,279,1,0,0,0,282,283,5,9,0,0,283,39,1,0,0,0,284,287,
        5,22,0,0,285,288,3,70,35,0,286,288,5,62,0,0,287,285,1,0,0,0,287,
        286,1,0,0,0,288,289,1,0,0,0,289,290,5,23,0,0,290,291,3,24,12,0,291,
        41,1,0,0,0,292,293,5,24,0,0,293,294,5,23,0,0,294,295,3,24,12,0,295,
        43,1,0,0,0,296,297,5,25,0,0,297,298,5,62,0,0,298,303,5,8,0,0,299,
        300,5,62,0,0,300,302,5,10,0,0,301,299,1,0,0,0,302,305,1,0,0,0,303,
        301,1,0,0,0,303,304,1,0,0,0,304,307,1,0,0,0,305,303,1,0,0,0,306,
        308,5,62,0,0,307,306,1,0,0,0,307,308,1,0,0,0,308,309,1,0,0,0,309,
        310,5,9,0,0,310,45,1,0,0,0,311,312,7,2,0,0,312,313,5,6,0,0,313,318,
        5,66,0,0,314,315,5,10,0,0,315,317,3,66,33,0,316,314,1,0,0,0,317,
        320,1,0,0,0,318,316,1,0,0,0,318,319,1,0,0,0,319,321,1,0,0,0,320,
        318,1,0,0,0,321,322,5,7,0,0,322,47,1,0,0,0,323,325,5,28,0,0,324,
        323,1,0,0,0,324,325,1,0,0,0,325,333,1,0,0,0,326,334,5,29,0,0,327,
        334,5,30,0,0,328,334,5,31,0,0,329,334,5,32,0,0,330,331,7,3,0,0,331,
        334,5,62,0,0,332,334,5,62,0,0,333,326,1,0,0,0,333,327,1,0,0,0,333,
        328,1,0,0,0,333,329,1,0,0,0,333,330,1,0,0,0,333,332,1,0,0,0,334,
        338,1,0,0,0,335,337,7,4,0,0,336,335,1,0,0,0,337,340,1,0,0,0,338,
        336,1,0,0,0,338,339,1,0,0,0,339,49,1,0,0,0,340,338,1,0,0,0,341,343,
        5,35,0,0,342,344,3,66,33,0,343,342,1,0,0,0,343,344,1,0,0,0,344,51,
        1,0,0,0,345,346,7,5,0,0,346,347,5,62,0,0,347,359,5,8,0,0,348,350,
        3,58,29,0,349,348,1,0,0,0,350,353,1,0,0,0,351,349,1,0,0,0,351,352,
        1,0,0,0,352,355,1,0,0,0,353,351,1,0,0,0,354,356,5,1,0,0,355,354,
        1,0,0,0,356,357,1,0,0,0,357,355,1,0,0,0,357,358,1,0,0,0,358,360,
        1,0,0,0,359,351,1,0,0,0,360,361,1,0,0,0,361,359,1,0,0,0,361,362,
        1,0,0,0,362,363,1,0,0,0,363,364,5,9,0,0,364,53,1,0,0,0,365,366,3,
        48,24,0,366,367,3,56,28,0,367,55,1,0,0,0,368,369,5,6,0,0,369,372,
        5,11,0,0,370,373,3,56,28,0,371,373,5,62,0,0,372,370,1,0,0,0,372,
        371,1,0,0,0,373,374,1,0,0,0,374,375,5,7,0,0,375,376,5,6,0,0,376,
        377,3,14,7,0,377,378,5,7,0,0,378,57,1,0,0,0,379,380,3,48,24,0,380,
        382,5,62,0,0,381,383,3,68,34,0,382,381,1,0,0,0,382,383,1,0,0,0,383,
        386,1,0,0,0,384,385,5,36,0,0,385,387,3,66,33,0,386,384,1,0,0,0,386,
        387,1,0,0,0,387,59,1,0,0,0,388,389,3,66,33,0,389,390,5,36,0,0,390,
        391,3,66,33,0,391,61,1,0,0,0,392,393,5,6,0,0,393,394,3,48,24,0,394,
        397,5,7,0,0,395,398,3,70,35,0,396,398,3,66,33,0,397,395,1,0,0,0,
        397,396,1,0,0,0,398,63,1,0,0,0,399,400,3,66,33,0,400,401,5,10,0,
        0,401,403,1,0,0,0,402,399,1,0,0,0,403,406,1,0,0,0,404,402,1,0,0,
        0,404,405,1,0,0,0,405,407,1,0,0,0,406,404,1,0,0,0,407,409,3,66,33,
        0,408,404,1,0,0,0,408,409,1,0,0,0,409,65,1,0,0,0,410,411,6,33,-1,
        0,411,432,3,70,35,0,412,432,3,62,31,0,413,416,3,18,9,0,414,416,3,
        46,23,0,415,413,1,0,0,0,415,414,1,0,0,0,416,432,1,0,0,0,417,418,
        5,8,0,0,418,419,3,64,32,0,419,420,5,9,0,0,420,432,1,0,0,0,421,422,
        5,6,0,0,422,423,3,66,33,0,423,424,5,7,0,0,424,432,1,0,0,0,425,426,
        7,6,0,0,426,432,3,66,33,14,427,428,5,62,0,0,428,432,7,7,0,0,429,
        430,7,8,0,0,430,432,3,66,33,11,431,410,1,0,0,0,431,412,1,0,0,0,431,
        415,1,0,0,0,431,417,1,0,0,0,431,421,1,0,0,0,431,425,1,0,0,0,431,
        427,1,0,0,0,431,429,1,0,0,0,432,468,1,0,0,0,433,434,10,10,0,0,434,
        435,7,9,0,0,435,467,3,66,33,11,436,437,10,9,0,0,437,438,7,10,0,0,
        438,467,3,66,33,10,439,440,10,8,0,0,440,441,7,11,0,0,441,467,3,66,
        33,9,442,443,10,7,0,0,443,444,7,12,0,0,444,467,3,66,33,8,445,446,
        10,6,0,0,446,447,7,13,0,0,447,467,3,66,33,7,448,449,10,5,0,0,449,
        450,5,39,0,0,450,467,3,66,33,6,451,452,10,4,0,0,452,453,5,54,0,0,
        453,467,3,66,33,5,454,455,10,3,0,0,455,456,5,55,0,0,456,467,3,66,
        33,4,457,458,10,2,0,0,458,459,5,56,0,0,459,467,3,66,33,3,460,461,
        10,1,0,0,461,462,5,57,0,0,462,467,3,66,33,2,463,464,10,12,0,0,464,
        465,5,40,0,0,465,467,5,62,0,0,466,433,1,0,0,0,466,436,1,0,0,0,466,
        439,1,0,0,0,466,442,1,0,0,0,466,445,1,0,0,0,466,448,1,0,0,0,466,
        451,1,0,0,0,466,454,1,0,0,0,466,457,1,0,0,0,466,460,1,0,0,0,466,
        463,1,0,0,0,467,470,1,0,0,0,468,466,1,0,0,0,468,469,1,0,0,0,469,
        67,1,0,0,0,470,468,1,0,0,0,471,472,5,58,0,0,472,473,3,66,33,0,473,
        474,5,59,0,0,474,476,1,0,0,0,475,471,1,0,0,0,476,477,1,0,0,0,477,
        475,1,0,0,0,477,478,1,0,0,0,478,69,1,0,0,0,479,488,5,63,0,0,480,
        488,5,64,0,0,481,488,5,65,0,0,482,488,5,66,0,0,483,485,5,62,0,0,
        484,486,3,68,34,0,485,484,1,0,0,0,485,486,1,0,0,0,486,488,1,0,0,
        0,487,479,1,0,0,0,487,480,1,0,0,0,487,481,1,0,0,0,487,482,1,0,0,
        0,487,483,1,0,0,0,488,71,1,0,0,0,53,80,86,88,94,116,121,131,138,
        142,147,153,157,165,169,174,183,189,199,201,207,217,221,236,238,
        243,247,251,277,279,287,303,307,318,324,333,338,343,351,357,361,
        372,382,386,397,404,408,415,431,466,468,477,485,487
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
                     "'++'", "'--'", "'&'", "'.'", "'+'", "'~'", "'!'", 
                     "'/'", "'%'", "'>>'", "'<<'", "'<'", "'>'", "'>='", 
                     "'<='", "'=='", "'!='", "'^'", "'|'", "'&&'", "'||'", 
                     "'['", "']'" ]

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
                      "<INVALID>", "<INVALID>", "<INVALID>", "<INVALID>", 
                      "MULTILINE", "SINGLECOMMENT", "IDENTIFIER", "INT", 
                      "FLOAT", "CHAR", "STRING", "WS" ]

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
    RULE_initialize_list = 32
    RULE_expr = 33
    RULE_array = 34
    RULE_literal = 35

    ruleNames =  [ "start_", "code", "include_guard", "include", "comment", 
                   "function", "line", "parameters", "parameter", "function_call", 
                   "parameter_call", "block_line", "block_code", "typedef", 
                   "define", "if", "for", "while", "anonymous_scope", "switch", 
                   "case", "default", "enum", "printscanf", "type", "return", 
                   "structunion", "function_ptr", "function_ptr_2", "declaration", 
                   "assignment", "conversion", "initialize_list", "expr", 
                   "array", "literal" ]

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
    T__58=59
    MULTILINE=60
    SINGLECOMMENT=61
    IDENTIFIER=62
    INT=63
    FLOAT=64
    CHAR=65
    STRING=66
    WS=67

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
            self.state = 72
            self.code()
            self.state = 73
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
            self.state = 88
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while (((_la) & ~0x3f) == 0 and ((1 << _la) & -1152905115045082796) != 0) or ((((_la - 64)) & ~0x3f) == 0 and ((1 << (_la - 64)) & 7) != 0):
                self.state = 86
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,1,self._ctx)
                if la_ == 1:
                    self.state = 75
                    self.function()
                    pass

                elif la_ == 2:
                    self.state = 76
                    self.line()
                    self.state = 78 
                    self._errHandler.sync(self)
                    _alt = 1
                    while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                        if _alt == 1:
                            self.state = 77
                            self.match(grammarCParser.T__0)

                        else:
                            raise NoViableAltException(self)
                        self.state = 80 
                        self._errHandler.sync(self)
                        _alt = self._interp.adaptivePredict(self._input,0,self._ctx)

                    pass

                elif la_ == 3:
                    self.state = 82
                    self.comment()
                    pass

                elif la_ == 4:
                    self.state = 83
                    self.include()
                    pass

                elif la_ == 5:
                    self.state = 84
                    self.define()
                    pass

                elif la_ == 6:
                    self.state = 85
                    self.include_guard()
                    pass


                self.state = 90
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 94
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==1:
                self.state = 91
                self.match(grammarCParser.T__0)
                self.state = 96
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
            self.state = 97
            self.match(grammarCParser.T__1)
            self.state = 98
            self.match(grammarCParser.IDENTIFIER)
            self.state = 99
            self.code()
            self.state = 100
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
            self.state = 102
            self.match(grammarCParser.T__3)
            self.state = 103
            _la = self._input.LA(1)
            if not(_la==5 or _la==66):
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
            self.state = 105
            _la = self._input.LA(1)
            if not(_la==60 or _la==61):
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
            self.state = 107
            self.type_()
            self.state = 108
            self.match(grammarCParser.IDENTIFIER)
            self.state = 109
            self.match(grammarCParser.T__5)
            self.state = 110
            self.parameters()
            self.state = 111
            self.match(grammarCParser.T__6)
            self.state = 116
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,4,self._ctx)
            if la_ == 1:
                self.state = 112
                self.match(grammarCParser.T__7)
                self.state = 113
                self.block_code()
                self.state = 114
                self.match(grammarCParser.T__8)


            self.state = 121
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,5,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 118
                    self.match(grammarCParser.T__0) 
                self.state = 123
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
            self.state = 131
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,6,self._ctx)
            if la_ == 1:
                self.state = 124
                self.declaration()
                pass

            elif la_ == 2:
                self.state = 125
                self.expr(0)
                pass

            elif la_ == 3:
                self.state = 126
                self.assignment()
                pass

            elif la_ == 4:
                self.state = 127
                self.typedef()
                pass

            elif la_ == 5:
                self.state = 128
                self.enum()
                pass

            elif la_ == 6:
                self.state = 129
                self.structunion()
                pass

            elif la_ == 7:
                self.state = 130
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
            self.state = 142
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if (((_la) & ~0x3f) == 0 and ((1 << _la) & 4611686052552245248) != 0):
                self.state = 138
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,7,self._ctx)
                while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                    if _alt==1:
                        self.state = 133
                        self.parameter()
                        self.state = 134
                        self.match(grammarCParser.T__9) 
                    self.state = 140
                    self._errHandler.sync(self)
                    _alt = self._interp.adaptivePredict(self._input,7,self._ctx)

                self.state = 141
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

        def array(self):
            return self.getTypedRuleContext(grammarCParser.ArrayContext,0)


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
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 144
            self.type_()
            self.state = 145
            self.match(grammarCParser.IDENTIFIER)
            self.state = 147
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==58:
                self.state = 146
                self.array()


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
            self.state = 157
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [6]:
                self.state = 149
                self.match(grammarCParser.T__5)
                self.state = 150
                self.match(grammarCParser.T__10)
                self.state = 153
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,10,self._ctx)
                if la_ == 1:
                    self.state = 151
                    self.function_call()
                    pass

                elif la_ == 2:
                    self.state = 152
                    self.match(grammarCParser.IDENTIFIER)
                    pass


                self.state = 155
                self.match(grammarCParser.T__6)
                pass
            elif token in [62]:
                self.state = 156
                self.match(grammarCParser.IDENTIFIER)
                pass
            else:
                raise NoViableAltException(self)

            self.state = 172 
            self._errHandler.sync(self)
            _alt = 1
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt == 1:
                    self.state = 159
                    self.match(grammarCParser.T__5)
                    self.state = 169
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)
                    if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 2233785670729466917) != 0):
                        self.state = 165
                        self._errHandler.sync(self)
                        _alt = self._interp.adaptivePredict(self._input,12,self._ctx)
                        while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                            if _alt==1:
                                self.state = 160
                                self.parameter_call()
                                self.state = 161
                                self.match(grammarCParser.T__9) 
                            self.state = 167
                            self._errHandler.sync(self)
                            _alt = self._interp.adaptivePredict(self._input,12,self._ctx)

                        self.state = 168
                        self.parameter_call()


                    self.state = 171
                    self.match(grammarCParser.T__6)

                else:
                    raise NoViableAltException(self)
                self.state = 174 
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,14,self._ctx)

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
            self.state = 176
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
            self.state = 183
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,15,self._ctx)
            if la_ == 1:
                self.state = 178
                self.line()
                pass

            elif la_ == 2:
                self.state = 179
                self.printscanf()
                pass

            elif la_ == 3:
                self.state = 180
                self.match(grammarCParser.T__11)
                pass

            elif la_ == 4:
                self.state = 181
                self.match(grammarCParser.T__12)
                pass

            elif la_ == 5:
                self.state = 182
                self.return_()
                pass


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
            self.state = 201
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while ((((_la - 4)) & ~0x3f) == 0 and ((1 << (_la - 4)) & 9151315469312180117) != 0):
                self.state = 199
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,17,self._ctx)
                if la_ == 1:
                    self.state = 185
                    self.block_line()
                    self.state = 187 
                    self._errHandler.sync(self)
                    _alt = 1
                    while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                        if _alt == 1:
                            self.state = 186
                            self.match(grammarCParser.T__0)

                        else:
                            raise NoViableAltException(self)
                        self.state = 189 
                        self._errHandler.sync(self)
                        _alt = self._interp.adaptivePredict(self._input,16,self._ctx)

                    pass

                elif la_ == 2:
                    self.state = 191
                    self.comment()
                    pass

                elif la_ == 3:
                    self.state = 192
                    self.if_()
                    pass

                elif la_ == 4:
                    self.state = 193
                    self.for_()
                    pass

                elif la_ == 5:
                    self.state = 194
                    self.while_()
                    pass

                elif la_ == 6:
                    self.state = 195
                    self.anonymous_scope()
                    pass

                elif la_ == 7:
                    self.state = 196
                    self.switch()
                    pass

                elif la_ == 8:
                    self.state = 197
                    self.include()
                    pass

                elif la_ == 9:
                    self.state = 198
                    self.define()
                    pass


                self.state = 203
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 207
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==1:
                self.state = 204
                self.match(grammarCParser.T__0)
                self.state = 209
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
            self.state = 210
            self.match(grammarCParser.T__13)
            self.state = 211
            self.type_()
            self.state = 212
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
            self.state = 214
            self.match(grammarCParser.T__14)
            self.state = 215
            self.match(grammarCParser.IDENTIFIER)
            self.state = 221
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,21,self._ctx)
            if la_ == 1:
                self.state = 217
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if _la==16:
                    self.state = 216
                    self.match(grammarCParser.T__15)


                self.state = 219
                self.literal()
                pass

            elif la_ == 2:
                self.state = 220
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
            self.state = 223
            self.match(grammarCParser.T__16)
            self.state = 224
            self.match(grammarCParser.T__5)
            self.state = 225
            self.expr(0)
            self.state = 226
            self.match(grammarCParser.T__6)
            self.state = 227
            self.match(grammarCParser.T__7)
            self.state = 228
            self.block_code()
            self.state = 229
            self.match(grammarCParser.T__8)
            self.state = 238
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==18:
                self.state = 230
                self.match(grammarCParser.T__17)
                self.state = 236
                self._errHandler.sync(self)
                token = self._input.LA(1)
                if token in [8]:
                    self.state = 231
                    self.match(grammarCParser.T__7)
                    self.state = 232
                    self.block_code()
                    self.state = 233
                    self.match(grammarCParser.T__8)
                    pass
                elif token in [17]:
                    self.state = 235
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
            self.state = 240
            self.match(grammarCParser.T__18)
            self.state = 241
            self.match(grammarCParser.T__5)
            self.state = 243
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 2233785671799539173) != 0):
                self.state = 242
                self.block_line()


            self.state = 245
            self.match(grammarCParser.T__0)
            self.state = 247
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 2233785671799539173) != 0):
                self.state = 246
                self.block_line()


            self.state = 249
            self.match(grammarCParser.T__0)
            self.state = 251
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 2233785671799539173) != 0):
                self.state = 250
                self.block_line()


            self.state = 253
            self.match(grammarCParser.T__6)
            self.state = 254
            self.match(grammarCParser.T__7)
            self.state = 255
            self.block_code()
            self.state = 256
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
            self.state = 258
            self.match(grammarCParser.T__19)
            self.state = 259
            self.match(grammarCParser.T__5)
            self.state = 260
            self.block_line()
            self.state = 261
            self.match(grammarCParser.T__6)
            self.state = 262
            self.match(grammarCParser.T__7)
            self.state = 263
            self.block_code()
            self.state = 264
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
            self.state = 266
            self.match(grammarCParser.T__7)
            self.state = 267
            self.block_code()
            self.state = 268
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
            self.state = 270
            self.match(grammarCParser.T__20)
            self.state = 271
            self.match(grammarCParser.T__5)
            self.state = 272
            self.match(grammarCParser.IDENTIFIER)
            self.state = 273
            self.match(grammarCParser.T__6)
            self.state = 274
            self.match(grammarCParser.T__7)
            self.state = 279
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==22 or _la==24:
                self.state = 277
                self._errHandler.sync(self)
                token = self._input.LA(1)
                if token in [22]:
                    self.state = 275
                    self.case()
                    pass
                elif token in [24]:
                    self.state = 276
                    self.default()
                    pass
                else:
                    raise NoViableAltException(self)

                self.state = 281
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 282
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
            self.state = 284
            self.match(grammarCParser.T__21)
            self.state = 287
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,29,self._ctx)
            if la_ == 1:
                self.state = 285
                self.literal()
                pass

            elif la_ == 2:
                self.state = 286
                self.match(grammarCParser.IDENTIFIER)
                pass


            self.state = 289
            self.match(grammarCParser.T__22)
            self.state = 290
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
            self.state = 292
            self.match(grammarCParser.T__23)
            self.state = 293
            self.match(grammarCParser.T__22)
            self.state = 294
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
            self.state = 296
            self.match(grammarCParser.T__24)
            self.state = 297
            self.match(grammarCParser.IDENTIFIER)
            self.state = 298
            self.match(grammarCParser.T__7)
            self.state = 303
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,30,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 299
                    self.match(grammarCParser.IDENTIFIER)
                    self.state = 300
                    self.match(grammarCParser.T__9) 
                self.state = 305
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,30,self._ctx)

            self.state = 307
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==62:
                self.state = 306
                self.match(grammarCParser.IDENTIFIER)


            self.state = 309
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
            self.state = 311
            _la = self._input.LA(1)
            if not(_la==26 or _la==27):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 312
            self.match(grammarCParser.T__5)
            self.state = 313
            self.match(grammarCParser.STRING)
            self.state = 318
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while _la==10:
                self.state = 314
                self.match(grammarCParser.T__9)
                self.state = 315
                self.expr(0)
                self.state = 320
                self._errHandler.sync(self)
                _la = self._input.LA(1)

            self.state = 321
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
            self.state = 324
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==28:
                self.state = 323
                self.match(grammarCParser.T__27)


            self.state = 333
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [29]:
                self.state = 326
                self.match(grammarCParser.T__28)
                pass
            elif token in [30]:
                self.state = 327
                self.match(grammarCParser.T__29)
                pass
            elif token in [31]:
                self.state = 328
                self.match(grammarCParser.T__30)
                pass
            elif token in [32]:
                self.state = 329
                self.match(grammarCParser.T__31)
                pass
            elif token in [25, 33, 34]:
                self.state = 330
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 25803358208) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 331
                self.match(grammarCParser.IDENTIFIER)
                pass
            elif token in [62]:
                self.state = 332
                self.match(grammarCParser.IDENTIFIER)
                pass
            else:
                raise NoViableAltException(self)

            self.state = 338
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,35,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    self.state = 335
                    _la = self._input.LA(1)
                    if not(_la==11 or _la==28):
                        self._errHandler.recoverInline(self)
                    else:
                        self._errHandler.reportMatch(self)
                        self.consume() 
                self.state = 340
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,35,self._ctx)

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
            self.state = 341
            self.match(grammarCParser.T__34)
            self.state = 343
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 2233785670729466917) != 0):
                self.state = 342
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
            self.state = 345
            _la = self._input.LA(1)
            if not(_la==33 or _la==34):
                self._errHandler.recoverInline(self)
            else:
                self._errHandler.reportMatch(self)
                self.consume()
            self.state = 346
            self.match(grammarCParser.IDENTIFIER)
            self.state = 347
            self.match(grammarCParser.T__7)
            self.state = 359 
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            while True:
                self.state = 351
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                while (((_la) & ~0x3f) == 0 and ((1 << _la) & 4611686052552245248) != 0):
                    self.state = 348
                    self.declaration()
                    self.state = 353
                    self._errHandler.sync(self)
                    _la = self._input.LA(1)

                self.state = 355 
                self._errHandler.sync(self)
                _alt = 1
                while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                    if _alt == 1:
                        self.state = 354
                        self.match(grammarCParser.T__0)

                    else:
                        raise NoViableAltException(self)
                    self.state = 357 
                    self._errHandler.sync(self)
                    _alt = self._interp.adaptivePredict(self._input,38,self._ctx)

                self.state = 361 
                self._errHandler.sync(self)
                _la = self._input.LA(1)
                if not ((((_la) & ~0x3f) == 0 and ((1 << _la) & 4611686052552245250) != 0)):
                    break

            self.state = 363
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
            self.state = 365
            self.type_()
            self.state = 366
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
            self.state = 368
            self.match(grammarCParser.T__5)
            self.state = 369
            self.match(grammarCParser.T__10)
            self.state = 372
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [6]:
                self.state = 370
                self.function_ptr_2()
                pass
            elif token in [62]:
                self.state = 371
                self.match(grammarCParser.IDENTIFIER)
                pass
            else:
                raise NoViableAltException(self)

            self.state = 374
            self.match(grammarCParser.T__6)
            self.state = 375
            self.match(grammarCParser.T__5)
            self.state = 376
            self.parameters()
            self.state = 377
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

        def array(self):
            return self.getTypedRuleContext(grammarCParser.ArrayContext,0)


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
            self.state = 379
            self.type_()
            self.state = 380
            self.match(grammarCParser.IDENTIFIER)
            self.state = 382
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==58:
                self.state = 381
                self.array()


            self.state = 386
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if _la==36:
                self.state = 384
                self.match(grammarCParser.T__35)
                self.state = 385
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

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ExprContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ExprContext,i)


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
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 388
            self.expr(0)

            self.state = 389
            self.match(grammarCParser.T__35)
            self.state = 390
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
            self.state = 392
            self.match(grammarCParser.T__5)
            self.state = 393
            self.type_()
            self.state = 394
            self.match(grammarCParser.T__6)
            self.state = 397
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,43,self._ctx)
            if la_ == 1:
                self.state = 395
                self.literal()
                pass

            elif la_ == 2:
                self.state = 396
                self.expr(0)
                pass


        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
        return localctx


    class Initialize_listContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ExprContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ExprContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_initialize_list

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterInitialize_list" ):
                listener.enterInitialize_list(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitInitialize_list" ):
                listener.exitInitialize_list(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitInitialize_list" ):
                return visitor.visitInitialize_list(self)
            else:
                return visitor.visitChildren(self)




    def initialize_list(self):

        localctx = grammarCParser.Initialize_listContext(self, self._ctx, self.state)
        self.enterRule(localctx, 64, self.RULE_initialize_list)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 408
            self._errHandler.sync(self)
            _la = self._input.LA(1)
            if ((((_la - 6)) & ~0x3f) == 0 and ((1 << (_la - 6)) & 2233785670729466917) != 0):
                self.state = 404
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,44,self._ctx)
                while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                    if _alt==1:
                        self.state = 399
                        self.expr(0)
                        self.state = 400
                        self.match(grammarCParser.T__9) 
                    self.state = 406
                    self._errHandler.sync(self)
                    _alt = self._interp.adaptivePredict(self._input,44,self._ctx)

                self.state = 407
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
            return self.getTypedRuleContext(grammarCParser.LiteralContext,0)


        def conversion(self):
            return self.getTypedRuleContext(grammarCParser.ConversionContext,0)


        def function_call(self):
            return self.getTypedRuleContext(grammarCParser.Function_callContext,0)


        def printscanf(self):
            return self.getTypedRuleContext(grammarCParser.PrintscanfContext,0)


        def initialize_list(self):
            return self.getTypedRuleContext(grammarCParser.Initialize_listContext,0)


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
        _startState = 66
        self.enterRecursionRule(localctx, 66, self.RULE_expr, _p)
        self._la = 0 # Token type
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 431
            self._errHandler.sync(self)
            la_ = self._interp.adaptivePredict(self._input,47,self._ctx)
            if la_ == 1:
                self.state = 411
                self.literal()
                pass

            elif la_ == 2:
                self.state = 412
                self.conversion()
                pass

            elif la_ == 3:
                self.state = 415
                self._errHandler.sync(self)
                token = self._input.LA(1)
                if token in [6, 62]:
                    self.state = 413
                    self.function_call()
                    pass
                elif token in [26, 27]:
                    self.state = 414
                    self.printscanf()
                    pass
                else:
                    raise NoViableAltException(self)

                pass

            elif la_ == 4:
                self.state = 417
                self.match(grammarCParser.T__7)
                self.state = 418
                self.initialize_list()
                self.state = 419
                self.match(grammarCParser.T__8)
                pass

            elif la_ == 5:
                self.state = 421
                self.match(grammarCParser.T__5)
                self.state = 422
                self.expr(0)
                self.state = 423
                self.match(grammarCParser.T__6)
                pass

            elif la_ == 6:
                self.state = 425
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 962072676352) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 426
                self.expr(14)
                pass

            elif la_ == 7:
                self.state = 427
                self.match(grammarCParser.IDENTIFIER)
                self.state = 428
                _la = self._input.LA(1)
                if not(_la==37 or _la==38):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                pass

            elif la_ == 8:
                self.state = 429
                _la = self._input.LA(1)
                if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 15393162854400) != 0)):
                    self._errHandler.recoverInline(self)
                else:
                    self._errHandler.reportMatch(self)
                    self.consume()
                self.state = 430
                self.expr(11)
                pass


            self._ctx.stop = self._input.LT(-1)
            self.state = 468
            self._errHandler.sync(self)
            _alt = self._interp.adaptivePredict(self._input,49,self._ctx)
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt==1:
                    if self._parseListeners is not None:
                        self.triggerExitRuleEvent()
                    _prevctx = localctx
                    self.state = 466
                    self._errHandler.sync(self)
                    la_ = self._interp.adaptivePredict(self._input,48,self._ctx)
                    if la_ == 1:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 433
                        if not self.precpred(self._ctx, 10):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 10)")
                        self.state = 434
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 52776558135296) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 435
                        self.expr(11)
                        pass

                    elif la_ == 2:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 436
                        if not self.precpred(self._ctx, 9):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 9)")
                        self.state = 437
                        _la = self._input.LA(1)
                        if not(_la==16 or _la==41):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 438
                        self.expr(10)
                        pass

                    elif la_ == 3:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 439
                        if not self.precpred(self._ctx, 8):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 8)")
                        self.state = 440
                        _la = self._input.LA(1)
                        if not(_la==46 or _la==47):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 441
                        self.expr(9)
                        pass

                    elif la_ == 4:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 442
                        if not self.precpred(self._ctx, 7):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 7)")
                        self.state = 443
                        _la = self._input.LA(1)
                        if not((((_la) & ~0x3f) == 0 and ((1 << _la) & 4222124650659840) != 0)):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 444
                        self.expr(8)
                        pass

                    elif la_ == 5:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 445
                        if not self.precpred(self._ctx, 6):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 6)")
                        self.state = 446
                        _la = self._input.LA(1)
                        if not(_la==52 or _la==53):
                            self._errHandler.recoverInline(self)
                        else:
                            self._errHandler.reportMatch(self)
                            self.consume()
                        self.state = 447
                        self.expr(7)
                        pass

                    elif la_ == 6:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 448
                        if not self.precpred(self._ctx, 5):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 5)")
                        self.state = 449
                        self.match(grammarCParser.T__38)
                        self.state = 450
                        self.expr(6)
                        pass

                    elif la_ == 7:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 451
                        if not self.precpred(self._ctx, 4):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 4)")
                        self.state = 452
                        self.match(grammarCParser.T__53)
                        self.state = 453
                        self.expr(5)
                        pass

                    elif la_ == 8:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 454
                        if not self.precpred(self._ctx, 3):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 3)")
                        self.state = 455
                        self.match(grammarCParser.T__54)
                        self.state = 456
                        self.expr(4)
                        pass

                    elif la_ == 9:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 457
                        if not self.precpred(self._ctx, 2):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 2)")
                        self.state = 458
                        self.match(grammarCParser.T__55)
                        self.state = 459
                        self.expr(3)
                        pass

                    elif la_ == 10:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 460
                        if not self.precpred(self._ctx, 1):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 1)")
                        self.state = 461
                        self.match(grammarCParser.T__56)
                        self.state = 462
                        self.expr(2)
                        pass

                    elif la_ == 11:
                        localctx = grammarCParser.ExprContext(self, _parentctx, _parentState)
                        self.pushNewRecursionContext(localctx, _startState, self.RULE_expr)
                        self.state = 463
                        if not self.precpred(self._ctx, 12):
                            from antlr4.error.Errors import FailedPredicateException
                            raise FailedPredicateException(self, "self.precpred(self._ctx, 12)")
                        self.state = 464
                        self.match(grammarCParser.T__39)
                        self.state = 465
                        self.match(grammarCParser.IDENTIFIER)
                        pass

             
                self.state = 470
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,49,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.unrollRecursionContexts(_parentctx)
        return localctx


    class ArrayContext(ParserRuleContext):
        __slots__ = 'parser'

        def __init__(self, parser, parent:ParserRuleContext=None, invokingState:int=-1):
            super().__init__(parent, invokingState)
            self.parser = parser

        def expr(self, i:int=None):
            if i is None:
                return self.getTypedRuleContexts(grammarCParser.ExprContext)
            else:
                return self.getTypedRuleContext(grammarCParser.ExprContext,i)


        def getRuleIndex(self):
            return grammarCParser.RULE_array

        def enterRule(self, listener:ParseTreeListener):
            if hasattr( listener, "enterArray" ):
                listener.enterArray(self)

        def exitRule(self, listener:ParseTreeListener):
            if hasattr( listener, "exitArray" ):
                listener.exitArray(self)

        def accept(self, visitor:ParseTreeVisitor):
            if hasattr( visitor, "visitArray" ):
                return visitor.visitArray(self)
            else:
                return visitor.visitChildren(self)




    def array(self):

        localctx = grammarCParser.ArrayContext(self, self._ctx, self.state)
        self.enterRule(localctx, 68, self.RULE_array)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 475 
            self._errHandler.sync(self)
            _alt = 1
            while _alt!=2 and _alt!=ATN.INVALID_ALT_NUMBER:
                if _alt == 1:
                    self.state = 471
                    self.match(grammarCParser.T__57)
                    self.state = 472
                    self.expr(0)
                    self.state = 473
                    self.match(grammarCParser.T__58)

                else:
                    raise NoViableAltException(self)
                self.state = 477 
                self._errHandler.sync(self)
                _alt = self._interp.adaptivePredict(self._input,50,self._ctx)

        except RecognitionException as re:
            localctx.exception = re
            self._errHandler.reportError(self, re)
            self._errHandler.recover(self, re)
        finally:
            self.exitRule()
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

        def array(self):
            return self.getTypedRuleContext(grammarCParser.ArrayContext,0)


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
        self.enterRule(localctx, 70, self.RULE_literal)
        try:
            self.enterOuterAlt(localctx, 1)
            self.state = 487
            self._errHandler.sync(self)
            token = self._input.LA(1)
            if token in [63]:
                self.state = 479
                self.match(grammarCParser.INT)
                pass
            elif token in [64]:
                self.state = 480
                self.match(grammarCParser.FLOAT)
                pass
            elif token in [65]:
                self.state = 481
                self.match(grammarCParser.CHAR)
                pass
            elif token in [66]:
                self.state = 482
                self.match(grammarCParser.STRING)
                pass
            elif token in [62]:
                self.state = 483
                self.match(grammarCParser.IDENTIFIER)
                self.state = 485
                self._errHandler.sync(self)
                la_ = self._interp.adaptivePredict(self._input,51,self._ctx)
                if la_ == 1:
                    self.state = 484
                    self.array()


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
        self._predicates[33] = self.expr_sempred
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
         

            if predIndex == 10:
                return self.precpred(self._ctx, 12)
         




