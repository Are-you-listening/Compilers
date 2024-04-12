; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ; INT a = 1
  store i32 3, i32* %".3", align 4
  ; a = 3
  %".8" = load i32, i32* %".3", align 4
  ; if a
  %".10" = icmp ne i32 %".8", 0
  br i1 %".10", label %".11", label %".18"
.11:
  %".12" = bitcast [3 x i8]* @".str.d" to i8*
  %".13" = alloca i32
  store i32 1, i32* %".13"
  %".15" = load i32, i32* %".13"
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".15")
  ; printf "%d" 1
  br label %".25"
.18:
  %".19" = bitcast [3 x i8]* @".str.d" to i8*
  %".20" = alloca i32
  store i32 2, i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  ; printf "%d" 2
  br label %".25"
.25:
  store i32 0, i32* %".3", align 4
  ; a = 0
  %".28" = load i32, i32* %".3", align 4
  ; if a
  %".30" = icmp ne i32 %".28", 0
  br i1 %".30", label %".31", label %".38"
.31:
  %".32" = bitcast [3 x i8]* @".str.d" to i8*
  %".33" = alloca i32
  store i32 1, i32* %".33"
  %".35" = load i32, i32* %".33"
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  ; printf "%d" 1
  br label %".45"
.38:
  %".39" = bitcast [3 x i8]* @".str.d" to i8*
  %".40" = alloca i32
  store i32 2, i32* %".40"
  %".42" = load i32, i32* %".40"
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".42")
  ; printf "%d" 2
  br label %".45"
.45:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"