; ModuleID = "tests/test4.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ;  INT r = 5
  ;  if r
  %".8" = load i32, i32* %".4", align 4
  %".9" = icmp ne i32 %".8", 0
  br i1 %".9", label %".10", label %".45"
.10:
  %".11" = load i32, i32* %".4", align 4
  ; printf "%d" r
  %".13" = bitcast [3 x i8]* @".str.d" to i8*
  %".14" = alloca i32
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  %".18" = alloca i32, align 4
  store i32 0, i32* %".18", align 4
  ; INT a = 0
  %".21" = bitcast [3 x i8]* @".str.d" to i8*
  %".22" = alloca i32
  store i32 0, i32* %".22"
  %".24" = load i32, i32* %".22"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".24")
  ; printf "%d" a
  %".27" = alloca i32, align 4
  store i32 0, i32* %".27", align 4
  ; if 6  INT c = 0
  %".30" = bitcast [3 x i8]* @".str.d" to i8*
  %".31" = alloca i32
  store i32 0, i32* %".31"
  %".33" = load i32, i32* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  ; printf "%d" c
  %".36" = alloca i32, align 4
  store i32 0, i32* %".36", align 4
  ;  INT q = 0
  %".39" = bitcast [3 x i8]* @".str.d" to i8*
  %".40" = alloca i32
  store i32 0, i32* %".40"
  %".42" = load i32, i32* %".40"
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".42")
  ; printf "%d" q
  br label %".45"
.45:
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"