; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_pointerReassignment.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 -6250, i32* %".3", align 4
  ; const INT b = - 6250
  %".6" = alloca i32, align 4
  store i32 5, i32* %".6", align 4
  ; const INT x = 5
  %".9" = alloca i32*, align 8
  store i32* %".6", i32** %".9", align 8
  ; INT * non_const_pointer = & x
  %".12" = load i32*, i32** %".9", align 8
  store i32 36941, i32* %".12", align 8
  ; * non_const_pointer = 36941
  store i32* %".3", i32** %".9", align 8
  ; non_const_pointer = & b
  %".17" = alloca i8, align 1
  store i8 120, i8* %".17", align 1
  ; CHAR c = 'x'
}
