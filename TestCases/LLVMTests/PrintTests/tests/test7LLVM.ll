; ModuleID = "tests/test7.c"
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
  ; printf "%f" , 5.2
  %".10" = bitcast [3 x i8]* @".str.x" to i8*
  %".11" = alloca i8
  store i8 97, i8* %".11"
  %".13" = load i8, i8* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i8 %".13")
  ; printf "%x" , 'a'
  %".16" = bitcast [3 x i8]* @".str.c" to i8*
  %".17" = alloca i8
  store i8 97, i8* %".17"
  %".19" = load i8, i8* %".17"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i8 %".19")
  ; printf "%c" , 'a'
  %".22" = bitcast [3 x i8]* @".str.d" to i8*
  %".23" = alloca i32
  store i32 6, i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  ; printf "%d" , 6
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.f" = internal constant [3 x i8] c"%f\00"
@".str.x" = internal constant [3 x i8] c"%x\00"
@".str.c" = internal constant [3 x i8] c"%c\00"
@".str.d" = internal constant [3 x i8] c"%d\00"