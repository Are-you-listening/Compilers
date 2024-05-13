; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; int a = 5
  %".6" = load i32, i32* %".3", align 4
  %".7" = add i32 10, %".6"
  %".8" = sitofp i32 %".7" to float
  %".9" = alloca float, align 4
  store float %".8", float* %".9", align 4
  ; float b = 10 + a
  %".12" = load i32, i32* %".3", align 4
  %".13" = sitofp i32 %".12" to float
  %".14" = load float, float* %".9", align 4
  %".15" = fadd float %".13", %".14"
  %".16" = fptosi float %".15" to i32
  %".17" = alloca i32, align 4
  store i32 %".16", i32* %".17", align 4
  ; int c = a + b
  %".20" = alloca i32, align 4
  ; int d
  %".22" = load i32, i32* %".17", align 4
  %".23" = add i32 %".22", 3
  store i32 %".23", i32* %".20", align 4
  ; d = c + 3
}
