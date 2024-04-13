; ModuleID = "tests/test15.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ;  const INT x = 5
  %".7" = alloca float, align 4
  store float 0x3fe18ef340000000, float* %".7", align 4
  ; const FLOAT f = 0.5487
  %".10" = alloca i32, align 4
  store i32 -875, i32* %".10", align 4
  ; const INT y = x * 35 * - 5
  %".13" = alloca float, align 4
  store float 0x3fc52535a0000000, float* %".13", align 4
  ;  const FLOAT z = f * f * f
  ret i32 0
  ;   return 0
}
