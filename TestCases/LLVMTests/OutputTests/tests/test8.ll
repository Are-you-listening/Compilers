; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca float, align 4
  store float 0x3fdea7ac80000000, float* %".4", align 4
  ; FLOAT x = 0.478984
  %".7" = alloca float, align 4
  store float 0x4154f0cac0000000, float* %".7", align 4
  ; FLOAT y = 5489451.245847
  %".10" = alloca float, align 4
  store float 0x4099d80000000000, float* %".10", align 4
  ; FLOAT f = 1654.0000
  %".13" = alloca float, align 4
  store float              0x0, float* %".13", align 4
  ; FLOAT z = 0000.00000
  store float 0xc081a9b940000000, float* %".13", align 4
  ; z = - 565.21547
  ret i32 0
  ;  return 0
}
