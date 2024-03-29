; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 50, i32* %".3", align 4
  ; INT x = 50
  %".6" = alloca i32, align 4
  store i32 -22, i32* %".6", align 4
  ; INT y = - 22
  %".9" = bitcast [3 x i8]* @".str.d" to i8*
  %".10" = alloca i32
  store i32 0, i32* %".10"
  %".12" = load i32, i32* %".10"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".12")
  ; printf " %d " , x == y
  %".15" = load i32, i32* %".3", align 4
  ; printf " %d " , x != y
  %".17" = load i32, i32* %".6", align 4
  %".18" = icmp ne i32 %".15", %".17"
  %".19" = bitcast [3 x i8]* @".str.d" to i8*
  %".20" = alloca i1
  store i1 %".18", i1* %".20"
  %".22" = load i1, i1* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i1 %".22")
  %".24" = load i32, i32* %".3", align 4
  ; printf " %d " , x > y
  %".26" = load i32, i32* %".6", align 4
  %".27" = icmp sgt i32 %".24", %".26"
  %".28" = bitcast [3 x i8]* @".str.d" to i8*
  %".29" = alloca i1
  store i1 %".27", i1* %".29"
  %".31" = load i1, i1* %".29"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i1 %".31")
  %".33" = load i32, i32* %".3", align 4
  ; printf " %d " , x >= y
  %".35" = load i32, i32* %".6", align 4
  %".36" = icmp sge i32 %".33", %".35"
  %".37" = bitcast [3 x i8]* @".str.d" to i8*
  %".38" = alloca i1
  store i1 %".36", i1* %".38"
  %".40" = load i1, i1* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i1 %".40")
  %".42" = load i32, i32* %".3", align 4
  ; printf " %d " , x <= y
  %".44" = load i32, i32* %".6", align 4
  %".45" = icmp sle i32 %".42", %".44"
  %".46" = bitcast [3 x i8]* @".str.d" to i8*
  %".47" = alloca i1
  store i1 %".45", i1* %".47"
  %".49" = load i1, i1* %".47"
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".46", i1 %".49")
  %".51" = load i32, i32* %".3", align 4
  ; printf " %d " , x < y
  %".53" = load i32, i32* %".6", align 4
  %".54" = icmp slt i32 %".51", %".53"
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i1
  store i1 %".54", i1* %".56"
  %".58" = load i1, i1* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i1 %".58")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"