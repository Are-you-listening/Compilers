; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = bitcast [3 x i8]* @".str.0" to i8*
  %".5" = alloca float
  store float 0x4014ccccc0000000, float* %".5"
  %".7" = load float, float* %".5"
  %".8" = fpext float %".7" to double
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", double %".8")
  ; printf "%f" 5.2
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [3 x i8] c"%f\00"
declare i32 @"printf"(i8* %".1", ...)
