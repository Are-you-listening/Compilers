; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT a = 0
  %".10" = alloca i32, align 4
  store i32 0, i32* %".10", align 4
  ; INT b = 0
  %".13" = alloca i32, align 4
  store i32 0, i32* %".13", align 4
  ; INT c = 0
  %".16" = alloca i32, align 4
  store i32 0, i32* %".16", align 4
  ; INT d = 0
  %".19" = alloca i32, align 4
  store i32 0, i32* %".19", align 4
  ; INT e = 0
  %".22" = alloca i32, align 4
  store i32 0, i32* %".22", align 4
  ; INT f = 0
  store i32 0, i32* %".7", align 4
  ; a = 0
  store i32 0, i32* %".10", align 4
  ; b = 0
  store i32 0, i32* %".13", align 4
  ; c = 0
  store i32 0, i32* %".16", align 4
  ; d = 0
  store i32 0, i32* %".19", align 4
  ; e = 0
  store i32 1, i32* %".7", align 4
  ; a = 1
  store i32 0, i32* %".10", align 4
  ; b = 0
  %".39" = load i32, i32* %".7", align 4
  ; f = a && ! b || c
  %".41" = icmp ne i32 %".39", 0
  br i1 %".41", label %".3", label %".5"
.3:
  %".43" = load i32, i32* %".10", align 4
  %".44" = icmp ne i32 %".43", 0
  br i1 %".44", label %".5", label %".4"
.4:
  %".46" = load i32, i32* %".13", align 4
  %".47" = icmp ne i32 %".46", 0
  %".48" = xor i1 %".47", 1
  br label %".5"
.5:
  %".50" = phi  i1 [%".48", %".4"], [0, %".2"], [0, %".3"]
  %".51" = zext i1 %".50" to i32
  store i32 %".51", i32* %".22", align 4
  %".53" = load i32, i32* %".22", align 4
  ; printf "%d" , f
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i32
  store i32 %".53", i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"