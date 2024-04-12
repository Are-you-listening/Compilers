; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT r = 5
  %".6" = load i32, i32* %".3", align 4
  ; if r
  %".8" = icmp ne i32 %".6", 0
  br i1 %".8", label %".9", label %".44"
.9:
  %".10" = load i32, i32* %".3", align 4
  ; printf "%d" r
  %".12" = bitcast [3 x i8]* @".str.d" to i8*
  %".13" = alloca i32
  store i32 %".10", i32* %".13"
  %".15" = load i32, i32* %".13"
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".15")
  %".17" = alloca i32, align 4
  store i32 0, i32* %".17", align 4
  ; INT a = 0
  %".20" = bitcast [3 x i8]* @".str.d" to i8*
  %".21" = alloca i32
  store i32 0, i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  ; printf "%d" a
  %".26" = alloca i32, align 4
  store i32 0, i32* %".26", align 4
  ; INT c = 0
  %".29" = bitcast [3 x i8]* @".str.d" to i8*
  %".30" = alloca i32
  store i32 0, i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  ; printf "%d" c
  %".35" = alloca i32, align 4
  store i32 0, i32* %".35", align 4
  ; INT q = 0
  %".38" = bitcast [3 x i8]* @".str.d" to i8*
  %".39" = alloca i32
  store i32 0, i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  ; printf "%d" q
  br label %".44"
.44:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"