; ModuleID = "tests/test10.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT a = 1
  %".9" = alloca i32, align 4
  store i32 1, i32* %".9", align 4
  ; INT b = 1
  store i32 1, i32* %".6", align 4
  ; a = 1
  store i32 1, i32* %".9", align 4
  ; b = 1
  %".16" = alloca i32, align 4
  ; INT f
  %".18" = load i32, i32* %".6", align 4
  ; f = ! a || b
  %".20" = icmp ne i32 %".18", 0
  br i1 %".20", label %".4", label %".3"
.3:
  %".22" = load i32, i32* %".9", align 4
  %".23" = icmp ne i32 %".22", 0
  br label %".4"
.4:
  %".25" = phi  i1 [%".23", %".3"], [1, %".2"]
  %".26" = icmp ne i1 %".25", 0
  %".27" = xor i1 %".26", 1
  %".28" = zext i1 %".27" to i32
  store i32 %".28", i32* %".16", align 4
  %".30" = load i32, i32* %".16", align 4
  ; printf "%d" , f
  %".32" = bitcast [3 x i8]* @".str.d" to i8*
  %".33" = alloca i32
  store i32 %".30", i32* %".33"
  %".35" = load i32, i32* %".33"
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"