; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 -20, i32* %".3", align 4
  ; INT x = - 20
  %".6" = alloca i32, align 4
  store i32 20, i32* %".6", align 4
  ; INT a = - x
  %".9" = load i32, i32* %".3", align 4
  ; INT b = - - x
  %".11" = sub i32 0, %".9"
  %".12" = sub i32 0, %".11"
  %".13" = alloca i32, align 4
  store i32 %".12", i32* %".13", align 4
  %".15" = load i32, i32* %".3", align 4
  ; INT c = + - x
  %".17" = sub i32 0, %".15"
  %".18" = alloca i32, align 4
  store i32 %".17", i32* %".18", align 4
  %".20" = load i32, i32* %".3", align 4
  ; printf "%d" , x
  %".22" = bitcast [3 x i8]* @".str.d" to i8*
  %".23" = alloca i32
  store i32 %".20", i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  %".27" = bitcast [3 x i8]* @".str.d" to i8*
  %".28" = alloca i32
  store i32 20, i32* %".28"
  %".30" = load i32, i32* %".28"
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".30")
  ; printf "%d" , a
  %".33" = load i32, i32* %".13", align 4
  ; printf "%d" , b
  %".35" = bitcast [3 x i8]* @".str.d" to i8*
  %".36" = alloca i32
  store i32 %".33", i32* %".36"
  %".38" = load i32, i32* %".36"
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".38")
  %".40" = load i32, i32* %".18", align 4
  ; printf "%d" , c
  %".42" = bitcast [3 x i8]* @".str.d" to i8*
  %".43" = alloca i32
  store i32 %".40", i32* %".43"
  %".45" = load i32, i32* %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".45")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"