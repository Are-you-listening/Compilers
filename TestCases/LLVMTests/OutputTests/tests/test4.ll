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
  ; x --
  %".8" = sub i32 %".6", 1
  store i32 %".8", i32* %".3", align 4
  %".10" = load i32, i32* %".3", align 4
  ; INT z = x --
  %".12" = sub i32 %".10", 1
  store i32 %".12", i32* %".3", align 4
  %".14" = alloca i32, align 4
  store i32 %".10", i32* %".14", align 4
  %".16" = load i32, i32* %".3", align 4
  ; x = x -- + z --
  %".18" = sub i32 %".16", 1
  store i32 %".18", i32* %".3", align 4
  %".20" = load i32, i32* %".14", align 4
  %".21" = sub i32 %".20", 1
  store i32 %".21", i32* %".14", align 4
  %".23" = add i32 %".16", %".20"
  store i32 %".23", i32* %".3", align 4
  %".25" = load i32, i32* %".3", align 4
  ; -- x
  %".27" = sub i32 %".25", 1
  store i32 %".27", i32* %".3", align 4
  ; INT main
}
