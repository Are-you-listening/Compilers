; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".10" = alloca i32, align 4
  store i32 0, i32* %".10", align 4
  ; INT a = 0
  %".13" = alloca i32, align 4
  store i32 1, i32* %".13", align 4
  ; INT b = 1
  %".16" = alloca i32, align 4
  store i32 6, i32* %".16", align 4
  ; INT c = 6
  store i32 0, i32* %".10", align 4
  ; a = 0
  store i32 1, i32* %".13", align 4
  ; b = 1
  store i32 6, i32* %".16", align 4
  ; c = 6
  %".25" = load i32, i32* %".10", align 4
  ; INT d = a && b || c
  %".27" = icmp ne i32 %".25", 0
  br i1 %".27", label %".3", label %".4"
.3:
  %".29" = load i32, i32* %".13", align 4
  %".30" = icmp ne i32 %".29", 0
  br i1 %".30", label %".5", label %".4"
.4:
  %".32" = load i32, i32* %".16", align 4
  %".33" = icmp ne i32 %".32", 0
  br label %".5"
.5:
  %".35" = phi  i1 [1, %".3"], [%".33", %".4"]
  %".36" = zext i1 %".35" to i32
  %".37" = alloca i32, align 4
  store i32 %".36", i32* %".37", align 4
  %".39" = load i32, i32* %".10", align 4
  %".40" = icmp ne i32 %".39", 0
  br i1 %".40", label %".6", label %".7"
.6:
  %".42" = load i32, i32* %".13", align 4
  %".43" = icmp ne i32 %".42", 0
  br i1 %".43", label %".8", label %".7"
.7:
  %".45" = load i32, i32* %".16", align 4
  %".46" = icmp ne i32 %".45", 0
  br label %".8"
.8:
  %".48" = phi  i1 [%".46", %".7"], [1, %".6"]
  %".49" = zext i1 %".48" to i32
  %".50" = bitcast [3 x i8]* @".str.d" to i8*
  %".51" = alloca i32
  store i32 %".49", i32* %".51"
  %".53" = load i32, i32* %".51"
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".53")
  ; printf "%d" , d
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"