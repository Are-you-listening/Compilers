; ModuleID = "tests/test4.c"
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
  br label %".9"
.9:
  %".10" = load i32, i32* %".3", align 4
  ; while a < 30
  %".12" = icmp slt i32 %".10", 30
  br i1 %".12", label %".13", label %".54"
.13:
  %".14" = load i32, i32* %".3", align 4
  ; if a % 2 == 0
  %".16" = srem i32 %".14", 2
  %".17" = icmp eq i32 %".16", 0
  br i1 %".17", label %".18", label %".25"
.18:
  %".19" = bitcast [3 x i8]* @".str.d" to i8*
  %".20" = alloca i32
  store i32 1, i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  ; printf "%d" 1
  br label %".49"
.25:
  %".26" = bitcast [3 x i8]* @".str.d" to i8*
  %".27" = alloca i32
  store i32 2, i32* %".27"
  %".29" = load i32, i32* %".27"
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".29")
  ; printf "%d" 2
  br label %".32"
.32:
  %".33" = load i32, i32* %".6", align 4
  ; while b < 5
  %".35" = icmp slt i32 %".33", 5
  br i1 %".35", label %".36", label %".48"
.36:
  %".37" = load i32, i32* %".6", align 4
  ; printf "%d" b
  %".39" = bitcast [3 x i8]* @".str.d" to i8*
  %".40" = alloca i32
  store i32 %".37", i32* %".40"
  %".42" = load i32, i32* %".40"
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".42")
  %".44" = load i32, i32* %".6", align 4
  ; b ++
  %".46" = add i32 %".44", 1
  store i32 %".46", i32* %".6", align 4
  br label %".32"
.48:
  br label %".49"
.49:
  %".50" = load i32, i32* %".3", align 4
  ; a ++
  %".52" = add i32 %".50", 1
  store i32 %".52", i32* %".3", align 4
  br label %".9"
.54:
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"