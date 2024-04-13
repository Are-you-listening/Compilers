; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 15, i32* %".4", align 4
  ;  INT a = 6 + 9
  %".7" = load i32, i32* %".4", align 4
  ;  if a < 1000
  %".9" = icmp slt i32 %".7", 1000
  br i1 %".9", label %".10", label %".20"
.10:
  %".11" = load i32, i32* %".4", align 4
  ; printf "%d" a
  %".13" = bitcast [3 x i8]* @".str.d" to i8*
  %".14" = alloca i32
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  store i32 6, i32* %".4", align 4
  ; a = 6
  br label %".30"
.20:
  %".21" = load i32, i32* %".4", align 4
  ; else printf "%d" a
  %".23" = bitcast [3 x i8]* @".str.d" to i8*
  %".24" = alloca i32
  store i32 %".21", i32* %".24"
  %".26" = load i32, i32* %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
  store i32 8, i32* %".4", align 4
  ; a = 8
  br label %".30"
.30:
  %".31" = load i32, i32* %".4", align 4
  ;   printf "%d" a
  %".33" = bitcast [3 x i8]* @".str.d" to i8*
  %".34" = alloca i32
  store i32 %".31", i32* %".34"
  %".36" = load i32, i32* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"