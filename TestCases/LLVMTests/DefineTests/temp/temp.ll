; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;          INT main
  %".4" = alloca i32, align 4
  store i32 21, i32* %".4", align 4
  ;   INT radius = 21
  %".7" = alloca i32, align 4
  store i32 5, i32* %".7", align 4
  ; INT side = 5
  %".10" = alloca i32, align 4
  ; INT area
  %".12" = alloca i32, align 4
  store i32 1, i32* %".12", align 4
  ; const INT success = 1
}
