; ModuleID = "tests/test3.c"
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
  %".7" = load i32, i32* %".3", align 4
  ; while a < 30
  %".9" = icmp slt i32 %".7", 30
  br i1 %".9", label %".10", label %".34"
.10:
  %".11" = load i32, i32* %".3", align 4
  ; if a % 2 == 0
  %".13" = srem i32 %".11", 2
  %".14" = icmp eq i32 %".13", 0
  br i1 %".14", label %".15", label %".22"
.15:
  %".16" = bitcast [3 x i8]* @".str.d" to i8*
  %".17" = alloca i32
  store i32 1, i32* %".17"
  %".19" = load i32, i32* %".17"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".19")
  ; printf "%d" 1
  br label %".29"
.22:
  %".23" = bitcast [3 x i8]* @".str.d" to i8*
  %".24" = alloca i32
  store i32 2, i32* %".24"
  %".26" = load i32, i32* %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
  ; printf "%d" 2
  br label %".29"
.29:
  %".30" = load i32, i32* %".3", align 4
  ; a ++
  %".32" = add i32 %".30", 1
  store i32 %".32", i32* %".3", align 4
  br label %".6"
.34:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"