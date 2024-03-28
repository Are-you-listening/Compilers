; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; Incompatible Types?
  %".4" = alloca i32, align 4
  store i32 478, i32* %".4", align 4
  ; INT x = 478
  %".7" = alloca i32, align 4
  store i32 -251454, i32* %".7", align 4
  ; INT b = - 251454
  %".10" = alloca i32*, align 8
  store i32* %".7", i32** %".10", align 8
  ; INT * b_ptr = & b
  %".13" = alloca i32**, align 8
  store i32** %".10", i32*** %".13", align 8
  ; INT * * x_ptr = & b_ptr
  %".16" = bitcast i32* %".7" to i32**
  store i32** %".16", i32*** %".13", align 8
  ; x_ptr = & b
  ret i32 0
}
