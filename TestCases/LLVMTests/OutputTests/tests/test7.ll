; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 10, i8* %".3", align 1
  ; CHAR nl = '\n'
  %".6" = alloca i8, align 1
  store i8 9, i8* %".6", align 1
  ; CHAR tab = '\t'
  %".9" = alloca i8, align 1
  store i8 0, i8* %".9", align 1
  ; CHAR character_null = '\0'
  ret i32 0
  ; INT main
}
