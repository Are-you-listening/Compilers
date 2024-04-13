; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 21, i32* %".3", align 4
  ; INT radius = 21
  %".6" = alloca i32, align 4
  store i32 5, i32* %".6", align 4
  ; INT side = 5
  %".9" = alloca i32, align 4
  ; INT area
  %".11" = alloca i32, align 4
  store i32 1, i32* %".11", align 4
  ; bool success = True
  ;  Using macros to calculate areas by
  ;  passing argument
  store i32 3, i32* %".9", align 4
  ; area = CIRCLE_AREA
  %".18" = load i32, i32* %".3", align 4
  ; printf "Area of Circle of radius %d: %d \n" radius
  %".20" = load i32, i32* %".9", align 4
  ; area
  %".22" = bitcast [35 x i8]* @".str.d" to i8*
  %".23" = alloca i32
  %".24" = alloca i32
  store i32 %".18", i32* %".23"
  store i32 %".20", i32* %".24"
  %".27" = load i32, i32* %".23"
  %".28" = load i32, i32* %".24"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".27", i32 %".28")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

@"CIRCLE_AREA" = dso_local global float 0x40091eb860000000, align 4
@"True" = dso_local global i32 1, align 4
@"False" = dso_local global i32 0, align 4
declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [35 x i8] c"Area of Circle of radius %d: %d \5cn\00"