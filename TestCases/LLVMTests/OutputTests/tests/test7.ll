; ModuleID = "tests/test7.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i8, align 1
  store i8 10, i8* %".4", align 1
  ;   CHAR nl = '\n'
  %".7" = alloca i8, align 1
  store i8 9, i8* %".7", align 1
  ; CHAR tab = '\t'
  %".10" = alloca i8, align 1
  store i8 0, i8* %".10", align 1
  ; CHAR character_null = '\0'
  ret i32 0
  ; return 0
}
