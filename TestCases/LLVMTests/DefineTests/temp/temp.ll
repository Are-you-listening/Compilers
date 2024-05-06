; ModuleID = "tests/test1.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 21, i32* %".3", align 4
  ;          INT main ( ) {  INT radius = 21 ;
  %".6" = alloca i32, align 4
  store i32 5, i32* %".6", align 4
  ; INT side = 5 ;
  %".9" = alloca i32, align 4
  ; INT area ;
  %".11" = alloca i32, align 4
  store i32 1, i32* %".11", align 4
  ; const INT success = 1 ;
  store i32 3, i32* %".9", align 4
  ;  area = 3.14 ;
  %".16" = load i32, i32* %".9", align 4
  ; printf ( "%d%d%d" , radius , area , success ) ;
  %".18" = load i32, i32* %".11", align 4
  %".19" = bitcast [7 x i8]* @".str.0" to i8*
  %".20" = alloca i32
  %".21" = alloca i32
  %".22" = alloca i32
  store i32 21, i32* %".20"
  store i32 %".16", i32* %".21"
  store i32 %".18", i32* %".22"
  %".26" = load i32, i32* %".20"
  %".27" = load i32, i32* %".21"
  %".28" = load i32, i32* %".22"
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".26", i32 %".27", i32 %".28")
  ret i32 0
  ;  return 0 ;
}

@".str.0" = internal constant [7 x i8] c"%d%d%d\00"
declare i32 @"printf"(i8* %".1", ...)
