; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ; INT a = 1
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT b = 1
  %".9" = alloca i32, align 4
  store i32 0, i32* %".9", align 4
  ; INT c = 0
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 0, i32* %".9", align 4
  ; c = 0
  %".18" = alloca i32, align 4
  ; INT f
  %".20" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".22" = icmp ne i32 %".20", 0
  br i1 %".22", label %".23", label %".30"
.23:
  %".24" = load i32, i32* %".6", align 4
  %".25" = icmp ne i32 %".24", 0
  br i1 %".25", label %".30", label %".26"
.26:
  %".27" = load i32, i32* %".9", align 4
  %".28" = icmp ne i32 %".27", 0
  %".29" = xor i1 %".28", 1
  br label %".30"
.30:
  %".31" = phi  i1 [0, %".23"], [%".29", %".26"], [0, %".2"]
  %".32" = zext i1 %".31" to i32
  store i32 %".32", i32* %".18", align 4
  %".34" = load i32, i32* %".18", align 4
  ; printf "%d" , f
  %".36" = bitcast [3 x i8]* @".str.d" to i8*
  %".37" = alloca i32
  store i32 %".34", i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"