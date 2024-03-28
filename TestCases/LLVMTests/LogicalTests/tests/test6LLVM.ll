; ModuleID = "tests/test6.c"
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
  store i32 1, i32* %".9", align 4
  ; c = 1
  %".35" = load i32, i32* %".3", align 4
  ; f = a && b || c || d && c && e
  %".37" = icmp ne i32 %".35", 0
  br i1 %".37", label %".38", label %".44"
.38:
  %".39" = load i32, i32* %".6", align 4
  %".40" = icmp ne i32 %".39", 0
  br i1 %".40", label %".53", label %".41"
.41:
  %".42" = load i32, i32* %".9", align 4
  %".43" = icmp ne i32 %".42", 0
  br i1 %".43", label %".53", label %".44"
.44:
  %".45" = load i32, i32* %".12", align 4
  %".46" = icmp ne i32 %".45", 0
  br i1 %".46", label %".47", label %".53"
.47:
  %".48" = load i32, i32* %".9", align 4
  %".49" = icmp ne i32 %".48", 0
  br i1 %".49", label %".50", label %".53"
.50:
  %".51" = load i32, i32* %".15", align 4
  %".52" = icmp ne i32 %".51", 0
  br label %".53"
.53:
  %".60" = phi  i1 [1, %".38"], [1, %".41"], [%".52", %".50"], [0, %".44"], [0, %".47"]
  %".61" = zext i1 %".60" to i32
  store i32 %".61", i32* %".18", align 4
  %".63" = load i32, i32* %".18", align 4
  ; printf " %d " , f
  %".65" = bitcast [3 x i8]* @".str.d" to i8*
  %".66" = alloca i32
  store i32 %".63", i32* %".66"
  %".68" = load i32, i32* %".66"
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".65", i32 %".68")
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"