; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = bitcast [3 x i8]* @".str.d" to i8*
  %".5" = alloca i32
  store i32 1024, i32* %".5"
  %".7" = load i32, i32* %".5"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  ;  printf "%d" 1024
}

@"x" = global i32 1, align 4
declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"