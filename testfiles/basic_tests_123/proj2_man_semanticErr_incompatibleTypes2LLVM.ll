; ModuleID = "testfiles/basic_tests_123/proj2_man_semanticErr_incompatibleTypes2.c"
target triple = "unknown-unknown-unknown"
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
  %".9" = alloca i32**, align 8
}
