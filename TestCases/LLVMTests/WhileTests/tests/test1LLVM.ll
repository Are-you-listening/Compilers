; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ;  INT i = 0
  br label %".7"
.7:
  ; while i != 10
  %".9" = load i32, i32* %".4", align 4
  %".10" = icmp ne i32 %".9", 10
  br i1 %".10", label %".11", label %".23"
.11:
  %".12" = load i32, i32* %".4", align 4
  ; printf "%d" i
  %".14" = bitcast [3 x i8]* @".str.d" to i8*
  %".15" = alloca i32
  store i32 %".12", i32* %".15"
  %".17" = load i32, i32* %".15"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  %".19" = load i32, i32* %".4", align 4
  ; i ++
  %".21" = add i32 %".19", 1
  store i32 %".21", i32* %".4", align 4
  br label %".7"
.23:
  %".24" = alloca i32, align 4
  ;   INT j
  store i32 0, i32* %".24", align 4
  ; for j = 0 j < 10 j ++
  br label %".28"
.28:
  %".29" = load i32, i32* %".24", align 4
  %".30" = icmp slt i32 %".29", 10
  br i1 %".30", label %".31", label %".42"
.31:
  %".32" = load i32, i32* %".24", align 4
  ; printf "%d" j
  %".34" = bitcast [3 x i8]* @".str.d" to i8*
  %".35" = alloca i32
  store i32 %".32", i32* %".35"
  %".37" = load i32, i32* %".35"
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %".37")
  %".39" = load i32, i32* %".24", align 4
  %".40" = add i32 %".39", 1
  store i32 %".40", i32* %".24", align 4
  br label %".28"
.42:
  ret i32 0
  ;   return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"