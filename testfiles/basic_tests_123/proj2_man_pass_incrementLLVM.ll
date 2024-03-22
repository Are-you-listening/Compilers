; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_increment.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 -55, i32* %".3", align 4
  ; INT number = - 55
  %".6" = load i32, i32* %".3", align 4
  %".7" = add i32 %".6", 1
  store i32 %".7", i32* %".3", align 4
  %".9" = load i32, i32* %".3", align 4
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %".3", align 4
}
