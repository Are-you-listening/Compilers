; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT a = 0
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT b = 1
  %".9" = alloca i32, align 4
  store i32 6, i32* %".9", align 4
  ; INT c = 6
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 1, i32* %".6", align 4
  ; b = 1
  store i32 6, i32* %".9", align 4
  ; c = 6
  %".18" = load i32, i32* %".3", align 4
  ; INT d = a && b || c
  %".20" = icmp ne i32 %".18", 0
  %".21" = load i32, i32* %".3", align 4
  %".22" = icmp ne i32 %".21", 0
.23:
  %".24" = load i32, i32* %".6", align 4
  %".25" = icmp ne i32 %".24", 0
.26:
  %".27" = load i32, i32* %".9", align 4
  %".28" = icmp ne i32 %".27", 0
.29:
  %".30" = phi  i1 [%".28", %".26"], [1, %".23"]
  %".31" = zext i1 %".30" to i32
  %".32" = alloca i32, align 4
  store i32 %".31", i32* %".32", align 4
  %".34" = phi  i1 [%".28", %".26"], [1, %".23"]
  %".35" = zext i1 %".34" to i32
  %".36" = bitcast [3 x i8]* @".str.d" to i8*
  %".37" = alloca i32
  store i32 %".35", i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  ; printf "%d" , d
  ret i32 0
.43:
  %".44" = load i32, i32* %".6", align 4
  %".45" = icmp ne i32 %".44", 0
.46:
  %".47" = load i32, i32* %".9", align 4
  %".48" = icmp ne i32 %".47", 0
.49:
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"