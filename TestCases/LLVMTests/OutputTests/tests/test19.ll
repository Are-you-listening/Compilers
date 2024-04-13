; ModuleID = "tests/test19.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca float, align 4
  store float 0x3fe93f7ce0000000, float* %".4", align 4
  ; const FLOAT f = 0.789
  %".7" = alloca float*, align 8
  store float* %".4", float** %".7", align 8
  ; const FLOAT * f_ptr = & f
  %".10" = alloca float*, align 8
  store float* %".4", float** %".10", align 8
  ; FLOAT * non_const_f_ptr = f_ptr
  %".13" = load float*, float** %".10", align 8
  ; * non_const_f_ptr = 3.1492
  store float 0x4009318fc0000000, float* %".13", align 8
  ret i32 0
  ;  return 0
}
