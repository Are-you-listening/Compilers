; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; * My program
  ; INT main
  %".5" = alloca i32, align 4
  store i32 0, i32* %".5", align 4
  ; INT x = 5 * 3 / 10 + 9 / 10
  %".8" = load i32, i32* %".5", align 4
  ; speed y = x * 2 / 2 + 1 * 2 / 3 + x + 8 * 8 / 4
  %".10" = add i32 2, %".8"
  %".11" = sdiv i32 0, %".10"
  %".12" = add i32 %".11", 16
  %".13" = sitofp i32 %".12" to float
  %".14" = alloca float, align 4
  store float %".13", float* %".14", align 4
  %".16" = load i32, i32* %".5", align 4
  ; FLOAT result = x + y
  %".18" = sitofp i32 %".16" to float
  %".19" = load i32, i32* %".5", align 4
  %".20" = add i32 2, %".19"
  %".21" = sdiv i32 0, %".20"
  %".22" = add i32 %".21", 16
  %".23" = sitofp i32 %".22" to float
  %".24" = fadd float %".18", %".23"
  %".25" = alloca float, align 4
  store float %".24", float* %".25", align 4
  %".27" = load float, float* %".25", align 4
  ; printf "%f" , result
  %".29" = bitcast [3 x i8]* @".str.f" to i8*
  %".30" = alloca float
  store float %".27", float* %".30"
  %".32" = load float, float* %".30"
  %".33" = fpext float %".32" to double
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".29", double %".33")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.f" = internal constant [3 x i8] c"%f\00"