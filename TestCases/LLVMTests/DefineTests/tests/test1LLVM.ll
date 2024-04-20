; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;       INT main
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
  ;  Using macros to calculate areas by
  ;
  ;  passing argument
  ;
  store i32 3, i32* %".10", align 4
  ; area = 3.14
  %".21" = load i32, i32* %".4", align 4
  ; printf "%d%d%d" radius
  %".23" = load i32, i32* %".10", align 4
  ; area success
  %".25" = bitcast [7 x i8]* @".str.d" to i8*
  %".26" = alloca i32
  %".27" = alloca i32
  %".28" = alloca i32
  store i32 %".21", i32* %".26"
  store i32 %".23", i32* %".27"
  store i32 1, i32* %".28"
  %".32" = load i32, i32* %".26"
  %".33" = load i32, i32* %".27"
  %".34" = load i32, i32* %".28"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".32", i32 %".33", i32 %".34")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [7 x i8] c"%d%d%d\00"