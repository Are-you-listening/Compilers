; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 -55, i32* %".3", align 4
  ; INT number = - 55
  %".6" = load i32, i32* %".3", align 4
  %".7" = add i32 %".6", 1
  store i32 %".7", i32* %".3", align 4
  %".9" = load i32, i32* %".3", align 4
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %".3", align 4
  store i32 %".9", i32* %".3", align 4
  ; number = number ++
  %".14" = load i32, i32* %".3", align 4
  %".15" = add i32 %".14", 1
  store i32 %".15", i32* %".3", align 4
  %".17" = alloca i32, align 4
  store i32 %".14", i32* %".17", align 4
  ; INT n = number ++
  %".20" = load i32, i32* %".17", align 4
  %".21" = load i32, i32* %".17", align 4
  %".22" = add i32 %".21", 1
  store i32 %".22", i32* %".17", align 4
  %".24" = sub i32 %".20", %".21"
  store i32 %".24", i32* %".17", align 4
  ; n = n - n ++
  %".27" = load i32, i32* %".17", align 4
  %".28" = add i32 %".27", 1
  store i32 %".28", i32* %".17", align 4
  ret i32 0
}
