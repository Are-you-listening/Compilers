; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.x" to i8*
  %".4" = alloca i32
  store i32 1, i32* %".4"
  %".6" = load i32, i32* %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  ; printf "%x" 1
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.x" = internal constant [3 x i8] c"%x\00"