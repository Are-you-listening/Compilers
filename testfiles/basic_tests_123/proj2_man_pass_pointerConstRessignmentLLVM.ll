; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_pointerConstRessignment.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 4, i32* %".3", align 4
  ; INT x = 4
  %".6" = alloca i32, align 4
  store i32 9632, i32* %".6", align 4
  ; INT b = 9632
  %".9" = alloca i32*, align 8
  store i32* %".3", i32** %".9", align 8
  ; const INT * x_ptr = & x
  store i32* %".6", i32** %".9", align 8
  ; x_ptr = & b
  ret i32 0
}
