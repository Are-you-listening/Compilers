; ModuleID = "tests/test13.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 0, i32* %".3", align 4
  ; INT a = 0
  %".6" = alloca i32, align 4
  store i32 0, i32* %".6", align 4
  ; INT b = 0
  %".9" = alloca i32, align 4
  store i32 0, i32* %".9", align 4
  ; INT c = 0
  %".12" = alloca i32, align 4
  store i32 0, i32* %".12", align 4
  ; INT d = 0
  %".15" = alloca i32, align 4
  store i32 0, i32* %".15", align 4
  ; INT e = 0
  %".18" = alloca i32, align 4
  store i32 0, i32* %".18", align 4
  ; INT f = 0
  store i32 0, i32* %".3", align 4
  ; a = 0
  store i32 0, i32* %".6", align 4
  ; b = 0
  store i32 0, i32* %".9", align 4
  ; c = 0
  store i32 0, i32* %".12", align 4
  ; d = 0
  store i32 0, i32* %".15", align 4
  ; e = 0
  store i32 1, i32* %".3", align 4
  ; a = 1
  store i32 0, i32* %".6", align 4
  ; b = 0
  %".35" = load i32, i32* %".3", align 4
  ; f = a && ! b || c
  %".37" = icmp ne i32 %".35", 0
  br i1 %".37", label %".38", label %".44"
.38:
  %".39" = load i32, i32* %".6", align 4
  %".40" = icmp ne i32 %".39", 0
  br i1 %".40", label %".44", label %".41"
.41:
  %".42" = load i32, i32* %".9", align 4
  %".43" = icmp ne i32 %".42", 0
  %".47" = xor i1 %".43", 1
  br label %".44"
.44:
  %".49" = phi  i1 [0, %".38"], [0, %".2"], [%".47", %".41"]
  %".50" = zext i1 %".49" to i32
  store i32 %".50", i32* %".18", align 4
  %".52" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".54" = bitcast [3 x i8]* @".str.d" to i8*
  %".55" = alloca i32
  store i32 %".52", i32* %".55"
  %".57" = load i32, i32* %".55"
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %".57")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"