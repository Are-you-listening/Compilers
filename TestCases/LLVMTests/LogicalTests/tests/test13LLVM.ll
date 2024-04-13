; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
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
  store i32 0, i32* %".7", align 4
  ; b = 0
  ; f = a && ! b || c
  %".37" = load i32, i32* %".4", align 4
  %".38" = icmp ne i32 %".37", 0
  br i1 %".38", label %".39", label %".46"
.39:
  %".40" = load i32, i32* %".7", align 4
  %".41" = icmp ne i32 %".40", 0
  br i1 %".41", label %".46", label %".42"
.42:
  %".43" = load i32, i32* %".10", align 4
  %".44" = icmp ne i32 %".43", 0
  %".45" = xor i1 %".44", 1
  br label %".46"
.46:
  %".47" = phi  i1 [0, %".2"], [0, %".39"], [%".45", %".42"]
  %".48" = zext i1 %".47" to i32
  store i32 %".48", i32* %".19", align 4
  %".50" = load i32, i32* %".19", align 4
  ; printf "%d" f
  %".52" = bitcast [3 x i8]* @".str.d" to i8*
  %".53" = alloca i32
  store i32 %".50", i32* %".53"
  %".55" = load i32, i32* %".53"
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %".55")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"