; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 -60, i32* %".3", align 4
  ; INT x = - 60
  %".6" = alloca i32*, align 8
  store i32* %".3", i32** %".6", align 8
  ; INT * some_pointer = & x
  %".9" = load i32*, i32** %".6", align 8
  ; * some_pointer = 53
  store i32 53, i32* %".9", align 8
  %".12" = alloca i32**, align 8
  store i32** %".6", i32*** %".12", align 8
  ; INT * * another_pointer = & some_pointer
  %".15" = alloca i32***, align 8
  store i32*** %".12", i32**** %".15", align 8
  ; INT * * * triple_pointer = & another_pointer
  %".18" = load i32**, i32*** %".12", align 8
  ; INT y = * * * triple_pointer
  %".20" = load i32*, i32** %".18", align 8
  %".21" = load i32, i32* %".20", align 8
  %".22" = alloca i32, align 4
  store i32 %".21", i32* %".22", align 4
  ret i32 0
  ; INT main
}
