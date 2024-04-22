; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".5" = alloca i32
  store i32 1, i32* %".5"
  %".7" = load i32, i32* %".5"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  ; printf "%x" 1
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%x\00"