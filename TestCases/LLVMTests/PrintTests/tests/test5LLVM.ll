; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".4" = bitcast [3 x i8]* @".str.x" to i8*
  %".5" = alloca i8
  store i8 121, i8* %".5"
  %".7" = load i8, i8* %".5"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i8 %".7")
  ; printf "%x" , 'y'
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.x" = internal constant [3 x i8] c"%x\00"