; ModuleID = "tests/test9.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ; INT a = 1
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT b = 1
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 1, i32* %".6", align 4
  ; b = 1
  %".13" = load i32, i32* %".3", align 4
  ; if a && b
  %".15" = icmp ne i32 %".13", 0
  br i1 %".15", label %".16", label %".19"
.16:
  %".17" = load i32, i32* %".6", align 4
  %".18" = icmp ne i32 %".17", 0
  br label %".19"
.19:
  %".20" = load i32, i32* %".3", align 4
  ; else if a || b
  %".22" = icmp ne i32 %".20", 0
  br i1 %".22", label %".26", label %".23"
.23:
  %".24" = load i32, i32* %".6", align 4
  %".25" = icmp ne i32 %".24", 0
  br label %".26"
.26:
  %".27" = phi  i1 [1, %".19"], [%".25", %".23"]
  br i1 %".27", label %".28", label %".35"
.28:
  %".29" = bitcast [3 x i8]* @".str.d" to i8*
  %".30" = alloca i32
  store i32 1, i32* %".30"
  %".32" = load i32, i32* %".30"
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  ; printf "%d" 1
  br label %".51"
.35:
  %".36" = phi  i1 [0, %".26"]
  br i1 %".36", label %".37", label %".44"
.37:
  %".38" = bitcast [3 x i8]* @".str.d" to i8*
  %".39" = alloca i32
  store i32 2, i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  ; printf "%d" 2
  br label %".51"
.44:
  %".45" = bitcast [3 x i8]* @".str.d" to i8*
  %".46" = alloca i32
  store i32 3, i32* %".46"
  %".48" = load i32, i32* %".46"
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %".48")
  ; printf "%d" 3
  br label %".51"
.51:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"