; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ; INT a
  store i32 0, i32* %".3", align 4
  ; for a = 0 a < 10 a ++
  br label %".7"
.7:
  %".8" = load i32, i32* %".3", align 4
  %".9" = icmp slt i32 %".8", 10
  br i1 %".9", label %".10", label %".21"
.10:
  %".11" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".13" = bitcast [3 x i8]* @".str.d" to i8*
  %".14" = alloca i32
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  %".18" = load i32, i32* %".3", align 4
  %".19" = add i32 %".18", 1
  store i32 %".19", i32* %".3", align 4
  br label %".7"
.21:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"