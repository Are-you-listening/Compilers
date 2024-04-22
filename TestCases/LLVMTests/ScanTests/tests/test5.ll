; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT k = 0
  %".7" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".8" = alloca i32*
  store i32* %".4", i32** %".8"
  %".10" = load i32*, i32** %".8"
  %".11" = call i32 (i8*, ...) @"scanf"(i8* %".7", i32* %".10")
  ; scanf "%x" & k
  %".13" = load i32, i32* %".4", align 4
  ; printf "%x" k
  %".15" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".16" = alloca i32
  store i32 %".13", i32* %".16"
  %".18" = load i32, i32* %".16"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18")
  ret i32 0
  ; return 0
}

declare i32 @"scanf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%x\00"
declare i32 @"printf"(i8* %".1", ...)
