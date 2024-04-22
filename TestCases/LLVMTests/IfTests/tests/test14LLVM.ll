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
  ; if x == 5 && 1
  %".22" = load i32, i32* %".4", align 4
  %".23" = icmp eq i32 %".22", 5
  %".24" = icmp ne i1 %".23", 0
  br i1 %".24", label %".25", label %".32"
.25:
  %".26" = load i32, i32* %".4", align 4
  ; if x != 4
  %".28" = icmp ne i32 %".26", 4
  br i1 %".28", label %".29", label %".31"
.29:
  ; else if 1
  br label %".31"
.31:
  br label %".32"
.32:
  ;   if x ++
  %".34" = load i32, i32* %".4", align 4
  %".35" = add i32 %".34", 1
  store i32 %".35", i32* %".4", align 4
  %".37" = icmp ne i32 %".34", 0
  br i1 %".37", label %".38", label %".40"
.38:
  ; else
  br label %".42"
.40:
  ;
  br label %".42"
.42:
  %".43" = load i32, i32* %".4", align 4
  ;  printf "%d" x
  %".45" = bitcast [3 x i8]* @".str.PS0" to i8*
  %".46" = alloca i32
  store i32 %".43", i32* %".46"
  %".48" = load i32, i32* %".46"
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %".48")
  ret i32 0
  ;  return 0
}

declare i32 @"printf"(i8* %".1", ...)

@".str.PS0" = internal constant [3 x i8] c"%d\00"