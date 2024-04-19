; ModuleID = "tests/test14.c"
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
  br i1 %".9", label %".10", label %".12"
.10:
  ;
  br label %".12"
.12:
  %".13" = load i32, i32* %".4", align 4
  ; if x >= 5
  %".15" = icmp sge i32 %".13", 5
  br i1 %".15", label %".16", label %".18"
.16:
  ; else
  br label %".20"
.18:
  ;
  br label %".20"
.20:
  %".21" = load i32, i32* %".4", align 4
  ; if x == 5 && 1
  %".23" = icmp eq i32 %".21", 5
  br i1 %".23", label %".24", label %".31"
.24:
  %".25" = load i32, i32* %".4", align 4
  ; if x != 4
  %".27" = icmp ne i32 %".25", 4
  br i1 %".27", label %".28", label %".30"
.28:
  ; else if 1
  br label %".30"
.30:
  br label %".31"
.31:
  ;   if x ++
  %".33" = load i32, i32* %".4", align 4
  %".34" = add i32 %".33", 1
  store i32 %".34", i32* %".4", align 4
  %".36" = icmp ne i32 %".33", 0
  br i1 %".36", label %".37", label %".39"
.37:
  ; else
  br label %".41"
.39:
  ;
  br label %".41"
.41:
  %".42" = load i32, i32* %".4", align 4
  ;  printf "%d" x
  %".44" = bitcast [3 x i8]* @".str.d" to i8*
  %".45" = alloca i32
  store i32 %".42", i32* %".45"
  %".47" = load i32, i32* %".45"
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %".47")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"