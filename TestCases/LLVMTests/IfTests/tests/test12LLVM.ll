; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>   INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT x = 5
  %".7" = load i32, i32* %".4", align 4
  ; if x < 5
  %".9" = icmp slt i32 %".7", 5
  br i1 %".9", label %".10", label %".17"
.10:
  %".11" = bitcast [3 x i8]* @".str.d" to i8*
  %".12" = alloca i32
  store i32 1, i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  ; printf "%d" 1
  br label %".17"
.17:
  %".18" = load i32, i32* %".4", align 4
  ;  if x >= 5
  %".20" = icmp sge i32 %".18", 5
  br i1 %".20", label %".21", label %".28"
.21:
  %".22" = bitcast [3 x i8]* @".str.d" to i8*
  %".23" = alloca i32
  store i32 2, i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  ; printf "%d" 2
  br label %".28"
.28:
  %".29" = load i32, i32* %".4", align 4
  ;  if x == 5 && 1
  %".31" = icmp eq i32 %".29", 5
  br i1 %".31", label %".32", label %".44"
.32:
  %".33" = load i32, i32* %".4", align 4
  ; if x != 4
  %".35" = icmp ne i32 %".33", 4
  br i1 %".35", label %".36", label %".43"
.36:
  %".37" = bitcast [3 x i8]* @".str.d" to i8*
  %".38" = alloca i32
  store i32 3, i32* %".38"
  %".40" = load i32, i32* %".38"
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  ; printf "%d" 3
  br label %".43"
.43:
  br label %".44"
.44:
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"