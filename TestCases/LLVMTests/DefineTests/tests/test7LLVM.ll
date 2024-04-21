; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".5" = alloca i32
  store i32 3, i32* %".5"
  %".7" = load i32, i32* %".5"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  ;  printf "%d" y
  %".10" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".11" = alloca i32
  store i32 8, i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  ; printf "%d" peer
  ret i32 0
  ; return 0
}

@"peer" = global i32 8, align 4
@"x" = global i32 1, align 4
@"y" = global i32 3, align 4
declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"