; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 478, i32* %".4", align 4
  ;  INT x = 478
  %".7" = alloca i32, align 4
  store i32 -251454, i32* %".7", align 4
  ; INT b = - 251454
  ;  INT * * x_ptr = & x
  %".11" = bitcast i32* %".4" to i32**
  %".12" = alloca i32**, align 8
  store i32** %".11", i32*** %".12", align 8
  ; x_ptr = & b
  %".15" = bitcast i32* %".7" to i32**
  store i32** %".15", i32*** %".12", align 8
}
