; ModuleID = "tests/test2.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  ; #define appel INT * *  INT main
  %".4" = alloca i32, align 4
  store i32 -20, i32* %".4", align 4
  ;   #define True - 20
  %".7" = alloca i32, align 4
  store i32 21, i32* %".7", align 4
  ;  INT radius = 21
  %".10" = alloca i32, align 4
  store i32 5, i32* %".10", align 4
  ; INT side = 5
  %".13" = alloca i32, align 4
  ; INT area
  %".15" = alloca i32, align 4
  store i32 -20, i32* %".15", align 4
  ; bool success = True
  ;  Using macros to calculate areas by
  ;
  ;  passing argument
  ;
  store i32 3, i32* %".13", align 4
  ; area = CIRCLE_AREA
  ;     printf("Area of Circle of radius %d: %d \n", radius,
  ;
  ;            area);
  ;
  %".28" = bitcast [3 x i8]* @".str.d" to i8*
  %".29" = alloca i32
  store i32 -20, i32* %".29"
  %".31" = load i32, i32* %".29"
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".31")
  ; printf "%d" success
  store i32 7, i32* %".10", align 4
  ;  side = 7
  %".36" = load i32, i32* %".4", align 4
  ;  printf "%d" True
  %".38" = bitcast [3 x i8]* @".str.d" to i8*
  %".39" = alloca i32
  store i32 %".36", i32* %".39"
  %".41" = load i32, i32* %".39"
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  ret i32 0
  ; return 0
}

@"CIRCLE_AREA" = global float 0x40091eb860000000, align 4
@"True" = global i32 1, align 4
@"False" = global i32 0, align 4
declare i32 @"printf"(i8* %".1", ...)

@".str.d" = internal constant [3 x i8] c"%d\00"