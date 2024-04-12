; ModuleID = "tests/test9.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT a = 0
  br label %".6"
.6:
  br label %".7"
.7:
  %".8" = load i32, i32* %".3", align 4
  ; if a % 2 == 1
  %".10" = srem i32 %".8", 2
  %".11" = icmp eq i32 %".10", 1
  br i1 %".11", label %".12", label %".17"
.12:
  %".13" = load i32, i32* %".3", align 4
  ; a ++
  %".15" = add i32 %".13", 1
  store i32 %".15", i32* %".3", align 4
  br label %".6"
.17:
  %".18" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".20" = bitcast [3 x i8]* @".str.d" to i8*
  %".21" = alloca i32
  store i32 %".18", i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  %".25" = load i32, i32* %".3", align 4
  ; if a > 10
  %".27" = icmp sgt i32 %".25", 10
  br i1 %".27", label %".28", label %".30"
.28:
  ; break
  br label %".35"
.30:
  %".31" = load i32, i32* %".3", align 4
  ; a ++
  %".33" = add i32 %".31", 1
  store i32 %".33", i32* %".3", align 4
  br label %".6"
.35:
  %".36" = bitcast [3 x i8]* @".str.d" to i8*
  %".37" = alloca i32
  store i32 1, i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  ; printf "%d" 1
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"