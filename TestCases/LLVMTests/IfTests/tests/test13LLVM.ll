; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT x = 5
  %".6" = load i32, i32* %".3", align 4
  ; if x < 5
  %".8" = icmp slt i32 %".6", 5
  br i1 %".8", label %".9", label %".16"
.9:
  %".10" = bitcast [3 x i8]* @".str.d" to i8*
  %".11" = alloca i32
  store i32 1, i32* %".11"
  %".13" = load i32, i32* %".11"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  ; printf "%d" 1
  br label %".16"
.16:
  %".17" = load i32, i32* %".3", align 4
  ; if x >= 5
  %".19" = icmp sge i32 %".17", 5
  br i1 %".19", label %".20", label %".27"
.20:
  %".21" = bitcast [3 x i8]* @".str.d" to i8*
  %".22" = alloca i32
  store i32 2, i32* %".22"
  %".24" = load i32, i32* %".22"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".24")
  ; printf "%d" 2
  br label %".34"
.27:
  %".28" = bitcast [3 x i8]* @".str.d" to i8*
  %".29" = alloca i32
  store i32 3, i32* %".29"
  %".31" = load i32, i32* %".29"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".31")
  ; printf "%d" 3
  br label %".34"
.34:
  %".35" = load i32, i32* %".3", align 4
  ; if x == 5 && 1
  %".37" = icmp eq i32 %".35", 5
  br i1 %".37", label %".38", label %".57"
.38:
  %".39" = load i32, i32* %".3", align 4
  ; if x != 4
  %".41" = icmp ne i32 %".39", 4
  br i1 %".41", label %".42", label %".49"
.42:
  %".43" = bitcast [3 x i8]* @".str.d" to i8*
  %".44" = alloca i32
  store i32 4, i32* %".44"
  %".46" = load i32, i32* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  ; printf "%d" 4
  br label %".56"
.49:
  %".50" = bitcast [3 x i8]* @".str.d" to i8*
  %".51" = alloca i32
  store i32 5, i32* %".51"
  %".53" = load i32, i32* %".51"
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".53")
  ; printf "%d" 5
  br label %".56"
.56:
  br label %".57"
.57:
  %".58" = load i32, i32* %".3", align 4
  ; if x < 5
  %".60" = icmp slt i32 %".58", 5
  br i1 %".60", label %".61", label %".62"
.61:
  br label %".63"
.62:
  br label %".63"
.63:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"