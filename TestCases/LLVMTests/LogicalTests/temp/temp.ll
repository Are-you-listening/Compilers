; ModuleID = "tests/test11.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  store i32 1, i32* %".3", align 4
  ;    INT main ( ) { INT a = 1 ;
  %".6" = alloca i32, align 4
  store i32 1, i32* %".6", align 4
  ; INT b = 1 ;
  store i32 1, i32* %".3", align 4
  ; a = 1 ;
  store i32 1, i32* %".6", align 4
  ; b = 1 ;
  %".13" = alloca i32, align 4
  ;  INT f ;
  store i32 1, i32* %".13", align 4
  ; f = ( a || ! b ) ;
  %".17" = load i32, i32* %".13", align 4
  ; printf ( "%d" , f ) ;
  %".19" = bitcast [3 x i8]* @".str.0" to i8*
  %".20" = alloca i32
  store i32 %".17", i32* %".20"
  %".22" = load i32, i32* %".20"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  ret i32 0
  ;  return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
