; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT b = 0
  %".7" = alloca i32, align 4
  store i32 0, i32* %".7", align 4
  ; INT a = 0
  br label %".10"
.10:
  ; while b < 5
  %".12" = load i32, i32* %".4", align 4
  %".13" = icmp slt i32 %".12", 5
  br i1 %".13", label %".14", label %".42"
.14:
  %".15" = bitcast [3 x i8]* @".str.d" to i8*
  %".16" = alloca i32
  store i32 1, i32* %".16"
  %".18" = load i32, i32* %".16"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18")
  ;  printf "%d" 1
  %".21" = load i32, i32* %".7", align 4
  ; if a > 5
  %".23" = icmp sgt i32 %".21", 5
  br i1 %".23", label %".24", label %".31"
.24:
  %".25" = bitcast [3 x i8]* @".str.d" to i8*
  %".26" = alloca i32
  store i32 2, i32* %".26"
  %".28" = load i32, i32* %".26"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".28")
  ; printf "%d" 2
  br label %".42"
.31:
  %".32" = bitcast [3 x i8]* @".str.d" to i8*
  %".33" = alloca i32
  store i32 3, i32* %".33"
  %".35" = load i32, i32* %".33"
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  ; break  printf "%d" 3
  %".38" = load i32, i32* %".7", align 4
  ; a ++
  %".40" = add i32 %".38", 1
  store i32 %".40", i32* %".7", align 4
  br label %".10"
.42:
  %".43" = bitcast [3 x i8]* @".str.d" to i8*
  %".44" = alloca i32
  store i32 4, i32* %".44"
  %".46" = load i32, i32* %".44"
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".46")
  ;    printf "%d" 4
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"