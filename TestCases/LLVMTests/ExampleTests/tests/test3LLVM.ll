; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 -20, i32* %".4", align 4
  ;  INT x = - 20
  %".7" = alloca i32, align 4
  store i32 20, i32* %".7", align 4
  ; INT a = - x
  %".10" = load i32, i32* %".4", align 4
  ; INT b = - - x
  %".12" = sub i32 0, %".10"
  %".13" = sub i32 0, %".12"
  %".14" = alloca i32, align 4
  store i32 %".13", i32* %".14", align 4
  %".16" = load i32, i32* %".4", align 4
  ; INT c = + - x
  %".18" = sub i32 0, %".16"
  %".19" = alloca i32, align 4
  store i32 %".18", i32* %".19", align 4
  %".21" = load i32, i32* %".4", align 4
  ;  printf "%d" x
  %".23" = bitcast [3 x i8]* @".str.d" to i8*
  %".24" = alloca i32
  store i32 %".21", i32* %".24"
  %".26" = load i32, i32* %".24"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
  %".28" = bitcast [3 x i8]* @".str.d" to i8*
  %".29" = alloca i32
  store i32 20, i32* %".29"
  %".31" = load i32, i32* %".29"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".31")
  ; printf "%d" a
  %".34" = load i32, i32* %".14", align 4
  ; printf "%d" b
  %".36" = bitcast [3 x i8]* @".str.d" to i8*
  %".37" = alloca i32
  store i32 %".34", i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  %".41" = load i32, i32* %".19", align 4
  ; printf "%d" c
  %".43" = bitcast [3 x i8]* @".str.d" to i8*
  %".44" = alloca i32
  store i32 %".41", i32* %".44"
  %".46" = load i32, i32* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"