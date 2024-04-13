; ModuleID = "tests/test10.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 4, i32* %".4", align 4
  ;  INT x = 4
  %".7" = alloca i32, align 4
  store i32 9632, i32* %".7", align 4
  ; INT b = 9632
  %".10" = alloca i32*, align 8
  store i32* %".4", i32** %".10", align 8
  ;  const INT * x_ptr = & x
  store i32* %".7", i32** %".10", align 8
  ; x_ptr = & b
  ret i32 0
  ;  return 0
}
