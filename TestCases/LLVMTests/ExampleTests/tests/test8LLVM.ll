; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;   typedef FLOAT speed INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT x = 5 * 3 / 10 + 9 / 10
  ; speed y = x * 2 / 2 + 1 * 2 / 3 + x + 8 * 8 / 4
  %".8" = load i32, i32* %".4", align 4
  %".9" = add i32 2, %".8"
  %".10" = sdiv i32 0, %".9"
  %".11" = add i32 %".10", 16
  %".12" = sitofp i32 %".11" to float
  %".13" = alloca float, align 4
  store float %".12", float* %".13", align 4
  ; FLOAT result = x + y
  %".16" = load i32, i32* %".4", align 4
  %".17" = sitofp i32 %".16" to float
  %".18" = load i32, i32* %".4", align 4
  %".19" = add i32 2, %".18"
  %".20" = sdiv i32 0, %".19"
  %".21" = add i32 %".20", 16
  %".22" = sitofp i32 %".21" to float
  %".23" = fadd float %".17", %".22"
  %".24" = alloca float, align 4
  store float %".23", float* %".24", align 4
  %".26" = load float, float* %".24", align 4
  ; printf "%f" result
  %".28" = bitcast [3 x i8]* @".str.0" to i8*
  %".29" = alloca float
  store float %".26", float* %".29"
  %".31" = load float, float* %".29"
  %".32" = fpext float %".31" to double
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".28", double %".32")
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%f\00"
declare i32 @"printf"(i8* %".1", ...)
