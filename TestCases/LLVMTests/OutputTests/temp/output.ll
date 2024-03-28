; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 478, i32* %".3", align 4
  ; INT x = 478
  %".6" = alloca i32, align 4
  store i32 -251454, i32* %".6", align 4
  ; INT b = - 251454
  %".9" = bitcast i32* %".3" to i32**
  ; INT * * x_ptr = & x
  %".11" = alloca i32**, align 8
  store i32** %".9", i32*** %".11", align 8
  %".13" = bitcast i32* %".6" to i32**
  ; x_ptr = & b
  store i32** %".13", i32*** %".11", align 8
  ; INT main
}
