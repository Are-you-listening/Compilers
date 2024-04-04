; ModuleID = "tests/test11.c"
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
  ; f = a || ! b
  %".20" = icmp ne i32 %".18", 0
  br i1 %".20", label %".4", label %".3"
.3:
  %".22" = load i32, i32* %".9", align 4
  %".23" = icmp ne i32 %".22", 0
  %".24" = xor i1 %".23", 1
  br label %".4"
.4:
  %".26" = phi  i1 [1, %".2"], [%".24", %".3"]
  %".27" = zext i1 %".26" to i32
  store i32 %".27", i32* %".16", align 4
  %".29" = load i32, i32* %".16", align 4
  ; printf "%d" , f
  %".31" = bitcast [3 x i8]* @".str.d" to i8*
  %".32" = alloca i32
  store i32 %".29", i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"