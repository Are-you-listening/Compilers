; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i8, align 1
  store i8 120, i8* %".4", align 1
  ;  CHAR x = 'x'
  %".7" = alloca i8, align 1
  store i8 46, i8* %".7", align 1
  ; CHAR dot = '.'
  ret i32 0
  ; return 0
}
