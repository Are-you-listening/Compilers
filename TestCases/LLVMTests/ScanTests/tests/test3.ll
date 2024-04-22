; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = bitcast [3 x i8]* @".str.0" to i8*
  %".5" = alloca float
  store float 0x40091eb860000000, float* %".5"
  %".7" = load float, float* %".5"
  %".8" = fpext float %".7" to double
  %".9" = call i32 (i8*, ...) @"scanf"(i8* %".4", double %".8")
  ; scanf "%c" 3.14
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [3 x i8] c"%c\00"
declare i32 @"scanf"(i8* %".1", ...)
