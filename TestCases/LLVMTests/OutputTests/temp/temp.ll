; ModuleID = "tests/test55.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca i32, align 4
  ;    INT main ( ) { INT i ;
  store i32 0, i32* %".3", align 4
  ; for ( i = 0 ; i < 5 ; i ++ ) {
  br label %".7"
.7:
  %".8" = load i32, i32* %".3", align 4
  %".9" = icmp slt i32 %".8", 5
  br i1 %".9", label %".10", label %".26"
.10:
  %".11" = load i32, i32* %".3", align 4
  ; { INT loopVar = i * 10 ;
  %".13" = mul i32 %".11", 10
  %".14" = alloca i32, align 4
  store i32 %".13", i32* %".14", align 4
  %".16" = load i32, i32* %".14", align 4
  ; printf ( "Loop variable: %d\n" , loopVar ) ;
  %".18" = bitcast [19 x i8]* @".str.0" to i8*
  %".19" = alloca i32
  store i32 %".16", i32* %".19"
  %".21" = load i32, i32* %".19"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".21")
  %".23" = load i32, i32* %".3", align 4
  %".24" = add i32 %".23", 1
  store i32 %".24", i32* %".3", align 4
  br label %".7"
.26:
  ret i32 0
  ; } } return 0 ;
}

@".str.0" = internal constant [19 x i8] c"Loop variable: %d\0a\00"
declare i32 @"printf"(i8* %".1", ...)
