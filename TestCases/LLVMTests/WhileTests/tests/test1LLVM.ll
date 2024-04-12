; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT i = 0
  br label %".6"
.6:
  %".7" = load i32, i32* %".3", align 4
  ; while i != 10
  %".9" = icmp ne i32 %".7", 10
  br i1 %".9", label %".10", label %".22"
.10:
  %".11" = load i32, i32* %".3", align 4
  ; printf "%d" i
  %".13" = bitcast [3 x i8]* @".str.d" to i8*
  %".14" = alloca i32
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  %".18" = load i32, i32* %".3", align 4
  ; i ++
  %".20" = add i32 %".18", 1
  store i32 %".20", i32* %".3", align 4
  br label %".6"
.22:
  %".23" = alloca i32, align 4
  ; INT j
  store i32 0, i32* %".23", align 4
  ; for j = 0 j < 10 j ++
  br label %".27"
.27:
  %".28" = load i32, i32* %".23", align 4
  %".29" = icmp slt i32 %".28", 10
  br i1 %".29", label %".30", label %".41"
.30:
  %".31" = load i32, i32* %".23", align 4
  ; printf "%d" j
  %".33" = bitcast [3 x i8]* @".str.d" to i8*
  %".34" = alloca i32
  store i32 %".31", i32* %".34"
  %".36" = load i32, i32* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
  %".38" = load i32, i32* %".23", align 4
  %".39" = add i32 %".38", 1
  store i32 %".39", i32* %".23", align 4
  br label %".27"
.41:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"