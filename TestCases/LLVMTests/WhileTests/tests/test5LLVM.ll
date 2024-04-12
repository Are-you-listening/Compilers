; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  br label %".3"
.3:
  br label %".4"
.4:
  %".5" = alloca i32, align 4
  store i32 0, i32* %".5", align 4
  ; INT a = 0
  %".8" = bitcast [3 x i8]* @".str.d" to i8*
  %".9" = alloca i32
  store i32 1, i32* %".9"
  %".11" = load i32, i32* %".9"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
  ; printf "%d" 1
  br label %".14"
.14:
  %".15" = bitcast [3 x i8]* @".str.d" to i8*
  %".16" = alloca i32
  store i32 2, i32* %".16"
  %".18" = load i32, i32* %".16"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18")
  ; printf "%d" 2
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"