; ModuleID = "tests/test5.c"
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
  %".12" = load i32*, i32** %".9", align 8
  ; ptr ++
  %".14" = getelementptr inbounds i32, i32* %".12", i64 1
  store i32* %".14", i32** %".9", align 8
  %".16" = load i32*, i32** %".9", align 8
  ; ptr --
  %".18" = sub i64 0, 1
  %".19" = getelementptr inbounds i32, i32* %".16", i64 %".18"
  store i32* %".19", i32** %".9", align 8
  %".21" = load i32*, i32** %".9", align 8
  ; INT is_x = ptr == & x
  %".23" = icmp eq i32* %".21", %".4"
  %".24" = zext i1 %".23" to i32
  %".25" = alloca i32, align 4
  store i32 %".24", i32* %".25", align 4
  %".27" = load i32*, i32** %".9", align 8
  %".28" = icmp eq i32* %".27", %".4"
  %".29" = zext i1 %".28" to i32
  %".30" = bitcast [3 x i8]* @".str.d" to i8*
  %".31" = alloca i32
  store i32 %".29", i32* %".31"
  %".33" = load i32, i32* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  ; printf "%d" , is_x
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"