; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.c" to i8*
  %".4" = alloca i8
  store i8 97, i8* %".4"
  %".6" = load i8, i8* %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i8 %".6")
  ; printf "%c" 'a'
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.c" = internal constant [3 x i8] c"%c\00"