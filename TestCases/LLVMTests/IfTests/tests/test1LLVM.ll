; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  if 1 INT b = 0
  %".7" = bitcast [3 x i8]* @".str.d" to i8*
  %".8" = alloca i32
  store i32 0, i32* %".8"
  %".10" = load i32, i32* %".8"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".10")
  ; printf "%d" b
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"