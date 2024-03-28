; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i8, align 1
  store i8 120, i8* %".3", align 1
  ; CHAR x = 'x'
  %".6" = alloca i8, align 1
  store i8 46, i8* %".6", align 1
  ; CHAR dot = '.'
  ret i32 0
  ; INT main
}
