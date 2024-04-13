; ModuleID = "tests/test18.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    typedef INT bool  INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ; bool x = 1
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; bool y = 0
  %".10" = alloca i32, align 4
  store i32 0, i32* %".10", align 4
  ; INT z = x && y
  %".13" = load i32, i32* %".7", align 4
  ;  bool b = y * z * 57809
  %".15" = mul i32 %".13", 0
  %".16" = mul i32 %".15", 57809
  %".17" = alloca i32, align 4
  store i32 %".16", i32* %".17", align 4
  ret i32 0
  ;  return 0
}
