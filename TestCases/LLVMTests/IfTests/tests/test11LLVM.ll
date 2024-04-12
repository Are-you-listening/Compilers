; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 15, i32* %".3", align 4
  ; INT a = 6 + 9
  %".6" = load i32, i32* %".3", align 4
  ; if a < 1000
  %".8" = icmp slt i32 %".6", 1000
  br i1 %".8", label %".9", label %".19"
.9:
  %".10" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".12" = bitcast [3 x i8]* @".str.d" to i8*
  %".13" = alloca i32
  store i32 %".10", i32* %".13"
  %".15" = load i32, i32* %".13"
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".15")
  store i32 6, i32* %".3", align 4
  ; a = 6
  br label %".29"
.19:
  %".20" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".22" = bitcast [3 x i8]* @".str.d" to i8*
  %".23" = alloca i32
  store i32 %".20", i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  store i32 8, i32* %".3", align 4
  ; a = 8
  br label %".29"
.29:
  %".30" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".32" = bitcast [3 x i8]* @".str.d" to i8*
  %".33" = alloca i32
  store i32 %".30", i32* %".33"
  %".35" = load i32, i32* %".33"
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"