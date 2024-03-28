; ModuleID = "tests/test15.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; const INT x = 5
  %".6" = alloca float, align 4
  store float 0x3fe18ef340000000, float* %".6", align 4
  ; const FLOAT f = 0.5487
  %".9" = alloca i32, align 4
  store i32 -875, i32* %".9", align 4
  ; const INT y = x * 35 * - 5
  %".12" = alloca float, align 4
  store float 0x3fc52535a0000000, float* %".12", align 4
  ; const FLOAT z = f * f * f
  ret i32 0
}
