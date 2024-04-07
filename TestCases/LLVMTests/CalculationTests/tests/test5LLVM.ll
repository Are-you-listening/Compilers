; ModuleID = "tests/test5.c"
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
  %".11" = load i32*, i32** %".8", align 8
  ; ptr ++
  %".13" = getelementptr inbounds i32, i32* %".11", i64 1
  store i32* %".13", i32** %".8", align 8
  %".15" = load i32*, i32** %".8", align 8
  ; ptr --
  %".17" = sub i64 0, 1
  %".18" = getelementptr inbounds i32, i32* %".15", i64 %".17"
  store i32* %".18", i32** %".8", align 8
  %".20" = load i32*, i32** %".8", align 8
  ; INT is_x = ptr == & x
  %".22" = icmp eq i32* %".20", %".3"
  %".23" = zext i1 %".22" to i32
  %".24" = alloca i32, align 4
  store i32 %".23", i32* %".24", align 4
  %".26" = load i32*, i32** %".8", align 8
  %".27" = icmp eq i32* %".26", %".3"
  %".28" = zext i1 %".27" to i32
  %".29" = bitcast [3 x i8]* @".str.d" to i8*
  %".30" = alloca i32
  store i32 %".28", i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  ; printf "%d" is_x
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"