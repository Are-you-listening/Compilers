; ModuleID = "tests/test8.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 0, i32* %".4", align 4
  ; INT a = 0
  br label %".7"
.7:
  ; while 1
  br label %".9"
.9:
  %".10" = load i32, i32* %".4", align 4
  ;  if a % 2 == 1
  %".12" = srem i32 %".10", 2
  %".13" = icmp eq i32 %".12", 1
  br i1 %".13", label %".14", label %".19"
.14:
  %".15" = load i32, i32* %".4", align 4
  ; a ++
  %".17" = add i32 %".15", 1
  store i32 %".17", i32* %".4", align 4
  br label %".7"
.19:
  %".20" = load i32, i32* %".4", align 4
  ; continue   printf "%d" a
  %".22" = bitcast [3 x i8]* @".str.0" to i8*
  %".23" = alloca i32
  store i32 %".20", i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  %".27" = load i32, i32* %".4", align 4
  ; if a > 10
  %".29" = icmp sgt i32 %".27", 10
  br i1 %".29", label %".30", label %".32"
.30:
  ; break
  br label %".37"
.32:
  %".33" = load i32, i32* %".4", align 4
  ;   a ++
  %".35" = add i32 %".33", 1
  store i32 %".35", i32* %".4", align 4
  br label %".7"
.37:
  %".38" = bitcast [3 x i8]* @".str.0" to i8*
  %".39" = alloca i32
  store i32 1, i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  ;   printf "%d" 1
  ret i32 0
  ;  return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
