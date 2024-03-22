; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_conversionImplicit.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = sitofp i32 5 to float
  %".7" = alloca float, align 4
  store float %".6", float* %".7", align 4
  ; FLOAT f = x
  %".10" = alloca i32, align 4
  store i32 -32682, i32* %".10", align 4
  ; INT z = - 32682
  %".13" = load i32, i32* %".3", align 4
  %".14" = sitofp i32 %".13" to float
  %".15" = fadd float 0xc13074ea00000000, %".14"
  store float %".15", float* %".7", align 4
  ; f = 33.0 * z + x
  %".18" = load float, float* %".7", align 4
  %".19" = fmul float %".18", 0x3fe6666660000000
  %".20" = fptosi float %".19" to i32
  store i32 %".20", i32* %".10", align 4
  ; z = f * 0.7
  %".23" = zext i8 219 to i32
  %".24" = alloca i32, align 4
  store i32 %".23", i32* %".24", align 4
  ; INT k = 'a' + 'z'
  ret i32 0
}
