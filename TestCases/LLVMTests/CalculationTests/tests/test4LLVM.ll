; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 4, i32* %".3", align 4
  ; INT x = 4
  store i32 1, i32* %".3", align 4
  ; x = 1
  %".8" = alloca i32*, align 8
  store i32* %".3", i32** %".8", align 8
  ; INT * ptr = & x
  %".11" = icmp eq i32* %".3", %".3"
  ; INT is_x = ptr == & x
  %".13" = zext i1 %".11" to i32
  %".14" = alloca i32, align 4
  store i32 %".13", i32* %".14", align 4
  %".16" = icmp eq i32* %".3", %".3"
  %".17" = zext i1 %".16" to i32
  %".18" = bitcast [3 x i8]* @".str.d" to i8*
  %".19" = alloca i32
  store i32 %".17", i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  ; printf "%d" , is_x
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"