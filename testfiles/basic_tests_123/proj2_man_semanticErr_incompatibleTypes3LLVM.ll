; ModuleID = "testfiles/basic_tests_123/proj2_man_semanticErr_incompatibleTypes3.c"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 54, i32* %".3", align 4
  ; INT x = 54
  %".6" = alloca float, align 4
}
