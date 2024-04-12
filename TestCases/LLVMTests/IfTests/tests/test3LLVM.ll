; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT a = 0
  %".6" = bitcast [3 x i8]* @".str.d" to i8*
  %".7" = alloca i32
  store i32 0, i32* %".7"
  %".9" = load i32, i32* %".7"
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".9")
  ; printf "%d" a
  %".12" = alloca i32, align 4
  store i32 0, i32* %".12", align 4
  ; INT c = 0
  %".15" = bitcast [3 x i8]* @".str.d" to i8*
  %".16" = alloca i32
  store i32 0, i32* %".16"
  %".18" = load i32, i32* %".16"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18")
  ; printf "%d" c
  %".21" = alloca i32, align 4
  store i32 0, i32* %".21", align 4
  ; INT q = 0
  %".24" = bitcast [3 x i8]* @".str.d" to i8*
  %".25" = alloca i32
  store i32 0, i32* %".25"
  %".27" = load i32, i32* %".25"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".27")
  ; printf "%d" q
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"