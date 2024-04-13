; ModuleID = "tests/test9.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ;  INT a = 1
  %".7" = alloca i32, align 4
  store i32 1, i32* %".7", align 4
  ; INT b = 1
  store i32 1, i32* %".4", align 4
  ;  a = 1
  store i32 1, i32* %".7", align 4
  ; b = 1
  ;  if a && b
  %".15" = load i32, i32* %".4", align 4
  %".16" = icmp ne i32 %".15", 0
  br i1 %".16", label %".17", label %".20"
.17:
  %".18" = load i32, i32* %".7", align 4
  %".19" = icmp ne i32 %".18", 0
  br label %".20"
.20:
  ; printf "%d" 1 else if a || b
  %".22" = load i32, i32* %".4", align 4
  %".23" = icmp ne i32 %".22", 0
  br i1 %".23", label %".27", label %".24"
.24:
  %".25" = load i32, i32* %".7", align 4
  %".26" = icmp ne i32 %".25", 0
  br label %".27"
.27:
  %".28" = phi  i1 [1, %".20"], [%".26", %".24"]
  br i1 %".28", label %".29", label %".35"
.29:
  %".30" = bitcast [3 x i8]* @".str.d" to i8*
  %".31" = alloca i32
  store i32 1, i32* %".31"
  %".33" = load i32, i32* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  br label %".51"
.35:
  %".36" = phi  i1 [0, %".27"]
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
  ; else printf "%d" 3
  br label %".51"
.51:
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"