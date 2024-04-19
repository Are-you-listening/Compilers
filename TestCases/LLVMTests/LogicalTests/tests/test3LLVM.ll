; ModuleID = "tests/test3.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT a = 5
  %".7" = alloca i32, align 4
  store i32 9, i32* %".7", align 4
  ; INT b = 9
  %".10" = alloca i32, align 4
  store i32 6, i32* %".10", align 4
  ; INT c = 6
  store i32 5, i32* %".4", align 4
  ; a = 5
  store i32 9, i32* %".7", align 4
  ; b = 9
  store i32 6, i32* %".10", align 4
  ; c = 6
  ; INT d = ! a && b || c
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
  %".30" = icmp ne i1 %".29", 0
  %".31" = xor i1 %".30", 1
  %".32" = zext i1 %".31" to i32
  %".33" = alloca i32, align 4
  store i32 %".32", i32* %".33", align 4
  %".35" = load i32, i32* %".4", align 4
  %".36" = icmp ne i32 %".35", 0
  br i1 %".36", label %".37", label %".40"
.37:
  %".38" = load i32, i32* %".7", align 4
  %".39" = icmp ne i32 %".38", 0
  br i1 %".39", label %".43", label %".40"
.40:
  %".41" = load i32, i32* %".10", align 4
  %".42" = icmp ne i32 %".41", 0
  br label %".43"
.43:
  %".44" = phi  i1 [1, %".37"], [%".42", %".40"]
  %".45" = icmp ne i1 %".44", 0
  %".46" = xor i1 %".45", 1
  %".47" = zext i1 %".46" to i32
  %".48" = bitcast [3 x i8]* @".str.d" to i8*
  %".49" = alloca i32
  store i32 %".47", i32* %".49"
  %".51" = load i32, i32* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".51")
  ; printf "%d" d
  ret i32 0
  ; return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"