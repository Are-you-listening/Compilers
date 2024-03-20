; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_pointerOperations2.c"
target triple = "unknown-unknown-unknown"
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
  store i32 53, i32* %".9", align 8
  ; * some_pointer = 53
  %".12" = alloca i32**, align 8
  store i32** %".6", i32*** %".12", align 8
  ; INT * * another_pointer = & some_pointer
  %".15" = alloca i32***, align 8
  store i32*** %".12", i32**** %".15", align 8
  ; INT * * * triple_pointer = & another_pointer
  %".18" = load i32**, i32*** %".12", align 8
  %".19" = load i32*, i32** %".18", align 8
  %".20" = load i32, i32* %".19", align 8
  %".21" = alloca i32, align 4
  store i32 %".20", i32* %".21", align 4
  ; INT y = * * * triple_pointer
}
