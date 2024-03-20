; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_literalChar.c"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 'x', i8* %".3", align 1
  ; CHAR x = 'x'
  %".6" = alloca i8, align 1
  store i8 '.', i8* %".6", align 1
  ; CHAR dot = '.'
}
