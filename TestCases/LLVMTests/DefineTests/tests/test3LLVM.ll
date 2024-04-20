; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;   INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ;  INT x = 1.13
  %".7" = bitcast [3 x i8]* @".str.d" to i8*
  %".8" = alloca i32
  store i32 2048, i32* %".8"
  %".10" = load i32, i32* %".8"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".10")
  ;  printf "%d" 2048
  %".13" = bitcast [3 x i8]* @".str.f" to i8*
  %".14" = alloca i32
  store i32 1, i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = fpext i32 %".16" to double
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".13", double %".17")
  ; printf "%f" x
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
@".str.f" = internal constant [3 x i8] c"%f\00"