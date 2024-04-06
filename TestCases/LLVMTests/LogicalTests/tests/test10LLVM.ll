; ModuleID = "tests/test10.c"
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
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".13" = alloca i32, align 4
  ; INT f
  %".15" = load i32, i32* %".3", align 4
  ; f = ! a || b
  %".17" = icmp ne i32 %".15", 0
  br i1 %".17", label %".21", label %".18"
.18:
  %".19" = load i32, i32* %".6", align 4
  %".20" = icmp ne i32 %".19", 0
  br label %".21"
.21:
  %".22" = phi  i1 [1, %".2"], [%".20", %".18"]
  %".23" = icmp ne i1 %".22", 0
  %".24" = xor i1 %".23", 1
  %".25" = zext i1 %".24" to i32
  store i32 %".25", i32* %".13", align 4
  %".27" = load i32, i32* %".13", align 4
  ; printf "%d" , f
  %".29" = bitcast [3 x i8]* @".str.d" to i8*
  %".30" = alloca i32
  store i32 %".27", i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"