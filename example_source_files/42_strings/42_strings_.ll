; ModuleID = "./example_source_files/42_strings/42_strings.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca [10 x i8], align 16
  ;  INT main ( ) { CHAR s [ 10 ] = "string\nhe" ;
  %".5" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 9
  store i8 0, i8* %".5", align 4
  %".7" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 8
  store i8 101, i8* %".7", align 4
  %".9" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 7
  store i8 104, i8* %".9", align 4
  %".11" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 6
  store i8 10, i8* %".11", align 4
  %".13" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 5
  store i8 103, i8* %".13", align 4
  %".15" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 4
  store i8 110, i8* %".15", align 4
  %".17" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 3
  store i8 105, i8* %".17", align 4
  %".19" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 2
  store i8 114, i8* %".19", align 4
  %".21" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 1
  store i8 116, i8* %".21", align 4
  %".23" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 0
  store i8 115, i8* %".23", align 4
  %".25" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 0
  ;  s [ 0 ] = 'a' ;
  store i8 97, i8* %".25", align 4
  %".28" = getelementptr inbounds [10 x i8], [10 x i8]* %".3", i64 0, i32 1
  ; s [ 1 ] = 101 ;
  store i8 101, i8* %".28", align 4
  %".31" = alloca i8*, align 8
  %".32" = bitcast [10 x i8]* @".str.0" to i8*
  store i8* %".32", i8** %".31", align 8
  ;  CHAR * str = "string he" ;
  ret i32 0
  ; return 0 ;
}

@".str.0" = internal constant [10 x i8] c"string he\00"