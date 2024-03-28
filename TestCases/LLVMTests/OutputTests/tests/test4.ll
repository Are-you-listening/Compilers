; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = load i32, i32* %".3", align 4
  %".7" = sub i32 %".6", 1
  store i32 %".7", i32* %".3", align 4
  %".9" = load i32, i32* %".3", align 4
  %".10" = sub i32 %".9", 1
  store i32 %".10", i32* %".3", align 4
  %".12" = alloca i32, align 4
  store i32 %".9", i32* %".12", align 4
  ; INT z = x --
  %".15" = load i32, i32* %".3", align 4
  %".16" = sub i32 %".15", 1
  store i32 %".16", i32* %".3", align 4
  %".18" = load i32, i32* %".12", align 4
  %".19" = sub i32 %".18", 1
  store i32 %".19", i32* %".12", align 4
  %".21" = add i32 %".15", %".18"
  store i32 %".21", i32* %".3", align 4
  ; x = x -- + z --
  %".24" = load i32, i32* %".3", align 4
  %".25" = sub i32 %".24", 1
  store i32 %".25", i32* %".3", align 4
}
