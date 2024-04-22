; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ;       INT main
  %".4" = bitcast [3 x i8]* @".str.0" to i8*
  %".5" = alloca i32
  store i32 1, i32* %".5"
  %".7" = load i32, i32* %".5"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  ;   printf "%d" 1
  %".10" = alloca i32, align 4
  store i32 21, i32* %".10", align 4
  ;    INT radius = 21
  %".13" = alloca i32, align 4
  store i32 5, i32* %".13", align 4
  ; INT side = 5
  %".16" = alloca i32, align 4
  ; INT area
  %".18" = alloca i32, align 4
  store i32 -20, i32* %".18", align 4
  ; const INT success = - 20
  ;  Using macros to calculate areas by
  ;
  ;  passing argument
  ;
  store i32 3, i32* %".16", align 4
  ; area = 3.14
  ;     printf("Area of Circle of radius %d: %d \n", radius,
  ;
  ;            area);
  ;
  %".31" = bitcast [3 x i8]* @".str.0" to i8*
  %".32" = alloca i32
  store i32 -20, i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  ; printf "%d" success
  store i32 7, i32* %".13", align 4
  ;  side = 7
  %".39" = bitcast [3 x i8]* @".str.0" to i8*
  %".40" = alloca i32
  store i32 -20, i32* %".40"
  %".42" = load i32, i32* %".40"
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".42")
  ;  printf "%d" - 20
  ret i32 0
  ; return 0
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
