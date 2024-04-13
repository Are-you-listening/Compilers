; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT x = 5
  %".7" = load i32, i32* %".4", align 4
  ; x --
  %".9" = sub i32 %".7", 1
  store i32 %".9", i32* %".4", align 4
  %".11" = load i32, i32* %".4", align 4
  ;  INT z = x --
  %".13" = sub i32 %".11", 1
  store i32 %".13", i32* %".4", align 4
  %".15" = alloca i32, align 4
  store i32 %".11", i32* %".15", align 4
  %".17" = load i32, i32* %".4", align 4
  ; x = x -- + z --
  %".19" = sub i32 %".17", 1
  store i32 %".19", i32* %".4", align 4
  %".21" = load i32, i32* %".15", align 4
  %".22" = sub i32 %".21", 1
  store i32 %".22", i32* %".15", align 4
  %".24" = add i32 %".17", %".21"
  store i32 %".24", i32* %".4", align 4
  %".26" = load i32, i32* %".4", align 4
  ;  -- x
  %".28" = sub i32 %".26", 1
  store i32 %".28", i32* %".4", align 4
}
