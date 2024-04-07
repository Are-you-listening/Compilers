; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.d" to i8*
  %".4" = alloca i32
  store i32 5, i32* %".4"
  %".6" = load i32, i32* %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  ; printf "%d" 5
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"