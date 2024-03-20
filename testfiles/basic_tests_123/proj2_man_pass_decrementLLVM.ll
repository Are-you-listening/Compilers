; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_decrement.c"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = load i32, i32* %".3", align 4
  %".7" = sub i32 %".6", 1
  store i32 %".7", i32* %".3", align 4
  %".9" = load i32, i32* %".3", align 4
  %".10" = sub i32 %".9", 1
  store i32 %".10", i32* %".3", align 4
  %".12" = alloca i32, align 4
}
