; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  store i32 110127075, i32* %".4", align 4
  ; a = 33 + 69789 * 69421 / 51213 + 2231 - 654
  %".9" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".11" = bitcast [3 x i8]* @".str.0" to i8*
  %".12" = alloca i32
  store i32 %".9", i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  store i32 0, i32* %".4", align 4
  ;  a = 654 * 15486 - 15000 + 486
  %".18" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".20" = bitcast [3 x i8]* @".str.0" to i8*
  %".21" = alloca i32
  store i32 %".18", i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
