; ModuleID = "tests/test5.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ; INT a = 1
  store i32 3, i32* %".3", align 4
  ; a = 3
  %".8" = load i32, i32* %".3", align 4
  ; if a
  %".10" = icmp ne i32 %".8", 0
  br i1 %".10", label %".11", label %".19"
.11:
  %".12" = load i32, i32* %".3", align 4
  ; printf "%d" a
  %".14" = bitcast [3 x i8]* @".str.d" to i8*
  %".15" = alloca i32
  store i32 %".12", i32* %".15"
  %".17" = load i32, i32* %".15"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  br label %".19"
.19:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"