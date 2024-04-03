; ModuleID = "tests/test2.c"
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
  ; INT d = a && b || c
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
  %".31" = phi  i1 [%".26", %".24"], [1, %".21"]
  %".32" = zext i1 %".31" to i32
  %".33" = alloca i32, align 4
  store i32 %".32", i32* %".33", align 4
  %".35" = load i32, i32* %".3", align 4
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".37", label %".40"
.37:
  %".38" = load i32, i32* %".6", align 4
  %".39" = icmp ne i32 %".38", 0
  br i1 %".39", label %".43", label %".40"
.40:
  %".41" = load i32, i32* %".9", align 4
  %".42" = icmp ne i32 %".41", 0
  br label %".43"
.43:
  %".47" = phi  i1 [1, %".37"], [%".42", %".40"]
  %".48" = zext i1 %".47" to i32
  %".49" = bitcast [3 x i8]* @".str.d" to i8*
  %".50" = alloca i32
  store i32 %".48", i32* %".50"
  %".52" = load i32, i32* %".50"
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".52")
  ; printf " %d " , d
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"