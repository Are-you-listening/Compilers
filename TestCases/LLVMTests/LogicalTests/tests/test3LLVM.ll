; ModuleID = "tests/test3.c"
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
  ; INT d = ! a && b || c
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
  %".36" = icmp ne i1 %".35", 0
  %".37" = xor i1 %".36", 1
  %".38" = zext i1 %".37" to i32
  %".39" = alloca i32, align 4
  store i32 %".38", i32* %".39", align 4
  %".41" = load i32, i32* %".10", align 4
  %".42" = icmp ne i32 %".41", 0
  br i1 %".42", label %".6", label %".7"
.6:
  %".44" = load i32, i32* %".13", align 4
  %".45" = icmp ne i32 %".44", 0
  br i1 %".45", label %".8", label %".7"
.7:
  %".47" = load i32, i32* %".16", align 4
  %".48" = icmp ne i32 %".47", 0
  br label %".8"
.8:
  %".50" = phi  i1 [1, %".6"], [%".48", %".7"]
  %".51" = icmp ne i1 %".50", 0
  %".52" = xor i1 %".51", 1
  %".53" = zext i1 %".52" to i32
  %".54" = bitcast [3 x i8]* @".str.d" to i8*
  %".55" = alloca i32
  store i32 %".53", i32* %".55"
  %".57" = load i32, i32* %".55"
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %".57")
  ; printf "%d" , d
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"