; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT b = 0
  %".10" = alloca i32, align 4
  store i32 0, i32* %".10", align 4
  ; INT c = 0
  %".13" = alloca i32, align 4
  store i32 0, i32* %".13", align 4
  ; INT d = 0
  %".16" = alloca i32, align 4
  store i32 0, i32* %".16", align 4
  ; INT e = 0
  %".19" = alloca i32, align 4
  store i32 0, i32* %".19", align 4
  ; INT f = 0
  store i32 0, i32* %".4", align 4
  ;  a = 0
  store i32 0, i32* %".7", align 4
  ; b = 0
  store i32 0, i32* %".10", align 4
  ; c = 0
  store i32 0, i32* %".13", align 4
  ; d = 0
  store i32 0, i32* %".16", align 4
  ; e = 0
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".10", align 4
  ; c = 1
  ; f = a && b || c || d && c && e
  %".37" = load i32, i32* %".4", align 4
  %".38" = icmp ne i32 %".37", 0
  br i1 %".38", label %".39", label %".45"
.39:
  %".40" = load i32, i32* %".7", align 4
  %".41" = icmp ne i32 %".40", 0
  br i1 %".41", label %".54", label %".42"
.42:
  %".43" = load i32, i32* %".10", align 4
  %".44" = icmp ne i32 %".43", 0
  br i1 %".44", label %".54", label %".45"
.45:
  %".46" = load i32, i32* %".13", align 4
  %".47" = icmp ne i32 %".46", 0
  br i1 %".47", label %".48", label %".54"
.48:
  %".49" = load i32, i32* %".10", align 4
  %".50" = icmp ne i32 %".49", 0
  br i1 %".50", label %".51", label %".54"
.51:
  %".52" = load i32, i32* %".16", align 4
  %".53" = icmp ne i32 %".52", 0
  br label %".54"
.54:
  %".55" = phi  i1 [1, %".39"], [1, %".42"], [0, %".45"], [0, %".48"], [%".53", %".51"]
  %".56" = zext i1 %".55" to i32
  store i32 %".56", i32* %".19", align 4
  %".58" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".60" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".61" = alloca i32
  store i32 %".58", i32* %".61"
  %".63" = load i32, i32* %".61"
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".60", i32 %".63")
  ret i32 0
  ;     return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"