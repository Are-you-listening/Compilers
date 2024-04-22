; ModuleID = "tests/test12.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;     INT main
  %".4" = alloca i32, align 4
  store i32 5, i32* %".4", align 4
  ; INT x = 5
  %".7" = load i32, i32* %".4", align 4
  ; if x < 5
  %".9" = icmp slt i32 %".7", 5
  br i1 %".9", label %".10", label %".17"
.10:
  %".11" = bitcast [3 x i8]* @".str.0" to i8*
  %".12" = alloca i32
  store i32 1, i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  ; printf "%d" 1
  br label %".17"
.17:
  %".18" = load i32, i32* %".4", align 4
  ;  if x >= 5
  %".20" = icmp sge i32 %".18", 5
  br i1 %".20", label %".21", label %".28"
.21:
  %".22" = bitcast [3 x i8]* @".str.0" to i8*
  %".23" = alloca i32
  store i32 2, i32* %".23"
  %".25" = load i32, i32* %".23"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".25")
  ; printf "%d" 2
  br label %".28"
.28:
  ;  if x == 5 && 1
  %".30" = load i32, i32* %".4", align 4
  %".31" = icmp eq i32 %".30", 5
  %".32" = icmp ne i1 %".31", 0
  br i1 %".32", label %".33", label %".45"
.33:
  %".34" = load i32, i32* %".4", align 4
  ; if x != 4
  %".36" = icmp ne i32 %".34", 4
  br i1 %".36", label %".37", label %".44"
.37:
  %".38" = bitcast [3 x i8]* @".str.0" to i8*
  %".39" = alloca i32
  store i32 3, i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  ; printf "%d" 3
  br label %".44"
.44:
  br label %".45"
.45:
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
