; ModuleID = "tests/test6.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;    INT main
  %".4" = alloca i32, align 4
  store i32 1, i32* %".4", align 4
  ;  INT a = 1
  store i32 3, i32* %".4", align 4
  ; a = 3
  ;  if a
  %".10" = load i32, i32* %".4", align 4
  %".11" = icmp ne i32 %".10", 0
  br i1 %".11", label %".12", label %".19"
.12:
  %".13" = bitcast [3 x i8]* @".str.0" to i8*
  %".14" = alloca i32
  store i32 1, i32* %".14"
  %".16" = load i32, i32* %".14"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  ; printf "%d" 1
  br label %".26"
.19:
  %".20" = bitcast [3 x i8]* @".str.0" to i8*
  %".21" = alloca i32
  store i32 2, i32* %".21"
  %".23" = load i32, i32* %".21"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  ; else printf "%d" 2
  br label %".26"
.26:
  store i32 0, i32* %".4", align 4
  ;   a = 0
  ;  if a
  %".30" = load i32, i32* %".4", align 4
  %".31" = icmp ne i32 %".30", 0
  br i1 %".31", label %".32", label %".39"
.32:
  %".33" = bitcast [3 x i8]* @".str.0" to i8*
  %".34" = alloca i32
  store i32 1, i32* %".34"
  %".36" = load i32, i32* %".34"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".36")
  ; printf "%d" 1
  br label %".46"
.39:
  %".40" = bitcast [3 x i8]* @".str.0" to i8*
  %".41" = alloca i32
  store i32 2, i32* %".41"
  %".43" = load i32, i32* %".41"
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".43")
  ; else printf "%d" 2
  br label %".46"
.46:
  ret i32 0
  ;   return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
