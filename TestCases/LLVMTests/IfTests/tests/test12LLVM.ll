; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = load i32, i32* %".3", align 4
  ; if x < 5
  %".8" = icmp slt i32 %".6", 5
  br i1 %".8", label %".9", label %".16"
.9:
  %".10" = bitcast [3 x i8]* @".str.d" to i8*
  %".11" = alloca i32
  store i32 1, i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  ; printf "%d" 1
  br label %".16"
.16:
  %".17" = load i32, i32* %".3", align 4
  ; if x >= 5
  %".19" = icmp sge i32 %".17", 5
  br i1 %".19", label %".20", label %".27"
.20:
  %".21" = bitcast [3 x i8]* @".str.d" to i8*
  %".22" = alloca i32
  store i32 2, i32* %".22"
  %".24" = load i32, i32* %".22"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".24")
  ; printf "%d" 2
  br label %".27"
.27:
  %".28" = load i32, i32* %".3", align 4
  ; if x == 5 && 1
  %".30" = icmp eq i32 %".28", 5
  br i1 %".30", label %".31", label %".43"
.31:
  %".32" = load i32, i32* %".3", align 4
  ; if x != 4
  %".34" = icmp ne i32 %".32", 4
  br i1 %".34", label %".35", label %".42"
.35:
  %".36" = bitcast [3 x i8]* @".str.d" to i8*
  %".37" = alloca i32
  store i32 3, i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  ; printf "%d" 3
  br label %".42"
.42:
  br label %".43"
.43:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"