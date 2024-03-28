; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.f" to i8*
  %".4" = alloca float
  store float 0x4014ccccc0000000, float* %".4"
  %".6" = load float, float* %".4"
  %".7" = fpext float %".6" to double
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".3", double %".7")
  ; printf " %f " , 5.2
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.f" = internal constant [3 x i8] c"%f\00"