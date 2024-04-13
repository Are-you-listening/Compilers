; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT a = 5
  %".7" = alloca i32, align 4
  store i32 9, i32* %".7", align 4
  ; INT b = 9
  %".10" = alloca i32, align 4
  store i32 6, i32* %".10", align 4
  ; INT c = 6
  store i32 5, i32* %".4", align 4
  ; a = 5
  store i32 9, i32* %".7", align 4
  ; b = 9
  store i32 6, i32* %".10", align 4
  ; c = 6
  ; INT d = ! a && ! b || c
  %".20" = load i32, i32* %".4", align 4
  %".21" = icmp ne i32 %".20", 0
  br i1 %".21", label %".22", label %".26"
.22:
  %".23" = load i32, i32* %".7", align 4
  %".24" = icmp ne i32 %".23", 0
  %".25" = xor i1 %".24", 1
  br i1 %".25", label %".29", label %".26"
.26:
  %".27" = load i32, i32* %".10", align 4
  %".28" = icmp ne i32 %".27", 0
  br label %".29"
.29:
  %".30" = phi  i1 [1, %".22"], [%".28", %".26"]
  %".31" = icmp ne i1 %".30", 0
  %".32" = xor i1 %".31", 1
  %".33" = zext i1 %".32" to i32
  %".34" = alloca i32, align 4
  store i32 %".33", i32* %".34", align 4
  %".36" = load i32, i32* %".4", align 4
  %".37" = icmp ne i32 %".36", 0
  br i1 %".37", label %".38", label %".42"
.38:
  %".39" = load i32, i32* %".7", align 4
  %".40" = icmp ne i32 %".39", 0
  %".41" = xor i1 %".40", 1
  br i1 %".41", label %".45", label %".42"
.42:
  %".43" = load i32, i32* %".10", align 4
  %".44" = icmp ne i32 %".43", 0
  br label %".45"
.45:
  %".46" = phi  i1 [1, %".38"], [%".44", %".42"]
  %".47" = icmp ne i1 %".46", 0
  %".48" = xor i1 %".47", 1
  %".49" = zext i1 %".48" to i32
  %".50" = bitcast [3 x i8]* @".str.d" to i8*
  %".51" = alloca i32
  store i32 %".49", i32* %".51"
  %".53" = load i32, i32* %".51"
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".53")
  ; printf "%d" d
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"