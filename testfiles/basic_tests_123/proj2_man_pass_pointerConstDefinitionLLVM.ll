; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_pointerConstDefinition.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 98362, i32* %".3", align 4
  ; const INT x = 98362
  %".6" = alloca i32*, align 8
  store i32* %".3", i32** %".6", align 8
  ; const INT * x_ptr = & x
  %".9" = alloca i32**, align 8
  store i32** %".6", i32*** %".9", align 8
  ; const INT * * p = & x_ptr
  %".12" = alloca i32*, align 8
  store i32* %".3", i32** %".12", align 8
  ; const INT * z = & x
  %".15" = alloca float, align 4
  store float 0x408ac20da0000000, float* %".15", align 4
  ; const FLOAT a = 856.25668
  %".18" = alloca float*, align 8
  store float* %".15", float** %".18", align 8
  ; const FLOAT * a_ptr = & a
  ret i32 0
}
