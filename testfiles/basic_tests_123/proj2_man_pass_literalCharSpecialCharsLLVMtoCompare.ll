; ModuleID = "testfiles/basic_tests_123/proj2_man_pass_literalCharSpecialChars.c"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 '\n', i8* %".3", align 1
  ; CHAR nl = '\n'
  %".6" = alloca i8, align 1
  store i8 '\t', i8* %".6", align 1
  ; CHAR tab = '\t'
  %".9" = alloca i8, align 1
  store i8 '\0', i8* %".9", align 1
  ; CHAR character_null = '\0'
}
