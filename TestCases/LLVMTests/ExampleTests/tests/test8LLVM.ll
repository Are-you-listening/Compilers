; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT x = 5 * 3 / 10 + 9 / 10
  %".6" = load i32, i32* %".3", align 4
  ; speed y = x * 2 / 2 + 1 * 2 / 3 + x + 8 * 8 / 4
  %".8" = add i32 2, %".6"
  %".9" = sdiv i32 0, %".8"
  %".10" = add i32 %".9", 16
  %".11" = sitofp i32 %".10" to float
  %".12" = alloca float, align 4
  store float %".11", float* %".12", align 4
  %".14" = load i32, i32* %".3", align 4
  ; FLOAT result = x + y
  %".16" = sitofp i32 %".14" to float
  %".17" = load i32, i32* %".3", align 4
  %".18" = add i32 2, %".17"
  %".19" = sdiv i32 0, %".18"
  %".20" = add i32 %".19", 16
  %".21" = sitofp i32 %".20" to float
  %".22" = fadd float %".16", %".21"
  %".23" = alloca float, align 4
  store float %".22", float* %".23", align 4
  %".25" = load float, float* %".23", align 4
  ; printf "%f" result
  %".27" = bitcast [3 x i8]* @".str.f" to i8*
  %".28" = alloca float
  store float %".25", float* %".28"
  %".30" = load float, float* %".28"
  %".31" = fpext float %".30" to double
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".27", double %".31")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.f" = internal constant [3 x i8] c"%f\00"