; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  INT a = 0
  br label %".7"
.7:
  ;  while a < 30
  %".9" = load i32, i32* %".4", align 4
  %".10" = icmp slt i32 %".9", 30
  br i1 %".10", label %".11", label %".35"
.11:
  %".12" = load i32, i32* %".4", align 4
  ; if a % 2 == 0
  %".14" = srem i32 %".12", 2
  %".15" = icmp eq i32 %".14", 0
  br i1 %".15", label %".16", label %".23"
.16:
  %".17" = bitcast [3 x i8]* @".str.d" to i8*
  %".18" = alloca i32
  store i32 1, i32* %".18"
  %".20" = load i32, i32* %".18"
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".20")
  ; printf "%d" 1
  br label %".30"
.23:
  %".24" = bitcast [3 x i8]* @".str.d" to i8*
  %".25" = alloca i32
  store i32 2, i32* %".25"
  %".27" = load i32, i32* %".25"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".27")
  ; else printf "%d" 2
  br label %".30"
.30:
  %".31" = load i32, i32* %".4", align 4
  ;  a ++
  %".33" = add i32 %".31", 1
  store i32 %".33", i32* %".4", align 4
  br label %".7"
.35:
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"