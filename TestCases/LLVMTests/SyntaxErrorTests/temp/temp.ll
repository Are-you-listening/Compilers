; ModuleID = "tests/test27.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca float, align 4
  store float 0x4022ea7060000000, float* %".4", align 4
  ; FLOAT f = 9.457889
  store float 0x41a4ecd2c0000000, float* %".4", align 4
  ;  & f = 3217 * 54564
}
