; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = bitcast [3 x i8]* @".str.d" to i8*
  %".5" = alloca i32
  store i32 3, i32* %".5"
  %".7" = load i32, i32* %".5"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  ;  printf "%d" y
  %".10" = bitcast [3 x i8]* @".str.d" to i8*
  %".11" = alloca i32
  store i32 8, i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  ; printf "%d" peer
  %".16" = bitcast [3 x i8]* @".str.f" to i8*
  %".17" = alloca float
  store float 0x400921fa00000000, float* %".17"
  %".19" = load float, float* %".17"
  %".20" = fpext float %".19" to double
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".16", double %".20")
  ; printf "%f" 3.14159
  ret i32 0
  ; return 0
}

@"peer" = global i32 8, align 4
@"x" = global i32 1, align 4
@"z" = global i32 3, align 4
@"y" = global i32 3, align 4
declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"
@".str.f" = internal constant [3 x i8] c"%f\00"