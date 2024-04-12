; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT b = 0
  %".6" = alloca i32, align 4
  store i32 0, i32* %".6", align 4
  ; INT a = 0
  br label %".9"
.9:
  %".10" = load i32, i32* %".3", align 4
  ; while b < 5
  %".12" = icmp slt i32 %".10", 5
  br i1 %".12", label %".13", label %".41"
.13:
  %".14" = bitcast [3 x i8]* @".str.d" to i8*
  %".15" = alloca i32
  store i32 1, i32* %".15"
  %".17" = load i32, i32* %".15"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  ; printf "%d" 1
  %".20" = load i32, i32* %".6", align 4
  ; if a > 5
  %".22" = icmp sgt i32 %".20", 5
  br i1 %".22", label %".23", label %".30"
.23:
  %".24" = bitcast [3 x i8]* @".str.d" to i8*
  %".25" = alloca i32
  store i32 2, i32* %".25"
  %".27" = load i32, i32* %".25"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".27")
  ; printf "%d" 2
  br label %".41"
.30:
  %".31" = bitcast [3 x i8]* @".str.d" to i8*
  %".32" = alloca i32
  store i32 3, i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  ; printf "%d" 3
  %".37" = load i32, i32* %".6", align 4
  ; a ++
  %".39" = add i32 %".37", 1
  store i32 %".39", i32* %".6", align 4
  br label %".9"
.41:
  %".42" = bitcast [3 x i8]* @".str.d" to i8*
  %".43" = alloca i32
  store i32 4, i32* %".43"
  %".45" = load i32, i32* %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".45")
  ; printf "%d" 4
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"