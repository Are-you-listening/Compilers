; ModuleID = "tests/test35.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define float @"mul"(i32** %".1")
{
.3:
  %".4" = alloca i32**
  %".5" = alloca i32**
  store i32** %".1", i32*** %".5"
  %".7" = load i32**, i32*** %".5"
  ;    FLOAT mul ( INT * * b ) { printf ( "%d" , ( * b ) [ 0 ] ) ;
  %".9" = load i32*, i32** %".7"
  %".10" = getelementptr inbounds i32, i32* %".9", i32 0
  %".11" = load i32, i32* %".10", align 4
  %".12" = bitcast [3 x i8]* @".str.0" to i8*
  %".13" = alloca i32
  store i32 %".11", i32* %".13"
  %".15" = load i32, i32* %".13"
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".15")
  ret float              0x0
  ; return 0.0 ;
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
  ; mul ( b ) ;
  %".24" = call float @"mul"(i32** %".22")
  ret i32 0
  ;  INT * * s = & z ;  return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%d\00"
declare i32 @"printf"(i8* %".1", ...)
