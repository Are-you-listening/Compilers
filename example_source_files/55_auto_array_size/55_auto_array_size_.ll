; ModuleID = "/home/watson/OneDrive/2023-2024/Compilers/Project/Compilers/example_source_files/55_auto_array_size/55_auto_array_size.c"
target triple = "x86_64-pc-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
.2:
  %".3" = alloca [12 x i8], align 64
  ;      INT main ( ) { CHAR c [ ] = "hello world" ;
  %".5" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 11
  store i8 0, i8* %".5", align 4
  %".7" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 10
  store i8 100, i8* %".7", align 4
  %".9" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 9
  store i8 108, i8* %".9", align 4
  %".11" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 8
  store i8 114, i8* %".11", align 4
  %".13" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 7
  store i8 111, i8* %".13", align 4
  %".15" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 6
  store i8 119, i8* %".15", align 4
  %".17" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 5
  store i8 32, i8* %".17", align 4
  %".19" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 4
  store i8 111, i8* %".19", align 4
  %".21" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 3
  store i8 108, i8* %".21", align 4
  %".23" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 2
  store i8 108, i8* %".23", align 4
  %".25" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 1
  store i8 101, i8* %".25", align 4
  %".27" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i64 0, i32 0
  store i8 104, i8* %".27", align 4
  %".29" = getelementptr inbounds [12 x i8], [12 x i8]* %".3", i32 0, i32 0
  ;  printf ( "%s" , c ) ;
  %".31" = bitcast [3 x i8]* @".str.0" to i8*
  %".32" = alloca i8*
  store i8* %".29", i8** %".32"
  %".34" = load i8*, i8** %".32"
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i8* %".34")
  %".36" = alloca [3 x i8], align 16
  ;  CHAR d [ ] = { 'a' , 'b' , '\0' } ;
  %".38" = getelementptr inbounds [3 x i8], [3 x i8]* %".36", i64 0, i32 2
  store i8 0, i8* %".38", align 4
  %".40" = getelementptr inbounds [3 x i8], [3 x i8]* %".36", i64 0, i32 1
  store i8 98, i8* %".40", align 4
  %".42" = getelementptr inbounds [3 x i8], [3 x i8]* %".36", i64 0, i32 0
  store i8 97, i8* %".42", align 4
  %".44" = getelementptr inbounds [3 x i8], [3 x i8]* %".36", i32 0, i32 0
  ;  printf ( "%s" , d ) ;
  %".46" = bitcast [3 x i8]* @".str.0" to i8*
  %".47" = alloca i8*
  store i8* %".44", i8** %".47"
  %".49" = load i8*, i8** %".47"
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".46", i8* %".49")
  ret i32 0
  ;  return 0 ;
}

@".str.0" = internal constant [3 x i8] c"%s\00"
declare i32 @"printf"(i8* %".1", ...)
