; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  #include <stdio.h>  INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  %".7" = alloca i32, align 4
  store i32 1, i32* %".7", align 4
  ; INT b = 1
  %".10" = alloca i32, align 4
  store i32 6, i32* %".10", align 4
  ; INT c = 6
  store i32 0, i32* %".4", align 4
  ; a = 0
  store i32 1, i32* %".7", align 4
  ; b = 1
  store i32 6, i32* %".10", align 4
  ; c = 6
  ; INT d = a && b || c
  %".20" = load i32, i32* %".4", align 4
  %".21" = icmp ne i32 %".20", 0
  br i1 %".21", label %".22", label %".25"
.22:
  %".23" = load i32, i32* %".7", align 4
  %".24" = icmp ne i32 %".23", 0
  br i1 %".24", label %".28", label %".25"
.25:
  %".26" = load i32, i32* %".10", align 4
  %".27" = icmp ne i32 %".26", 0
  br label %".28"
.28:
  %".29" = phi  i1 [1, %".22"], [%".27", %".25"]
  %".30" = zext i1 %".29" to i32
  %".31" = alloca i32, align 4
  store i32 %".30", i32* %".31", align 4
  %".33" = load i32, i32* %".4", align 4
  %".34" = icmp ne i32 %".33", 0
  br i1 %".34", label %".35", label %".38"
.35:
  %".36" = load i32, i32* %".7", align 4
  %".37" = icmp ne i32 %".36", 0
  br i1 %".37", label %".41", label %".38"
.38:
  %".39" = load i32, i32* %".10", align 4
  %".40" = icmp ne i32 %".39", 0
  br label %".41"
.41:
  %".42" = phi  i1 [1, %".35"], [%".40", %".38"]
  %".43" = zext i1 %".42" to i32
  %".44" = bitcast [3 x i8]* @".str.d" to i8*
  %".45" = alloca i32
  store i32 %".43", i32* %".45"
  %".47" = load i32, i32* %".45"
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %".47")
  ; printf "%d" d
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"