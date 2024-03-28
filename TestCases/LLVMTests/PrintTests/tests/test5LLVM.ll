; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.x" to i8*
  %".4" = alloca i8
  store i8 121, i8* %".4"
  %".6" = load i8, i8* %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i8 %".6")
  ; printf " %x " , 'y'
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.x" = internal constant [3 x i8] c"%x\00"