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
  ; number ++
  %".8" = add i32 %".6", 1
  store i32 %".8", i32* %".3", align 4
  %".10" = load i32, i32* %".3", align 4
  ; number = number ++
  %".12" = add i32 %".10", 1
  store i32 %".12", i32* %".3", align 4
  store i32 %".10", i32* %".3", align 4
  %".15" = load i32, i32* %".3", align 4
  ; INT n = number ++
  %".17" = add i32 %".15", 1
  store i32 %".17", i32* %".3", align 4
  %".19" = alloca i32, align 4
  store i32 %".15", i32* %".19", align 4
  %".21" = load i32, i32* %".19", align 4
  ; n = n - n ++
  %".23" = load i32, i32* %".19", align 4
  %".24" = add i32 %".23", 1
  store i32 %".24", i32* %".19", align 4
  %".26" = sub i32 %".21", %".23"
  store i32 %".26", i32* %".19", align 4
  %".28" = load i32, i32* %".19", align 4
  ; ++ n
  %".30" = add i32 %".28", 1
  store i32 %".30", i32* %".19", align 4
  ret i32 0
  ; INT main
}
