; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  very simple test to test the basics of identifierReplacer
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ; int a = 1
  %".7" = load i32, i32* %".4", align 4
  %".8" = alloca i32, align 4
  store i32 %".7", i32* %".8", align 4
  ; int b = a
  %".11" = load i32, i32* %".4", align 4
  %".12" = add i32 %".11", 1
  %".13" = alloca i32, align 4
  store i32 %".12", i32* %".13", align 4
  ; int c = a + 1
}
