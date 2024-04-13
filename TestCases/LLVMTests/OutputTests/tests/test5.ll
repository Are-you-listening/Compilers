; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  INT main
  %".4" = alloca i32, align 4
  store i32 -55, i32* %".4", align 4
  ; INT number = - 55
  %".7" = load i32, i32* %".4", align 4
  ;  number ++
  %".9" = add i32 %".7", 1
  store i32 %".9", i32* %".4", align 4
  %".11" = load i32, i32* %".4", align 4
  ; number = number ++
  %".13" = add i32 %".11", 1
  store i32 %".13", i32* %".4", align 4
  store i32 %".11", i32* %".4", align 4
  %".16" = load i32, i32* %".4", align 4
  ;  INT n = number ++
  %".18" = add i32 %".16", 1
  store i32 %".18", i32* %".4", align 4
  %".20" = alloca i32, align 4
  store i32 %".16", i32* %".20", align 4
  %".22" = load i32, i32* %".20", align 4
  ;  n = n - n ++
  %".24" = load i32, i32* %".20", align 4
  %".25" = add i32 %".24", 1
  store i32 %".25", i32* %".20", align 4
  %".27" = sub i32 %".22", %".24"
  store i32 %".27", i32* %".20", align 4
  %".29" = load i32, i32* %".20", align 4
  ;  ++ n
  %".31" = add i32 %".29", 1
  store i32 %".31", i32* %".20", align 4
  ret i32 0
  ; return 0
}
