; ModuleID = "tests/test7.c"
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
  %".13" = bitcast [3 x i8]* @".str.d" to i8*
  %".14" = alloca i32
  store i32 %".11", i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  %".18" = bitcast [3 x i8]* @".str.d" to i8*
  %".19" = alloca i32
  store i32 0, i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  ; printf "%d" Mon
  %".24" = alloca i32, align 4
  store i32 3, i32* %".24", align 4
  ; INT q = Thur - Mon * Tue
  %".27" = bitcast [3 x i8]* @".str.d" to i8*
  %".28" = alloca i32
  store i32 1, i32* %".28"
  %".30" = load i32, i32* %".28"
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".30")
  ; printf "%d" Tue
  %".33" = bitcast [3 x i8]* @".str.d" to i8*
  %".34" = alloca i32
  store i32 3, i32* %".34"
  %".36" = load i32, i32* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
  ; printf "%d" Thur
  %".39" = bitcast [3 x i8]* @".str.d" to i8*
  %".40" = alloca i32
  store i32 4, i32* %".40"
  %".42" = load i32, i32* %".40"
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".42")
  ; printf "%d" Fri
  %".45" = bitcast [3 x i8]* @".str.d" to i8*
  %".46" = alloca i32
  store i32 5, i32* %".46"
  %".48" = load i32, i32* %".46"
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %".48")
  ; printf "%d" Sat
  %".51" = bitcast [3 x i8]* @".str.d" to i8*
  %".52" = alloca i32
  store i32 3, i32* %".52"
  %".54" = load i32, i32* %".52"
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %".54")
  ; printf "%d" q
  %".57" = bitcast [3 x i8]* @".str.d" to i8*
  %".58" = alloca i32
  store i32 6, i32* %".58"
  %".60" = load i32, i32* %".58"
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %".60")
  ; printf "%d" Sun
  store i32 6, i32* %".24", align 4
  ; q = Sun
  %".65" = load i32, i32* %".24", align 4
  ; printf "%d" q
  %".67" = bitcast [3 x i8]* @".str.d" to i8*
  %".68" = alloca i32
  store i32 %".65", i32* %".68"
  %".70" = load i32, i32* %".68"
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".67", i32 %".70")
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
declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"