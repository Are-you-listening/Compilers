; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;  typedef INT enumweek  INT main
  %".4" = alloca i32, align 4
  ;  enum week day
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; enumweek z = 1
  store i32 2, i32* %".4", align 4
  ; day = Wed
  %".11" = load i32, i32* %".4", align 4
  ; printf "%d" day
  %".13" = bitcast [3 x i8]* @".str.0" to i8*
  %".14" = alloca i32
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  %".18" = bitcast [3 x i8]* @".str.0" to i8*
  %".19" = alloca i32
  store i32 0, i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  ; printf "%d" Mon
  %".24" = bitcast [3 x i8]* @".str.0" to i8*
  %".25" = alloca i32
  store i32 1, i32* %".25"
  %".27" = load i32, i32* %".25"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".27")
  ; printf "%d" Tue
  %".30" = bitcast [3 x i8]* @".str.0" to i8*
  %".31" = alloca i32
  store i32 3, i32* %".31"
  %".33" = load i32, i32* %".31"
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  ; printf "%d" Thur
  %".36" = bitcast [3 x i8]* @".str.0" to i8*
  %".37" = alloca i32
  store i32 4, i32* %".37"
  %".39" = load i32, i32* %".37"
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  ; printf "%d" Fri
  %".42" = bitcast [3 x i8]* @".str.0" to i8*
  %".43" = alloca i32
  store i32 5, i32* %".43"
  %".45" = load i32, i32* %".43"
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".45")
  ; printf "%d" Sat
  %".48" = bitcast [3 x i8]* @".str.0" to i8*
  %".49" = alloca i32
  store i32 6, i32* %".49"
  %".51" = load i32, i32* %".49"
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".51")
  ; printf "%d" Sun
  ret i32 0
  ; return 0
}

@"x" = global i32 1, align 4
@"Sun" = global i32 6, align 4
@"Sat" = global i32 5, align 4
@"Fri" = global i32 4, align 4
@"Thur" = global i32 3, align 4
@"Wed" = global i32 2, align 4
@"Tue" = global i32 1, align 4
@"Mon" = global i32 0, align 4
@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
