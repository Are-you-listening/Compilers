; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 -60, i32* %".4", align 4
  ;  INT x = - 60
  %".7" = alloca i32*, align 8
  store i32* %".4", i32** %".7", align 8
  ; INT * some_pointer = & x
  %".10" = load i32*, i32** %".7", align 8
  ; * some_pointer = 53
  store i32 53, i32* %".10", align 8
  %".13" = alloca i32**, align 8
  store i32** %".7", i32*** %".13", align 8
  ; INT * * another_pointer = & some_pointer
  %".16" = alloca i32***, align 8
  store i32*** %".13", i32**** %".16", align 8
  ; INT * * * triple_pointer = & another_pointer
  %".19" = load i32**, i32*** %".13", align 8
  ; INT y = * * * triple_pointer
  %".21" = load i32*, i32** %".19", align 8
  %".22" = load i32, i32* %".21", align 8
  %".23" = alloca i32, align 4
  store i32 %".22", i32* %".23", align 4
  ret i32 0
  ;  return 0
}
