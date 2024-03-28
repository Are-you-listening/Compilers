; ModuleID = "tests/test4.c"
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
  ; INT d = ! a && ! b || c
  %".20" = icmp ne i32 %".18", 0
  br i1 %".20", label %".21", label %".25"
.21:
  %".22" = load i32, i32* %".6", align 4
  %".23" = icmp ne i32 %".22", 0
  %".24" = xor i1 %".23", 1
  br i1 %".24", label %".28", label %".25"
.25:
  %".26" = load i32, i32* %".9", align 4
  %".27" = icmp ne i32 %".26", 0
  br label %".28"
.28:
  %".32" = phi  i1 [1, %".21"], [%".27", %".25"]
  %".33" = icmp ne i1 %".32", 0
  %".34" = xor i1 %".33", 1
  %".35" = zext i1 %".34" to i32
  %".36" = alloca i32, align 4
  store i32 %".35", i32* %".36", align 4
  %".38" = load i32, i32* %".3", align 4
  %".39" = icmp ne i32 %".38", 0
  br i1 %".39", label %".40", label %".44"
.40:
  %".41" = load i32, i32* %".6", align 4
  %".42" = icmp ne i32 %".41", 0
  %".43" = xor i1 %".42", 1
  br i1 %".43", label %".47", label %".44"
.44:
  %".45" = load i32, i32* %".9", align 4
  %".46" = icmp ne i32 %".45", 0
  br label %".47"
.47:
  %".51" = phi  i1 [%".46", %".44"], [1, %".40"]
  %".52" = icmp ne i1 %".51", 0
  %".53" = xor i1 %".52", 1
  %".54" = zext i1 %".53" to i32
  %".55" = bitcast [3 x i8]* @".str.d" to i8*
  %".56" = alloca i32
  store i32 %".54", i32* %".56"
  %".58" = load i32, i32* %".56"
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %".58")
  ; printf " %d " , d
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"