; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; INT main
  %".10" = alloca i32, align 4
  store i32 0, i32* %".10", align 4
  ; INT a = 0
  %".13" = alloca i32, align 4
  store i32 0, i32* %".13", align 4
  ; INT b = 0
  %".16" = alloca i32, align 4
  store i32 0, i32* %".16", align 4
  ; INT c = 0
  %".19" = alloca i32, align 4
  store i32 0, i32* %".19", align 4
  ; INT d = 0
  %".22" = alloca i32, align 4
  store i32 0, i32* %".22", align 4
  ; INT e = 0
  %".25" = alloca i32, align 4
  store i32 0, i32* %".25", align 4
  ; INT f = 0
  store i32 0, i32* %".10", align 4
  ; a = 0
  store i32 0, i32* %".13", align 4
  ; b = 0
  store i32 0, i32* %".16", align 4
  ; c = 0
  store i32 0, i32* %".19", align 4
  ; d = 0
  store i32 0, i32* %".22", align 4
  ; e = 0
  store i32 1, i32* %".10", align 4
  ; a = 1
  store i32 1, i32* %".16", align 4
  ; c = 1
  %".42" = load i32, i32* %".10", align 4
  ; f = a && b || c || d && c && e
  %".44" = icmp ne i32 %".42", 0
  br i1 %".44", label %".3", label %".5"
.3:
  %".46" = load i32, i32* %".13", align 4
  %".47" = icmp ne i32 %".46", 0
  br i1 %".47", label %".8", label %".4"
.4:
  %".49" = load i32, i32* %".16", align 4
  %".50" = icmp ne i32 %".49", 0
  br i1 %".50", label %".8", label %".5"
.5:
  %".52" = load i32, i32* %".19", align 4
  %".53" = icmp ne i32 %".52", 0
  br i1 %".53", label %".6", label %".8"
.6:
  %".55" = load i32, i32* %".16", align 4
  %".56" = icmp ne i32 %".55", 0
  br i1 %".56", label %".7", label %".8"
.7:
  %".58" = load i32, i32* %".22", align 4
  %".59" = icmp ne i32 %".58", 0
  br label %".8"
.8:
  %".61" = phi  i1 [%".59", %".7"], [0, %".6"], [0, %".5"], [1, %".4"], [1, %".3"]
  %".62" = zext i1 %".61" to i32
  store i32 %".62", i32* %".25", align 4
  %".64" = load i32, i32* %".25", align 4
  ; printf "%d" , f
  %".66" = bitcast [3 x i8]* @".str.d" to i8*
  %".67" = alloca i32
  store i32 %".64", i32* %".67"
  %".69" = load i32, i32* %".67"
  %".70" = call i32 (i8*, ...) @"printf"(i8* %".66", i32 %".69")
  ret i32 0
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"