; ModuleID = "testfiles/basic_tests_123/proj2_man_semanticErr_incompatibleTypes5.c"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 54, i32* %".3", align 4
  ; INT x = 54
  %".6" = alloca i32, align 4
  store i32 -33, i32* %".6", align 4
  ; INT z = - 33
  %".9" = alloca i32*, align 8
  store i32* %".6", i32** %".9", align 8
  ; INT * p = & z
}
