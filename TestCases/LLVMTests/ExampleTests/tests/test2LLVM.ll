; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 50, i32* %".4", align 4
  ;  INT x = 50
  %".7" = alloca i32, align 4
  store i32 -22, i32* %".7", align 4
  ; INT y = - 22
  %".10" = bitcast [3 x i8]* @".str.d" to i8*
  %".11" = alloca i32
  store i32 0, i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  ;  printf "%d" x == y
  %".16" = load i32, i32* %".4", align 4
  ; printf "%d" x != y
  %".18" = load i32, i32* %".7", align 4
  %".19" = icmp ne i32 %".16", %".18"
  %".20" = bitcast [3 x i8]* @".str.d" to i8*
  %".21" = alloca i1
  store i1 %".19", i1* %".21"
  %".23" = load i1, i1* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i1 %".23")
  %".25" = load i32, i32* %".4", align 4
  ; printf "%d" x > y
  %".27" = load i32, i32* %".7", align 4
  %".28" = icmp sgt i32 %".25", %".27"
  %".29" = bitcast [3 x i8]* @".str.d" to i8*
  %".30" = alloca i1
  store i1 %".28", i1* %".30"
  %".32" = load i1, i1* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i1 %".32")
  %".34" = load i32, i32* %".4", align 4
  ; printf "%d" x >= y
  %".36" = load i32, i32* %".7", align 4
  %".37" = icmp sge i32 %".34", %".36"
  %".38" = bitcast [3 x i8]* @".str.d" to i8*
  %".39" = alloca i1
  store i1 %".37", i1* %".39"
  %".41" = load i1, i1* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i1 %".41")
  %".43" = load i32, i32* %".4", align 4
  ; printf "%d" x <= y
  %".45" = load i32, i32* %".7", align 4
  %".46" = icmp sle i32 %".43", %".45"
  %".47" = bitcast [3 x i8]* @".str.d" to i8*
  %".48" = alloca i1
  store i1 %".46", i1* %".48"
  %".50" = load i1, i1* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i1 %".50")
  %".52" = load i32, i32* %".4", align 4
  ; printf "%d" x < y
  %".54" = load i32, i32* %".7", align 4
  %".55" = icmp slt i32 %".52", %".54"
  %".56" = bitcast [3 x i8]* @".str.d" to i8*
  %".57" = alloca i1
  store i1 %".55", i1* %".57"
  %".59" = load i1, i1* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i1 %".59")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"