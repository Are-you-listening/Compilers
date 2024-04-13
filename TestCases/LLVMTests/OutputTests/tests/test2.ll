; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  ; Incompatible Types?
  ;
  %".6" = alloca i32, align 4
  store i32 478, i32* %".6", align 4
  ; INT x = 478
  %".9" = alloca i32, align 4
  store i32 -251454, i32* %".9", align 4
  ; INT b = - 251454
  %".12" = alloca i32*, align 8
  store i32* %".9", i32** %".12", align 8
  ;  INT * b_ptr = & b
  %".15" = alloca i32**, align 8
  store i32** %".12", i32*** %".15", align 8
  ;  INT * * x_ptr = & b_ptr
  ; x_ptr = & b
  %".19" = bitcast i32* %".9" to i32**
  store i32** %".19", i32*** %".15", align 8
  ret i32 0
  ;  return 0
}
