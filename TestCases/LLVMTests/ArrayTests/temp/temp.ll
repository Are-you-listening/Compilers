; ModuleID = "tests/test30.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32** @"mul"(i32** %".1")
{
.3:
  %".4" = alloca i32**
  store i32** %".1", i32*** %".4"
  %".6" = load i32**, i32*** %".4"
  ;    INT * * mul ( INT * * b ) { printf ( "%d" , ( * b ) [ 0 ] ) ;
  %".8" = load i32*, i32** %".6"
  %".9" = getelementptr inbounds i32, i32* %".8", i32 0
  %".10" = load i32, i32* %".9", align 4
  %".11" = bitcast [3 x i8]* @".str.0" to i8*
  %".12" = alloca i32
  store i32 %".10", i32* %".12"
  %".14" = load i32, i32* %".12"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  %".16" = load i32**, i32*** %".4"
  ; return b ;
  ret i32** %".16"
}

define i32 @"main"()
{
.2:
  %".3" = alloca [5 x i32], align 32
  ; }  INT main ( ) { INT z [ 5 ] = { 1 , 2 , 3 , 4 , 5 } ;
  %".5" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 4
  store i32 5, i32* %".5", align 4
  %".7" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 3
  store i32 4, i32* %".7", align 4
  %".9" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 2
  store i32 3, i32* %".9", align 4
  %".11" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 1
  store i32 2, i32* %".11", align 4
  %".13" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i64 0, i32 0
  store i32 1, i32* %".13", align 4
  %".15" = getelementptr inbounds [5 x i32], [5 x i32]* %".3", i32 0, i32 0
  ;  INT * a = z ;
  %".17" = alloca i32*, align 8
  store i32* %".15", i32** %".17", align 8
  %".19" = alloca i32**, align 8
  store i32** %".17", i32*** %".19", align 8
  ; INT * * b = & a ;
  %".22" = load i32**, i32*** %".19", align 8
  ; b = mul ( b ) ;
  %".24" = call i32** @"mul"(i32** %".22")
  store i32** %".24", i32*** %".19", align 8
  %".26" = load i32**, i32*** %".19", align 8
  ;   printf ( "%d" , ( * b ) [ 0 ] ) ;
  %".28" = load i32*, i32** %".26"
  %".29" = getelementptr inbounds i32, i32* %".28", i32 0
  %".30" = load i32, i32* %".29", align 4
  %".31" = bitcast [3 x i8]* @".str.0" to i8*
  %".32" = alloca i32
  store i32 %".30", i32* %".32"
  %".34" = load i32, i32* %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  ret i32 0
  ;  return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
