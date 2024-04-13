; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 98362, i32* %".4", align 4
  ;  INT x = 98362
  %".7" = alloca i32*, align 8
  store i32* %".4", i32** %".7", align 8
  ;  INT * x_ptr = & x
  %".10" = alloca i32**, align 8
  store i32** %".7", i32*** %".10", align 8
  ;  INT * * p = & x_ptr
  %".13" = alloca i32*, align 8
  store i32* %".4", i32** %".13", align 8
  ; INT * z = & x
  %".16" = alloca float, align 4
  store float 0x408ac20da0000000, float* %".16", align 4
  ;  FLOAT a = 856.25668
  %".19" = alloca float*, align 8
  store float* %".16", float** %".19", align 8
  ; FLOAT * a_ptr = & a
  ret i32 0
  ;  return 0
}
