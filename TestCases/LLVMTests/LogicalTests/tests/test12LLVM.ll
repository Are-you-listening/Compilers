; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".7" = alloca i32, align 4
  store i32 1, i32* %".7", align 4
  ; INT a = 1
  %".10" = alloca i32, align 4
  store i32 1, i32* %".10", align 4
  ; INT b = 1
  %".13" = alloca i32, align 4
  store i32 0, i32* %".13", align 4
  ; INT c = 0
  store i32 1, i32* %".7", align 4
  ; a = 1
  store i32 1, i32* %".10", align 4
  ; b = 1
  store i32 0, i32* %".13", align 4
  ; c = 0
  %".22" = alloca i32, align 4
  ; INT f
  %".24" = load i32, i32* %".7", align 4
  ; f = a && ! b || c
  %".26" = icmp ne i32 %".24", 0
  br i1 %".26", label %".3", label %".5"
.3:
  %".28" = load i32, i32* %".10", align 4
  %".29" = icmp ne i32 %".28", 0
  br i1 %".29", label %".5", label %".4"
.4:
  %".31" = load i32, i32* %".13", align 4
  %".32" = icmp ne i32 %".31", 0
  %".33" = xor i1 %".32", 1
  br label %".5"
.5:
  %".35" = phi  i1 [%".33", %".4"], [0, %".3"], [0, %".2"]
  %".36" = zext i1 %".35" to i32
  store i32 %".36", i32* %".22", align 4
  %".38" = load i32, i32* %".22", align 4
  ; printf "%d" , f
  %".40" = bitcast [3 x i8]* @".str.d" to i8*
  %".41" = alloca i32
  store i32 %".38", i32* %".41"
  %".43" = load i32, i32* %".41"
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".43")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"