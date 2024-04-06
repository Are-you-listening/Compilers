; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT a = 5
  %".6" = alloca i32, align 4
  store i32 9, i32* %".6", align 4
  ; INT b = 9
  %".9" = alloca i32, align 4
  store i32 6, i32* %".9", align 4
  ; INT c = 6
  store i32 5, i32* %".3", align 4
  ; a = 5
  store i32 9, i32* %".6", align 4
  ; b = 9
  store i32 6, i32* %".9", align 4
  ; c = 6
  %".18" = load i32, i32* %".3", align 4
  ; INT d = ! a && b || c
  %".20" = icmp ne i32 %".18", 0
  br i1 %".20", label %".21", label %".24"
.21:
  %".22" = load i32, i32* %".6", align 4
  %".23" = icmp ne i32 %".22", 0
  br i1 %".23", label %".27", label %".24"
.24:
  %".25" = load i32, i32* %".9", align 4
  %".26" = icmp ne i32 %".25", 0
  br label %".27"
.27:
  %".28" = phi  i1 [%".26", %".24"], [1, %".21"]
  %".29" = icmp ne i1 %".28", 0
  %".30" = xor i1 %".29", 1
  %".31" = zext i1 %".30" to i32
  %".32" = alloca i32, align 4
  store i32 %".31", i32* %".32", align 4
  %".34" = load i32, i32* %".3", align 4
  %".35" = icmp ne i32 %".34", 0
  br i1 %".35", label %".36", label %".39"
.36:
  %".37" = load i32, i32* %".6", align 4
  %".38" = icmp ne i32 %".37", 0
  br i1 %".38", label %".42", label %".39"
.39:
  %".40" = load i32, i32* %".9", align 4
  %".41" = icmp ne i32 %".40", 0
  br label %".42"
.42:
  %".43" = phi  i1 [%".41", %".39"], [1, %".36"]
  %".44" = icmp ne i1 %".43", 0
  %".45" = xor i1 %".44", 1
  %".46" = zext i1 %".45" to i32
  %".47" = bitcast [3 x i8]* @".str.d" to i8*
  %".48" = alloca i32
  store i32 %".46", i32* %".48"
  %".50" = load i32, i32* %".48"
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".50")
  ; printf "%d" , d
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"