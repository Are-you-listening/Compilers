; ModuleID = "tests/test17.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = bitcast [3 x i8]* @".str.0" to i8*
  %".4" = alloca [28 x i8]*
  store [28 x i8]* @".str.1", [28 x i8]** %".4"
  %".6" = load [28 x i8]*, [28 x i8]** %".4"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", [28 x i8]* %".6")
  ;    INT main ( ) { printf ( "%s" , "This is a beautifull string" ) ;
  %".9" = alloca [5 x i8], align 8
  ;  CHAR hello [ 5 ] = { 'H' , 'e' , 'l' , 'l' , 'o' } ;
  %".11" = getelementptr inbounds [5 x i8], [5 x i8]* %".9", i64 0, i32 4
  store i8 111, i8* %".11", align 4
  %".13" = getelementptr inbounds [5 x i8], [5 x i8]* %".9", i64 0, i32 3
  store i8 108, i8* %".13", align 4
  %".15" = getelementptr inbounds [5 x i8], [5 x i8]* %".9", i64 0, i32 2
  store i8 108, i8* %".15", align 4
  %".17" = getelementptr inbounds [5 x i8], [5 x i8]* %".9", i64 0, i32 1
  store i8 101, i8* %".17", align 4
  %".19" = getelementptr inbounds [5 x i8], [5 x i8]* %".9", i64 0, i32 0
  store i8 72, i8* %".19", align 4
  ret i32 0
  ;    return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%s\00"
@".str.1" = internal constant [28 x i8] c"This is a beautifull string\00"
declare i32 @"printf"(i8* %".1", ...)
