; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".4" = bitcast [3 x i8]* @".str.c" to i8*
  %".5" = alloca i8
  store i8 97, i8* %".5"
  %".7" = load i8, i8* %".5"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i8 %".7")
  ; printf "%c" , 'a'
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.c" = internal constant [3 x i8] c"%c\00"