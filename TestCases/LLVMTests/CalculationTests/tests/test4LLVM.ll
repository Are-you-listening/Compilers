; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".4" = alloca i32, align 4
  store i32 4, i32* %".4", align 4
  ; INT x = 4
  store i32 1, i32* %".4", align 4
  ; x = 1
  %".9" = alloca i32*, align 8
  store i32* %".4", i32** %".9", align 8
  ; INT * ptr = & x
  %".12" = icmp eq i32* %".4", %".4"
  ; INT is_x = ptr == & x
  %".14" = zext i1 %".12" to i32
  %".15" = alloca i32, align 4
  store i32 %".14", i32* %".15", align 4
  %".17" = icmp eq i32* %".4", %".4"
  %".18" = zext i1 %".17" to i32
  %".19" = bitcast [3 x i8]* @".str.d" to i8*
  %".20" = alloca i32
  store i32 %".18", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  ; printf "%d" , is_x
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"