; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".10" = alloca i32, align 4
  store i32 5, i32* %".10", align 4
  ; INT a = 5
  %".13" = alloca i32, align 4
  store i32 9, i32* %".13", align 4
  ; INT b = 9
  %".16" = alloca i32, align 4
  store i32 6, i32* %".16", align 4
  ; INT c = 6
  store i32 5, i32* %".10", align 4
  ; a = 5
  store i32 9, i32* %".13", align 4
  ; b = 9
  store i32 6, i32* %".16", align 4
  ; c = 6
  %".25" = load i32, i32* %".10", align 4
  ; INT d = ! a && ! b || c
  %".27" = icmp ne i32 %".25", 0
  br i1 %".27", label %".3", label %".4"
.3:
  %".29" = load i32, i32* %".13", align 4
  %".30" = icmp ne i32 %".29", 0
  %".31" = xor i1 %".30", 1
  br i1 %".31", label %".5", label %".4"
.4:
  %".33" = load i32, i32* %".16", align 4
  %".34" = icmp ne i32 %".33", 0
  br label %".5"
.5:
  %".36" = phi  i1 [%".34", %".4"], [1, %".3"]
  %".37" = icmp ne i1 %".36", 0
  %".38" = xor i1 %".37", 1
  %".39" = zext i1 %".38" to i32
  %".40" = alloca i32, align 4
  store i32 %".39", i32* %".40", align 4
  %".42" = load i32, i32* %".10", align 4
  %".43" = icmp ne i32 %".42", 0
  br i1 %".43", label %".6", label %".7"
.6:
  %".45" = load i32, i32* %".13", align 4
  %".46" = icmp ne i32 %".45", 0
  %".47" = xor i1 %".46", 1
  br i1 %".47", label %".8", label %".7"
.7:
  %".49" = load i32, i32* %".16", align 4
  %".50" = icmp ne i32 %".49", 0
  br label %".8"
.8:
  %".52" = phi  i1 [%".50", %".7"], [1, %".6"]
  %".53" = icmp ne i1 %".52", 0
  %".54" = xor i1 %".53", 1
  %".55" = zext i1 %".54" to i32
  %".56" = bitcast [3 x i8]* @".str.d" to i8*
  %".57" = alloca i32
  store i32 %".55", i32* %".57"
  %".59" = load i32, i32* %".57"
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %".59")
  ; printf "%d" , d
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"