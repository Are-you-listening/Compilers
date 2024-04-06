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
  %".29" = phi  i1 [1, %".21"], [%".27", %".25"]
  %".30" = icmp ne i1 %".29", 0
  %".31" = xor i1 %".30", 1
  %".32" = zext i1 %".31" to i32
  %".33" = alloca i32, align 4
  store i32 %".32", i32* %".33", align 4
  %".35" = load i32, i32* %".3", align 4
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".37", label %".41"
.37:
  %".38" = load i32, i32* %".6", align 4
  %".39" = icmp ne i32 %".38", 0
  %".40" = xor i1 %".39", 1
  br i1 %".40", label %".44", label %".41"
.41:
  %".42" = load i32, i32* %".9", align 4
  %".43" = icmp ne i32 %".42", 0
  br label %".44"
.44:
  %".45" = phi  i1 [%".43", %".41"], [1, %".37"]
  %".46" = icmp ne i1 %".45", 0
  %".47" = xor i1 %".46", 1
  %".48" = zext i1 %".47" to i32
  %".49" = bitcast [3 x i8]* @".str.d" to i8*
  %".50" = alloca i32
  store i32 %".48", i32* %".50"
  %".52" = load i32, i32* %".50"
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".52")
  ; printf "%d" , d
  ret i32 0
  ; INT main
  ; #include <stdio.h>
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"