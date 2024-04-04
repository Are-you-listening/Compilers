; ModuleID = "tests/test2.c"
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
  ; INT d = a && b || c
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
  %".29" = zext i1 %".28" to i32
  %".30" = alloca i32, align 4
  store i32 %".29", i32* %".30", align 4
  %".32" = load i32, i32* %".3", align 4
  %".33" = icmp ne i32 %".32", 0
  br i1 %".33", label %".34", label %".37"
.34:
  %".35" = load i32, i32* %".6", align 4
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".40", label %".37"
.37:
  %".38" = load i32, i32* %".9", align 4
  %".39" = icmp ne i32 %".38", 0
  br label %".40"
.40:
  %".41" = phi  i1 [1, %".34"], [%".39", %".37"]
  %".42" = zext i1 %".41" to i32
  %".43" = bitcast [3 x i8]* @".str.d" to i8*
  %".44" = alloca i32
  store i32 %".42", i32* %".44"
  %".46" = load i32, i32* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  ; printf "%d" , d
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"