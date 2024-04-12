; ModuleID = "tests/test14.c"
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
  br i1 %".8", label %".9", label %".10"
.9:
  br label %".10"
.10:
  %".11" = load i32, i32* %".3", align 4
  ; if x >= 5
  %".13" = icmp sge i32 %".11", 5
  br i1 %".13", label %".14", label %".15"
.14:
  br label %".16"
.15:
  br label %".16"
.16:
  %".17" = load i32, i32* %".3", align 4
  ; if x == 5 && 1
  %".19" = icmp eq i32 %".17", 5
  br i1 %".19", label %".20", label %".26"
.20:
  %".21" = load i32, i32* %".3", align 4
  ; if x != 4
  %".23" = icmp ne i32 %".21", 4
  br i1 %".23", label %".24", label %".25"
.24:
  br label %".25"
.25:
  br label %".26"
.26:
  %".27" = load i32, i32* %".3", align 4
  ; if x ++
  %".29" = add i32 %".27", 1
  store i32 %".29", i32* %".3", align 4
  %".31" = icmp ne i32 %".27", 0
  br i1 %".31", label %".32", label %".33"
.32:
  br label %".34"
.33:
  br label %".34"
.34:
  %".35" = load i32, i32* %".3", align 4
  ; printf "%d" x
  %".37" = bitcast [3 x i8]* @".str.d" to i8*
  %".38" = alloca i32
  store i32 %".35", i32* %".38"
  %".40" = load i32, i32* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"