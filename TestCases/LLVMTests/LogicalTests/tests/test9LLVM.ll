; ModuleID = "tests/test9.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ; INT a = 1
  store i32 1, i32* %".3", align 4
  ; a = 1
  %".8" = alloca i32, align 4
  ; INT f
  %".10" = load i32, i32* %".3", align 4
  ; f = ! a
  %".12" = icmp ne i32 %".10", 0
  %".13" = xor i1 %".12", 1
  %".14" = zext i1 %".13" to i32
  store i32 %".14", i32* %".8", align 4
  %".16" = load i32, i32* %".8", align 4
  ; printf "%d" f
  %".18" = bitcast [3 x i8]* @".str.d" to i8*
  %".19" = alloca i32
  store i32 %".16", i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"