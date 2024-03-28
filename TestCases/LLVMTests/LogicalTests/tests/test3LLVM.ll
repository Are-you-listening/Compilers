; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 5, i32* %".3", align 4
  ; INT a = 5
  %".6" = alloca i32, align 4
  store i32 9, i32* %".6", align 4
  ; INT b = 9
  %".9" = alloca i32, align 4
  store i32 6, i32* %".9", align 4
  ; INT c = 6
  store i32 5, i32* %".3", align 4
  ; a = 5
  store i32 9, i32* %".6", align 4
  ; b = 9
  store i32 6, i32* %".9", align 4
  ; c = 6
  %".18" = load i32, i32* %".3", align 4
  ; INT d = ! a && b || c
  %".20" = icmp ne i32 %".18", 0
  br i1 %".20", label %".21", label %".24"
.21:
  %".22" = load i32, i32* %".6", align 4
  %".23" = icmp ne i32 %".22", 0
  br i1 %".23", label %".27", label %".24"
.24:
  %".25" = load i32, i32* %".9", align 4
  %".26" = icmp ne i32 %".25", 0
  br label %".27"
.27:
  %".31" = phi  i1 [1, %".21"], [%".26", %".24"]
  %".32" = icmp ne i1 %".31", 0
  %".33" = xor i1 %".32", 1
  %".34" = zext i1 %".33" to i32
  %".35" = alloca i32, align 4
  store i32 %".34", i32* %".35", align 4
  %".37" = load i32, i32* %".3", align 4
  %".38" = icmp ne i32 %".37", 0
  br i1 %".38", label %".39", label %".42"
.39:
  %".40" = load i32, i32* %".6", align 4
  %".41" = icmp ne i32 %".40", 0
  br i1 %".41", label %".45", label %".42"
.42:
  %".43" = load i32, i32* %".9", align 4
  %".44" = icmp ne i32 %".43", 0
  br label %".45"
.45:
  %".49" = phi  i1 [%".44", %".42"], [1, %".39"]
  %".50" = icmp ne i1 %".49", 0
  %".51" = xor i1 %".50", 1
  %".52" = zext i1 %".51" to i32
  %".53" = bitcast [3 x i8]* @".str.d" to i8*
  %".54" = alloca i32
  store i32 %".52", i32* %".54"
  %".56" = load i32, i32* %".54"
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".53", i32 %".56")
  ; printf " %d " , d
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"